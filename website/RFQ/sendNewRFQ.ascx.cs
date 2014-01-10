using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;

public partial class SendNewRFQ : System.Web.UI.UserControl
{   
    public event EventHandler Ok_Click;
    public event EventHandler Cancel_Click;
    private SupplierCRUD supplierCRUD = new SupplierCRUD();
    private List<Supplier> supplierList = null;
    
    protected void Page_Load(object sender, EventArgs e)
    {
        btnNewSupplier.OnClientClick = "return promptUser('New supplierList', 's~', " + ((HiddenField)uscNotifier.FindControl("txtPrompt")).ClientID + ")";
        btnNewMarketSector.OnClientClick = "return promptUser('New Market Sector', 'm~', " + ((HiddenField)uscNotifier.FindControl("txtPrompt")).ClientID + ")";
        
        supplierList = (List<Supplier>)Session["SupplierList"];
        if (supplierList == null)
        {
            supplierList = new List<Supplier>();
            Session["SupplierList"] = supplierList;
        }
        
        if (txtDueDate.Text.Trim() == "")
        {
            txtDueDate.Text = DateTime.Now.ToShortDateString();
        }
    }
    protected void btnSendRFQ_Click(object sender, EventArgs e)
    {
        RFQNumberCRUD rfqNumberCRUD = new RFQNumberCRUD();
        string folderAttachments = (string)Session["RFQATTACHMENTSFOLDER"];

        string strAuthUser = HttpContext.Current.User.Identity.Name;

        string[] arrEAU = ((Label)frmBOMLine.FindControl("EAULabel")).Text.Split(',');
        
        if (supplierList.Count > 0)
        {
            foreach (Supplier supplier in supplierList)
            {
                for (var i = 0; i < arrEAU.Length; i++)
                {
                    if (arrEAU[i].Trim() != "")
                    {
                        RFQNumberEntity rfqNumber = new RFQNumberEntity();

                        rfqNumber.BOMDetailKey = (long)ViewState["bomDetailID"];
                        rfqNumber.SifHeaderKey = (long)ViewState["sifHeaderID"];
                        rfqNumber.RFQNumber = rfqNumberCRUD.generateNewRFQNumber(rfqNumber.SifHeaderKey);

                        if (rfqNumber.RFQNumber == -1)
                        {
                            Navigator.goToPage("~/Error.aspx", "ERROR:There was an error generating a new RFQ number.");
                            return;
                        }

                        ConnectionManager CM = new ConnectionManager();
                        Data_Base_MNG.SQL DM = CM.getDataManager();

                        /*Begin Transaction*/
                        DM.Open_Connection("Send New RFQ Save");



                        String idGeneratedRFQNumber = rfqNumberCRUD.createAndReturnIdGenerated(rfqNumber, ref DM);
                        if (rfqNumberCRUD.ErrorOccur)
                        {
                            Navigator.goToPage("~/Error.aspx", "ERROR:" + rfqNumberCRUD.ErrorMessage);
                            return;
                        }
                        else
                        {
                            RFQ rfq = new RFQ();
                            RfqCRUD rfqCRUD = new RfqCRUD();

                            rfq.SupplierId = supplier.Id;
                            rfq.SentToVendor = DateTime.Now;
                            rfq.Status = "PENDING";
                            rfq.BomDetailId = (long)ViewState["bomDetailID"];
                            rfq.RfqNumberKey = long.Parse(idGeneratedRFQNumber);
                            rfq.DueDate = DateTime.Parse(txtDueDate.Text);
                            rfq.MarketSectorID = long.Parse(cboMarketSector.SelectedValue);
                            rfq.DrawingLevel = txtDrawingLevel.Text;
                            rfq.EstimatedAnnualVolume = arrEAU[i].Trim();
                            if (chkTargetPrice.Checked)
                            {
                                rfq.TargetPrice = float.Parse(txtTargetPrice.Text);
                            }
                            rfq.CommentsToVendor = txtCommentToVendor.Text.Trim();

                            if (folderAttachments != null)
                            {
                                rfq.SentAttachmentsFolder = folderAttachments;
                            }

                            rfq.CreatedBy = strAuthUser;

                            string idGenerated = rfqCRUD.createAndReturnIdGenerated(rfq, ref DM);

                            if (!rfqCRUD.ErrorOccur)
                            {
                                rfq.Id = long.Parse(idGenerated);
                                TokenCRUD token_CRUD = new TokenCRUD();
                                Token token = new Token();
                                token.Subject = "RFQ";
                                token.SubjectKey = long.Parse(idGenerated);
                                token.TokenNumber = MD5HashGenerator.GenerateKey(DateTime.Now);
                                if (token_CRUD.create(token, ref DM))
                                {
                                    Email NewMail = new Email();
                                    MailMessage Message = new MailMessage();

                                    Message.From = new MailAddress("capsonic.apps@gmail.com", "capsonic.apps@gmail.com");
                                    Message.To.Add(new MailAddress(supplier.ContactEmail.ToString()));
                                    Message.Subject = "Request For Quote";
                                    Message.IsBodyHtml = true;
                                    Message.BodyEncoding = System.Text.Encoding.UTF8;

                                    string strEmailContent =    "Dear Supplier," + Environment.NewLine
                                                                + "We are seeking quotations to match the part/process description shown on our RFQ form.  Please click the following link to be directed to the RFQ page.  Drawings and special instructions will be included there also."
                                                                + " Please fill out the RFQ form as completely as possible. You may attach documents to the RFQ, but the RFQ form must be completed."
                                                                + Environment.NewLine + Environment.NewLine
                                                                + "There is an instruction module available to walk you through the form should you need assistance.  If you have any questions regarding the RFQ, please contact the Capsonic Advanced Purchasing Buyer shown on the RFQ form."
                                                                + Environment.NewLine + Environment.NewLine
                                                                + "http://" + Request.Url.Authority + Request.ApplicationPath + "/Vendor/RFQHandler.ashx?token=" + token.TokenNumber
                                                                + Environment.NewLine + Environment.NewLine
                                                                + "Please mark this e-mail as coming from a trusted source to avoid issues with future correspondence reaching your inbox."
                                                                + Environment.NewLine + Environment.NewLine
                                                                + "Sincerely," + Environment.NewLine + Environment.NewLine + "The Capsonic Advanced Purchasing Team";


                                    AlternateView htmlView = AlternateView.CreateAlternateViewFromString(strEmailContent);
                                    Message.AlternateViews.Add(htmlView);


                                    //NDA Attachment not used anymore
                                    //string path = HttpRuntime.AppDomainAppPath.ToString() + @"\Docs\NDA.pdf";
                                    //Attachment x = new Attachment(path);
                                    //Message.Attachments.Add(x);
                                    try
                                    {
                                        NewMail.SendMail(Message);
                                    }
                                    catch
                                    {
                                        DM.RollBack();
                                        Navigator.goToPage("~/Error.aspx", "ERROR:Could not send email to: " + supplier.ContactEmail.ToString());
                                        return;
                                    }
                                }
                                else
                                {
                                    Navigator.goToPage("~/Error.aspx", "ERROR:" + token_CRUD.ErrorMessage);
                                    return;
                                }
                            }
                            else
                            {
                                Navigator.goToPage("~/Error.aspx", "ERROR:" + rfqCRUD.ErrorMessage);
                                return;
                            }
                        }

                        DM.CommitTransaction();
                        DM.Close_Open_Connection();

                        if (DM.ErrorOccur)
                        {
                            Navigator.goToPage("~/Error.aspx", "ERROR:" + DM.Error_Mjs);
                            return;
                        }
                    }
                }
            }
        }

        Session.Remove("RFQATTACHMENTS");
        Session.Remove("RFQATTACHMENTSFOLDER");

        supplierList = null;
        Ok_Click(this, e);
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        supplierList = null;
        Cancel_Click(this, e);
    }
    protected void cboSupplier_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (cboSupplier.Items.Count > 0)
        {
            long id = long.Parse(cboSupplier.SelectedItem.Value);
            if (id > -1)
            {
                setEntity(supplierCRUD.readById(id));
            }
        }
    }
    public void setEntity(Object entidad){
        Supplier supplier;
        if (entidad != null)
        {
            supplier = (Supplier)entidad;
        }
        else
        {
            supplier = new Supplier();
        }
        
        txtEmail.Text = supplier.ContactEmail;
        cboSupplier.Focus();
    }
    protected void on_dataBound_supplier(object sender, EventArgs e)
    {
        cboSupplier_SelectedIndexChanged(sender, e);
    }
    public void setBOMDetailID(long id)
    {
        lstEmail.Items.Clear();
        lstEmail.DataBind();

        ViewState["bomDetailID"] = id;
        lblBomDetailID.Text = id.ToString();
        frmBOMLine.DataBind();

        cboSupplier.Focus();
    }
    public void setSIFHeaderID(long id)
    {
        ViewState["sifHeaderID"] = id;
        sifDetailCRUD sifDetail_CRUD = new sifDetailCRUD();
        List<SIFDetail> sifDetail = sifDetail_CRUD.readByParentID(id);
        uscSifDetail.setEntity(sifDetail);
    }
    public void on_sqldatasource_Init(Object sender, EventArgs e)
    {
        ConnectionManager connection = new ConnectionManager();
        SqlDataSource1.ConnectionString = connection.getConnection().ConnectionString;
        SqlDataSourceRFQCountPerBOMDetail.ConnectionString = connection.getConnection().ConnectionString;
        SqlDataSourceMarketSector.ConnectionString = connection.getConnection().ConnectionString;
    }
    protected void on_prompt(object sender, EventArgs e)
    {
        string value = ((HiddenField)sender).Value;

        if (value.Trim() != "")
        {
            string[] prompt = value.Split('~');
            if (prompt[1] != "null" && prompt[1].Trim() != "")
            {
                switch (prompt[0])
                {
                    case "s":
                        Supplier supplier = new Supplier();
                        supplier.SupplierName = prompt[1];

                        string idGenerated =supplierCRUD.createAndReturnIdGenerated(supplier);
                        if (!supplierCRUD.ErrorOccur)
                        {
                            //SqlDataSource1.DataBind();
                            cboSupplier.DataBind();
                            cboSupplier.SelectedValue = idGenerated;

                            txtEmail.Text = "";
                            cboSupplier.Focus();
                        }
                        else
                        {
                            uscNotifier.showAlert("Supplier could not be saved. " + supplierCRUD.ErrorMessage);
                        }
                        break;
                    case "m":
                        MarketSector marketSector = new MarketSector();
                        marketSector.Name = prompt[1];

                        MarketSectorCRUD marketSector_CRUD = new MarketSectorCRUD();


                        string idGeneratedMarket = marketSector_CRUD.createAndReturnIdGenerated(marketSector);
                        if (!marketSector_CRUD.ErrorOccur)
                        {
                            //SqlDataSource1.DataBind();
                            cboMarketSector.DataBind();
                            cboMarketSector.SelectedValue = idGeneratedMarket;

                            cboMarketSector.Focus();
                        }
                        else
                        {
                            uscNotifier.showAlert("Market Sector could not be saved. " + marketSector_CRUD.ErrorMessage);
                        }
                        break;
                }
            }
            ((HiddenField)sender).Value = "";
        }
    }
    protected void btnSelectMaterial_Click(object sender, EventArgs e)
    {
        panelPopupSelectMaterial.Visible = true;
    }
    protected void btnOKSelectMaterial_Click(object sender, EventArgs e)
    {
        panelPopupSelectMaterial.Visible = false;
    }
    protected void btnCancelSelectMaterial_Click(object sender, EventArgs e)
    {
        panelPopupSelectMaterial.Visible = false;
    }
    protected void btnAddEmail_Click(object sender, EventArgs e)
    {
        if (txtEmail.Text.Trim() != "")
        {
            Supplier supplier = supplierCRUD.readById(long.Parse(cboSupplier.SelectedValue));

            if (supplier.ContactEmail.Trim() != txtEmail.Text.Trim())
            {
                supplier.ContactEmail = txtEmail.Text.Trim();
                if (!supplierCRUD.update(supplier))
                {
                    Navigator.goToPage("~/Error.aspx", "ERROR:" + supplierCRUD.ErrorMessage);
                    return;
                }
            }
            if (!supplierList.Any(item=>item.Id == supplier.Id )){
                supplierList.Add(supplier);
            }
            
            bindEmailList();
        }
    }
    private void bindEmailList(){
        lstEmail.DataSource = supplierList;
        lstEmail.DataTextField = "NameAndEmail";
        lstEmail.DataBind();
    }
    protected void btnRemoveEmail_Click(object sender, EventArgs e)
    {
        try
        {
            if (lstEmail.SelectedIndex > -1)
            {
                supplierList.RemoveAt(lstEmail.SelectedIndex);
                bindEmailList();
            }
        }
        catch
        {
        }
    }
}