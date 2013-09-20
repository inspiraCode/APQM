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

public partial class _Default : System.Web.UI.Page 
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
                    disablePageForModalPopup();
                    openpopupContainer();
                    popupContainer.Style.Add("height", "550px");
                    popupContainer.Style.Add("width", "1060px");
                    popupContainer.Style.Add("left", "35%");
                    popupContainer.Style.Add("top", "35%");
                    break;
                default:
                    break;
            }
        }
    }
    private void disablePageForModalPopup()
    {
        uscMenu.disableButtons();
        tabRFQ.Enabled = false;
        tabRFQCountPerBOMDetail.Enabled = false;
    }
    private void enablePageForModalPopup()
    {
        uscMenu.enableButtons();
        tabRFQ.Enabled = true;
        tabRFQCountPerBOMDetail.Enabled = true;
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
        enablePageForModalPopup();
        uscRfqCountPerBomLines.refreshGrid();
    }
    protected void on_cancel_sendRFQ(object sender, EventArgs e)
    {
        panelPopup.Visible = false;
        enablePageForModalPopup();
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
    protected void on_row_command(Object sender, GridViewCommandEventArgs e)
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

                    LinkButton lnkRfqCount = (LinkButton)((GridView)sender).Rows[index].Cells[8].Controls[0];

                    int iRfqCount = int.Parse(lnkRfqCount.Text);
                    if (iRfqCount > 0)
                    {
                        disablePageForModalPopup();
                        openpopupContainer();
                        popupContainer.Style.Add("height", "350px");
                        popupContainer.Style.Add("width", "600px");
                        popupContainer.Style.Add("left", "35%");
                        popupContainer.Style.Add("top", "35%");
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
                    bomDetailId = long.Parse(((GridView)sender).DataKeys[index].Value.ToString());
                    disablePageForModalPopup();
                    openpopupContainer();
                    popupContainer.Style.Add("height", "350px");
                    popupContainer.Style.Add("width", "500px");
                    popupContainer.Style.Add("left", "35%");
                    popupContainer.Style.Add("top", "35%");
                    multiViewPopup.SetActiveView(viewSendNewRFQ);
                    uscSendNewRFQ.setBOMDetailID(bomDetailId);
                }
                catch
                {
                    Navigator.goToPage("~/Error.aspx", "");
                }
                break;
        }
    }
    protected void btnClosePopup_Click(object sender, EventArgs e)
    {
        panelPopup.Visible = false;
        enablePageForModalPopup();
    }
}