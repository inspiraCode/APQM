using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;

public partial class rfqListInsideBOM : System.Web.UI.UserControl
{

    protected void Page_Load(object sender, EventArgs e)
    {
    }
    public void filterByBOMDetailKey(long bomID)
    {
        ConnectionManager connection = new ConnectionManager();
        SqlDataSource.ConnectionString = connection.getConnection().ConnectionString;
        SqlDataSource.SelectCommand = "SELECT * FROM [viewRFQHeader_ReadAll] WHERE BOMDetailKey = " + bomID;
        gridRFQList.DataBind();
    }
    public void on_sqldatasource_Init(Object sender, EventArgs e)
    {
        ConnectionManager connection = new ConnectionManager();
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
                    if (!rfqCRUD.setActiveByID(rfqHeaderKey, 0))
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

    public GridView getGridView()
    {
        return gridRFQList;
    }
}