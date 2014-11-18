using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json;
using System.IO;
using System.Configuration;

public partial class WebService_RFQ : System.Web.UI.Page
{
    RfqCRUD rfq_CRUD = new RfqCRUD();
    RfqAcrCRUD rfqACR_CRUD = new RfqAcrCRUD();
    RFQEAVCRUD rfqEAV_CRUD = new RFQEAVCRUD();
    RfqDetailCRUD rfqDetail_CRUD = new RfqDetailCRUD();
    UserCRUD user_CRUD = new UserCRUD();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request["RFQATTACHMENTSFOLDERINBOX"] != null)
        {
            if (getPostedAttachmentsToBuyer()) return;
        }
        else if (Request["RFQATTACHMENTSFOLDER"] != null)
        {
            if (getPostedAttachmentsToVendor()) return;
        }


        if (Request["cmd"] == null)
            return;

        string cmd = Request["cmd"].ToString();

        switch (cmd)
        {
            case "create":
                return;
            case "read":
                Response.Clear();
                Response.Write(getRFQbyID(long.Parse(Request["id"])));
                Response.End();
                return;
            case "get":
                Response.Clear();
                Response.Write(getRFQ());
                Response.End();
                return;
            case "update":
                Response.Clear();
                Response.Write(updateRFQ());
                Response.End();
                return;
            case "delete":

                return;
            case "deleteAttachmentToBuyer":
                deleteAttachmentToBuyerByName(Request["Directory"], Request["FileName"]);
                return;
            case "downloadAttachmentToBuyer":
                downloadAttachmentToBuyer(Request["Directory"], Request["FileName"]);
                return;
            case "deleteAttachmentToVendor":
                deleteAttachmentToVendorByName(Request["Directory"], Request["FileName"]);
                return;
            case "downloadAttachmentToVendor":
                downloadAttachmentToVendor(Request["Directory"], Request["FileName"]);
                return;
        }
    }

    public bool getPostedAttachmentsToBuyer()
    {
        HttpPostedFile file = Request.Files["myfile"];
        HttpFileCollection fileCollection = Request.Files;
        if (file != null)
        {
            string fileName = file.FileName;
            HttpPostedFile postedFile = file;

            string baseAttachmentsPath = ConfigurationManager.AppSettings["RFQAttachmentsInbox"];

            string currentPathAttachments;
            string folderName = Request["RFQATTACHMENTSFOLDERINBOX"];
            if (folderName != null && folderName.Trim() != "")
            {
                currentPathAttachments = baseAttachmentsPath + folderName + @"\";
            }
            else
            {
                do
                {
                    DateTime date = DateTime.Now;
                    folderName = date.Year.ToString() + date.Month.ToString() +
                                    date.Day.ToString() + "_" + MD5HashGenerator.GenerateKey(date);
                    currentPathAttachments = baseAttachmentsPath + folderName;
                } while (Directory.Exists(currentPathAttachments));
                Directory.CreateDirectory(currentPathAttachments);
                currentPathAttachments += @"\";
            }

            if (postedFile.ContentLength > 0)
            {
                postedFile.SaveAs(currentPathAttachments + Path.GetFileName(postedFile.FileName));
            }
            Response.Clear();
            Response.Write("[{\"FolderName\":\"" + folderName + "\"}," + JsonConvert.SerializeObject(getAttachmentsFromFolder(folderName)) + "]");
            Response.End();
            return true;
        }
        return false;
    }
    public bool getPostedAttachmentsToVendor()
    {
        HttpPostedFile file = Request.Files["myfile"];
        HttpFileCollection fileCollection = Request.Files;
        if (file != null)
        {
            string fileName = file.FileName;
            HttpPostedFile postedFile = file;

            string baseAttachmentsPath = ConfigurationManager.AppSettings["RFQAttachmentsSent"];

            string currentPathAttachments;
            string folderName = Request["RFQATTACHMENTSFOLDER"];
            if (folderName != null && folderName.Trim() != "")
            {
                currentPathAttachments = baseAttachmentsPath + folderName + @"\";
            }
            else
            {
                do
                {
                    DateTime date = DateTime.Now;
                    folderName = date.Year.ToString() + date.Month.ToString() +
                                    date.Day.ToString() + "_" + MD5HashGenerator.GenerateKey(date);
                    currentPathAttachments = baseAttachmentsPath + folderName;
                } while (Directory.Exists(currentPathAttachments));
                Directory.CreateDirectory(currentPathAttachments);
                currentPathAttachments += @"\";
            }

            if (postedFile.ContentLength > 0)
            {
                postedFile.SaveAs(currentPathAttachments + Path.GetFileName(postedFile.FileName));
            }
            Response.Clear();
            Response.Write("[{\"FolderName\":\"" + folderName + "\"}," + JsonConvert.SerializeObject(getAttachmentsFromSentFolder(folderName)) + "]");
            Response.End();
            return true;
        }
        return false;
    }
    public List<RFQAttachments> getAttachmentsFromFolder(string folderName)
    {
        List<RFQAttachments> rfqInboxAttachmentsList = new List<RFQAttachments>();
        string baseInboxAttachmentsPath = ConfigurationManager.AppSettings["RFQAttachmentsInbox"];
        if (folderName != "" && Directory.Exists(baseInboxAttachmentsPath + folderName.Trim()))
        {
            DirectoryInfo directory = new DirectoryInfo(baseInboxAttachmentsPath + folderName);
            foreach (FileInfo file in directory.GetFiles())
            {
                RFQAttachments rfqAttachment = new RFQAttachments();
                rfqAttachment.FileName = file.Name;
                rfqAttachment.Directory = folderName;
                rfqInboxAttachmentsList.Add(rfqAttachment);
            }
        }
        return rfqInboxAttachmentsList;
    }
    public List<RFQAttachments> getAttachmentsFromSentFolder(string folderName)
    {
        List<RFQAttachments> rfqInboxAttachmentsList = new List<RFQAttachments>();
        string baseInboxAttachmentsPath = ConfigurationManager.AppSettings["RFQAttachmentsSent"];
        if (folderName != "" && Directory.Exists(baseInboxAttachmentsPath + folderName.Trim()))
        {
            DirectoryInfo directory = new DirectoryInfo(baseInboxAttachmentsPath + folderName);
            foreach (FileInfo file in directory.GetFiles())
            {
                RFQAttachments rfqAttachment = new RFQAttachments();
                rfqAttachment.FileName = file.Name;
                rfqAttachment.Directory = folderName;
                rfqInboxAttachmentsList.Add(rfqAttachment);
            }
        }
        return rfqInboxAttachmentsList;
    }
    private string getRFQbyID(long id)
    {
        RFQ rfq = rfq_CRUD.readById(id);

        rfq.User = user_CRUD.readById(rfq.CreatedBy);

        rfq.RfqAcr = rfqACR_CRUD.readByParentID(rfq.Id);

        rfq.RfqEAV = rfqEAV_CRUD.readByParentID(rfq.Id);

        foreach (RFQEAV rfqEAV in rfq.RfqEAV)
        {
            List<RFQDetail> rfqDetail = rfqDetail_CRUD.readByParentID(rfqEAV.Id);
            rfqEAV.RfqDetail = rfqDetail;
        }

        updateAttachmentsToBuyer(ref rfq);
        updateAttachmentsToVendor(ref rfq);

        return JsonConvert.SerializeObject(rfq);
    }


    private string getRFQ()
    {
        GatewayResponse response = new GatewayResponse();
        long id = -1;
        try
        {
            id = long.Parse(Request["id"]);
        }
        catch (Exception ex)
        {
            response.ErrorThrown = true;
            response.ResponseDescription = "Bad request.";
            return JsonConvert.SerializeObject(response);
        }

        RFQ rfq = rfq_CRUD.readById(id);

        rfq.User = user_CRUD.readById(rfq.CreatedBy);

        rfq.RfqAcr = rfqACR_CRUD.readByParentID(rfq.Id);

        rfq.RfqEAV = rfqEAV_CRUD.readByParentID(rfq.Id);

        foreach (RFQEAV rfqEAV in rfq.RfqEAV)
        {
            List<RFQDetail> rfqDetail = rfqDetail_CRUD.readByParentID(rfqEAV.Id);
            rfqEAV.RfqDetail = rfqDetail;
        }

        updateAttachmentsToBuyer(ref rfq);
        updateAttachmentsToVendor(ref rfq);

        response.ErrorThrown = false;
        response.ResponseDescription = "OK";
        response.Result = rfq;

        return JsonConvert.SerializeObject(response);
    }

    private void updateAttachmentsToVendor(ref RFQ rfq)
    {
        rfq.AttachmentsToVendor = null;
        string baseSentAttachmentsPath = ConfigurationManager.AppSettings["RFQAttachmentsSent"];

        if (rfq.SentAttachmentsFolder.Trim() != "" && Directory.Exists(baseSentAttachmentsPath + rfq.SentAttachmentsFolder.Trim()))
        {
            List<RFQAttachments> rfqSentAttachmentsList = new List<RFQAttachments>();
            DirectoryInfo directory = new DirectoryInfo(baseSentAttachmentsPath + rfq.SentAttachmentsFolder);
            foreach (FileInfo file in directory.GetFiles())
            {
                RFQAttachments rfqAttachment = new RFQAttachments();
                rfqAttachment.FileName = file.Name;
                rfqAttachment.Directory = rfq.SentAttachmentsFolder;
                rfqSentAttachmentsList.Add(rfqAttachment);
            }
            rfq.AttachmentsToVendor = rfqSentAttachmentsList;
        }
    }
    public void updateAttachmentsToBuyer(ref RFQ rfq)
    {
        rfq.AttachmentsToBuyer = null;
        string baseInboxAttachmentsPath = ConfigurationManager.AppSettings["RFQAttachmentsInbox"];
        if (rfq.InboxAttachmentsFolder.Trim() != "" && Directory.Exists(baseInboxAttachmentsPath + rfq.InboxAttachmentsFolder.Trim()))
        {
            List<RFQAttachments> rfqInboxAttachmentsList = new List<RFQAttachments>();
            DirectoryInfo directory = new DirectoryInfo(baseInboxAttachmentsPath + rfq.InboxAttachmentsFolder);
            foreach (FileInfo file in directory.GetFiles())
            {
                RFQAttachments rfqAttachment = new RFQAttachments();
                rfqAttachment.FileName = file.Name;
                rfqAttachment.Directory = rfq.InboxAttachmentsFolder;
                rfqInboxAttachmentsList.Add(rfqAttachment);
            }
            rfq.AttachmentsToBuyer = rfqInboxAttachmentsList;
        }
    }
    public void downloadAttachmentToVendor(string strDirectory, string strFileName)
    {
        string baseAttachmentsPath = ConfigurationManager.AppSettings["RFQAttachmentsSent"];
        string filePath = baseAttachmentsPath + strDirectory + "\\" + strFileName;
        FileInfo file = new FileInfo(filePath);
        Response.AddHeader("Content-Disposition", "attachment;filename=" + file.Name);
        Response.TransmitFile(filePath);
        Response.End();
    }

    public void downloadAttachmentToBuyer(string strDirectory, string strFileName)
    {
        string baseAttachmentsPath = ConfigurationManager.AppSettings["RFQAttachmentsInbox"];
        string filePath = baseAttachmentsPath + strDirectory + "\\" + strFileName;
        FileInfo file = new FileInfo(filePath);
        Response.AddHeader("Content-Disposition", "attachment;filename=" + file.Name);
        Response.TransmitFile(filePath);
        Response.End();
    }
    public void deleteAttachmentToBuyerByName(string strDirectory, string strFileName)
    {
        string baseAttachmentsPath = ConfigurationManager.AppSettings["RFQAttachmentsInbox"];
        string filePath = baseAttachmentsPath + strDirectory + "\\" + strFileName;
        FileInfo file = new FileInfo(filePath);
        file.Delete();
        Response.Clear();
        Response.Write("{\"Result\":\"" + "Attachment deleted succesfully." + "\"}");
        Response.End();
    }
    public void deleteAttachmentToVendorByName(string strFileName)
    {
        GatewayResponse response = new GatewayResponse();
        string baseAttachmentsPath = ConfigurationManager.AppSettings["RFQAttachmentsSent"];
        string filePath = baseAttachmentsPath + strFileName;
        FileInfo file = new FileInfo(filePath);
        file.Delete();
        response.ErrorThrown = false;
        response.ResponseDescription = "Attachment '" + strFileName + "' deleted succesfully.";
        response.Result = strFileName;
        Response.Clear();
        Response.Write(JsonConvert.SerializeObject(response));
        Response.End();
    }
    public void deleteAttachmentToVendorByName(string strDirectory, string strFileName)
    {
        GatewayResponse response = new GatewayResponse();
        string baseAttachmentsPath = ConfigurationManager.AppSettings["RFQAttachmentsSent"];
        string filePath = baseAttachmentsPath + strDirectory + "\\" + strFileName;
        FileInfo file = new FileInfo(filePath);
        file.Delete();
        response.ErrorThrown = false;
        response.ResponseDescription = "Attachment '" + strFileName + "' deleted succesfully.";
        response.Result = strFileName;
        Response.Clear();
        Response.Write(JsonConvert.SerializeObject(response));
        Response.End();
    }

    private string updateRFQ()
    {
        String s = new StreamReader(Request.InputStream).ReadToEnd();
        RFQ rfq = JsonConvert.DeserializeObject<RFQ>(s);

        if (rfq.Status == "COMPLETED")
        {
            if (rfq.NoQuote) rfq.Status = "NO QUOTE";
        }

        /*Begin Transaction*/
        ConnectionManager CM = new ConnectionManager();
        Data_Base_MNG.SQL DM = CM.getDataManager();

        DM.Open_Connection("RFQ Update");
        if (!rfq_CRUD.update(rfq, ref DM))
        {
            return "ERROR:" + rfq_CRUD.ErrorMessage;
        }

        foreach (RFQEAV rfqEAVLocal in rfq.RfqEAV)
        {
            if (!rfqEAV_CRUD.update(rfqEAVLocal, ref DM))
            {
                return "ERROR:" + rfqEAV_CRUD.ErrorMessage;
            }

            if (!rfqDetail_CRUD.deleteByParentID(rfqEAVLocal.Id, ref DM))
            {
                return "ERROR:" + rfqDetail_CRUD.ErrorMessage;
            }

            foreach (RFQDetail rfqDetailCurrent in rfqEAVLocal.RfqDetail)
            {
                rfqDetailCurrent.RfqEAVKey = rfqEAVLocal.Id;
                if (!rfqDetail_CRUD.create(rfqDetailCurrent, ref DM))
                {
                    return "ERROR:" + rfqDetail_CRUD.ErrorMessage;
                }
            }
        }
        if (!rfqACR_CRUD.deleteByParentID(rfq.Id, ref DM))
        {
            return "ERROR:" + rfqACR_CRUD.ErrorMessage;
        }
        foreach (RFQACR currentACR in rfq.RfqAcr)
        {
            currentACR.RfqHeaderKey = rfq.Id;
            if (!rfqACR_CRUD.create(currentACR, ref DM))
            {
                return "ERROR:" + rfqACR_CRUD.ErrorMessage;
            }
        }

        DM.CommitTransaction();
        DM.Close_Open_Connection();

        if (DM.ErrorOccur)
        {
            return "ERROR:" + DM.Error_Mjs;
        }

        return getRFQbyID(rfq.Id);
    }
}