using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Vendor_Supplier : System.Web.UI.Page
{
    private Token token;

    private RFQ rfq;
    private RfqCRUD rfqCRUD = new RfqCRUD();

    private Supplier supplier;
    private SupplierCRUD supplierCRUD = new SupplierCRUD();

    RfqDetailCRUD rfqDetailCRUD = new RfqDetailCRUD();
    RfqAcrCRUD rfqACRCRUD = new RfqAcrCRUD();
    RFQEAVCRUD rfqEAVCRUD = new RFQEAVCRUD();

    protected void Page_Load(object sender, EventArgs e)
    {
        Control btnHome = Master.FindControl("btnHome");
        btnHome.Visible = false;
        if (Session["rfqObject"] != null && ((RFQ)(((SessionObject)Session["rfqObject"]).Content)).Status == "COMPLETED")
        {
            divInfo.InnerText = "You have already send us your information, but you can see it as read only.";
            divButtons.Visible = false;
        }       
        if (!IsPostBack)
        {   
            if (Session["supplierObject"] != null)
            {
                supplier = (Supplier)((SessionObject)Session["supplierObject"]).Content;
                ((SessionObject)Session["supplierObject"]).Status = "forUpdate";
                uscSupplierForm.load();
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

                List<RFQEAV> rfqEAV = rfqEAVCRUD.readByParentID(rfq.Id);
                rfq.RfqEAV = rfqEAV;

                SessionObject soRFQ = new SessionObject();
                soRFQ.Content = rfq;
                soRFQ.Status = "forUpdate";
                Session["rfqObject"] = soRFQ;
                return true;
            }
        }
        return false;
    }
    protected void on_save_supplier(object sender, EventArgs e)
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
    protected void on_cancel_supplier(object sender, EventArgs e)
    {   
        if (retrieveEntity())
        {
            Navigator.goToPage("~/Vendor/Supplier.aspx", "");
        }
        else
        {
            exitByError();
        }
    }
    protected void btnToRFQForm_Click(object sender, EventArgs e)
    {
        on_save_supplier(null,null);
    }
    private void exitByError()
    {
        Session.Remove("SECTION");
        Session.Remove("supplierObject");
        Session.Remove("rfqObject");
        Session.Remove("token");
        supplier = null;
        Navigator.goToPage("~/Error.aspx", "");
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        uscSupplierForm.save();
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        uscSupplierForm.cancel();
    }
}
