using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SIF_SIF_Form : System.Web.UI.Page
{

    private long sifHeaderKey = -1;
    private SIF sif;
    private sifCRUD sif_CRUD = new sifCRUD();
    private sifDetailCRUD sifDetail_CRUD = new sifDetailCRUD();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (ViewState["sifHeaderKey"] == null)
        {
            load();
        }
    }
    public void load()
    {
        if (retrieveEntity())
        {
            ViewState["sifHeaderKey"] = sifHeaderKey;
            uscSIFMaster.load();
        }
        else
        {
            exitByError("Could not retrieve entity.");
        }
    }
    private bool retrieveEntity()
    {
        string sSIF_ID = Request["sif"]; //From Address Box
        if (sSIF_ID != "" && sSIF_ID != null)
        {
            sifHeaderKey = long.Parse(sSIF_ID);
        }
        else
        {
            sifHeaderKey = -1;
        }
        sif = sif_CRUD.readById(sifHeaderKey);
        if (sif != null)
        {
            List<SIFDetail> bomDetailList = sifDetail_CRUD.readByParentID(sif.Id);
            sif.SifDetail = bomDetailList;

            SessionObject soSIF = new SessionObject();
            soSIF.Content = sif;
            soSIF.Status = "forUpdate";
            Session["sifObject"] = soSIF;
            return true;
        }
        return false;
    }
    private void exitByError(string strError)
    {
        Session.Remove("sifObject");
        Navigator.goToPage("~/Error.aspx", "ERROR:" + strError);
    }
    protected void on_after_SIF_save(object sender, EventArgs e)
    {
        load();
    }
    protected void on_after_SIF_cancel(object sender, EventArgs e)
    {
        load();
    }
}