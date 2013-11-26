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
    private Supplier supplier = null;
    protected void Page_Load(object sender, EventArgs e)
    {
        btnNewSupplier.OnClientClick = "return promptUser('New Supplier', 's~', " + ((HiddenField)uscNotifier.FindControl("txtPrompt")).ClientID + ")";
        btnNewMarketSector.OnClientClick = "return promptUser('New Market Sector', 'm~', " + ((HiddenField)uscNotifier.FindControl("txtPrompt")).ClientID + ")";
        if (Session["supplierObject"] != null)
        {
            this.supplier = (Supplier)((SessionObject)Session["supplierObject"]).Content;
        }
        if (txtDueDate.Text.Trim() == "")
        {
            txtDueDate.Text = DateTime.Now.ToShortDateString();
        }
    }
    protected void btnSendRFQ_Click(object sender, EventArgs e)
    {
        if (supplier.ContactEmail.Trim() != txtEmail.Text.Trim())
        {
            supplier.ContactEmail = txtEmail.Text.Trim();
            if (!supplierCRUD.update(supplier))
            {
                Navigator.goToPage("~/Error.aspx", "");
                return;
            }
        }

        RFQNumberEntity rfqNumber = new RFQNumberEntity();
        RFQNumberCRUD rfqNumberCRUD = new RFQNumberCRUD();

        rfqNumber.BOMDetailKey = (long)ViewState["bomDetailID"];
        rfqNumber.SifHeaderKey = (long)ViewState["sifHeaderID"];
        rfqNumber.RFQNumber = rfqNumberCRUD.generateNewRFQNumber(rfqNumber.SifHeaderKey);
        if (rfqNumber.RFQNumber == -1)
        {
            Navigator.goToPage("~/Error.aspx", "");
            return;
        }
        String idGeneratedRFQNumber = rfqNumberCRUD.createAndReturnIdGenerated(rfqNumber);
        if (idGeneratedRFQNumber == "")
        {
            Navigator.goToPage("~/Error.aspx", "");
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
            if (chkTargetPrice.Checked)
            {   
                rfq.TargetPrice = float.Parse(txtTargetPrice.Text);
            }
            rfq.CommentsToVendor = txtCommentToVendor.Text.Trim();
            string idGenerated = rfqCRUD.createAndReturnIdGenerated(rfq);
            
            if (idGenerated != "")
            {
                rfq.Id = long.Parse(idGenerated);
                
                TokenCRUD token_CRUD = new TokenCRUD();
                Token token = new Token();
                token.Subject = "RFQ";
                token.SubjectKey = long.Parse(idGenerated);
                token.TokenNumber = MD5HashGenerator.GenerateKey(DateTime.Now);
                if (token_CRUD.create(token))
                {
                    Email NewMail = new Email();
                    MailMessage Message = new MailMessage();

                    Message.From = new MailAddress("capsonic.apps@gmail.com", "capsonic.apps@gmail.com");
                    Message.To.Add(new MailAddress(supplier.ContactEmail.ToString()));
                    Message.Subject = "Test from APQM WEB - sending RFQ";
                    Message.IsBodyHtml = true;
                    Message.BodyEncoding = System.Text.Encoding.UTF8;

                    AlternateView htmlView = AlternateView.CreateAlternateViewFromString("Please click the following link to open the RFQ form:  http://" +
                        Request.Url.Authority + Request.ApplicationPath + "/Vendor/RFQHandler.ashx?token=" + token.TokenNumber);
                    Message.AlternateViews.Add(htmlView);

                    string path = HttpRuntime.AppDomainAppPath.ToString() + @"\Docs\NDA.pdf";

                    Attachment x = new Attachment(path);

                    Message.Attachments.Add(x);
                    try
                    {
                        NewMail.SendMail(Message);
                        Session.Remove("RFQTEMPFOLDER");
                    }
                    catch
                    {
                        Navigator.goToPage("~/Error.aspx", "");
                        return;
                    }
                }
            }
            else
            {
                Navigator.goToPage("~/Error.aspx", "");
                return;
            }
        
        }
        
        supplier = null;
        Ok_Click(this, e);
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        supplier = null;
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
        if (entidad != null)
        {
            this.supplier = (Supplier)entidad;
        }
        else
        {
            this.supplier = new Supplier();
        }
        SessionObject so = new SessionObject();
        so.Content = this.supplier;
        Session["supplierObject"] = so;

        txtEmail.Text = supplier.ContactEmail;
        cboSupplier.Focus();
    }
    protected void on_dataBound_supplier(object sender, EventArgs e)
    {
        cboSupplier_SelectedIndexChanged(sender, e);
    }
    public void setBOMDetailID(long id)
    {
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
                        if (idGenerated != "")
                        {
                            //SqlDataSource1.DataBind();
                            cboSupplier.DataBind();
                            cboSupplier.SelectedValue = idGenerated;

                            txtEmail.Text = "";
                            cboSupplier.Focus();
                        }
                        else
                        {
                            uscNotifier.showAlert("Supplier could not be saved.");
                        }
                        break;
                    case "m":
                        MarketSector marketSector = new MarketSector();
                        marketSector.Name = prompt[1];

                        MarketSectorCRUD marketSector_CRUD = new MarketSectorCRUD();


                        string idGeneratedMarket = marketSector_CRUD.createAndReturnIdGenerated(marketSector);
                        if (idGeneratedMarket != "")
                        {
                            //SqlDataSource1.DataBind();
                            cboMarketSector.DataBind();
                            cboMarketSector.SelectedValue = idGeneratedMarket;

                            cboMarketSector.Focus();
                        }
                        else
                        {
                            uscNotifier.showAlert("Market Sector could not be saved.");
                        }
                        break;
                }
            }
            ((HiddenField)sender).Value = "";
        }
    }
}