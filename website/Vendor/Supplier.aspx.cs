﻿using System;
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
        uscSupplierForm.hideFieldsForVendor();
        btnToRFQ.OnClientClick = "return validate(event);";
        if (Session["rfqObject"] != null)
        {
            RFQ rfqObject = (RFQ)(((SessionObject)Session["rfqObject"]).Content);
            if (rfqObject.Status != "PENDING" && rfqObject.Status != "IN PROGRESS")
            {
                divInfo.InnerText = "You have already sent us your information, but you can see it as read only.";
                divButtons.Visible = false;
                btnToRFQ.OnClientClick = "return true;";
            }
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
            exitByError("Could not load page, please try again.");
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

                List<RFQACR> rfqACR = rfqACRCRUD.readByParentID(rfq.Id);
                rfq.RfqAcr = rfqACR;

                List<RFQEAV> rfqEAVList = rfqEAVCRUD.readByParentID(rfq.Id);
                rfq.RfqEAV = rfqEAVList;

                foreach (RFQEAV rfqEAV in rfqEAVList)
                {
                    System.Collections.Generic.List<RFQDetail> rfqDetail = rfqDetailCRUD.readByParentID(rfq.Id);
                    rfqEAV.RfqDetail = rfqDetail;
                }

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
            exitByError("Could not retrieve entity.");
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
            exitByError("Could not retrieve entity.");
        }
    }
    protected void btnToRFQForm_Click(object sender, EventArgs e)
    {
        btnSave_Click(null, null);
    }
    private void exitByError(string strError)
    {
        Session.Remove("SECTION");
        Session.Remove("supplierObject");
        Session.Remove("rfqObject");
        Session.Remove("token");
        supplier = null;
        Navigator.goToPage("~/Error.aspx", "ERROR:" + strError);
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
