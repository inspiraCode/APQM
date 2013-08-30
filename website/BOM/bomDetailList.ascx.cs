using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class bomDetailList : System.Web.UI.UserControl
{
    private bomDetailCRUD bomDetailCRUD = new bomDetailCRUD();
    public long bomHeaderKey = -1;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["BOM"] != null)
        {
            long id = ((BOM)(((SessionObject)Session["BOM"]).Content)).Id;
            if (id > -1)
            {
                bomHeaderKey = id;
                List<BOMDetail> recordset = (List<BOMDetail>)bomDetailCRUD.readByParentID(id);
                Repeater1.DataSource = recordset;
                Repeater1.DataBind();
                divBOMDetailList.InnerHtml = recordset.Count.ToString() + " records.";
            }
            else
            {
                
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
            ((SessionObject)Session["BOM"]).Status = "forUpdate";
            Server.Transfer("~/BOM/BOM.aspx?tab=bom");  
        }
        else
        {
            Server.Transfer("~/Error.aspx");
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

            Session["BOMDetail"] = so;
        }
        //Server.Transfer("~/BOM/bomDetail.aspx?tab=BOMDetail");
    }
    public void add_Click(object sender, EventArgs e)
    {
        BOMDetail bomDetail = new BOMDetail();
        bomDetail.BomHeaderKey = bomHeaderKey;
        bomDetail.ItemMasterkey = long.Parse(txtPartNumber.Text);
        bomDetail.Qty = long.Parse(txtQuantity.Text);
        bomDetail.Description = txtDescription.Text;
        bomDetail.Status = "Created";
        if (bomDetailCRUD.create(bomDetail))
        {
            ((SessionObject)Session["BOM"]).Status = "forUpdate";
            Server.Transfer("~/BOM/BOM.aspx?tab=bom");     
        }
        else
        {
            Server.Transfer("~/Error.aspx");
        }
    }
}