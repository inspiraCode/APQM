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

        item.Id = long.Parse(cboPartNumberEdit.SelectedValue);
        item.PartNumber = cboPartNumberEdit.SelectedItem.Text;
        item.Cost = float.Parse(txtCost.Text);
        item.Um = cboUM.SelectedValue;
        item.Material = txtMaterial.Text;
        item.CapsonicPN = txtCapsonicPN.Text;
        item.CustomerPN = txtCustomerPN.Text;
        item.ManufacturePN = txtManufacturePN.Text;
        item.SupplierPN = txtSupplierPN.Text;
        item.CommCode = txtCommCode.Text;
        item.EAU = int.Parse(txtEAU.Text);
        
        bomDetailEdit.Item = item;

        bomDetailEdit.PartNumber = cboPartNumberEdit.SelectedItem.Text;
        bomDetailEdit.ItemMasterkey = long.Parse(cboPartNumberEdit.SelectedValue);
        bomDetailEdit.CapsonicPN = txtCapsonicPN.Text;
        bomDetailEdit.CustomerPN = txtCustomerPN.Text;
        bomDetailEdit.ManufacturePN = txtManufacturePN.Text;
        bomDetailEdit.SupplierPN = txtSupplierPN.Text;
        bomDetailEdit.CommCode = txtCommCode.Text;
        bomDetailEdit.Material = txtMaterial.Text;
        bomDetailEdit.Um = cboUM.SelectedValue;
        //vendorQuote imported from sales db
        bomDetailEdit.Qty = float.Parse(txtQuantity.Text);
        bomDetailEdit.EAU = int.Parse(txtEAU.Text);
        bomDetailEdit.Cost = float.Parse(txtCost.Text);
        bomDetailEdit.CapComAssm = txtCapComAssm.Text;
        bomDetailEdit.PurchasingComments = txtPurchasingComments.Text;
        //salesStatus imported from sales db
        bomDetailEdit.DirectedBuy = chkDirectedBuy.Checked;
        bomDetailEdit.PurchasingStatus = cboPurchasingStatus.SelectedValue;
        bomDetailEdit.UserKey = -1; //TODO: Set logged user.
        bomDetailEdit.Status = "System status"; //TODO handle system status

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
        btnNewPartNumber.OnClientClick = "return promptUser('New Part Number', 'p~', " + ((HiddenField)uscNotifier.FindControl("txtPrompt")).ClientID + ")";
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

        cboPartNumberEdit.SelectedValue = bomDetailEdit.ItemMasterkey.ToString();
        txtCapsonicPN.Text = bomDetailEdit.CapsonicPN;
        txtCustomerPN.Text = bomDetailEdit.CustomerPN;
        txtManufacturePN.Text = bomDetailEdit.ManufacturePN;
        txtSupplierPN.Text = bomDetailEdit.SupplierPN;
        txtCommCode.Text = bomDetailEdit.CommCode;
        txtMaterial.Text = bomDetailEdit.Material;
        cboUM.SelectedValue = bomDetailEdit.Um;
        lblVendorQuoteEst.Text = bomDetailEdit.VendorQuoteEst;
        txtQuantity.Text = bomDetailEdit.Qty.ToString();
        txtEAU.Text = bomDetailEdit.EAU.ToString();
        txtCost.Text = bomDetailEdit.Cost.ToString();
        txtCapComAssm.Text = bomDetailEdit.CapComAssm;
        txtPurchasingComments.Text = bomDetailEdit.PurchasingComments;
        lblSalesStatus.Text = bomDetailEdit.SalesStatus;
        chkDirectedBuy.Checked = bomDetailEdit.DirectedBuy;
        cboPurchasingStatus.SelectedValue = bomDetailEdit.PurchasingStatus;
        //lblAssignedTo.Text = bomDetailEdit TODO
        //TODO system status
        
    }
    protected void on_prompt(object sender, EventArgs e)
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
                            cboPartNumberEdit.SelectedValue = idGenerated;
                            txtCapsonicPN.Text = "";
                            txtCustomerPN.Text = "";
                            txtManufacturePN.Text = "";
                            txtSupplierPN.Text = "";
                            txtCommCode.Text = "";
                            txtMaterial.Text = "";
                            cboUM.SelectedIndex = -1;
                            txtEAU.Text = "0";
                            txtCost.Text = "0";
                            cboPartNumberEdit.Focus();
                        }
                        else
                        {
                            uscNotifier.showAlert("This part number could not be saved, may be it already exists.");
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
        }
        Session["bomDetailListAllItems"] = allItems;
        cboPartNumberEdit.DataSource = allItems;
        cboPartNumberEdit.DataTextField = "PartNumber";
        cboPartNumberEdit.DataValueField = "Id";
        cboPartNumberEdit.DataBind();
    }
    protected void cboPartNumberEdit_SelectedIndexChanged(object sender, EventArgs e)
    {
        Item item = item_CRUD.readById(long.Parse(cboPartNumberEdit.SelectedValue));
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
            txtEAU.Text = item.EAU.ToString();
            cboPartNumberEdit.Focus();
        }
        else
        {
            txtCapsonicPN.Text = "";
            txtCustomerPN.Text = "";
            txtManufacturePN.Text = "";
            txtSupplierPN.Text = "";
            txtCommCode.Text = "";
            txtMaterial.Text = "";
            cboUM.SelectedIndex = -1;
            txtEAU.Text = "0";
            txtCost.Text = "0";
            cboPartNumberEdit.Focus();
        }
    }
}