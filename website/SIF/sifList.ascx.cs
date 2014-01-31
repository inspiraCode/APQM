using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

public partial class sifList : System.Web.UI.UserControl
{
    private sifCRUD sif_CRUD = new sifCRUD();
    private bomCRUD bom_CRUD = new bomCRUD();
    private bomDetailCRUD bomDetail_CRUD = new bomDetailCRUD();

    protected void Page_Load(object sender, EventArgs e)
    {
    }
    public void setUserFilterWithCookie()
    {
        if (!IsPostBack)
        {
            if (cboFilterByUser.DataSource == null)
                cboFilterByUser.DataBind();
            HttpCookie sifCookie = Request.Cookies["SIF_User_Filter"];
            if (sifCookie != null)
                cboFilterByUser.Text = sifCookie.Value;
            load();
        }
    }
    public void load()
    {
        List<SIF> recordset;
        if (cboFilterByUser.SelectedValue == "All")
        {
            recordset = (List<SIF>)sif_CRUD.readAll();
            cboFilterByUser.Text = "All";
        }
        else
        {
            recordset = (List<SIF>)sif_CRUD.readAll("WHERE AssignedTo = '" + cboFilterByUser.SelectedValue + "'");
        }

        Repeater1.DataSource = recordset;
        Repeater1.DataBind();
    }
    public void R1_ItemDataBound(Object Sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            SIF sif = (SIF)e.Item.DataItem;
            ((LinkButton)e.Item.FindControl("deleteByID")).CommandArgument = sif.Id.ToString();
            ((LinkButton)e.Item.FindControl("linkAssignedTo")).CommandArgument = sif.Id.ToString();
            ((HtmlAnchor)e.Item.FindControl("aLinkSIF")).HRef = "../SIF/SIF_Form.aspx?sif=" + sif.Id;
            if (sif.BomId > -1)
            {
                ((HtmlAnchor)e.Item.FindControl("aLinkEditBOM")).HRef = "../BOM/BOM_Form.aspx?bom=" + sif.BomId;
                ((LinkButton)e.Item.FindControl("linkDeleteBOM")).CommandArgument = sif.BomId.ToString();
                ((LinkButton)e.Item.FindControl("linkCreateBOM")).Visible = false; 
                //((LinkButton)e.Item.FindControl("linkCreateBOM")).CommandArgument = sif.Id.ToString(); 
                //((LinkButton)e.Item.FindControl("deleteBOMByID")).Visible = true;
                if (sif.TopPartNumber.ToString().Trim() != "")
                {
                    ((HtmlAnchor)e.Item.FindControl("aLinkEditBOM")).InnerText = sif.TopPartNumber.ToString();
                }
                else
                {
                    ((HtmlAnchor)e.Item.FindControl("aLinkEditBOM")).InnerText = "Edit BOM";
                }
            }
            else
            {
                ((HtmlAnchor)e.Item.FindControl("aLinkEditBOM")).Visible = false;
                ((LinkButton)e.Item.FindControl("linkDeleteBOM")).Visible = false;
                ((LinkButton)e.Item.FindControl("linkCreateBOM")).CommandArgument = sif.Id.ToString();
            }
            if (sif.AssignedTo != "")
            {
                ((LinkButton)e.Item.FindControl("linkAssignedTo")).Text = sif.AssignedTo;
            }
            if (sif.SalesDBID > -1)
            {
                ((Label)e.Item.FindControl("lblCreatedIn")).Text =  "Sales DB";
            }
            else
            {
                ((Label)e.Item.FindControl("lblCreatedIn")).Text = "APQM";
            }
            if (sif.CreatedDate.Year == 1985 &&
                sif.CreatedDate.Month == 2 &&
                sif.CreatedDate.Day == 10)
            {
                ((Label)e.Item.FindControl("lblCreatedDate")).Text = "";
            }
        }
    }
    public void deleteByID(object sender, CommandEventArgs e)
    {
        long id = long.Parse((string)e.CommandArgument);
        if (sif_CRUD.delete(id))
        {
            load();
            uscNotifier.showSuccess("SIF deleted successfully.");
        }
        else
        {
            Navigator.goToPage("~/Error.aspx", "ERROR:" + sif_CRUD.ErrorMessage);
        }
    }
    public void deleteBOMByID(object sender, CommandEventArgs e)
    {
        long id = long.Parse((string)e.CommandArgument);
        if (bom_CRUD.delete(id))
        {
            load();
            uscNotifier.showSuccess("BOM deleted successfully.");
        }
        else
        {
            Navigator.goToPage("~/Error.aspx", "ERROR:" + bom_CRUD.ErrorMessage);
        }
    }
    public void createByBomID(object sender, CommandEventArgs e)
    {
        long sifID = long.Parse((string)e.CommandArgument);


        SessionObject so;
        BOM bom = null;
        
        bom = new BOM();
        bom.SifId = sifID;
        string idGenerated = bom_CRUD.createAndReturnIdGenerated(bom);
        if (!bom_CRUD.ErrorOccur)
        {
            bom.Id = long.Parse(idGenerated);
            so = new SessionObject();
            so.Content = bom;
            so.Status = "forUpdate";
            Session["bomObject"] = so;
            load();
            uscNotifier.showSuccess("BOM created successfully.");
        }
        else
        {
            Navigator.goToPage("~/Error.aspx", "ERROR:" + bom_CRUD.ErrorMessage);
            return;
        }
    }
    public void takeSIF(object sender, CommandEventArgs e)
    {
        String authUser = HttpContext.Current.User.Identity.Name;
        int SIF_ID = int.Parse((string)e.CommandArgument);

        SIF sifLocal = sif_CRUD.readById(SIF_ID);
        BOM localBOM = bom_CRUD.readBySIFId(SIF_ID);

        ConnectionManager CM = new ConnectionManager();
        Data_Base_MNG.SQL DM = CM.getDataManager();

        /*Begin Transaction*/
        DM.Open_Connection("SIF User Assignation");

        sifLocal.AssignedTo = authUser;
        sif_CRUD.update(sifLocal, ref DM);

        if (localBOM != null)
        {
            List<BOMDetail> bomDetailList = bomDetail_CRUD.readByParentID(localBOM.Id);
            foreach (BOMDetail detail in bomDetailList)
            {
                if (detail.User.Trim() == "")
                {
                    detail.User = authUser;
                }
                bomDetail_CRUD.update(detail, ref DM);
            }
        }

        DM.CommitTransaction();
        DM.Close_Open_Connection();

        if (DM.ErrorOccur)
        {
            Navigator.goToPage("~/Error.aspx", "ERROR:" + DM.Error_Mjs);
            return;
        }

        load();
        uscNotifier.showSuccess("You have taken this SIF, including its unassigned BOM's components.");
    }
    protected void cboFilterByUser_SelectedIndexChanged(object sender, EventArgs e)
    {
        HttpCookie sifCookie = new HttpCookie("SIF_User_Filter");
        sifCookie.Value = cboFilterByUser.SelectedValue;
        sifCookie.Expires = DateTime.Now.AddYears(1);
        Response.Cookies.Add(sifCookie);
        load();
    }
    public void on_sqldatasource_Init(Object sender, EventArgs e)
    {
        ConnectionManager connection = new ConnectionManager();
        SqlDataSourceUsers.ConnectionString = connection.getConnection().ConnectionString;
    }
}