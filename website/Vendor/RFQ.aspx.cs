using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Configuration;

public partial class Vendor_RFQ : System.Web.UI.Page
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

        if (getPostedFiles()) return;

        if (Session["rfqObject"] != null)
        {
            RFQ rfqObject = (RFQ)(((SessionObject)Session["rfqObject"]).Content);
            if(rfqObject.Status != "PENDING" && rfqObject.Status != "IN PROGRESS"){
                divInfo.InnerText = "You have already sent us your information, but you can see it as read only.";
                divButtonsTopToHide.Visible = false;
                divButtons.Visible = false;
                //btnInstructions.Visible = false;
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
    public bool getPostedFiles()
    {
        HttpPostedFile file = Request.Files["myfile"];
        HttpFileCollection fileCollection = Request.Files;
        if (file != null)
        {
            string fileName = file.FileName;
            HttpPostedFile postedFile = file;

            string baseAttachmentsPath = ConfigurationManager.AppSettings["RFQAttachmentsInbox"];

            string currentPathAttachments = (string)Session["RFQATTACHMENTSINBOX"];
            
            string folderName = (string)Session["RFQATTACHMENTSFOLDERINBOX"];
            if (currentPathAttachments == null)
            {
                if (folderName != null && folderName.Trim() != "")
                {
                    currentPathAttachments = baseAttachmentsPath + folderName + @"\";
                    Session["RFQATTACHMENTSINBOX"] = currentPathAttachments;
                    Session["RFQATTACHMENTSFOLDERINBOX"] = folderName;
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
                    Session["RFQATTACHMENTSINBOX"] = currentPathAttachments;
                    Session["RFQATTACHMENTSFOLDERINBOX"] = folderName;
                }
            }

            if (postedFile.ContentLength > 0)
            {
                postedFile.SaveAs(currentPathAttachments + Path.GetFileName(postedFile.FileName));
            }
            return true;
        }
        return false;
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
    protected void on_afterSave_rfq(object sender, EventArgs e)
    {
        divInfo.InnerHtml = "You have saved this RFQ but have not finalized it.  The purchasing department will not see the information until it is Finalized.<br />" +  
                            "Since it is saved, you may close this window.<br />" +
                            "To come back to this form, click on the original link in the e-mail you received from us and you will be guided back to your RFQ form.<br />" +
                            "Do not forget to Finalize and Submit.";
        //btnFinalize.Visible = false;
        uscRfqForm.Visible = false;
        //btnSave.Visible = false;
        //btnCancel.Visible = false;
        divButtonsTopToHide.Visible = false;
        divButtons.Visible = false;
    }
   protected void on_afterFinalize_rfq(object sender, EventArgs e)
    {
        Session.Remove("SECTION");
        Session.Remove("supplierObject");
        Session.Remove("rfqObject");
        Session.Remove("token");
        token = null;
        supplier = null;

        Navigator.goToPage("~/Vendor/ThankYou.aspx", "");
    }
    protected void btnCancel_Click(object sender, EventArgs e)
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
}