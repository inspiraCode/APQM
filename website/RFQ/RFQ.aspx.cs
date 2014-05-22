﻿using System;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Reflection;
using System.Collections.Generic;
using System.IO;
using Newtonsoft.Json;

public partial class RFQDefault : System.Web.UI.Page 
{
    RfqCRUD rfq_CRUD = new RfqCRUD();
    RfqAcrCRUD rfqACR_CRUD = new RfqAcrCRUD();
    RFQEAVCRUD rfqEAV_CRUD = new RFQEAVCRUD();
    RfqDetailCRUD rfqDetail_CRUD = new RfqDetailCRUD();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request["cmd"] == null)
            return;

        string cmd = Request["cmd"].ToString();
        if (cmd == "read")
        {
            Response.Clear();
            Response.Write(getRFQbyID(long.Parse(Request["id"])));
            Response.End();
        }


        if (Request.ContentType.Contains("json") &&
            Request.QueryString["Save"] != null)
        {
            saveRFQ();
            return;
        }
        
        if (Session["SECTION"] != null)
        {
            HttpPostedFile file = Request.Files["myfile"];
            HttpFileCollection fileCollection = Request.Files;
            if (file != null)
            {
                string fileName = file.FileName;
                HttpPostedFile postedFile = file;

                string baseAttachmentsPath = ConfigurationManager.AppSettings["RFQAttachmentsSent"];

                string currentPathAttachments = (string)Session["RFQATTACHMENTS"];
                string folderName = (string)Session["RFQATTACHMENTSFOLDER"];
                if (currentPathAttachments == null)
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
                    Session["RFQATTACHMENTS"] = currentPathAttachments;
                    Session["RFQATTACHMENTSFOLDER"] = folderName;
                }

                if (postedFile.ContentLength > 0)
                {
                    postedFile.SaveAs(currentPathAttachments + Path.GetFileName(postedFile.FileName));
                }
                return;
            }

            switch (((SessionObject)Session["SECTION"]).Content.ToString())
            {
                case "RFQ":
                    MultiViewMain.SetActiveView(viewRFQList);
                    ViewState["actualSection"] = "RFQ";
                    uscRfqList.setUserFilterWithCookie();
                    break;
                case "RFQPerBOMDetail":
                    MultiViewMain.SetActiveView(viewRFQCountPerBOMDetail);
                    ViewState["actualSection"] = "RFQPerBOMDetail";
                    break;
                case "RFQPerSharedItems":
                    MultiViewMain.SetActiveView(viewRFQCountPerSharedItems);
                    ViewState["actualSection"] = "RFQPerSharedItems";
                    break;
                case "popupRFQbyBOM":
                    openpopupContainer();
                    break;
                default:
                    break;
            }
        }
    }

    private string getRFQbyID(long id)
    {
        RFQ rfq = rfq_CRUD.readById(3550);

        List<RFQACR> rfqACR = rfqACR_CRUD.readByParentID(rfq.Id);
        rfq.RfqAcr = rfqACR;

        List<RFQEAV> rfqEAVList = rfqEAV_CRUD.readByParentID(rfq.Id);
        rfq.RfqEAV = rfqEAVList;

        foreach (RFQEAV rfqEAV in rfqEAVList)
        {
            List<RFQDetail> rfqDetail = rfqDetail_CRUD.readByParentID(rfqEAV.Id);
            rfqEAV.RfqDetail = rfqDetail;
        }



        return JsonConvert.SerializeObject(rfq);
    }

    public void saveRFQ()
    {
        if (Request.ContentType.Contains("json") &&
            Request.QueryString["Save"] != null)
        {
            String s = new StreamReader(Request.InputStream).ReadToEnd();
            String json = JsonConvert.SerializeObject(s);
        }
    }
    private void openpopupContainer()
    {
        panelPopup.Visible = true;
    }
    protected void on_update_RFQ(object sender, EventArgs e)
    {
        panelPopup.Visible = false;
        Navigator.goToPage("~/RFQ/RFQ.aspx", "RFQ");
    }
    protected void on_cancel_RFQ(object sender, EventArgs e) 
    {
        panelPopup.Visible = false;
        Navigator.goToPage("~/RFQ/RFQ.aspx", "RFQ");
    }
    protected void tabRFQ_Click(object sender, EventArgs e)
    {
        Navigator.goToPage("~/RFQ/RFQ.aspx","RFQ");
    }
    protected void tabRFQPerSharedItems_Click(object sender, EventArgs e)
    {
        Navigator.goToPage("~/RFQ/RFQ.aspx","RFQPerSharedItems");
    }
    protected void tabRFQPerBOMDetail_Click(object sender, EventArgs e)
    {
        Navigator.goToPage("~/RFQ/RFQ.aspx","RFQPerBOMDetail");
    }
    protected void on_rfqCountPerBomLines_rowCommand(Object sender, GridViewCommandEventArgs e)
    {

        // If multiple ButtonField column fields are used, use the
        // CommandName property to determine which button was clicked.

        // Convert the row index stored in the CommandArgument
        // property to an Integer.

        int index;
        long bomDetailId;
        switch (e.CommandName)
        {
            case "seeRFQ":
                try
                {   
                    index = ((GridViewRow)((Control)e.CommandSource).NamingContainer).RowIndex;
                    bomDetailId = long.Parse(((GridView)sender).DataKeys[index].Value.ToString());
                    // Get the last name of the selected author from the appropriate
                    // cell in the GridView control.
                    //GridViewRow selectedRow = ((GridView)sender).Rows[index];
                    //TableCell rfqCountCell = selectedRow.Cells[8];
                    int iRfqCount = int.Parse(e.CommandArgument.ToString());
                    if (iRfqCount > 0)
                    {
                        openpopupContainer();
                        multiViewPopup.SetActiveView(viewRFQListByBom);
                        uscRfqListByBom.setBomID(bomDetailId);
                    }
                }
                catch(Exception ex)
                {
                    Navigator.goToPage("~/Error.aspx", "ERROR:" + ex.Message);
                }                
                break;
            case "sendNewRFQ":
                //try
                //{
                //    index = Convert.ToInt32(e.CommandArgument);
                //    bomDetailId = long.Parse(((GridView)sender).DataKeys[index]["BOMDetailKey"].ToString());
                //    long sifHeaderID = long.Parse(((GridView)sender).DataKeys[index]["SIFHeaderKey"].ToString());
                //    Session.Remove("RFQATTACHMENTS");
                //    Session.Remove("RFQATTACHMENTSFOLDER");
                //    Session.Remove("SupplierList");
                //    openpopupContainer();
                //    multiViewPopup.SetActiveView(viewSendNewRFQ);
                //    uscSendNewRFQ.setBOMDetailID(bomDetailId);
                //    uscSendNewRFQ.setSIFHeaderID(sifHeaderID);
                //}
                //catch (Exception ex)
                //{
                //    Navigator.goToPage("~/Error.aspx", "ERROR:" + ex.Message);
                //}
                break;
            case "rfqSummary":
                try
                {
                    index = ((GridViewRow)((Control)e.CommandSource).NamingContainer).RowIndex;
                    bomDetailId = long.Parse(((GridView)sender).DataKeys[index]["BOMDetailKey"].ToString());
                    Session["rfqSummary"] = bomDetailId;
                    Response.Redirect("~/RFQ/RFQSummary.aspx", false);
                }
                catch (Exception ex)
                {
                    Navigator.goToPage("~/Error.aspx", "ERROR:" + ex.Message);
                    string message = ex.Message;
                }
                break;
                
        }
    }
    //protected void on_rfqList_rowCommand(Object sender, GridViewCommandEventArgs e)
    //{
    //    int index;
    //    long rfqHeaderKey;
    //    switch (e.CommandName)
    //    {
    //        case "seeRFQ":
    //            try
    //            {
    //                index = Convert.ToInt32(e.CommandArgument);
    //                rfqHeaderKey = long.Parse(((GridView)sender).DataKeys[index].Value.ToString());                    
                  
                        
    //                    //RfqCRUD rfqCRUD = new RfqCRUD();
    //                    //RfqDetailCRUD rfqDetailCRUD = new RfqDetailCRUD();
    //                    //RfqAcrCRUD rfqACRCRUD = new RfqAcrCRUD();

    //                    //RFQ rfq = rfqCRUD.readById(rfqHeaderKey);

    //                    //List<RFQDetail> rfqDetail = rfqDetailCRUD.readByParentID(rfqHeaderKey);
    //                    //rfq.RfqDetail = rfqDetail;

    //                    //List<RFQACR> rfqACR = rfqACRCRUD.readByParentID(rfqHeaderKey);
    //                    //rfq.RfqAcr = rfqACR;

    //                    //SessionObject soRFQ = new SessionObject();
    //                    //soRFQ.Content = rfq;
    //                    //soRFQ.Status = "forUpdate";
    //                    //Session["rfqObject"] = soRFQ;

    //                    ClientScript.RegisterClientScriptBlock(this.GetType(), "Message", "window.open('http://" + Request.Url.Authority + Request.ApplicationPath + "/RFQ/rfqFormMain.aspx?rfq=" + rfqHeaderKey + "','_blank');", true);                                                
    //            }
    //            catch {
    //                Navigator.goToPage("~/Error.aspx", "");
    //            }
                
    //            break;
    //    }
    //}
    protected void btnClosePopup_Click(object sender, EventArgs e)
    {
        panelPopup.Visible = false;
    }
    protected void on_activeView_changed(object sender, EventArgs e)
    {
        var objSent = sender;
        switch (((MultiView)sender).ActiveViewIndex)
        {
            case 0: //RFQ All
                tabRFQ.CssClass = "tabSelected";
                tabRFQCountPerBOMDetail.CssClass = "tabUnselected";
                tabRFQCountPerSharedItems.CssClass = "tabUnselected";
                break;
            case 1: //RFQs per BOM Lines
                tabRFQ.CssClass = "tabUnselected";
                tabRFQCountPerBOMDetail.CssClass = "tabSelected";
                tabRFQCountPerSharedItems.CssClass = "tabUnselected";
                break;
            case 2: //RFQs per Shared Items
                tabRFQ.CssClass = "tabUnselected";
                tabRFQCountPerBOMDetail.CssClass = "tabUnselected";
                tabRFQCountPerSharedItems.CssClass = "tabSelected";
                break;
        }
    }
}