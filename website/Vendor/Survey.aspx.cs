﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class VendorSurvey : System.Web.UI.Page
{
    private Token token;
    private tokenCRUD tokenCRUD = new tokenCRUD();

    private Supplier supplier;
    private SupplierCRUD supplierCRUD = new SupplierCRUD();

    private SupplierSurvey survey;
    private SupplierSurveyCRUD surveyCRUD = new SupplierSurveyCRUD();
    
    protected void Page_Load(object sender, EventArgs e)
    {
        Control btnHome = Master.FindControl("btnHome");
        btnHome.Visible = false;

        if (Session["token"] == null)
        {
            string sToken = Request["token"];
            if (sToken != "" && sToken != null)
            {
                token = tokenCRUD.readByToken(sToken);
                if (token != null)
                {
                    Session["token"] = token;
                    if (retrieveEntity())
                    {
                        Navigator.goToPage("~/Vendor/Survey.aspx", "supplier");
                    }
                }
            }
        }
        else
        {
            if (Session["SECTION"] != null)
            {
                if (Session["supplierObject"] != null)
                {
                    supplier = (Supplier)((SessionObject)Session["supplierObject"]).Content;                    
                    switch (((SessionObject)Session["SECTION"]).Content.ToString())
                    {
                        case "supplier":
                            multiView.SetActiveView(viewSupplier);
                            uscSupplierForm.load();
                            return;
                        case "survey":
                            multiView.SetActiveView(viewSurvey);
                            uscSurveyForm.load();
                            return;
                        case "finalize":
                            Session.Remove("SECTION");
                            Session.Remove("supplierObject");
                            Session.Remove("token");
                            token = null;
                            supplier = null;
                            multiView.SetActiveView(viewThankYou);
                            return;
                        default:
                            break;
                    }
                }
            }
        }
        exitByError();
    }
    private bool retrieveEntity(){
        token = (Token)Session["token"];
        survey = surveyCRUD.readById(token.SubjectKey);
        if (survey != null)
        {
            supplier = supplierCRUD.readById(survey.SupplierMasterKey);
            if (supplier != null)
            {
                SessionObject soSupplier = new SessionObject();
                supplier.SupplierSurvey = survey;
                soSupplier.Content = supplier;
                soSupplier.Status = "forUpdate";
                Session["supplierObject"] = soSupplier;
                
                return true;
            }
        }
        return false;
    }
    private void exitByError()
    {
        Session.Remove("SECTION");
        Session.Remove("supplierObject");
        Session.Remove("token");
        token = null;
        supplier = null;
        Navigator.goToPage("~/Error.aspx", "");
    }
    protected void btnToSupplierForm_Click(object sender, EventArgs e)
    {
        ((SessionObject)Session["supplierObject"]).Status = "forUpdate";
        Navigator.goToPage("~/Vendor/Survey.aspx", "supplier");
    }
    protected void btnToSurvey_Click(object sender, EventArgs e)
    {
        ((SessionObject)Session["supplierObject"]).Status = "forUpdate";
        Navigator.goToPage("~/Vendor/Survey.aspx", "survey");
    }
    protected void btnFinalize_Click(object sender, EventArgs e)
    {        
        Navigator.goToPage("~/Vendor/Survey.aspx", "finalize");
    }
    protected void on_save_supplier(object sender, EventArgs e)
    {
        if (retrieveEntity())
        {
            Navigator.goToPage("~/Vendor/Survey.aspx", "survey");
        }
        else
        {
            exitByError();
        }
    }
    protected void on_cancel_supplier(object sender, EventArgs e)
    {
        if (retrieveEntity())
        {
            Navigator.goToPage("~/Vendor/Survey.aspx", "supplier");
        }
        else
        {
            exitByError();
        }
    }
    protected void on_save_survey(object sender, EventArgs e)
    {

        if (retrieveEntity())
        {
            Navigator.goToPage("~/Vendor/Survey.aspx", "survey");
        }
        else
        {
            exitByError();
        }        
    }
    protected void on_cancel_survey(object sender, EventArgs e)
    {
        if (retrieveEntity())
        {
            Navigator.goToPage("~/Vendor/Survey.aspx", "survey");
        }
        else
        {
            exitByError();
        } 
    }
}