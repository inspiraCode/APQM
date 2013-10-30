using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Vendor_RFQ : System.Web.UI.Page
{
    private Token token;

    private RFQ rfq;
    private RfqCRUD rfqCRUD = new RfqCRUD();

    private Supplier supplier;
    private SupplierCRUD supplierCRUD = new SupplierCRUD();

    RfqDetailCRUD rfqDetailCRUD = new RfqDetailCRUD();
    RfqAcrCRUD rfqACRCRUD = new RfqAcrCRUD(); 

    protected void Page_Load(object sender, EventArgs e)
    {
        Control btnHome = Master.FindControl("btnHome");
        btnHome.Visible = false;
        
        if (Session["rfqObject"] != null)
        {
            RFQ rfqObject = (RFQ)(((SessionObject)Session["rfqObject"]).Content);
            if(rfqObject.Status != "PENDING" && rfqObject.Status != "IN PROGRESS"){
                divInfo.InnerText = "You have already sent us your information, but you can see it as read only.";
                btnFinalize.Visible = false;
                divButtons.Visible = false;
            }
        }       
        if (!IsPostBack)
        {
            if (Session["supplierObject"] != null)
            {
                supplier = (Supplier)((SessionObject)Session["supplierObject"]).Content;            
                ((SessionObject)Session["rfqObject"]).Status = "forUpdate";           
                uscRfqForm.load();
                return;
            }
            exitByError();
        }
    }
    private bool retrieveEntity()
    {
        token = (Token)Session["token"];
        rfq = rfqCRUD.readById(token.SubjectKey);
        if (rfq != null)
        {
            supplier = supplierCRUD.readById(rfq.SupplierId);
            if (supplier != null)
            {
                SessionObject soSupplier = new SessionObject();
                soSupplier.Content = supplier;
                soSupplier.Status = "forUpdate";
                Session["supplierObject"] = soSupplier;

                List<RFQDetail> rfqDetail = rfqDetailCRUD.readByParentID(rfq.Id);
                rfq.RfqDetail = rfqDetail;

                List<RFQACR> rfqACR = rfqACRCRUD.readByParentID(rfq.Id);
                rfq.RfqAcr = rfqACR;

                SessionObject soRFQ = new SessionObject();
                soRFQ.Content = rfq;
                soRFQ.Status = "forUpdate";
                Session["rfqObject"] = soRFQ;
                return true;
            }
        }
        return false;
    }
    private void exitByError()
    {
        Session.Remove("SECTION");
        Session.Remove("supplierObject");
        Session.Remove("rfqObject");
        Session.Remove("token");
        token = null;
        supplier = null;
        Navigator.goToPage("~/Error.aspx", "");
    }
    protected void btnToSupplierForm_Click(object sender, EventArgs e)
    {
        try
        {
            ((SessionObject)Session["supplierObject"]).Status = "forUpdate";
            Navigator.goToPage("~/Vendor/Supplier.aspx", "");
        }
        catch
        {
            exitByError();
        }
    }
    protected void btnFinalize_Click(object sender, EventArgs e)
    {
        if (uscRfqForm.finalize())
        {
            Session.Remove("SECTION");
            Session.Remove("supplierObject");
            Session.Remove("rfqObject");
            Session.Remove("token");
            token = null;
            supplier = null;
        
            Navigator.goToPage("~/Vendor/ThankYou.aspx", "");
        }
    }
    protected void on_save_rfq(object sender, EventArgs e)
    {
        if (retrieveEntity())
        {
            Navigator.goToPage("~/Vendor/RFQ.aspx", "");
        }
        else
        {
            exitByError();
        }
    }
    protected void on_cancel_rfq(object sender, EventArgs e)
    {
        if (retrieveEntity())
        {
            Navigator.goToPage("~/Vendor/RFQ.aspx", "");
        }
        else
        {
            exitByError();
        }
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        uscRfqForm.save();
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        uscRfqForm.cancel();
    }
}
