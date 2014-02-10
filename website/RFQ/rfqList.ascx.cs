using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Web.Services;

public partial class rfqList : System.Web.UI.UserControl
{

    protected void Page_Load(object sender, EventArgs e)
    {
    }

    public void setUserFilterWithCookie()
    {
        if (!IsPostBack)
        {
            if (cboFilterByUser.DataSource == null)
                cboFilterByUser.DataBind();
            HttpCookie sifCookie = Request.Cookies["RFQList_User_Filter"];
            if (sifCookie != null)
                cboFilterByUser.Text = sifCookie.Value;
            load();
        }
    }
    public void load()
    {
        if (cboFilterByUser.SelectedValue == "All")
        {
            SqlDataSource.SelectCommand = "SELECT * FROM [viewRFQHeader_ReadAll] ORDER BY RFQHeaderKey ASC";
            cboFilterByUser.Text = "All";
        }
        else
        {
            SqlDataSource.SelectCommand = "SELECT * FROM [viewRFQHeader_ReadAll] WHERE CreatedBy = '" + cboFilterByUser.SelectedValue + "' ORDER BY RFQHeaderKey ASC";
        }

        gridRFQList.DataBind();
    }
    public void filterByBOMDetailKey(long bomID)
    {
        ConnectionManager connection = new ConnectionManager();
        SqlDataSourceUsers.ConnectionString = connection.getConnection().ConnectionString;
        SqlDataSource.ConnectionString = connection.getConnection().ConnectionString;
        SqlDataSource.SelectCommand = "SELECT * FROM [viewRFQHeader_ReadAll] WHERE BOMDetailKey = " + bomID + " ORDER BY RFQHeaderKey ASC";
        cboFilterByUser.Text = "All";
        divFilterByUser.Visible = false;

        gridRFQList.DataBind();
    }
    protected void cboFilterByUser_SelectedIndexChanged(object sender, EventArgs e)
    {
        HttpCookie sifCookie = new HttpCookie("RFQList_User_Filter");
        sifCookie.Value = cboFilterByUser.SelectedValue;
        sifCookie.Expires = DateTime.Now.AddYears(1);
        Response.Cookies.Add(sifCookie);
        load();
    }
    public void on_sqldatasource_Init(Object sender, EventArgs e)
    {
        ConnectionManager connection = new ConnectionManager();
        SqlDataSourceUsers.ConnectionString = connection.getConnection().ConnectionString;
        SqlDataSource.ConnectionString = connection.getConnection().ConnectionString;
    }
    public static void MakeAccessible(GridView grid)
    {
        if (grid.Rows.Count <= 0) return;
        grid.UseAccessibleHeader = true;
        grid.HeaderRow.TableSection = TableRowSection.TableHeader;
        if (grid.ShowFooter)
            grid.FooterRow.TableSection = TableRowSection.TableFooter;
    }
    protected void preRenderGridView(Object sender, EventArgs e)
    {
        base.OnPreRender(e);
        MakeAccessible(gridRFQList);
    }
    protected void gridRFQList_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            DataKey keys = gridRFQList.DataKeys[e.Row.RowIndex];
            long rfqHeaderKey = long.Parse(keys.Value.ToString());


            DataBoundLiteralControl hrefStatus = (DataBoundLiteralControl)e.Row.Cells[4].Controls[0];
            if (hrefStatus.Text.IndexOf("AWARDED") > -1)
            {
                e.Row.Cells[5].Controls[1].Visible = false;
            }

            DateTime dateSentToVendor = DateTime.Parse(e.Row.Cells[7].Text);


            if (dateSentToVendor.Year == 1985 &&
                dateSentToVendor.Month == 2 &&
                dateSentToVendor.Day == 10)
            {
                e.Row.Cells[7].Text = "Not sent, just created.";
            }
            
            LinkButton linkDeleteByID = (LinkButton)e.Row.FindControl("linkDeleteByID");
            linkDeleteByID.OnClientClick = "javascript:return deleteRFQByID(" + rfqHeaderKey + ");";


            LinkButton linkSetAwardByID = (LinkButton)e.Row.FindControl("linkSetAward");
            linkSetAwardByID.OnClientClick = "javascript:return setAwardByRFQ_ID(" + rfqHeaderKey + ");";

            LinkButton linkResendRFQ = (LinkButton)e.Row.FindControl("resendRFQByID");
            linkResendRFQ.OnClientClick = "javascript:return resendRFQbyID(" + rfqHeaderKey + ");";

        }
    }
    protected void gridView_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        int index;
        long rfqHeaderKey;
        switch (e.CommandName)
        {
            case "deleteRFQ":
                try
                {
                    index = ((GridViewRow)((Control)e.CommandSource).NamingContainer).RowIndex;
                    rfqHeaderKey = long.Parse(((GridView)sender).DataKeys[index].Value.ToString());

                    RfqCRUD rfqCRUD = new RfqCRUD();
                    if (!rfqCRUD.deleteByID(rfqHeaderKey))
                    {
                        Navigator.goToPage("~/Error.aspx", "ERROR:" + rfqCRUD.ErrorMessage);
                        return;
                    }
                    gridRFQList.DataBind();

                }
                catch (Exception ex)
                {
                    Navigator.goToPage("~/Error.aspx", "ERROR:" + ex.Message);
                }
                break;
            case "setAwarded":
                try
                {
                    index = ((GridViewRow)((Control)e.CommandSource).NamingContainer).RowIndex;
                    rfqHeaderKey = long.Parse(((GridView)sender).DataKeys[index].Value.ToString());

                    RfqCRUD rfqCRUD = new RfqCRUD();
                    RFQ rfq = rfqCRUD.readById(rfqHeaderKey);

                    bomDetailCRUD bomDetailCRUD = new bomDetailCRUD();
                    BOMDetail bomDetail = bomDetailCRUD.readById(rfq.BomDetailId);

                    if (rfq != null)
                    {
                        ConnectionManager CM = new ConnectionManager();
                        Data_Base_MNG.SQL DM = CM.getDataManager();

                        /*Begin Transaction*/
                        DM.Open_Connection("RFQ Save");

                        List<RFQ> rfqList = rfqCRUD.readByBOMDetailKey(rfq.BomDetailId);
                        if (rfqList.Count > 0)
                        {
                            foreach (RFQ rfqLocal in rfqList)
                            {
                                if (rfqLocal.Id != rfq.Id)
                                {
                                    rfqLocal.Status = "DISMISSED";
                                    if (rfqLocal.NoQuote == true)
                                        rfqLocal.Status = "NO QUOTE";
                                    if (!rfqCRUD.update(rfqLocal))
                                    {
                                        Navigator.goToPage("~/Error.aspx", "ERROR:" + rfqCRUD.ErrorMessage);
                                        return;
                                    }
                                }
                            }
                        }

                        rfq.Status = "AWARDED";
                        if (!rfqCRUD.update(rfq))
                        {
                            Navigator.goToPage("~/Error.aspx", "ERROR:" + rfqCRUD.ErrorMessage);
                        }
                        else
                        {

                            if (bomDetail != null)
                            {
                                bomDetail.Status = "Processed";
                                if (!bomDetailCRUD.update(bomDetail))
                                {
                                    Navigator.goToPage("~/Error.aspx", "ERROR:" + bomDetailCRUD.ErrorMessage);
                                    return;
                                }
                            }
                            else
                            {
                                Navigator.goToPage("~/Error.aspx", "ERROR:There was an error when retrieving a BOM Detail for rfq.BomDetailId = " + rfq.BomDetailId);
                                return;
                            }
                        }

                        DM.CommitTransaction();
                        DM.Close_Open_Connection();

                        if (DM.ErrorOccur)
                        {
                            Navigator.goToPage("~/Error.aspx", "ERROR:" + DM.Error_Mjs);
                            return;
                        }

                        gridRFQList.DataBind();
                    }
                    else
                    {
                        Navigator.goToPage("~/Error.aspx", "ERROR:Could not retrieve RFQ with rfqHeaderKey = " + rfqHeaderKey);
                    }
                }
                catch (Exception ex)
                {
                    Navigator.goToPage("~/Error.aspx", "ERROR:" + ex.Message);
                }
                break;

            case "resendRFQ":
                try
                {
                    index = ((GridViewRow)((Control)e.CommandSource).NamingContainer).RowIndex;
                    rfqHeaderKey = long.Parse(((GridView)sender).DataKeys[index].Value.ToString());

                    uscResendRFQ.setEntity(rfqHeaderKey);
                    panelPopup.Visible = true;
                }
                catch (Exception ex)
                {
                    Navigator.goToPage("~/Error.aspx", "ERROR:" + ex.Message);
                }
                break;
        }
    }
    protected void on_resendRFQ(object sender, EventArgs e)
    {
        gridRFQList.DataBind();
        panelPopup.Visible = false;
        uscNotifier.showSuccess("RFQ was sent to Vendor's email successfully!");
    }
    protected void on_cancel_resendRFQ(object sender, EventArgs e)
    {
        panelPopup.Visible = false;
    }

    public GridView getGridView(){
        return gridRFQList;
    }

    protected void btnAfterDeleteRFQ_Click(object sender, EventArgs e)
    {
        load();
        uscNotifier.showSuccess("RFQ deleted successfully.");
    }
    protected void btnResendRFQ_Click(object sender, EventArgs e)
    {
        try
        {
            long rfqHeaderKey = long.Parse(HiddenFieldResendRFQ.Value);

            uscResendRFQ.setEntity(rfqHeaderKey);
            panelPopup.Visible = true;
        }
        catch (Exception ex)
        {
            Navigator.goToPage("~/Error.aspx", "ERROR:" + ex.Message);
        }
    }
    protected void btnAfterAward_Click(object sender, EventArgs e)
    {
        load();
        uscNotifier.showSuccess("RFQ set Awarded successfully.");
    }
}