using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class bomDetailList : System.Web.UI.UserControl
{
    private List<BOMDetail> bomDetail = null;
    private List<BOMDetail> bomDetailToDelete = null;
    private itemCRUD item_CRUD = new itemCRUD();
    private List<Item> allItems = null;

    protected void Page_Load(object sender, EventArgs e)
    {
        uscNotifier.hide();   
        bomDetail = (List<BOMDetail>)Session["bomDetailObject"];
        bomDetailToDelete = (List<BOMDetail>)Session["bomDetailObjectToDelete"];
        allItems = (List<Item>)Session["bomDetailListAllItems"];
        btnAdd.OnClientClick = "return validate();";
    }
    public void load()
    {
        btnNewPartNumber.OnClientClick = "return promptUser('New Part Number', 'p~', " + ((HiddenField)uscNotifier.FindControl("txtPrompt")).ClientID + ")";
        loadDropDowns();
        loadDetail();
    }
    public void reset()
    {
        Session.Remove("bomDetailListAllItems");
        Session.Remove("bomDetailObject");
        Session.Remove("bomDetailObjectToDelete");
    }
    private void loadDetail(){
        repeaterBOMDetail.DataSource = bomDetail;
        repeaterBOMDetail.DataBind();
        if (bomDetail != null) divBOMDetailList.InnerHtml = bomDetail.Count.ToString() + " records.";
    }
    public void setEntity(List<BOMDetail> detail)
    {
        if (detail != null)
        {
            bomDetail = detail;
        }
        else
        {
            bomDetail = new List<BOMDetail>();
        }
        bomDetailToDelete = new List<BOMDetail>();
        Session["bomDetailObject"] = bomDetail;
        Session["bomDetailObjectToDelete"] = bomDetailToDelete;
    }
    public List<BOMDetail> getEntity()
    {
        return (List<BOMDetail>)Session["bomDetailObject"];
    }
    public List<BOMDetail> getBomDetailToDelete()
    {
        return (List<BOMDetail>)Session["bomDetailObjectToDelete"];
    }
    public void R1_ItemDataBound(Object Sender, RepeaterItemEventArgs e) 
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem) {
            ((LinkButton)e.Item.FindControl("deleteByID")).CommandArgument = ((BOMDetail)e.Item.DataItem).Sequence.ToString();
            ((LinkButton)e.Item.FindControl("updateByID")).CommandArgument = ((BOMDetail)e.Item.DataItem).Sequence.ToString();
        }
    }
    public void takeBOMLine(object sender, CommandEventArgs e)
    {
       
    }
    public void deleteByID(object sender, CommandEventArgs e)
    {
        int sequence = int.Parse((string)e.CommandArgument);
        foreach (BOMDetail detail in bomDetail)
        {
            if (detail.Sequence == sequence)
            {
                detail.internalAction = "DELETE";
                bomDetailToDelete.Add(detail);
                bomDetail.Remove(detail);
                loadDetail();
                break;
            }
        }
    }
    public void updateByID(object sender, CommandEventArgs e)
    {
        int sequence = int.Parse((string)e.CommandArgument);
        foreach (BOMDetail detail in bomDetail)
        {
            if (detail.Sequence == sequence)
            {               
                uscBomDetailEdit.setEntity(detail);
                panelPopup.Visible = true;
                break;
            }
        }        
    }
    public void add_Click(object sender, EventArgs e)
    {
        BOMDetail bomDetailLine = new BOMDetail();

        bomDetailLine.PartNumber = cboPartNumber.SelectedItem.Text;
        bomDetailLine.ItemMasterkey = long.Parse(cboPartNumber.SelectedValue);
        bomDetailLine.CapsonicPN = txtCapsonicPN.Text;
        bomDetailLine.CustomerPN = txtCustomerPN.Text;
        bomDetailLine.ManufacturePN = txtManufacturePN.Text;
        bomDetailLine.SupplierPN = txtSupplierPN.Text;
        bomDetailLine.CommCode = txtCommCode.Text;
        bomDetailLine.Material = txtMaterial.Text;
        bomDetailLine.Um = cboUM.SelectedValue;
        //vendorQuote imported from sales db
        bomDetailLine.Qty = float.Parse(txtQuantity.Text);
        bomDetailLine.EAU = int.Parse(txtEAU.Text);
        bomDetailLine.Cost = float.Parse(txtCost.Text);
        bomDetailLine.CapComAssm = txtCapComAssm.Text;
        bomDetailLine.PurchasingComments = txtPurchasingComments.Text;
        //salesStatus imported from sales db
        bomDetailLine.DirectedBuy = chkDirectedBuy.Checked;
        bomDetailLine.PurchasingStatus = cboPurchasingStatus.SelectedValue;
        bomDetailLine.UserKey = -1; //TODO: Set logged user.
        bomDetailLine.Status = "System status"; //TODO handle system status
        
        if (bomDetail == null) bomDetail = new List<BOMDetail>();

        if (bomDetail.Count > 0)
        {
            bomDetailLine.Sequence = bomDetail[bomDetail.Count - 1].Sequence + 1;
        }
        else
        {
            bomDetailLine.Sequence = 0;
        }

        Item item = new Item();

        item.Id = long.Parse(cboPartNumber.SelectedValue);
        item.Material = txtMaterial.Text;
        //item.Description = txtDescription.Text;
        item.Cost = float.Parse(txtCost.Text);
        item.PartNumber = cboPartNumber.SelectedItem.Text;
        item.Um = cboUM.SelectedValue;
        item.CapsonicPN = txtCapsonicPN.Text;
        item.CustomerPN = txtCustomerPN.Text;
        item.ManufacturePN = txtManufacturePN.Text;
        item.SupplierPN = txtSupplierPN.Text;
        item.CommCode = txtCommCode.Text;
        item.EAU = int.Parse(txtEAU.Text);

        bomDetailLine.Item = item;
        bomDetailLine.internalAction = "CREATE";
        bomDetail.Add(bomDetailLine);
        Session["bomDetailObject"] = bomDetail;

        loadDetail();
        clearAddFields();
        cboPartNumber.Focus();
    }
    private void clearAddFields()
    {
        //Fields in BOMDetail and Item:
        txtCapsonicPN.Text = "";
        txtCustomerPN.Text = "";
        txtManufacturePN.Text = "";
        txtSupplierPN.Text = "";
        txtCommCode.Text = "";
        txtMaterial.Text = "";
        cboUM.SelectedIndex = -1;
        txtEAU.Text = "0";
        txtCost.Text = "0";

        //Fields only in BOMDetail       
        txtQuantity.Text = "0";
        txtCapComAssm.Text = "";
        txtPurchasingComments.Text = "";
        chkDirectedBuy.Checked = false;
        cboPurchasingStatus.SelectedIndex = -1;
    }
    protected void on_prompt_partNumber(object sender, EventArgs e)
    {
        string value = ((HiddenField)sender).Value;

        if (value.Trim() != "")
        {
            string[] prompt = value.Split('~');
            if (prompt[1] != "null" && prompt[1].Trim() != "")
            {
                switch (prompt[0])
                {
                    case "p":
                        Item item = new Item();
                        item.PartNumber = prompt[1];

                        string idGenerated = item_CRUD.createAndReturnIdGenerated(item);
                        if (idGenerated != "")
                        {
                            allItems = null;
                            loadDropDowns();
                            cboPartNumber.SelectedValue = idGenerated;

                            txtCapsonicPN.Text = "";
                            txtCustomerPN.Text = "";
                            txtManufacturePN.Text = "";
                            txtSupplierPN.Text = "";
                            txtCommCode.Text = "";
                            txtMaterial.Text = "";
                            cboUM.SelectedValue = "";
                            txtEAU.Text = "0";
                            txtCost.Text = "0";

                            cboPartNumber.Focus();
                        }
                        else
                        {
                            uscNotifier.showAlert("This part number could not be saved, may be already exists.");
                        }
                        break;
                }
            }
            ((HiddenField)sender).Value = "";
        }
    }
    private void loadDropDowns()
    {
        if (allItems == null)
        {
            allItems = (List<Item>)item_CRUD.readAll();
            Session["bomDetailListAllItems"] = allItems;
            cboPartNumber.DataSource = allItems;
            cboPartNumber.DataTextField = "PartNumber";
            cboPartNumber.DataValueField = "Id";
            cboPartNumber.DataBind();

            //if (allItems.Count > 0)
            //{
            //    cboPartNumber_SelectedIndexChanged(null, null);
            //}
        }
    }
    protected void cboPartNumber_SelectedIndexChanged(object sender, EventArgs e)
    {
        Item item = item_CRUD.readById(long.Parse(cboPartNumber.SelectedValue));
        if (item != null)
        {
            //txtDescription.Text = item.Description;
            txtMaterial.Text = item.Material;
            cboUM.SelectedValue = item.Um;
            txtCost.Text = item.Cost.ToString();
            txtCapsonicPN.Text = item.CapsonicPN;
            txtCustomerPN.Text = item.CustomerPN;
            txtManufacturePN.Text = item.ManufacturePN;
            txtSupplierPN.Text = item.SupplierPN;
            txtCommCode.Text = item.CommCode;
            //txtEAU.Text = item.EAU.ToString();

            cboPartNumber.Focus();
        }
        else
        {
            txtCapsonicPN.Text = "";
            txtCustomerPN.Text = "";
            txtManufacturePN.Text = "";
            txtSupplierPN.Text = "";
            txtCommCode.Text = "";
            txtMaterial.Text = "";
            cboUM.SelectedValue = "";
            //txtEAU.Text = "0";
            txtCost.Text = "0";
            cboPartNumber.Focus();
        }
    }
    protected void on_edit_line(object sender, EventArgs e)
    {
        loadDetail();
        panelPopup.Visible = false;
    }
    protected void on_cancelEdit_line(object sender, EventArgs e)
    {
        panelPopup.Visible = false;
    }
}