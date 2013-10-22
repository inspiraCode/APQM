using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class BOM_bomDetailEdit : System.Web.UI.UserControl
{
    public event EventHandler Ok_Click;
    public event EventHandler Cancel_Click;

    private itemCRUD item_CRUD = new itemCRUD();
    private List<Item> allItems = null;

    private BOMDetail bomDetailEdit;

    protected void Page_Load(object sender, EventArgs e)
    {
        allItems = (List<Item>)Session["bomDetailListAllItems"];
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        bomDetailEdit = (BOMDetail)Session["BOMDetailEdit"];


        Item item = new Item();

        item.Id = long.Parse(cboPartNumber.SelectedValue);
        item.Material = txtMaterial.Text;
        item.Description = txtDescription.Text;
        item.PartNumber = cboPartNumber.SelectedItem.Text;
        item.Um = cboUM.SelectedValue;

        bomDetailEdit.Item = item;

        bomDetailEdit.ItemMasterkey = long.Parse(cboPartNumber.SelectedValue);
        bomDetailEdit.Um = cboUM.SelectedValue;
        bomDetailEdit.Material =  txtMaterial.Text;
        bomDetailEdit.Description = txtDescription.Text;
        bomDetailEdit.Qty = float.Parse( txtQuantity.Text);
        bomDetailEdit.Cost = float.Parse(txtCost.Text);
        bomDetailEdit.DirectedBuy = chkDirectedBuy.Checked;
        bomDetailEdit.PurchasingStatus = cboPurchasingStatus.SelectedValue;
        bomDetailEdit.PurchasingComments = txtPurchasingComments.Text;

        if (bomDetailEdit.Id > -1)
        {
            bomDetailEdit.internalAction = "UPDATE";
        }
        
        Ok_Click(this, e);
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Cancel_Click(this, e);
    }
    public void setEntity(BOMDetail detail)
    {
        btnNewPartNumber.OnClientClick = "document.getElementById('" + txtPrompt.ClientID + "').value = 'p~' + prompt('New Part Number')";
        loadDropDowns();

        if (detail != null)
        {
            Session["BOMDetailEdit"] = detail;
        }
        else
        {
            Session["BOMDetailEdit"] = new BOMDetail();
        }
        bomDetailEdit = (BOMDetail)Session["BOMDetailEdit"];

        cboPartNumber.SelectedValue = bomDetailEdit.ItemMasterkey.ToString();
        cboUM.SelectedValue = bomDetailEdit.Um;
        txtMaterial.Text = bomDetailEdit.Material;
        txtDescription.Text = bomDetailEdit.Description;
        txtQuantity.Text = bomDetailEdit.Qty.ToString();
        txtCost.Text = bomDetailEdit.Cost.ToString();
        chkDirectedBuy.Checked = bomDetailEdit.DirectedBuy;
        cboPurchasingStatus.SelectedValue = bomDetailEdit.PurchasingStatus;
        txtPurchasingComments.Text = bomDetailEdit.PurchasingComments;
        lblSalesComments.Text = bomDetailEdit.SalesComments;
        lblVendorQuoteEst.Text = bomDetailEdit.VendorQuoteEst;
    }
    protected void txtPrompt_ValueChanged(object sender, EventArgs e)
    {
        if (txtPrompt.Value.Trim() != "")
        {
            string[] prompt = txtPrompt.Value.Split('~');
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
                            cboPartNumber.Focus();
                        }
                        break;
                }
            }
            txtPrompt.Value = "";
        }

    }
    private void loadDropDowns()
    {
        if (allItems == null)
        {
            allItems = (List<Item>)item_CRUD.readAll();
        }
        Session["bomDetailListAllItems"] = allItems;
        cboPartNumber.DataSource = allItems;
        cboPartNumber.DataTextField = "PartNumber";
        cboPartNumber.DataValueField = "Id";
        cboPartNumber.DataBind();
    }
    protected void cboPartNumber_SelectedIndexChanged(object sender, EventArgs e)
    {
        Item item = item_CRUD.readById(long.Parse(cboPartNumber.SelectedValue));
        if (item != null)
        {
            txtDescription.Text = item.Description;
            txtMaterial.Text = item.Material;
            cboUM.SelectedValue = item.Um;
            cboPartNumber.Focus();
        }
        else
        {
            txtDescription.Text = "";
            txtMaterial.Text = "";
            cboUM.SelectedValue = "";
            cboPartNumber.Focus();
        }
    }
}