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

        RFQ rfq = new RFQ();
        RfqCRUD rfqCRUD = new RfqCRUD();

        rfq.SupplierId = supplier.Id;
        rfq.SentToVendor = DateTime.Now;
        rfq.Status = "PENDING";
        rfq.BomDetailId = (long) ViewState["bomDetailID"];
        rfq.RfqNumber = txtRfqNumber.Text;
        rfq.DueDate = DateTime.Parse(txtDueDate.Text);
        string idGenerated = rfqCRUD.createAndReturnIdGenerated(rfq);

        if (idGenerated != "")
        {
            TokenCRUD token_CRUD = new TokenCRUD();
            Token token = new Token();
            token.Subject = "RFQ";
            token.SubjectKey = long.Parse(idGenerated);
            token.TokenNumber =  MD5HashGenerator.GenerateKey(DateTime.Now);
            if (token_CRUD.create(token))
            {
                Email NewMail = new Email();
                MailMessage Message = new MailMessage();

                Message.From = new MailAddress("aaron.corrales.zt@gmail.com", "aaron.corrales.zt@gmail.com");
                Message.To.Add(new MailAddress(supplier.ContactEmail.ToString()));
                Message.Subject = "test from APQM WEB - sending RFQ";
                Message.IsBodyHtml = true;
                Message.BodyEncoding = System.Text.Encoding.UTF8;

                AlternateView htmlView = AlternateView.CreateAlternateViewFromString("Please click the following link to open the form:  http://" + Request.Url.Authority + Request.ApplicationPath + "/Vendor/RFQHandler.ashx?token=" + token.TokenNumber);
                Message.AlternateViews.Add(htmlView);
                
                string path = HttpRuntime.AppDomainAppPath.ToString() + @"\Docs\NDA.pdf";

                Attachment x = new Attachment(path);

                Message.Attachments.Add(x);
                try
                {
                    NewMail.SendMail(Message);
                }
                catch {
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
    protected void btnCalendar_Click(object sender, EventArgs e)
    {
        panelPopup.Visible = true;
    }
    protected void btnCalendarBackground_Click(object sender, EventArgs e)
    {
        panelPopup.Visible = false;
    }
    protected void calendar_SelectionChanged(object sender, EventArgs e)
    {
        txtDueDate.Text = calendar.SelectedDate.ToShortDateString();
        panelPopup.Visible = false;
    }
    public void on_sqldatasource_Init(Object sender, EventArgs e)
    {
        ConnectionManager connection = new ConnectionManager();
        SqlDataSource1.ConnectionString = connection.getConnection().ConnectionString;
        SqlDataSourceRFQCountPerBOMDetail.ConnectionString = connection.getConnection().ConnectionString;
    }
}