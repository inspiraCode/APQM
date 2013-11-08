﻿using System;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Reflection;

public partial class _Default : System.Web.UI.Page 
{    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["SECTION"] != null)
        {
            switch (((SessionObject)Session["SECTION"]).Content.ToString())
            {
                case "bom":
                    MultiViewMain.SetActiveView(viewBOM);
                    uscBOMMasterForm.load();
                    break;
                case "sif":
                    MultiViewMain.SetActiveView(viewSIF);
                    uscSifForm.load();
                    break;
                //case "popupSupplier":
                //    //supplierMasterForm.fillWithId(long.Parse(Request.Params.Get("id")));
                //    openpopupContainer();
                //    break;
                default:
                    break;
            }                       
        }
    }
   
    //private void openpopupContainer(string content)
    //{
    //    panelPopup.Visible = true;
    //}
    protected void on_ok_bom(object sender, EventArgs e)
    {
        Navigator.goToPage("~/default.aspx","bom");
    }
    protected void on_cancel_bom(object sender, EventArgs e) 
    {
        Navigator.goToPage("~/default.aspx","bom");
    }
    protected void on_ok_sif(object sender, EventArgs e)
    {
        Navigator.goToPage("~/default.aspx", "bom");
    }
    protected void on_cancel_sif(object sender, EventArgs e)
    {
        Navigator.goToPage("~/default.aspx", "bom");
    }
    //protected void tabSupplier_Click(object sender, EventArgs e)
    //{
    //    Server.Transfer("~/Supplier/supplier.aspx?tab=supplier");
    //}
    //protected void tabSurvey_Click(object sender, EventArgs e)
    //{
    //    Server.Transfer("~/Supplier/supplier.aspx?tab=survey");
    //}

}