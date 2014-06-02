using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class rfqSummaryDetail : System.Web.UI.UserControl
{
    private List<RFQSummary> rfqSummary = null;
    private RfqSummaryCRUD rfqSummaryCRUD = new RfqSummaryCRUD();


    protected void Page_Load(object sender, EventArgs e)
    {       
        rfqSummary = (List<RFQSummary>)Session["rfqSummaryList"];
        //AsyncPostBackTrigger trigger = new AsyncPostBackTrigger();
        //trigger.ControlID = uscSelectRFQ.FindControl("btnCancel").UniqueID;
        //trigger.EventName = "Click";
        //UpdatePanel1.Triggers.Add(trigger);

        //ScriptManager1.RegisterAsyncPostBackControl(uscSelectRFQ.FindControl("btnCancel"));

        if (!IsPostBack)
        {
            updateRepeater();
        }
        ScriptManager.RegisterStartupScript(uscSelectRFQ, this.GetType(), "openPopupKey", "openPopup();", true);
        
    }
    private bool updateRepeater()
    {
        string[] formKeys = Request.Form.AllKeys;

        long rfqHeaderKeyLocal = -1;
        int seqLocal = -1;
        float eavLocal = -1;

        float fTotalBCost = 0;
        float fTotalCCost = 0;
        float fEAV = 0;
        
        bool wasEdited = false;
        if (rfqSummary != null)
        {
            foreach (string value in formKeys)
            {
                if (value != null)
                {
                    long auxRFQKey = value.IndexOf("txtKey");
                    int auxSeq = value.IndexOf("txtSeq");
                    float auxEAU = value.IndexOf("txtRFQ_EAU");
                    if (auxRFQKey != -1)
                    {
                        rfqHeaderKeyLocal = long.Parse(Request.Form[value]);
                    }
                    if (auxSeq != -1)
                    {
                        seqLocal = int.Parse(Request.Form[value]);
                    }
                    if (auxEAU != -1)
                    {
                        eavLocal = int.Parse(Request.Form[value]);
                    }
                    if (value.IndexOf("txtTotalBCost") != -1)
                    {
                        fTotalBCost = float.Parse(Request.Form[value]);
                    }
                    if (value.IndexOf("txtTotalCCost") != -1)
                    {
                        fTotalCCost = float.Parse(Request.Form[value]);
                    }
                    if (value.IndexOf("txtEAV") != -1)
                    {
                        if (Request.Form[value] != "")
                            fEAV = float.Parse(Request.Form[value]);
                    }
                    if (rfqHeaderKeyLocal != -1 && seqLocal != -1 && eavLocal != -1)
                    {
                        foreach (RFQSummary rfqS in rfqSummary)
                        {
                            if (rfqS.RfqHeaderKey == rfqHeaderKeyLocal && rfqS.EstimatedAnnualVolume == eavLocal)
                            {
                                rfqS.Sequence = seqLocal;
                                rfqS.TotalBCost = fTotalBCost;
                                rfqS.TotalCCost = fTotalCCost;
                                rfqS.EAV = fEAV;
                                
                                seqLocal = -1;
                                rfqHeaderKeyLocal = -1;
                                eavLocal = -1;

                                fTotalBCost = 0;
                                fTotalCCost = 0;
                                fEAV = 0;
                                
                                if (!rfqSummaryCRUD.updateOrCreate(rfqS))
                                {
                                    Navigator.goToPage("~/Error.aspx", "ERROR:" + rfqSummaryCRUD.ErrorMessage);
                                    return false;
                                }
                                wasEdited = true;
                                break;
                            }
                        }
                    }
                }
            }
        }
        else
        {
            uscNotifier.showLog("Need to open a program first.");
            return false;
        }
        if (wasEdited)
        {
            load();
            uscNotifier.showSuccess("Information saved successfully");
        }
        return true;
    }
    public void load()
    {
        //loadDropDowns();
        loadDetail();
    }
    public void reset()
    {
        //allItems = null;
        rfqSummary = null;
        Session.Remove("rfqSummaryList");
    }
    private void loadDetail()
    {
        repeaterRFQSummary.DataSource = rfqSummary.OrderBy(C => C.Sequence).ToList<RFQSummary>();
        repeaterRFQSummary.DataBind();
        if (rfqSummary.Count > 0)
        {
            repeaterRFQSummary.Visible = true;
            //divHeader.Visible = true;
        }
        else
        {
            repeaterRFQSummary.Visible = false;
            //divHeader.Visible = false;
        }
    }
    public void setEntity(long bomDetailKey )
    {
        if (bomDetailKey > -1)
        {
            hiddenBOMLineKey.Value = bomDetailKey.ToString();
            rfqSummary = rfqSummaryCRUD.readByBOMDetailID(bomDetailKey);
        }
        else
        {
            rfqSummary = new List<RFQSummary>();
        }
        Session["rfqSummaryList"] = rfqSummary;
        load();
    }
    public List<RFQSummary> getEntity()
    {
        return (List<RFQSummary>)Session["rfqSummaryList"];
    }
    public void R1_ItemDataBound(Object Sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            RFQSummary rfqSummary = (RFQSummary)e.Item.DataItem;

            AsyncPostBackTrigger trigger = new AsyncPostBackTrigger();
            LinkButton linkSupplier =(LinkButton)e.Item.FindControl("lnkSupplier");
            linkSupplier.CommandArgument = rfqSummary.RfqHeaderKey.ToString() + "|" + rfqSummary.EstimatedAnnualVolume;
            trigger.ControlID = linkSupplier.UniqueID;
            trigger.EventName = "Click";
            UpdatePanel1.Triggers.Add(trigger);
            
            ((Label)e.Item.FindControl("lblTotalACost")).Attributes.Add("item", e.Item.ItemIndex.ToString());
            ((Label)e.Item.FindControl("lblTotalACost")).Attributes.Add("fieldName", "lblTotalACost");

            ((TextBox)e.Item.FindControl("txtTotalBCost")).Attributes.Add("item", e.Item.ItemIndex.ToString());
            ((TextBox)e.Item.FindControl("txtTotalBCost")).Attributes.Add("fieldName", "txtTotalBCost");
            ((TextBox)e.Item.FindControl("txtTotalBCost")).Attributes.Add("onchange", "summarizeColumn(" + e.Item.ItemIndex.ToString() + ")");
            ((TextBox)e.Item.FindControl("txtTotalBCost")).Attributes.Add("onkeyup", "summarizeColumn(" + e.Item.ItemIndex.ToString() + ")");

            ((TextBox)e.Item.FindControl("txtTotalCCost")).Attributes.Add("item", e.Item.ItemIndex.ToString());
            ((TextBox)e.Item.FindControl("txtTotalCCost")).Attributes.Add("fieldName", "txtTotalCCost"); 
            ((TextBox)e.Item.FindControl("txtTotalCCost")).Attributes.Add("onchange", "summarizeColumn(" + e.Item.ItemIndex.ToString() + ")");
            ((TextBox)e.Item.FindControl("txtTotalCCost")).Attributes.Add("onkeyup", "summarizeColumn(" + e.Item.ItemIndex.ToString() + ")");

            ((Label)e.Item.FindControl("lblTotalAcquisitionCost")).Attributes.Add("item", e.Item.ItemIndex.ToString());
            ((Label)e.Item.FindControl("lblTotalAcquisitionCost")).Attributes.Add("fieldName", "lblTotalAcquisitionCost");

            ((TextBox)e.Item.FindControl("txtEAV")).Attributes.Add("item", e.Item.ItemIndex.ToString());
            ((TextBox)e.Item.FindControl("txtEAV")).Attributes.Add("fieldName", "txtEAV"); 
            ((TextBox)e.Item.FindControl("txtEAV")).Attributes.Add("onchange", "summarizeColumn(" + e.Item.ItemIndex.ToString() + ")");
            ((TextBox)e.Item.FindControl("txtEAV")).Attributes.Add("onkeyup", "summarizeColumn(" + e.Item.ItemIndex.ToString() + ")");

            ((Label)e.Item.FindControl("lblAnnualPurchaseCost")).Attributes.Add("item", e.Item.ItemIndex.ToString());
            ((Label)e.Item.FindControl("lblAnnualPurchaseCost")).Attributes.Add("fieldName", "lblAnnualPurchaseCost");
        }
    }

    public void selectRFQ(object sender, CommandEventArgs e)
    {
        string[] argument = ((string)e.CommandArgument).Split('|');
        long id = long.Parse(argument[0]);
        float volume = float.Parse(argument[1]);
        RFQSummary rfqSummary = new RFQSummary();
        rfqSummary = rfqSummaryCRUD.readByRFQHeaderIdAndEAU(id,volume);
        if (rfqSummary != null)
        {
            SessionObject so = new SessionObject();
            so.Content = rfqSummary;
            so.Status = "forUpdate";

            Session["rfqSummarySelected"] = so;
            panelPopup.Visible = true;
            uscSelectRFQ.load();
            updateRepeater();
            uscNotifier.hide();
        }
        else
        {
            Session.Remove("rfqSummarySelected");
            Navigator.goToPage("~/Error.aspx", "ERROR:Could not retrieve rfqSummary with id = " + id);
        }
    }
    public bool save()
    {
        return updateRepeater();
    }
    protected void on_confirm_rfq(Object sender, EventArgs e)
    {
        panelPopup.Visible = false;
        setEntity(long.Parse(hiddenBOMLineKey.Value));
        //List<RFQSummary> rfqSummary = rfqSummaryCRUD.readByBOMDetailID(long.Parse(txtBomDetailID.Text));
        //uscRfqSummaryList.setEntity(rfqSummary);
        //uscRfqSummaryList.load();
    }
    protected void on_cancel_rfq(Object sender, EventArgs e)
    {
        panelPopup.Visible = false;
    }
}