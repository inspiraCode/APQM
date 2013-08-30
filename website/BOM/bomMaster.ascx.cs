using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class bomMaster : System.Web.UI.UserControl
{
    public event EventHandler Ok_Click;
    public event EventHandler Cancel_Click;

    bomCRUD bomCRUD = new bomCRUD();   

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["BOM"]!=null)
        {
            if (((SessionObject)Session["BOM"]).Status == "forUpdate")
            {
                fillWithEntity((BOM)(((SessionObject)Session["BOM"]).Content));
                lblMode.Text = "Update";
                ((SessionObject)Session["BOM"]).Status = "Retrieved";                              
            }
            else if (((SessionObject)Session["BOM"]).Status == "forNew")
            {
                fillWithEntity((BOM)(((SessionObject)Session["BOM"]).Content));
                lblMode.Text = "New";
                ((SessionObject)Session["BOM"]).Status = "Retrieved";
            }            
        }
    }
    public void fillWithEntity(BOM bom){        
        lblID.Text = bom.Id.ToString();
        lblSifID.Text = bom.SifID.ToString();
        txtPartNumber.Text = bom.TopPartNumber;
        txtDescription.Text = bom.PartDescription;
        txtRevision.Text = bom.Revision;        
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        BOM bom = new BOM();
        bom.SifID = long.Parse(lblSifID.Text);
        bom.TopPartNumber = txtPartNumber.Text;        
        bom.PartDescription = txtDescription.Text;
        bom.Revision = txtRevision.Text;        

        if (lblMode.Text == "New") {
            if (!bomCRUD.create(bom))
            {
                Server.Transfer("~/Error.aspx");
            }
        }else if(lblMode.Text == "Update"){
            bom.Id = long.Parse(lblID.Text);
            if (!bomCRUD.update(bom))
            {
                Server.Transfer("~/Error.aspx");
            }
        }
        Ok_Click(this, e);
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Session.Remove("bom");
        Cancel_Click(this, e);
    }
}