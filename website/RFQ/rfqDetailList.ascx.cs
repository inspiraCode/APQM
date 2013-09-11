using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class rfqDetailList : System.Web.UI.UserControl
{

    private List<RFQDetail> rfqDetail = null;
    private itemCRUD item_CRUD = new itemCRUD();
    private static List<Item> allItems = null;
    
    protected void Page_Load(object sender, EventArgs e)
    {   
    }
    public void reset()
    {
        allItems = null;
        rfqDetail = null;
    }
    private void loadDetail()
    {
        btnNewPartNumber.OnClientClick = "document.getElementById('" + txtPrompt.ClientID + "').value = 'p-' + prompt('New Part Number')";
        loadDropDowns();
        repeaterRFQDetail.DataSource = rfqDetail;
        repeaterRFQDetail.DataBind();
        if(rfqDetail !=null) divRFQDetailList.InnerHtml = rfqDetail.Count.ToString() + " records.";
    }
    public void setEntity(List<RFQDetail> detail)
    {
        if (detail != null)
        {
            rfqDetail = detail;            
        }
        loadDetail();
    }
    public List<RFQDetail> getEntity()
    {
        return rfqDetail;
    }
    public void R1_ItemDataBound(Object Sender, RepeaterItemEventArgs e) 
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem) {            
            ((LinkButton)e.Item.FindControl("deleteByID")).CommandArgument = ((RFQDetail)e.Item.DataItem).Id.ToString();            
            ((LinkButton)e.Item.FindControl("updateByID")).CommandArgument = ((RFQDetail)e.Item.DataItem).Id.ToString();            
        }
    }
    public void deleteByID(object sender, CommandEventArgs e)
    {
        int sequence = int.Parse((string)e.CommandArgument);
        foreach (RFQDetail detail in rfqDetail)
        {
            if (detail.Sequence == sequence)
            {
                rfqDetail.Remove(detail);
                loadDetail();
                break;
            }
        }
    }
    public void updateByID(object sender, CommandEventArgs e)
    {
        //long id = long.Parse((string)e.CommandArgument);
        //RFQDetail rfqDetail = new RFQDetail();
        //rfqDetail = rfqDetailCRUD.readById(id);
        
        //if (rfqDetail != null)
        //{
        //    SessionObject so = new SessionObject();
        //    so.Content = rfqDetail;
        //    so.Status = "forUpdate";

        //    Session["RFQObject"] = so;
        //}
        ////Server.Transfer("~/RFQ/rfqDetail.aspx?tab=RFQDetail");
    }
    public void add_Click(object sender, EventArgs e)
    {
        RFQDetail rfqDetailLine = new RFQDetail();

        rfqDetailLine.ItemMasterKey = long.Parse(cboPartNumber.SelectedValue);
        rfqDetailLine.RpcQty = long.Parse(txtQuantity.Text);
        rfqDetailLine.RpcCostPerUnit = float.Parse(txtCostUnit.Text);
        rfqDetailLine.OSQty = long.Parse(txtOutsideServicesQuantity.Text);
        rfqDetailLine.OSCostPerUnit = float.Parse(txtOutsideServicesCostUnit.Text);
        rfqDetailLine.ScrapValue = float.Parse(txtScrapValue.Text);
        rfqDetailLine.DirectHrlyLaborRate = float.Parse(txtDirectHrlyLaborRate.Text);
        rfqDetailLine.StdHrs = int.Parse(txtStdHrs.Text);
        if (rfqDetail == null) rfqDetail = new List<RFQDetail>();
        rfqDetailLine.Sequence = rfqDetail.Count + 1;

        Item item = new Item();

        item.Id = long.Parse(cboPartNumber.SelectedValue);        
        item.PartNumber = cboPartNumber.SelectedItem.Text;
        item.Um = "UM";

        rfqDetailLine.Item = item;

        rfqDetail.Add(rfqDetailLine);

        loadDetail();
        cboPartNumber.Focus();
        clearAddFields();
    }
    private void clearAddFields()
    {
        txtQuantity.Text = "";
        txtCostUnit.Text = "";
        txtOutsideServicesQuantity.Text = "";
        txtOutsideServicesCostUnit.Text = "";
        txtScrapValue.Text = "";
        txtDirectHrlyLaborRate.Text = "";
        txtStdHrs.Text = "";
    }
    protected void txtPrompt_ValueChanged(object sender, EventArgs e)
    {
        if (txtPrompt.Value.Trim() != "")
        {
            string[] prompt = txtPrompt.Value.Split('-');
            if (prompt[1] != "null" && prompt[1].Trim() != "")
            {
                switch (prompt[0])
                {
                    case "p":
                        Item item = new Item();
                        item.PartNumber = prompt[1];
                        item.Um = "UM";

                        string idGenerated = item_CRUD.createAndReturnIdGenerated(item);
                        if (idGenerated != "")
                        {
                            allItems = null;
                            loadDropDowns();
                            cboPartNumber.SelectedValue = idGenerated;
                        }
                        break;
                }
            }
            txtPrompt.Value = "";
        }
        cboPartNumber.Focus();
    }

    private void loadDropDowns()
    {
        if (allItems == null)
        {
            allItems = (List<Item>)item_CRUD.readAll();
            
        }
        if (cboPartNumber.DataSource == null)
        {
            cboPartNumber.DataSource = allItems;
            cboPartNumber.DataTextField = "PartNumber";
            cboPartNumber.DataValueField = "Id";
            cboPartNumber.DataBind();
        }        
    }
}