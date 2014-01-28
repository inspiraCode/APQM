<%@ Control Language="C#" AutoEventWireup="true" CodeFile="rfqList.ascx.cs" Inherits="rfqList" %>
<%@ Register src="../Utils/Notifier/notifier.ascx" tagname="notifier" tagprefix="uc1" %>
<br />
<table cellspacing="0">
    <tr>
        <td align="right">
            Filter Created By:
        </td>
        <td>
            <asp:DropDownList ID="cboFilterByUser" runat="server" Width="180px" AutoPostBack="True"
                DataSourceID="SqlDataSourceUsers" DataTextField="CreatedBy" DataValueField="CreatedBy"
                OnSelectedIndexChanged="cboFilterByUser_SelectedIndexChanged">
            </asp:DropDownList>
        </td>
    </tr>
</table>
<br />
<br />
<asp:SqlDataSource ID="SqlDataSourceUsers" runat="server" OnInit="on_sqldatasource_Init"
    ProviderName="System.Data.SqlClient" SelectCommand="SELECT 'All' AS CreatedBy, 0 AS orderNumber UNION SELECT DISTINCT CreatedBy, 2 AS orderNumber FROM [viewRFQHeader_ReadAll] ORDER BY orderNumber">
</asp:SqlDataSource>
<div align="center">
    <asp:GridView ID="gridRFQList" runat="server" AutoGenerateColumns="False" class="display"
        Style="display: none;" DataSourceID="SqlDataSource" DataKeyNames="RFQHeaderKey"
        OnPreRender="preRenderGridView" RowStyle-Height="27px" OnRowCommand="gridView_RowCommand"
        OnRowDataBound="gridRFQList_RowDataBound">
        <RowStyle Height="27px"></RowStyle>
        <Columns>
            <asp:BoundField DataField="CreatedBy" HeaderText="Created By" SortExpression="CreatedBy"
                ItemStyle-HorizontalAlign="Center" />
            <asp:BoundField DataField="RfqGenerated" HeaderText="RFQ Number" SortExpression="RFQGenerated"
                ItemStyle-HorizontalAlign="Center" />
            <asp:BoundField DataField="PartNumber" HeaderText="Component Part Number" SortExpression="PartNumber"
                ItemStyle-HorizontalAlign="Center" />
            <asp:BoundField DataField="SupplierName" HeaderText="Vendor" SortExpression="SupplierName"
                ItemStyle-HorizontalAlign="Center" />
            <asp:BoundField DataField="DueDate" HeaderText="Due Date" SortExpression="DueDate"
                ItemStyle-HorizontalAlign="Center" DataFormatString="{0:d}" />
            <asp:TemplateField HeaderText="Status" SortExpression="Status" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <a target="_blank" href='<%# "rfqFormMain.aspx?rfq=" + Eval("RFQHeaderKey")%>'>
                        <%# Eval("Status")%></a>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField ShowHeader="False" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="false" OnClientClick="javascript:return confirm('Are you sure?');"
                        CommandName="setAwarded" Text="Set Awarded"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField ShowHeader="False" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <asp:LinkButton ID="resendRFQByID" runat="server" CausesValidation="false" OnClientClick="javascript:return confirm('Are you sure you want to re-send this RFQ to Vendor\'s email?');"
                        CommandName="resendRFQ" Text="Re-send">
                    </asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField ShowHeader="False" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <asp:LinkButton ID="deleteByID" runat="server" CausesValidation="false" OnClientClick="javascript:return confirm('Are you sure?\nEvery information related to this RFQ will be deleted as well.');"
                        CommandName="deleteRFQ" Text="Delete">
                    </asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource" runat="server" OnInit="on_sqldatasource_Init"
        SelectCommand="SELECT * FROM [viewRFQHeader_ReadAll]"></asp:SqlDataSource>
</div>

<script type="text/javascript">
    jQuery(document).ready(function() {
        jQuery('#<%= this.gridRFQList.ClientID %>').dataTable({ "bStateSave": true }).show();
    });
</script>
<uc1:notifier ID="uscNotifier" runat="server" />
