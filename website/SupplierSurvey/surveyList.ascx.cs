using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class surveyList : System.Web.UI.UserControl
{
    private SupplierSurveyCRUD surveyCRUD = new SupplierSurveyCRUD();
    Supplier supplier;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["supplierObject"] != null)
        {
            supplier = (Supplier)(((SessionObject)Session["supplierObject"]).Content);
        }
    }
    public void load()
    {
        if (Session["supplierObject"] != null)
        {
            supplier = (Supplier)(((SessionObject)Session["supplierObject"]).Content);
            List<SupplierSurvey> recordset = surveyCRUD.readByParentId(supplier.Id);
            Repeater1.DataSource = recordset;
            Repeater1.DataBind();
        }
    }

    public void R1_ItemDataBound(Object Sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            ((LinkButton)e.Item.FindControl("deleteByID")).CommandArgument = ((SupplierSurvey)e.Item.DataItem).Id.ToString();
            if (((SupplierSurvey)e.Item.DataItem).LastSurvey.Year == 1985 &&
                ((SupplierSurvey)e.Item.DataItem).LastSurvey.Month == 2 &&
                ((SupplierSurvey)e.Item.DataItem).LastSurvey.Day == 10)
            {
                ((LinkButton)e.Item.FindControl("updateByID")).Text = "Not filled yet";
            }
            ((LinkButton)e.Item.FindControl("updateByID")).CommandArgument = ((SupplierSurvey)e.Item.DataItem).Id.ToString();
        }
    }
    public void deleteByID(object sender, CommandEventArgs e)
    {
        long id = long.Parse((string)e.CommandArgument);
        if (surveyCRUD.delete(id))
        {
            load();
            uscNotifier.showSuccess("Survey deleted successfully.");
        }
        else
        {
            Navigator.goToPage("~/Error.aspx", "ERROR:" + surveyCRUD.ErrorMessage);
        }
    }
    public void updateByID(object sender, CommandEventArgs e)
    {
        long id = long.Parse((string)e.CommandArgument);
        SupplierSurvey survey = new SupplierSurvey();
        survey = surveyCRUD.readById(id);
        if (survey != null)
        {
            supplier.SupplierSurvey = survey;
            SessionObject so = new SessionObject();
            so.Content = supplier;
            so.Status = "forUpdate";
            Session["supplierObject"] = so;

            uscSurveyForm.load();
            panelPopup.Visible = true;
        }
        else
        {
            Navigator.goToPage("~/Error.aspx", "ERROR:Could not retrieve survey with id = " + id);
        }
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (uscSurveyForm.save())
        {
            panelPopup.Visible = false;
            load();
        }
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        panelPopup.Visible = false;
    }
}