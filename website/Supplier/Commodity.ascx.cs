using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CommodityControl : System.Web.UI.UserControl
{
    CommodityCRUD commodity_CRUD = new CommodityCRUD();
    private List<Commodity> commodityList = new List<Commodity>();
    private List<Commodity> allCommoditiesList;
    SupplierCommodityCRUD supplierCommodity_CRUD = new SupplierCommodityCRUD();

    protected void Page_Load(object sender, EventArgs e)
    {
        btnNewCommodity.OnClientClick = "return promptUser('New Commodity', 'c~', " + ((HiddenField)uscNotifier.FindControl("txtPrompt")).ClientID + ")";

        commodityList = (List<Commodity>)Session["CommodityList"];
        if (commodityList == null)
        {
            commodityList = new List<Commodity>();
            Session["CommodityList"] = commodityList;
        }
    }
    //protected void cboCommodities_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    if (cboCommodities.Items.Count > 0)
    //    {
    //        long id = long.Parse(cboCommodities.SelectedItem.Value);
    //        if (id > -1)
    //        {
    //            setEntity(commodity_CRUD.readById(id));
    //        }
    //    }
    //}
    //public void setEntity(Object entidad)
    //{
    //    Commodity commodity;
    //    if (entidad != null)
    //    {
    //        commodity = (Commodity)entidad;
    //    }
    //    else
    //    {
    //        commodity = new Commodity();
    //    }

    //    cboCommodities.Focus();
    //}
    //protected void cboCommodities_DataBound(object sender, EventArgs e)
    //{
    //    cboCommodities_SelectedIndexChanged(sender, e);
    //}
    public void setSupplierID(long id)
    {
        commodityList.Clear();
        List<Supplier_Commodity> supplierCommodityList = supplierCommodity_CRUD.readByParentID(id);
        
        foreach (Supplier_Commodity supplierCommLocal in supplierCommodityList)
        {
            Commodity commodity = getCommodityByID_InList(supplierCommLocal.CommodityKey);
            if (commodity != null)
            {
                commodityList.Add(commodity);
            }
        }
        Session["CommodityList"] = commodityList;
        bindCommodityList();

        ViewState["SupplierID"] = id;
        //lblBomDetailID.Text = id.ToString();
    }
    private Commodity getCommodityByID_InList(long commodityID)
    {
        if (allCommoditiesList == null)
        {
            allCommoditiesList = (List<Commodity>)commodity_CRUD.readAll();
        }
        
        foreach (Commodity commodityLocal in allCommoditiesList)
        {
            if (commodityLocal.Id == commodityID)
            {
                return commodityLocal;
            }
        }
        return null;
    }
    public List<Commodity> getEntity()
    {
        return (List<Commodity>) Session["CommodityList"];
    }
    public void on_sqldatasource_Init(Object sender, EventArgs e)
    {
        ConnectionManager connection = new ConnectionManager();
        SqlDataSource1.ConnectionString = connection.getConnection().ConnectionString;
    }
    protected void on_prompt(object sender, EventArgs e)
    {
        string value = ((HiddenField)sender).Value;

        if (value.Trim() != "")
        {
            string[] prompt = value.Split('~');
            if (prompt[1] != "null" && prompt[1].Trim() != "")
            {
                switch (prompt[0])
                {
                    case "c":
                        Commodity commodity = new Commodity();
                        commodity.CommidityName = prompt[1];

                        string idGenerated = commodity_CRUD.createAndReturnIdGenerated(commodity);
                        if (!commodity_CRUD.ErrorOccur)
                        {
                            cboCommodities.DataBind();//No need to databind: SqlDataSource1.DataBind();
                            cboCommodities.SelectedValue = idGenerated;

                            cboCommodities.Focus();
                        }
                        else
                        {
                            uscNotifier.showAlert("Commodity could not be saved. " + commodity_CRUD.ErrorMessage);
                        }
                        break;
                }
            }
            ((HiddenField)sender).Value = "";
        }
    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
            Commodity commodity = commodity_CRUD.readById(long.Parse(cboCommodities.SelectedValue));

            if (!commodityList.Any(item => item.Id == commodity.Id))
            {
                commodityList.Add(commodity);
            }

            bindCommodityList();
    }
    private void bindCommodityList()
    {
        lstItems.DataSource = commodityList;
        lstItems.DataTextField = "CommidityName";
        lstItems.DataBind();
    }
    protected void btnRemove_Click(object sender, EventArgs e)
    {
        try
        {
            if (lstItems.SelectedIndex > -1)
            {
                commodityList.RemoveAt(lstItems.SelectedIndex);
                bindCommodityList();
            }
        }
        catch
        {
        }
    }
}