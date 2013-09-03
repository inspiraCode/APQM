using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class surveyList : System.Web.UI.UserControl
{
    private SurveyCRUD surveyCRUD = new SurveyCRUD();
    protected void Page_Load(object sender, EventArgs e)
    {   
        List<SupplierSurvey> recordset = (List<SupplierSurvey>)surveyCRUD.readAll();
        Repeater1.DataSource = recordset;
        Repeater1.DataBind();
        divSurveyList.InnerHtml = recordset.Count.ToString() + " records.";
    }

    public void R1_ItemDataBound(Object Sender, RepeaterItemEventArgs e) 
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem) {                       
            ((LinkButton)e.Item.FindControl("deleteByID")).CommandArgument = ((SupplierSurvey)e.Item.DataItem).Id.ToString();            
            ((LinkButton)e.Item.FindControl("updateByID")).CommandArgument = ((SupplierSurvey)e.Item.DataItem).Id.ToString();            
        }
    }
    public void deleteByID(object sender, CommandEventArgs e)
    {
        long id = long.Parse((string)e.CommandArgument);
        if (!surveyCRUD.delete(id))
        {
            Navigator.goToPage("~/Error.aspx","");
        }
    }
    public void updateByID(object sender, CommandEventArgs e)
    {
        long id = long.Parse((string)e.CommandArgument);
        SupplierSurvey survey = new SupplierSurvey();
        survey = surveyCRUD.readById(id);
        if (survey != null)
        {
            SessionObject so = new SessionObject();
            so.Content = survey;
            so.Status = "forUpdate";

            Session["SurveyObject"] = so;
        }
        Navigator.goToPage("~/Default.aspx","popupSurvey");
    }   
}