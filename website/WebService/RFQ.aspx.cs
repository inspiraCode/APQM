using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json;
using System.IO;
using System.Configuration;
using System.Net.Mail;

public partial class WebService_RFQ : System.Web.UI.Page
{
    RfqCRUD rfq_CRUD = new RfqCRUD();

    protected void Page_Load(object sender, EventArgs e)
    {

        if (Request["cmd"] == null)
            return;

        string cmd = Request["cmd"].ToString();

        switch (cmd)
        {
            case "delete":
                deleteRFQbyID(long.Parse(Request["id"]));
                return;
            case "createrfq":
                Response.Clear();
                Response.Write(createRFQ());
                Response.End();
                return;
            case "sendrfq":
                Response.Clear();
                Response.Write(sendRFQ());
                Response.End();
                return;
            case "resendrfq":
                Response.Clear();
                Response.Write(resendRFQ());
                Response.End();
                return;
            case "readbybomlineid":
                Response.Clear();
                Response.Write(readRFQsByBOMLineID(long.Parse(Request["bomlineid"])));
                Response.End();
                return;
        }
    }

    public void deleteRFQbyID(long idRFQ)
    {
        string response = "{\"Result\":\"" + "OK" + "\"}";
        if (!rfq_CRUD.setActiveByID(idRFQ, 0))
        {
            response = "ERROR:" + rfq_CRUD.ErrorMessage;
        }
        Response.Clear();
        Response.Write(response);
        Response.End();
    }

    public string sendRFQ()
    {
        List<RFQ> resultRFQs = new List<RFQ>();
        GatewayResponse response = new GatewayResponse();
        String s;
        NewRFQScreen newRFQScreen;
        try
        {
            s = new StreamReader(Request.InputStream).ReadToEnd();
            newRFQScreen = JsonConvert.DeserializeObject<NewRFQScreen>(s);
        }
        catch (Exception ex)
        {
            response.ErrorThrown = true;
            response.ResponseDescription = "ERROR: When trying to parse JSON in server. " + ex.Message;
            return JsonConvert.SerializeObject(response);
        }

        RFQNumberCRUD rfqNumberCRUD = new RFQNumberCRUD();
        bomDetailCRUD bomDetail_CRUD = new bomDetailCRUD();
        UserCRUD user_CRUD = new UserCRUD();


        string strAuthUser = HttpContext.Current.User.Identity.Name;
        User user = user_CRUD.readById(strAuthUser);

        List<SIFDetail> EAUsList = newRFQScreen.SIFVolumesList;
        if (EAUsList.Count == 0)
        {
            response.ErrorThrown = true;
            response.ResponseDescription = "ERROR: Cannot create RFQ without EAU specified.";
            return JsonConvert.SerializeObject(response);
        }

        List<RFQEAV> newEAUList = new List<RFQEAV>();
        foreach (SIFDetail eau in EAUsList)
        {
            RFQEAV eauParsed = new RFQEAV();
            eauParsed.Volume = eau.ProjectedAnnualVolume;
            eauParsed.Year = eau.ProgramYear;
            RFQEAV alreadyExists = newEAUList.Find(eauInternal => eauInternal.Volume == eauParsed.Volume);
            if (alreadyExists == null)
            {
                newEAUList.Add(eauParsed);
            }
            else
            {
                alreadyExists.Year = alreadyExists.Year.Trim() + ", " + eauParsed.Year.Trim();
            }
        }

        List<BOMDetail> bomDetailList = newRFQScreen.BomDetailList;
        

        ConnectionManager CM = new ConnectionManager();
        Data_Base_MNG.SQL DM = CM.getDataManager();

        if (newRFQScreen.SupplierList.Count > 0)
        {
            foreach (Supplier supplier in newRFQScreen.SupplierList)
            {
                foreach (BOMDetail component in bomDetailList)
                {
                    RFQNumberEntity rfqNumber = new RFQNumberEntity();

                    rfqNumber.BOMDetailKey = component.Id;
                    rfqNumber.SifHeaderKey = newRFQScreen.SIFHeaderID;
                    rfqNumber.RFQNumber = rfqNumberCRUD.generateNewRFQNumber(rfqNumber.SifHeaderKey);

                    if (rfqNumber.RFQNumber == -1)
                    {
                        response.ErrorThrown = true;
                        response.ResponseDescription = "ERROR: There was an error generating a new RFQ number.";
                        return JsonConvert.SerializeObject(response);
                    }

                    CM = new ConnectionManager();
                    DM = CM.getDataManager();

                    /*Begin Transaction*/
                    DM.Open_Connection("Send New RFQ");

                    RFQ rfq = new RFQ();
                    RFQNumberEntity rfqNumberGenereated = rfqNumberCRUD.create_return_object(rfqNumber, ref DM);
                    if (rfqNumberCRUD.ErrorOccur)
                    {
                        response.ErrorThrown = true;
                        response.ResponseDescription = "ERROR:" + rfqNumberCRUD.ErrorMessage;
                        return JsonConvert.SerializeObject(response);
                    }
                    else
                    {
                        RfqCRUD rfqCRUD = new RfqCRUD();

                        rfq.SupplierId = supplier.Id;
                        rfq.SupplierName = supplier.SupplierName;
                        rfq.SentToVendor = DateTime.Now;
                        rfq.LastEmail = supplier.ContactEmail;
                        rfq.Status = "PENDING";
                        rfq.BomDetailId = component.Id;
                        rfq.RfqNumberKey = rfqNumberGenereated.Id;
                        rfq.RfqGenerated = rfqNumberGenereated.RfqGenerated;
                        rfq.DueDate = newRFQScreen.DueDate;
                        rfq.MarketSectorID = newRFQScreen.MarketSectorID;
                        rfq.DrawingLevel = newRFQScreen.DrawingLevel;
                        rfq.TargetPrice = newRFQScreen.TargetPrice;
                        rfq.CommentsToVendor = newRFQScreen.CommentsToVendor;
                        rfq.SentAttachmentsFolder = newRFQScreen.FolderAttachments;

                        rfq.CreatedBy = strAuthUser;

                        string idGenerated = rfqCRUD.createAndReturnIdGenerated(rfq, component, ref DM);

                        if (!rfqCRUD.ErrorOccur)
                        {
                            rfq.Id = long.Parse(idGenerated);

                            foreach (RFQEAV eau in newEAUList)
                            {
                                RFQEAVCRUD rfqEAV_CRUD = new RFQEAVCRUD();
                                RFQEAV rfqEAV_toPersist = new RFQEAV();
                                rfqEAV_toPersist.RfqHeaderKey = long.Parse(idGenerated);
                                rfqEAV_toPersist.Volume = eau.Volume * component.Qty;
                                rfqEAV_toPersist.Year = eau.Year;
                                rfqEAV_toPersist.Status = "CREATED";
                                rfqEAV_CRUD.createAndReturnIdGenerated(rfqEAV_toPersist, ref DM);
                                if (rfqEAV_CRUD.ErrorOccur)
                                {
                                    response.ErrorThrown = true;
                                    response.ResponseDescription = "ERROR:" + rfqEAV_CRUD.ErrorMessage;
                                    return JsonConvert.SerializeObject(response);
                                }
                            }

                            TokenCRUD token_CRUD = new TokenCRUD();
                            Token token = new Token();
                            token.Subject = "RFQ";
                            token.SubjectKey = long.Parse(idGenerated);
                            token.TokenNumber = MD5HashGenerator.GenerateKey(DateTime.Now);
                            if (token_CRUD.create(token, ref DM))
                            {
                                Email NewMail = new Email();
                                MailMessage Message = new MailMessage();
                                try
                                {
                                    Message.From = new MailAddress("rfqm@capsonic.com", "rfqm@capsonic.com");
                                    Message.To.Add(new MailAddress(supplier.ContactEmail.ToString()));
                                    Message.Subject = "Request For Quote";
                                    Message.IsBodyHtml = true;
                                    Message.BodyEncoding = System.Text.Encoding.UTF8;

                                    var url = ResolveUrl("~/Vendor/Email_RFQ_Request.htm");
                                    var strEmailContent = HTMLContent(url);
                                    strEmailContent = strEmailContent.Replace("{BuyerName}", user.Name);
                                    strEmailContent = strEmailContent.Replace("{BuyerPhone}", user.Phone1);
                                    strEmailContent = strEmailContent.Replace("{BuyerEmail}", user.Email);
                                    strEmailContent = strEmailContent.Replace("{RFQ Number}", rfqNumber.RfqGenerated);
                                    strEmailContent = strEmailContent.Replace("{Part Number}", component.PartNumber);
                                    strEmailContent = strEmailContent.Replace("{RFQLink}", "http://" + Request.Url.Authority + Request.ApplicationPath + "/Vendor/RFQHandler.ashx?token=" + token.TokenNumber);

                                    Message.Body = strEmailContent;


                                    NewMail.SendMail(Message);
                                }
                                catch (Exception ex)
                                {
                                    DM.RollBack();
                                    response.ErrorThrown = true;
                                    response.ResponseDescription = "ERROR: Could not send email to: " + supplier.ContactEmail.ToString();
                                    return JsonConvert.SerializeObject(response);
                                }
                            }
                            else
                            {
                                response.ErrorThrown = true;
                                response.ResponseDescription = "ERROR: " + token_CRUD.ErrorMessage;
                                return JsonConvert.SerializeObject(response);
                            }
                        }
                        else
                        {
                            response.ErrorThrown = true;
                            response.ResponseDescription = "ERROR: " + rfqCRUD.ErrorMessage;
                            return JsonConvert.SerializeObject(response);
                        }
                    }

                    DM.CommitTransaction();
                    DM.Close_Open_Connection();

                    if (DM.ErrorOccur)
                    {
                        response.ErrorThrown = true;
                        response.ResponseDescription = "ERROR: " + DM.Error_Mjs;
                        return JsonConvert.SerializeObject(response);
                    }
                    resultRFQs.Add(rfq);
                }
            }
        }

        response.ErrorThrown = false;
        response.ResponseDescription = "RFQs created successfully.";
        response.Result = resultRFQs;
        return JsonConvert.SerializeObject(response);
    }


    public string createRFQ()
    {
        List<RFQ> resultRFQs = new List<RFQ>();
        GatewayResponse response = new GatewayResponse();
        String s;
        NewRFQScreen newRFQScreen;
        try
        {
            s = new StreamReader(Request.InputStream).ReadToEnd();
            newRFQScreen = JsonConvert.DeserializeObject<NewRFQScreen>(s);
        }
        catch (Exception ex)
        {
            response.ErrorThrown = true;
            response.ResponseDescription = "ERROR: When trying to parse JSON in server. " + ex.Message;
            return JsonConvert.SerializeObject(response);
        }

        RFQNumberCRUD rfqNumberCRUD = new RFQNumberCRUD();
        bomDetailCRUD bomDetail_CRUD = new bomDetailCRUD();
        UserCRUD user_CRUD = new UserCRUD();

        string strAuthUser = HttpContext.Current.User.Identity.Name;
        User user = user_CRUD.readById(strAuthUser);

        List<SIFDetail> EAUsList = newRFQScreen.SIFVolumesList;
        if (EAUsList.Count == 0)
        {
            response.ErrorThrown = true;
            response.ResponseDescription = "ERROR: Cannot create RFQ without EAU specified.";
            return JsonConvert.SerializeObject(response);
        }

        List<RFQEAV> newEAUList = new List<RFQEAV>();
        foreach (SIFDetail eau in EAUsList)
        {
            RFQEAV eauParsed = new RFQEAV();
            eauParsed.Volume = eau.ProjectedAnnualVolume;
            eauParsed.Year = eau.ProgramYear;
            RFQEAV alreadyExists = newEAUList.Find(eauInternal => eauInternal.Volume == eauParsed.Volume);
            if (alreadyExists == null)
            {
                newEAUList.Add(eauParsed);
            }
            else
            {
                alreadyExists.Year = alreadyExists.Year.Trim() + ", " + eauParsed.Year.Trim();
            }
        }

        List<BOMDetail> bomDetailList = newRFQScreen.BomDetailList;


        ConnectionManager CM = new ConnectionManager();
        Data_Base_MNG.SQL DM = CM.getDataManager();

        if (newRFQScreen.SupplierList.Count > 0)
        {
            foreach (Supplier supplier in newRFQScreen.SupplierList)
            {
                foreach (BOMDetail component in bomDetailList)
                {
                    RFQNumberEntity rfqNumber = new RFQNumberEntity();

                    rfqNumber.BOMDetailKey = component.Id;
                    rfqNumber.SifHeaderKey = newRFQScreen.SIFHeaderID;
                    rfqNumber.RFQNumber = rfqNumberCRUD.generateNewRFQNumber(rfqNumber.SifHeaderKey);

                    if (rfqNumber.RFQNumber == -1)
                    {
                        response.ErrorThrown = true;
                        response.ResponseDescription = "ERROR: There was an error generating a new RFQ number.";
                        return JsonConvert.SerializeObject(response);
                    }

                    CM = new ConnectionManager();
                    DM = CM.getDataManager();

                    /*Begin Transaction*/
                    DM.Open_Connection("Send New RFQ");

                    RFQ rfq = new RFQ();
                    RFQNumberEntity rfqNumberGenereated = rfqNumberCRUD.create_return_object(rfqNumber, ref DM);
                    if (rfqNumberCRUD.ErrorOccur)
                    {
                        response.ErrorThrown = true;
                        response.ResponseDescription = "ERROR:" + rfqNumberCRUD.ErrorMessage;
                        return JsonConvert.SerializeObject(response);
                    }
                    else
                    {
                        RfqCRUD rfqCRUD = new RfqCRUD();

                        rfq.SupplierId = supplier.Id;
                        rfq.SupplierName = supplier.SupplierName;
                        //rfq.SentToVendor = DateTime.Now;
                        //rfq.LastEmail
                        rfq.Status = "PENDING";
                        rfq.BomDetailId = component.Id;
                        rfq.RfqNumberKey = rfqNumberGenereated.Id;
                        rfq.RfqGenerated = rfqNumberGenereated.RfqGenerated;
                        rfq.DueDate = newRFQScreen.DueDate;
                        rfq.MarketSectorID = newRFQScreen.MarketSectorID;
                        rfq.DrawingLevel = newRFQScreen.DrawingLevel;
                        rfq.TargetPrice = newRFQScreen.TargetPrice;
                        rfq.CommentsToVendor = newRFQScreen.CommentsToVendor;
                        rfq.SentAttachmentsFolder = newRFQScreen.FolderAttachments;

                        rfq.CreatedBy = strAuthUser;

                        string idGenerated = rfqCRUD.createAndReturnIdGenerated(rfq, component, ref DM);

                        if (!rfqCRUD.ErrorOccur)
                        {
                            rfq.Id = long.Parse(idGenerated);

                            foreach (RFQEAV eau in newEAUList)
                            {
                                RFQEAVCRUD rfqEAV_CRUD = new RFQEAVCRUD();
                                RFQEAV rfqEAV_toPersist = new RFQEAV();
                                rfqEAV_toPersist.RfqHeaderKey = long.Parse(idGenerated);
                                rfqEAV_toPersist.Volume = eau.Volume * component.Qty;
                                rfqEAV_toPersist.Year = eau.Year;
                                rfqEAV_toPersist.Status = "CREATED";
                                rfqEAV_CRUD.createAndReturnIdGenerated(rfqEAV_toPersist, ref DM);
                                if (rfqEAV_CRUD.ErrorOccur)
                                {
                                    response.ErrorThrown = true;
                                    response.ResponseDescription = "ERROR: " + rfqEAV_CRUD.ErrorMessage;
                                    return JsonConvert.SerializeObject(response);
                                }
                            }                            
                        }
                        else
                        {
                            response.ErrorThrown = true;
                            response.ResponseDescription = "ERROR: " + rfqCRUD.ErrorMessage;
                            return JsonConvert.SerializeObject(response);
                        }
                    }

                    DM.CommitTransaction();
                    DM.Close_Open_Connection();

                    if (DM.ErrorOccur)
                    {
                        response.ErrorThrown = true;
                        response.ResponseDescription = "ERROR:" + DM.Error_Mjs;
                        return JsonConvert.SerializeObject(response);
                    }

                    resultRFQs.Add(rfq);
                }
            }
        }
        response.ErrorThrown = false;
        response.ResponseDescription = "RFQs created successfully.";
        response.Result = resultRFQs;
        return JsonConvert.SerializeObject(response);
    }
    private string HTMLContent(string url)
    {
        string result = string.Empty;
        using (StreamReader reader = new StreamReader(Server.MapPath(url)))
        {
            result = reader.ReadToEnd();
        }
        return result;
    }
    public string resendRFQ()
    {
        GatewayResponse response = new GatewayResponse();
        String s;
        RFQ rfqToResend;
        try
        {
            s = new StreamReader(Request.InputStream).ReadToEnd();
            rfqToResend = JsonConvert.DeserializeObject<RFQ>(s);
        }
        catch (Exception ex)
        {
            response.ErrorThrown = true;
            response.ResponseDescription = "ERROR: When trying to parse JSON in server. " + ex.Message;
            return JsonConvert.SerializeObject(response);
        }

        UserCRUD user_CRUD = new UserCRUD();
        string strAuthUser = HttpContext.Current.User.Identity.Name;
        User user = user_CRUD.readById(strAuthUser);

        SupplierCRUD supplier_CRUD = new SupplierCRUD();
        Supplier supplier = supplier_CRUD.readById(rfqToResend.SupplierId);
        if (supplier != null)
        {
            if (supplier.ContactEmail.Trim() != rfqToResend.LastEmail.Trim())
            {
                supplier.ContactEmail = rfqToResend.LastEmail.Trim();
                if (!supplier_CRUD.update(supplier))
                {
                    response.ErrorThrown = true;
                    response.ResponseDescription = "ERROR:" + supplier_CRUD.ErrorMessage;
                    return JsonConvert.SerializeObject(response);
                }
            }
        }

        TokenCRUD token_CRUD = new TokenCRUD();
        Token token = token_CRUD.readByRFQ(rfqToResend);

        ConnectionManager CM = new ConnectionManager();
        Data_Base_MNG.SQL DM = CM.getDataManager();

        /*Begin Transaction*/
        DM.Open_Connection("RFQ Re-send");

        rfqToResend.SentToVendor = DateTime.Now;
        if (!rfq_CRUD.update(rfqToResend, ref DM))
        {
            response.ErrorThrown = true;
            response.ResponseDescription = "ERROR:" + rfq_CRUD.ErrorMessage;
            return JsonConvert.SerializeObject(response);
        }

        if (token == null)
        {
            token = new Token();
            token.Subject = "RFQ";
            token.SubjectKey = rfqToResend.Id;
            token.TokenNumber = MD5HashGenerator.GenerateKey(DateTime.Now);
            token_CRUD.create(token, ref DM);
            if (token_CRUD.ErrorOccur)
            {
                response.ErrorThrown = true;
                response.ResponseDescription = "ERROR:" + token_CRUD.ErrorMessage;
                return JsonConvert.SerializeObject(response);
            }
        }


        Email NewMail = new Email();
        MailMessage Message = new MailMessage();
        try
        {
            Message.From = new MailAddress("rfqm@capsonic.com", "rfqm@capsonic.com");
            Message.To.Add(new MailAddress(supplier.ContactEmail.ToString()));
            Message.Subject = "Request For Quote";
            Message.IsBodyHtml = true;
            Message.BodyEncoding = System.Text.Encoding.UTF8;

            var url = ResolveUrl("~/Vendor/Email_RFQ_Request.htm");
            var strEmailContent = HTMLContent(url);
            strEmailContent = strEmailContent.Replace("{BuyerName}", user.Name);
            strEmailContent = strEmailContent.Replace("{BuyerPhone}", user.Phone1);
            strEmailContent = strEmailContent.Replace("{BuyerEmail}", user.Email);
            strEmailContent = strEmailContent.Replace("{RFQ Number}", rfqToResend.RfqGenerated);
            strEmailContent = strEmailContent.Replace("{Part Number}", rfqToResend.PartNumber);
            strEmailContent = strEmailContent.Replace("{RFQLink}", "http://" + Request.Url.Authority + Request.ApplicationPath + "/Vendor/RFQHandler.ashx?token=" + token.TokenNumber);

            Message.Body = strEmailContent;


            NewMail.SendMail(Message);
        }
        catch (Exception ex)
        {
            DM.RollBack();
            response.ErrorThrown = true;
            response.ResponseDescription = "ERROR: Could not send email to: " + supplier.ContactEmail.ToString();
            return JsonConvert.SerializeObject(response);
        }

        DM.CommitTransaction();
        DM.Close_Open_Connection();

        if (DM.ErrorOccur)
        {
            response.ErrorThrown = true;
            response.ResponseDescription = "ERROR:" + DM.Error_Mjs;
            return JsonConvert.SerializeObject(response);
        }

        response.ErrorThrown = false;
        response.ResponseDescription = "RFQ " + rfqToResend.RfqGenerated + " re-sent successfully.";
        response.Result = rfqToResend;
        return JsonConvert.SerializeObject(response);
    }
    public string readRFQsByBOMLineID(long BOMLineID)
    {
        GatewayResponse response = new GatewayResponse();
        
        List<RFQ> result = new List<RFQ>();
        result = rfq_CRUD.readByBOMDetailKey(BOMLineID);

        response.ErrorThrown = false;
        response.ResponseDescription = "";
        response.Result = result;
        return JsonConvert.SerializeObject(response);
    }
}