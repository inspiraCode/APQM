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
    BOM bom;
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    public void load()
    {
        if (Session["bomObject"]!=null)
        {
            bom = (BOM)((SessionObject)Session["bomObject"]).Content;
            if (((SessionObject)Session["bomObject"]).Status == "forUpdate")
            {
                fillWithEntity(bom);
                lblMode.Text = "Update";
                ((SessionObject)Session["bomObject"]).Status = "Retrieved";
            }
            else if (((SessionObject)Session["bomObject"]).Status == "forNew")
            {
                fillWithEntity(bom);
                lblMode.Text = "New";
                ((SessionObject)Session["bomObject"]).Status = "Retrieved";
            }            
        }
        uscBOMDetailList.load();
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
        Session.Remove("bomObject");
        Cancel_Click(this, e);
    }
}