﻿using System;
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
    private bomDetailVolumeCRUD bomDetailVolumeCRUD = new bomDetailVolumeCRUD();
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
        lblProduct.Text = bom.PartDescription;
        lblRevision.Text = bom.Revision;
        lblInquiryNumber.Text = bom.InquiryNumber;
        lblMarketSector.Text = bom.MarketSector.ToString();
        txtAnnualVolume.Text = bom.AnnualVolume.ToString();
        lblCustomer.Text = bom.CustomerName;
        lblSalesRep.Text = bom.SalesPerson;

        foreach(BOMDetail detail in bom.BomDetail){
            string strVolume = "";
            detail.VolumeList = bomDetailVolumeCRUD.readByParentID(detail.Id);
            if (detail.VolumeList.Count > 0)
            {
                
                foreach (BOMDetailVolume objVolume in detail.VolumeList)
                {
                    strVolume += objVolume.Volume + ", ";
                }
                strVolume = strVolume.Substring(0, strVolume.Length - 2);
            }
            detail.EAU = strVolume;
        }

        uscBOMDetailList.reset();
        uscBOMDetailList.setEntity(bom.BomDetail);
        uscBOMDetailList.load();
        hiddenProgressBar.Value = uscBOMDetailList.getProgress().ToString();
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        BOM bom = new BOM();
        bom.SifId = long.Parse(lblSifID.Text);
        bom.TopPartNumber = txtPartNumber.Text;
        bom.PartDescription = lblProduct.Text;
        bom.Revision = lblRevision.Text;
        bom.AnnualVolume = int.Parse(txtAnnualVolume.Text);
        bom.MarketSector = lblMarketSector.Text;

        ConnectionManager CM = new ConnectionManager();
        Data_Base_MNG.SQL DM = CM.getDataManager();

        /*Begin Transaction*/
        DM.Open_Connection("BOM Save");

        if (lblMode.Text == "New")
        {
            string idGenerated = bomCRUD.createAndReturnIdGenerated(bom, ref DM);
            if (!bomCRUD.ErrorOccur)
            {
                this.bom.Id = long.Parse(idGenerated);
            }
            else
            {
                Navigator.goToPage("~/Error.aspx", "ERROR:" + bomCRUD.ErrorMessage);
                return;
            }
        }
        else if (lblMode.Text == "Update")
        {
            bom.Id = this.bom.Id;
            if (!bomCRUD.update(bom, ref DM))
            {
                Navigator.goToPage("~/Error.aspx", "ERROR:" + bomCRUD.ErrorMessage);
                return;
            }
        }
        List<BOMDetail> bomDetailListToDelete = uscBOMDetailList.getBomDetailToDelete();
        foreach (BOMDetail detail in bomDetailListToDelete)
        {
            if (!bomDetailVolumeCRUD.deleteByParentID(detail.Id, ref DM))
            {
                Navigator.goToPage("~/Error.aspx", "ERROR:" + bomDetailVolumeCRUD.ErrorMessage);
                return;
            }
            if (!bomDetailCRUD.delete(detail.Id, ref DM))
            {
                Navigator.goToPage("~/Error.aspx", "ERROR:" + bomDetailCRUD.ErrorMessage);
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
                    Navigator.goToPage("~/Error.aspx", "ERROR:" + item_CRUD.ErrorMessage);
                    return;
                }
            }
            if (detail.internalAction == "CREATE")
            {
                detail.BomHeaderKey = this.bom.Id;
                detail.Status = "Created";
                string bomDetailIDGenerated = bomDetailCRUD.createAndReturnIdGenerated(detail, ref DM);
                if (bomDetailCRUD.ErrorOccur)
                {
                    Navigator.goToPage("~/Error.aspx", "ERROR:" + bomDetailCRUD.ErrorMessage);
                    return;
                }
                else
                {
                    detail.Id = long.Parse(bomDetailIDGenerated);
                }
            }
            
            if (detail.internalAction == "UPDATE")
            {
                detail.BomHeaderKey = this.bom.Id;
                if (!bomDetailCRUD.update(detail, ref DM))
                {
                    Navigator.goToPage("~/Error.aspx", "ERROR:" + bomDetailCRUD.ErrorMessage);
                    return;
                }
            }

            if (detail.internalAction != "")
            {
                if (!bomDetailVolumeCRUD.deleteByParentID(detail.Id, ref DM))
                {
                    Navigator.goToPage("~/Error.aspx", "ERROR:" + bomDetailVolumeCRUD.ErrorMessage);
                    return;
                }

                string[] arrEAU = detail.EAU.Split(',');
                for (var i = 0; i < arrEAU.Length; i++)
                {
                    if (arrEAU[i].Trim() != "")
                    {
                        BOMDetailVolume bomDetailVolume = new BOMDetailVolume();
                        bomDetailVolume.BomDetailKey = detail.Id;
                        try
                        {
                            bomDetailVolume.Volume = long.Parse(arrEAU[i].Trim());
                        }
                        catch {
                            DM.RollBack();
                            Navigator.goToPage("~/Error.aspx", "ERROR:" + "The Volume field did not pass the Numeric validation.");
                            return;
                        }
                        if (!bomDetailVolumeCRUD.create(bomDetailVolume, ref DM))
                        {
                            Navigator.goToPage("~/Error.aspx", "ERROR:" + bomDetailVolumeCRUD.ErrorMessage);
                            return;
                        }
                    }
                }
            }
        }

        DM.CommitTransaction();
        DM.Close_Open_Connection();
        
        if (DM.ErrorOccur)
        {
            Navigator.goToPage("~/Error.aspx", "ERROR:" + DM.Error_Mjs);
            return;
        }
        
        Session.Remove("bom");
        Ok_Click(this, e);
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Session.Remove("bom");
        Session.Remove("bomObject");
        Cancel_Click(this, e);
    }
    protected void btnOpenSIFDetail_Click(object sender, EventArgs e)
    {
        panelPopup.Visible = true;
        sifDetailCRUD sifDetail_CRUD = new sifDetailCRUD();
        List<SIFDetail> sifDetailList = sifDetail_CRUD.readByParentID(long.Parse(lblSifID.Text));
        uscSifDetail.setEntity(sifDetailList);
    }
    protected void btnClosePopup_Click(object sender, EventArgs e)
    {
        panelPopup.Visible = false; 
    }
    protected void btnApplyAnnualVolume_Click(object sender, EventArgs e)
    {
        List<BOMDetail> bomDetailList = uscBOMDetailList.getEntity();
        foreach (BOMDetail detail in bomDetailList)
        {
            detail.EAU = Math.Round(detail.Qty * float.Parse(txtAnnualVolume.Text),0).ToString();
            if (detail.internalAction == "")
                detail.internalAction = "UPDATE";
        }
        Session["bomDetailObject"] = bomDetailList;
        uscBOMDetailList.loadDetail();
    }
}