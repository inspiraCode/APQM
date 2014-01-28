﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class BOM_BOM_Form : System.Web.UI.Page
{
    private long bomHeaderKey = -1;
    private BOM bom;
    private bomCRUD bom_CRUD = new bomCRUD();
    private bomDetailCRUD bomDetail_CRUD = new bomDetailCRUD();

    protected void Page_Load(object sender, EventArgs e)
    {
        Control btnHome = Master.FindControl("btnHome");
        btnHome.Visible = false;

        if (ViewState["bomHeaderkey"] == null)
        {
            load();
        }
    }
    public void load()
    {
        if (retrieveEntity())
        {
            ViewState["bomHeaderkey"] = bomHeaderKey;
            uscBOMForm.load();
        }
        else
        {
            exitByError("Could not retrieve entity.");
        }
    }
    private bool retrieveEntity()
    {
        string sBOM_ID = Request["bom"]; //From Address Box
        if (sBOM_ID != "" && sBOM_ID != null)
        {
            bomHeaderKey = long.Parse(sBOM_ID);
        }
        else
        {
            bomHeaderKey = -1;
        }
        bom = bom_CRUD.readById(bomHeaderKey);
        if (bom != null)
        {
            List<BOMDetail> bomDetailList = bomDetail_CRUD.readByParentID(bom.Id);
            bom.BomDetail = bomDetailList;

            SessionObject soBOM = new SessionObject();
            soBOM.Content = bom;
            soBOM.Status = "forUpdate";
            Session["bomObject"] = soBOM;
            return true;
        }
        return false;
    }
    private void exitByError(string strError)
    {
        Session.Remove("bomObject");
        Navigator.goToPage("~/Error.aspx", "ERROR:" + strError);
    }
    protected void on_after_BOM_save(object sender, EventArgs e)
    {
        load();
    }
    protected void on_after_BOM_cancel(object sender, EventArgs e)
    {
        load();
    }
}