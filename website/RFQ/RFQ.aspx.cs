using System;
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

public partial class RFQDefault : System.Web.UI.Page 
{   
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["SECTION"] != null)
        {
            switch (((SessionObject)Session["SECTION"]).Content.ToString())
            {
                case "RFQ":
                    MultiViewMain.SetActiveView(viewRFQList);                    
                    ViewState["actualSection"] = "RFQ";
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
    private void openpopupContainer()
    {
        panelPopup.Visible = true;
    }
    protected void on_update_RFQ(object sender, EventArgs e)
    {
        panelPopup.Visible = false;
        Navigator.goToPage("~/default.aspx","rfq");
    }
    protected void on_cancel_RFQ(object sender, EventArgs e) 
    {
        panelPopup.Visible = false;
        Navigator.goToPage("~/default.aspx","rfq");
    }
    protected void on_ok_sendRFQ(object sender, EventArgs e) 
    {   
        panelPopup.Visible = false;
        uscRfqCountPerBomLines.refreshGrid();
    }
    protected void on_cancel_sendRFQ(object sender, EventArgs e)
    {
        panelPopup.Visible = false;
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
                    index = Convert.ToInt32(e.CommandArgument);
                    bomDetailId = long.Parse(((GridView)sender).DataKeys[index].Value.ToString());
                    // Get the last name of the selected author from the appropriate
                    // cell in the GridView control.
                    //GridViewRow selectedRow = ((GridView)sender).Rows[index];
                    //TableCell rfqCountCell = selectedRow.Cells[8];

                    LinkButton lnkRfqCount = (LinkButton)((GridView)sender).Rows[index].Cells[19].Controls[0];

                    int iRfqCount = int.Parse(lnkRfqCount.Text);
                    if (iRfqCount > 0)
                    {
                        openpopupContainer();
                        multiViewPopup.SetActiveView(viewRFQListByBom);
                        uscRfqListByBom.setBomID(bomDetailId);
                    }                    
                }
                catch {
                    Navigator.goToPage("~/Error.aspx", "");
                }                
                break;
            case "sendNewRFQ":
                try
                {
                    index = Convert.ToInt32(e.CommandArgument);
                    bomDetailId = long.Parse(((GridView)sender).DataKeys[index]["BOMDetailKey"].ToString());
                    long sifHeaderID = long.Parse(((GridView)sender).DataKeys[index]["SIFHeaderKey"].ToString());
                    openpopupContainer();
                    multiViewPopup.SetActiveView(viewSendNewRFQ);
                    uscSendNewRFQ.setBOMDetailID(bomDetailId);
                    uscSendNewRFQ.setSIFHeaderID(sifHeaderID);
                }
                catch (Exception ex)
                {
                    Navigator.goToPage("~/Error.aspx", "");
                }
                break;
            case "rfqSummary":
                try
                {
                    index = Convert.ToInt32(e.CommandArgument);
                    bomDetailId = long.Parse(((GridView)sender).DataKeys[index].Value.ToString());
                    Session["rfqSummary"] = bomDetailId;
                    Response.Redirect("~/RFQ/RFQSummary.aspx", false);
                }
                catch (Exception ex)
                {
                    Navigator.goToPage("~/Error.aspx", "");
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