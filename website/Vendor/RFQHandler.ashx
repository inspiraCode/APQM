<%@ WebHandler Language="C#" Class="RFQHandler" %>

using System;
using System.Web;

public class RFQHandler : IHttpHandler, System.Web.SessionState.IRequiresSessionState {
    private Token token;
    private TokenCRUD tokenCRUD = new TokenCRUD();
    
    private RFQ rfq;
    private RfqCRUD rfqCRUD = new RfqCRUD();

    private Supplier supplier;
    private SupplierCRUD supplierCRUD = new SupplierCRUD();

    RfqDetailCRUD rfqDetailCRUD = new RfqDetailCRUD();
    RfqAcrCRUD rfqACRCRUD = new RfqAcrCRUD();
    RFQEAVCRUD rfqEAV_CRUD = new RFQEAVCRUD();
    
    
    public void ProcessRequest (HttpContext context) {
        
        string sToken = context.Request["token"];
        if (sToken != "" && sToken != null)
        {
            token = tokenCRUD.readByToken(sToken);
            if (token != null)
            {
                context.Session["token"] = token;
                if (retrieveEntity(context))
                {
                    Navigator.goToPage("~/Vendor/Supplier.aspx", "supplier");
                    return;
                }
                else
                {
                    Navigator.goToPage("~/Vendor/RFQDeleted.aspx", "supplier");
                    return;
                }
            }
            else
            {
                Navigator.goToPage("~/Vendor/RFQDeleted.aspx", "supplier");
                return;
            }
        }
        
    }
    public bool retrieveEntity(HttpContext context)
    {
        token = (Token)context.Session["token"];
        rfq = rfqCRUD.readById(token.SubjectKey);
        
        if (rfq != null)
        {
            supplier = supplierCRUD.readById(rfq.SupplierId);
            if (supplier != null)
            {
                SessionObject soSupplier = new SessionObject();
                soSupplier.Content = supplier;
                soSupplier.Status = "forUpdate";
                context.Session["supplierObject"] = soSupplier;

                

                System.Collections.Generic.List<RFQACR> rfqACRList = rfqACRCRUD.readByParentID(rfq.Id);
                rfq.RfqAcr = rfqACRList;

                System.Collections.Generic.List<RFQEAV> rfqEAVList = rfqEAV_CRUD.readByParentID(rfq.Id);
                rfq.RfqEAV = rfqEAVList;

                foreach (RFQEAV rfqEAV in rfqEAVList)
                {
                    System.Collections.Generic.List<RFQDetail> rfqDetail = rfqDetailCRUD.readByParentID(rfq.Id);
                    rfqEAV.RfqDetail = rfqDetail;
                }
                
                
                SessionObject soRFQ = new SessionObject();
                soRFQ.Content = rfq;
                soRFQ.Status = "forUpdate";
                context.Session["rfqObject"] = soRFQ;
                return true;
            }
        }
        return false;
    }
    public bool IsReusable {
        get {
            return false;
        }
    }
}