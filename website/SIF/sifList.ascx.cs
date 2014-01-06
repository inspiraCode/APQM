using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

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
            ((LinkButton)e.Item.FindControl("updateByID")).CommandArgument = sif.Id.ToString();
            ((LinkButton)e.Item.FindControl("deleteByID")).CommandArgument = sif.Id.ToString();
            ((LinkButton)e.Item.FindControl("linkAssignedTo")).CommandArgument = sif.Id.ToString();
            if (sif.BomId > -1)
            {
                ((LinkButton)e.Item.FindControl("updateBOM")).CommandArgument = sif.Id.ToString() + ";" +
                                                                                   sif.BomId.ToString();
                if (sif.TopPartNumber.ToString().Trim() != "")
                {
                    ((LinkButton)e.Item.FindControl("updateBOM")).Text = sif.TopPartNumber.ToString();
                }
                else
                {
                    ((LinkButton)e.Item.FindControl("updateBOM")).Text = "Edit BOM";
                }
            }
            else
            {
                ((LinkButton)e.Item.FindControl("updateBOM")).CommandArgument = sif.Id.ToString() + ";";
                ((LinkButton)e.Item.FindControl("updateBOM")).Text = "None";
            }
            if (sif.AssignedTo != "")
            {
                ((LinkButton)e.Item.FindControl("linkAssignedTo")).Text = sif.AssignedTo;
                //((LinkButton)e.Item.FindControl("linkAssignedTo")).Enabled = false;
            }
        }
    }
    public void deleteByID(object sender, CommandEventArgs e)
    {
        long id = long.Parse((string)e.CommandArgument);
        if (sif_CRUD.delete(id))
        {
            Navigator.goToPage("~/Default.aspx", "sif");
        }
        else
        {
            Navigator.goToPage("~/Error.aspx", "ERROR:" + sif_CRUD.ErrorMessage);
        }
    }
    public void updateByID(object sender, CommandEventArgs e)
    {
        long id = long.Parse((string)e.CommandArgument);
        SIF sif = new SIF();
        sif = sif_CRUD.readById(id);
        if (sif != null)
        {
            sifDetailCRUD sifDetailCRUD = new sifDetailCRUD();
            sif.SifDetail = sifDetailCRUD.readByParentID(sif.Id);

            SessionObject so = new SessionObject();
            so.Content = sif;
            so.Status = "forUpdate";

            Session["SIFObject"] = so;
        }
        Navigator.goToPage("~/SIF/SIF.aspx", "SIF");
    }
    public void updateByBomID(object sender, CommandEventArgs e)
    {
        SessionObject so;
        BOM bom = null;
        string[] values = e.CommandArgument.ToString().Split(';');
        if (values[1] != "")
        {
            long id = long.Parse(values[1]);
            bom = bom_CRUD.readById(id);
            if (bom == null)
            {
                Navigator.goToPage("~/Error.aspx", "");
                return;
            }
            else
            {
                so = new SessionObject();
                so.Content = bom;
                so.Status = "forUpdate";
                Session["bomObject"] = so;
                Navigator.goToPage("~/SIF/SIF.aspx", "bom");
            }
        }
        else
        {
            bom = new BOM();
            bom.SifId = long.Parse(values[0]);
            so = new SessionObject();
            so.Content = bom;
            so.Status = "forNew";
            Session["bomObject"] = so;
            Navigator.goToPage("~/SIF/SIF.aspx", "bom");
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
    }
    protected void cboFilterByUser_SelectedIndexChanged(object sender, EventArgs e)
    {
        HttpCookie sifCookie = new HttpCookie("SIF_User_Filter");
        sifCookie.Value = cboFilterByUser.SelectedValue;
        sifCookie.Expires = DateTime.Now.AddYears(1);
        Response.Cookies.Add(sifCookie);
        load();
    }
}