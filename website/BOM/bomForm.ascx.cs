using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class bomForm : System.Web.UI.UserControl
{
    public event EventHandler Ok_Click;
    public event EventHandler Cancel_Click;

    bomCRUD bomCRUD = new bomCRUD();
    public BOM bom;

    private bomDetailCRUD bomDetailCRUD = new bomDetailCRUD();
    private itemCRUD item_CRUD = new itemCRUD(); 

    protected void Page_Load(object sender, EventArgs e)
    {
        bom = (BOM)Session["bom"];
    }
    public void load()
    {
        if (bom == null)
        {
            if (Session["bomObject"] != null)
            {
                bom = (BOM)((SessionObject)Session["bomObject"]).Content;
                bom.BomDetail = bomDetailCRUD.readByParentID(bom.Id);
                Session["bom"] = bom;
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
        }
    }
    public void fillWithEntity(BOM bom){
        lblID.Text = bom.Id.ToString();
        lblSifID.Text = bom.SifId.ToString();
        txtPartNumber.Text = bom.TopPartNumber;
        txtDescription.Text = bom.PartDescription;
        txtRevision.Text = bom.Revision;
        uscBOMDetailList.reset();
        uscBOMDetailList.setEntity(bom.BomDetail);
        uscBOMDetailList.load();
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        BOM bom = new BOM();
        bom.SifId = long.Parse(lblSifID.Text);
        bom.TopPartNumber = txtPartNumber.Text;
        bom.PartDescription = txtDescription.Text;
        bom.Revision = txtRevision.Text;


        ConnectionManager CM = new ConnectionManager();
        Data_Base_MNG.SQL DM = CM.getDataManager();

        /*Begin Transaction*/
        DM.Open_Connection("BOM Save");

        if (lblMode.Text == "New")
        {
            string idGenerated = bomCRUD.createAndReturnIdGenerated(bom, ref DM);
            if (idGenerated != "")
            {
                this.bom.Id = long.Parse(idGenerated);
            }
            else
            {
                Navigator.goToPage("~/Error.aspx", "");
                return;
            }
        }
        else if (lblMode.Text == "Update")
        {
            bom.Id = this.bom.Id;
            if (!bomCRUD.update(bom, ref DM))
            {
                Navigator.goToPage("~/Error.aspx", "");
                return;
            }
        }
        List<BOMDetail> bomDetailListToDelete = uscBOMDetailList.getBomDetailToDelete();
        foreach (BOMDetail detail in bomDetailListToDelete)
        {            
            if (!bomDetailCRUD.delete(detail.Id, ref DM))
            {
                Navigator.goToPage("~/Error.aspx", "");
                return;
            }
        }
        List<BOMDetail> bomDetailList = uscBOMDetailList.getEntity();
        foreach (BOMDetail detail in bomDetailList)
        {
            Item item = detail.Item;
            if (item != null)
            {
                if (!item_CRUD.update(item, ref DM))
                {
                    Navigator.goToPage("~/Error.aspx", "");
                    return;
                }
            }
            if (detail.internalAction == "CREATE")
            {                
                detail.BomHeaderKey = this.bom.Id;
                if (!bomDetailCRUD.create(detail, ref DM))
                {
                    Navigator.goToPage("~/Error.aspx", "");
                    return;
                }
            }
        }

        DM.CommitTransaction();
        DM.Close_Open_Connection();


        Session.Remove("bom");
        Ok_Click(this, e);
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Session.Remove("bom");
        Session.Remove("bomObject");
        Cancel_Click(this, e);
    }
}