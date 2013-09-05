using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class rfqDetailList : System.Web.UI.UserControl
{
    private rfqDetailCRUD rfqDetailCRUD = new rfqDetailCRUD();
    public long rfqHeaderKey = -1;

    protected void Page_Load(object sender, EventArgs e)
    {
    }
    public void load()
    {
        if (Session["RFQObject"] != null)
        {
            long id = ((RFQ)(((SessionObject)Session["RFQObject"]).Content)).Id;
            if (id > -1)
            {
                rfqHeaderKey = id;
                List<RFQDetail> recordset = rfqDetailCRUD.readByParentID(id);
                Repeater1.DataSource = recordset;
                Repeater1.DataBind();                
            }
            else
            {
                
            }
        }
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
        long id = long.Parse((string)e.CommandArgument);
        if (rfqDetailCRUD.delete(id))
        {
            ((SessionObject)Session["RFQObject"]).Status = "forUpdate";
            Navigator.goToPage("~/RFQ/RFQ.aspx","rfq");  
        }
        else
        {
            Navigator.goToPage("~/Error.aspx","");
        }
    }
    public void updateByID(object sender, CommandEventArgs e)
    {
        long id = long.Parse((string)e.CommandArgument);
        RFQDetail rfqDetail = new RFQDetail();
        rfqDetail = rfqDetailCRUD.readById(id);
        
        if (rfqDetail != null)
        {
            SessionObject so = new SessionObject();
            so.Content = rfqDetail;
            so.Status = "forUpdate";

            Session["RFQObject"] = so;
        }
        //Server.Transfer("~/RFQ/rfqDetail.aspx?tab=RFQDetail");
    }
    public void add_Click(object sender, EventArgs e)
    {
        RFQDetail rfqDetail = new RFQDetail();

        rfqDetail.RfqHeaderKey = rfqHeaderKey;
        rfqDetail.ItemMasterKey = long.Parse(txtItemDescription.Text);
        rfqDetail.RpcQty = long.Parse(txtQuantity.Text);
        rfqDetail.RpcCostPerUnit = float.Parse(txtCostUnit.Text);
        rfqDetail.OSQty = long.Parse(txtOutsideServicesQuantity.Text);
        rfqDetail.OSCostPerUnit = float.Parse(txtOutsideServicesCostUnit.Text);
        rfqDetail.ScrapValue = float.Parse(txtScrapValue.Text);
        rfqDetail.DirectHrlyLaborRate= float.Parse(txtDirectHrlyLaborRate.Text);
        rfqDetail.StdHrs = int.Parse(txtStdHrs.Text);

        if (rfqDetailCRUD.create(rfqDetail))
        {
            ((SessionObject)Session["RFQObject"]).Status = "forUpdate";
            Navigator.goToPage("~/RFQ/RFQ.aspx","rfq");     
        }
        else
        {
            Navigator.goToPage("~/Error.aspx","");
        }
    }
}