using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class bomDetailList : System.Web.UI.UserControl
{
    private static List<BOMDetail> bomDetail = null;
    private itemCRUD item_CRUD = new itemCRUD();    
    private static List<Item> allItems = null;

    protected void Page_Load(object sender, EventArgs e)
    {
        btnNewPartNumber.OnClientClick = "document.getElementById('" + txtPrompt.ClientID + "').value = 'p-' + prompt('New Part Number')";
        loadDropDowns();
    }

    public void reset()
    {
        allItems = null;
        bomDetail = null;
    }
    
    private void loadDetail(){
        repeaterBOMDetail.DataSource = bomDetail;
        repeaterBOMDetail.DataBind();
        divBOMDetailList.InnerHtml = bomDetail.Count.ToString() + " records.";
    }
    public void setEntity(List<BOMDetail> detail)
    {
        if (detail != null)
        {
            bomDetailList.bomDetail = detail;
            loadDetail();
        }            
    }
    public List<BOMDetail> getEntity()
    {
        return bomDetail;
    }

    public void R1_ItemDataBound(Object Sender, RepeaterItemEventArgs e) 
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem) {
            ((LinkButton)e.Item.FindControl("deleteByID")).CommandArgument = ((BOMDetail)e.Item.DataItem).Sequence.ToString();
            ((LinkButton)e.Item.FindControl("updateByID")).CommandArgument = ((BOMDetail)e.Item.DataItem).Id.ToString();
        }
    }
    public void deleteByID(object sender, CommandEventArgs e)
    {
        int sequence = int.Parse((string)e.CommandArgument);
        foreach (BOMDetail detail in bomDetail)
        {
            if (detail.Sequence == sequence)
            {
                bomDetail.Remove(detail);
                loadDetail();
                break;
            }
        }
    }
    //public void deleteByID(object sender, CommandEventArgs e)
    //{
    //    long id = long.Parse((string)e.CommandArgument);
    //    if (bomDetailCRUD.delete(id))
    //    {
    //        ((SessionObject)Session["bomObject"]).Status = "forUpdate";
    //        Navigator.goToPage("~/BOM/BOM.aspx","bom");
    //    }
    //    else
    //    {
    //        Navigator.goToPage("~/Error.aspx","");
    //    }
    //}

    public void updateByID(object sender, CommandEventArgs e)
    {
        //long id = long.Parse((string)e.CommandArgument);
        //BOMDetail bomDetail = new BOMDetail();
        //bomDetail = bomDetailCRUD.readById(id);

        //if (bomDetail != null)
        //{
        //    SessionObject so = new SessionObject();
        //    so.Content = bomDetail;
        //    so.Status = "forUpdate";

        //    Session["bomObject"] = so;
        //}
        ////Server.Transfer("~/BOM/bomDetail.aspx?tab=BOMDetail");
    }
    public void add_Click(object sender, EventArgs e)
    {
        BOMDetail bomDetailLine = new BOMDetail();        

        bomDetailLine.Qty = float.Parse(txtQuantity.Text);
        bomDetailLine.Description = txtDescription.Text;
        bomDetailLine.Status = txtStatus.Text;
        bomDetailLine.ItemMasterkey = long.Parse(cboPartNumber.SelectedValue);
        bomDetailLine.PartNumber = cboPartNumber.SelectedItem.Text;
        bomDetailLine.Material = txtMaterial.Text;
        bomDetailLine.Sequence = bomDetail.Count + 1;

        Item item = new Item();

        item.Id = long.Parse(cboPartNumber.SelectedValue);
        item.Description = txtDescription.Text;
        item.Material = txtMaterial.Text;
        item.PartNumber = cboPartNumber.SelectedItem.Text;
        item.Um = "UM";

        bomDetailLine.Item = item;

        bomDetail.Add(bomDetailLine);

        loadDetail();
        cboPartNumber.Focus();
        clearAddFields();
    }
    private void clearAddFields()
    {
        txtDescription.Text = "";
        txtMaterial.Text = "";
        txtStatus.Text = "";
        txtQuantity.Text = "";
    }
    //public void add_Click(object sender, EventArgs e)
    //{
    //    BOMDetail bomDetail = new BOMDetail();
    //    Item item = new Item();

    //    item.Description = txtDescription.Text;
    //    item.Material = txtMaterial.Text;
    //    item.PartNumber = txtPartNumber.Text;
    //    item.Um = "UM";
    //    string idGenerated = itemCRUD.createAndReturnIdGenerated(item);
    //    if (idGenerated != "")
    //    {
    //        bomDetail.BomHeaderKey = bom.Id;
    //        bomDetail.ItemMasterkey = long.Parse(idGenerated);
    //        bomDetail.Qty = long.Parse(txtQuantity.Text);
    //        bomDetail.Description = txtDescription.Text;
    //        bomDetail.Status = txtStatus.Text;

    //        if (bomDetailCRUD.create(bomDetail))
    //        {
    //            ((SessionObject)Session["bomObject"]).Status = "forUpdate";
    //            Navigator.goToPage("~/BOM/BOM.aspx", "bom");
    //        }
    //        else
    //        {
    //            Navigator.goToPage("~/Error.aspx", "");
    //        }
    //    }
    //    else
    //    {
    //        Navigator.goToPage("~/Error.aspx", "");
    //    }
    //}
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
            cboPartNumber.DataSource = allItems;
            cboPartNumber.DataTextField = "PartNumber";
            cboPartNumber.DataValueField = "Id";
            cboPartNumber.DataBind();
        }
    }
    protected void cboPartNumber_SelectedIndexChanged(object sender, EventArgs e)
    {
        Item item = item_CRUD.readById(long.Parse(cboPartNumber.SelectedValue));
        if (item != null)
        {
            txtDescription.Text = item.Description;
            txtMaterial.Text = item.Material;
            cboPartNumber.Focus();
        }
    }
}