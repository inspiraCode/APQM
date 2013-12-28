using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class rfqList : System.Web.UI.UserControl
{
    
    protected void Page_Load(object sender, EventArgs e)
    {
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
        }
    }
    protected void gridView_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        int index;
        long rfqHeaderKey;
        switch (e.CommandName)
        {
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
                                        rfqLocal.Status = "DECLINED";
                                    if (!rfqCRUD.update(rfqLocal))
                                    {
                                        Navigator.goToPage("~/Error.aspx", "");
                                        return;
                                    }
                                }
                            }
                        }

                        rfq.Status = "AWARDED";
                        if (!rfqCRUD.update(rfq))
                        {
                            Navigator.goToPage("~/Error.aspx", "");
                        }
                        else
                        {
                            
                            if (bomDetail != null)
                            {
                                bomDetail.Status = "Processed";
                                if (!bomDetailCRUD.update(bomDetail))
                                {
                                    Navigator.goToPage("~/Error.aspx", "");
                                    return;
                                }
                            }
                            else
                            {
                                Navigator.goToPage("~/Error.aspx", "");
                                return;
                            }
                        }

                        DM.CommitTransaction();
                        DM.Close_Open_Connection();

                        if (DM.ErrorOccur)
                        {
                            Navigator.goToPage("~/Error.aspx", "");
                            return;
                        }

                        gridRFQList.DataBind();
                    }
                    else
                    {
                        Navigator.goToPage("~/Error.aspx", "");
                    }

                    //int iRfqCount = int.Parse(e.CommandArgument.ToString());
                    //if (iRfqCount > 0)
                    //{
                    //    openpopupContainer();
                    //    multiViewPopup.SetActiveView(viewRFQListByBom);
                    //    uscRfqListByBom.setBomID(bomDetailId);
                    //}
                }
                catch (Exception ex)
                {
                    Navigator.goToPage("~/Error.aspx", "");
                }
                break;
        }     
    }
}