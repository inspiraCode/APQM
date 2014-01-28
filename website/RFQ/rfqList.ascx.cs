using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;

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
            SqlDataSource.SelectCommand = "SELECT * FROM [viewRFQHeader_ReadAll]";
            cboFilterByUser.Text = "All";
        }
        else
        {
            SqlDataSource.SelectCommand = "SELECT * FROM [viewRFQHeader_ReadAll] WHERE CreatedBy = '" + cboFilterByUser.SelectedValue + "'";
        }

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
            DataBoundLiteralControl hrefStatus = (DataBoundLiteralControl)e.Row.Cells[5].Controls[0];
            if (hrefStatus.Text.IndexOf("AWARDED") > -1)
            {
                e.Row.Cells[6].Controls[1].Visible = false;
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
                    RfqSummaryCRUD rfqSummaryCRUD = new RfqSummaryCRUD();

                    ConnectionManager CM = new ConnectionManager();
                    Data_Base_MNG.SQL DM = CM.getDataManager();

                    /*Begin Transaction*/
                    DM.Open_Connection("RFQ Delete");

                    TokenCRUD token_CRUD = new TokenCRUD();
                    if (!token_CRUD.deleteByRFQID(rfqHeaderKey, ref DM))
                    {
                        Navigator.goToPage("~/Error.aspx", "ERROR:" + token_CRUD.ErrorMessage);
                        return;
                    }
                    if (!rfqSummaryCRUD.deleteByParentID(rfqHeaderKey, ref DM))
                    {
                        Navigator.goToPage("~/Error.aspx", "ERROR:" + rfqSummaryCRUD.ErrorMessage);
                        return;
                    }
                    if (!rfqCRUD.delete(rfqHeaderKey, ref DM))
                    {
                        Navigator.goToPage("~/Error.aspx", "ERROR:" + rfqCRUD.ErrorMessage);
                        return;
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
                    Navigator.goToPage("~/Error.aspx", "ERROR:" + ex.Message);
                }
                break;

            case "resendRFQ":
                try
                {
                    index = ((GridViewRow)((Control)e.CommandSource).NamingContainer).RowIndex;
                    rfqHeaderKey = long.Parse(((GridView)sender).DataKeys[index].Value.ToString());

                    RfqCRUD rfqCRUD = new RfqCRUD();

                    SupplierCRUD supplier_CRUD = new SupplierCRUD();

                    RFQ rfqToResend = rfqCRUD.readById(rfqHeaderKey);
                    if (rfqToResend == null)
                    {
                        Navigator.goToPage("~/Error.aspx", "ERROR:Could not retrieve RFQ. Please try again.");
                        return;
                    }

                    Supplier supplier = supplier_CRUD.readById(rfqToResend.SupplierId);
                    if (supplier == null)
                    {
                        Navigator.goToPage("~/Error.aspx", "ERROR:Could not retrieve Supplier. Please try again.");
                        return;
                    }

                    TokenCRUD token_CRUD = new TokenCRUD();
                    Token token = token_CRUD.readByRFQ(rfqToResend);

                    ConnectionManager CM = new ConnectionManager();
                    Data_Base_MNG.SQL DM = CM.getDataManager();

                    /*Begin Transaction*/
                    DM.Open_Connection("RFQ Re-send");

                    if (token == null)
                    {
                        token = new Token();
                        token.Subject = "RFQ";
                        token.SubjectKey = rfqHeaderKey;
                        token.TokenNumber = MD5HashGenerator.GenerateKey(DateTime.Now);
                        token_CRUD.create(token, ref DM);
                        if (token_CRUD.ErrorOccur)
                        {
                            Navigator.goToPage("~/Error.aspx", "ERROR:" + token_CRUD.ErrorMessage);
                            return;
                        }
                    }


                    Email NewMail = new Email();
                    MailMessage Message = new MailMessage();

                    Message.From = new MailAddress("capsonic.apps@gmail.com", "capsonic.apps@gmail.com");
                    Message.To.Add(new MailAddress(supplier.ContactEmail.ToString()));
                    Message.Subject = "Request For Quote";
                    Message.IsBodyHtml = true;
                    Message.BodyEncoding = System.Text.Encoding.UTF8;

                    string strEmailContent = "Dear Supplier," + Environment.NewLine
                                                + "We are seeking quotations to match the part/process description shown on our RFQ form.  Please click the following link to be directed to the RFQ page.  Drawings and special instructions will be included there also."
                                                + " Please fill out the RFQ form as completely as possible. You may attach documents to the RFQ, but the RFQ form must be completed."
                                                + Environment.NewLine + Environment.NewLine
                                                + "There is an instruction module available to walk you through the form should you need assistance.  If you have any questions regarding the RFQ, please contact the Capsonic Advanced Purchasing Buyer shown on the RFQ form."
                                                + Environment.NewLine + Environment.NewLine
                                                + "http://" + Request.Url.Authority + Request.ApplicationPath + "/Vendor/RFQHandler.ashx?token=" + token.TokenNumber
                                                + Environment.NewLine + Environment.NewLine
                                                + "Please mark this e-mail as coming from a trusted source to avoid issues with future correspondence reaching your inbox."
                                                + Environment.NewLine + Environment.NewLine
                                                + "Sincerely," + Environment.NewLine + Environment.NewLine + "The Capsonic Advanced Purchasing Team";


                    AlternateView htmlView = AlternateView.CreateAlternateViewFromString(strEmailContent);
                    Message.AlternateViews.Add(htmlView);


                    //NDA Attachment not used anymore
                    //string path = HttpRuntime.AppDomainAppPath.ToString() + @"\Docs\NDA.pdf";
                    //Attachment x = new Attachment(path);
                    //Message.Attachments.Add(x);
                    try
                    {
                        NewMail.SendMail(Message);
                    }
                    catch
                    {
                        DM.RollBack();
                        Navigator.goToPage("~/Error.aspx", "ERROR:Could not send email to: " + supplier.ContactEmail.ToString());
                        return;
                    }

                    DM.CommitTransaction();
                    DM.Close_Open_Connection();

                    if (DM.ErrorOccur)
                    {
                        Navigator.goToPage("~/Error.aspx", "ERROR:" + DM.Error_Mjs);
                        return;
                    }

                    gridRFQList.DataBind();
                    uscNotifier.showSuccess("RFQ was sent to Vendor's email successfully!");

                }
                catch (Exception ex)
                {
                    Navigator.goToPage("~/Error.aspx", "ERROR:" + ex.Message);
                }
                break;
        }
    }
}