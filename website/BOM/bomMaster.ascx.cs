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
        if (Session["BOMObject"]!=null)
        {
            if (((SessionObject)Session["BOMObject"]).Status == "forUpdate")
            {
                fillWithEntity((BOM)(((SessionObject)Session["BOMObject"]).Content));
                lblMode.Text = "Update";
                ((SessionObject)Session["BOMObject"]).Status = "Retrieved";                              
            }
            else if (((SessionObject)Session["BOMObject"]).Status == "forNew")
            {
                fillWithEntity((BOM)(((SessionObject)Session["BOMObject"]).Content));
                lblMode.Text = "New";
                ((SessionObject)Session["BOMObject"]).Status = "Retrieved";
            }            
        }
    }
    public void fillWithEntity(BOM bom){        
        lblID.Text = bom.Id.ToString();
        lblSifID.Text = bom.SifId.ToString();
        txtPartNumber.Text = bom.TopPartNumber;
        txtDescription.Text = bom.PartDescription;
        txtRevision.Text = bom.Revision;        
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        BOM bom = new BOM();
        bom.SifId = long.Parse(lblSifID.Text);
        bom.TopPartNumber = txtPartNumber.Text;        
        bom.PartDescription = txtDescription.Text;
        bom.Revision = txtRevision.Text;        

        if (lblMode.Text == "New") {
            if (!bomCRUD.create(bom))
            {
                Navigator.goToPage("~/Error.aspx","");
            }
        }else if(lblMode.Text == "Update"){
            bom.Id = long.Parse(lblID.Text);
            if (!bomCRUD.update(bom))
            {
                Navigator.goToPage("~/Error.aspx","");
            }
        }
        Ok_Click(this, e);
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Session.Remove("BOMObject");
        Cancel_Click(this, e);
    }
}