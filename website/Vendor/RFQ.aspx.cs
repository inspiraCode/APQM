using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class VendorRFQ : System.Web.UI.Page
{
    private Token token;
    private TokenCRUD tokenCRUD = new TokenCRUD();

    private Supplier supplier;
    private SupplierCRUD supplierCRUD = new SupplierCRUD();

    private RFQ rfq;
    private RfqCRUD rfqCRUD = new RfqCRUD();

    RfqDetailCRUD rfqDetailCRUD = new RfqDetailCRUD();
    RfqAcrCRUD rfqACRCRUD = new RfqAcrCRUD();

    protected void Page_Load(object sender, EventArgs e)
    {
        Control btnHome = Master.FindControl("btnHome");
        btnHome.Visible = false;

        if (Session["token"] == null)
        {
            string sToken = Request["token"];
            if (sToken != "" && sToken != null)
            {
                token = tokenCRUD.readByToken(sToken);
                if (token != null)
                {
                    Session["token"] = token;
                    if (retrieveEntity())
                    {
                        Navigator.goToPage("~/Vendor/RFQ.aspx", "supplier");
                        return;
                    }
                }
            }
        }
        else
        {
            if (Session["SECTION"] != null)
            {
                if (Session["supplierObject"] != null)
                {
                    supplier = (Supplier)((SessionObject)Session["supplierObject"]).Content;
                    switch (((SessionObject)Session["SECTION"]).Content.ToString())
                    {
                        case "supplier":
                            ((SessionObject)Session["supplierObject"]).Status = "forUpdate";
                            multiView.SetActiveView(viewSupplier);
                            uscSupplierForm.load();
                            return;
                        case "rfq":
                            ((SessionObject)Session["rfqObject"]).Status = "forUpdate";
                            multiView.SetActiveView(viewRFQ);
                            uscRfqForm.load();
                            return;
                        case "finalize":
                            Session.Remove("SECTION");
                            Session.Remove("supplierObject");
                            Session.Remove("rfqObject");
                            Session.Remove("token");
                            token = null;
                            supplier = null;
                            multiView.SetActiveView(viewThankYou);
                            return;
                        default:
                            break;
                    }
                }
            }
        }
        exitByError();
    }
    private bool retrieveEntity(){
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
        ((SessionObject)Session["supplierObject"]).Status = "forUpdate";
        Navigator.goToPage("~/Vendor/RFQ.aspx", "supplier");
    }    
    protected void btnToRFQForm_Click(object sender, EventArgs e)
    {
        ((SessionObject)Session["rfqObject"]).Status = "forUpdate";
        Navigator.goToPage("~/Vendor/RFQ.aspx", "rfq");
    }
    protected void btnFinalize_Click(object sender, EventArgs e)
    {
        if(uscRfqForm.save(true)) Navigator.goToPage("~/Vendor/RFQ.aspx", "finalize");
    }
    protected void on_save_supplier(object sender, EventArgs e)
    {
        if (retrieveEntity())
        {
            Navigator.goToPage("~/Vendor/RFQ.aspx", "rfq");
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
            Navigator.goToPage("~/Vendor/RFQ.aspx", "supplier");
        }
        else
        {
            exitByError();
        }
    }    
    protected void on_save_rfq(object sender, EventArgs e)
    {

        if (retrieveEntity())
        {
            Navigator.goToPage("~/Vendor/RFQ.aspx", "rfq");
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
            Navigator.goToPage("~/Vendor/RFQ.aspx", "rfq");
        }
        else
        {
            exitByError();
        }
    }
}