using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class bomDetailList : System.Web.UI.UserControl
{
    private bomDetailCRUD bomDetailCRUD = new bomDetailCRUD();
    private itemCRUD itemCRUD = new itemCRUD();
    private BOM bom;

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    public void load()
    {
        if (Session["bomObject"] != null)
        {
            bom = (BOM)((SessionObject)Session["bomObject"]).Content;
                        
            if (bom.Id > -1)
            {                
                List<BOMDetail> recordset = bomDetailCRUD.readByParentID(bom.Id);
                Repeater1.DataSource = recordset;
                Repeater1.DataBind();
                divBOMDetailList.InnerHtml = recordset.Count.ToString() + " records.";
            }
            else
            {
                //TODO
            }
        }
    }
    public void R1_ItemDataBound(Object Sender, RepeaterItemEventArgs e) 
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem) {            
            ((LinkButton)e.Item.FindControl("deleteByID")).CommandArgument = ((BOMDetail)e.Item.DataItem).Id.ToString();            
            ((LinkButton)e.Item.FindControl("updateByID")).CommandArgument = ((BOMDetail)e.Item.DataItem).Id.ToString();            
        }
    }
    public void deleteByID(object sender, CommandEventArgs e)
    {
        long id = long.Parse((string)e.CommandArgument);
        if (bomDetailCRUD.delete(id))
        {
            ((SessionObject)Session["bomObject"]).Status = "forUpdate";
            Navigator.goToPage("~/BOM/BOM.aspx","bom");
        }
        else
        {
            Navigator.goToPage("~/Error.aspx","");
        }
    }
    public void updateByID(object sender, CommandEventArgs e)
    {
        long id = long.Parse((string)e.CommandArgument);
        BOMDetail bomDetail = new BOMDetail();
        bomDetail = bomDetailCRUD.readById(id);
        
        if (bomDetail != null)
        {
            SessionObject so = new SessionObject();
            so.Content = bomDetail;
            so.Status = "forUpdate";

            Session["bomObject"] = so;
        }
        //Server.Transfer("~/BOM/bomDetail.aspx?tab=BOMDetail");
    }
    public void add_Click(object sender, EventArgs e)
    {
        BOMDetail bomDetail = new BOMDetail();
        Item item = new Item();

        item.Description = txtDescription.Text;
        item.Material = txtMaterial.Text;
        item.PartNumber = txtPartNumber.Text;
        item.Um = "UM";
        string idGenerated = itemCRUD.createAndReturnIdGenerated(item);
        if (idGenerated != "")
        {
            bomDetail.BomHeaderKey = bom.Id;
            bomDetail.ItemMasterkey = long.Parse(idGenerated);
            bomDetail.Qty = long.Parse(txtQuantity.Text);
            bomDetail.Description = txtDescription.Text;
            bomDetail.Status = txtStatus.Text;

            if (bomDetailCRUD.create(bomDetail))
            {
                ((SessionObject)Session["bomObject"]).Status = "forUpdate";
                Navigator.goToPage("~/BOM/BOM.aspx", "bom");
            }
            else
            {
                Navigator.goToPage("~/Error.aspx", "");
            }
        }
        else
        {
            Navigator.goToPage("~/Error.aspx", "");
        }
    }
}