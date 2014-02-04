﻿<%@ Control Language="C#" AutoEventWireup="true" CodeFile="rfqList.ascx.cs" Inherits="rfqList" ClassName="RFQList" %>
<%@ Register Src="../Utils/Notifier/notifier.ascx" TagName="notifier" TagPrefix="uc1" %>
<%@ Register Src="resendRFQ.ascx" TagName="resendRFQ" TagPrefix="uc2" %>
<br />
<div id="divFilterByUser" runat="server">
<table cellspacing="0" align="left">
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
</div>

<asp:SqlDataSource ID="SqlDataSourceUsers" runat="server" OnInit="on_sqldatasource_Init"
    ProviderName="System.Data.SqlClient" SelectCommand="SELECT 'All' AS CreatedBy, 0 AS orderNumber UNION SELECT DISTINCT CreatedBy, 2 AS orderNumber FROM [viewRFQHeader_ReadAll] ORDER BY orderNumber">
</asp:SqlDataSource>
<div align="center">
    <asp:GridView ID="gridRFQList" convertToDataTable="true" runat="server" AutoGenerateColumns="False" class="display dataTable"
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
            <asp:TemplateField HeaderText="Status" SortExpression="Status" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <a target="_blank" clickeableInHeader="true" href='<%# ResolveUrl("~/RFQ/rfqFormMain.aspx") + "?rfq=" + Eval("RFQHeaderKey")%>'>
                        <%# Eval("Status")%></a>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField ShowHeader="False" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" clickeableInHeader="true" runat="server" CausesValidation="false" OnClientClick="javascript:return confirm('Are you sure you want to set its status to Award?');"
                        CommandName="setAwarded" Text="Set Awarded"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField ShowHeader="False" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <asp:LinkButton ID="resendRFQByID" clickeableInHeader="true" runat="server" CausesValidation="false" CommandName="resendRFQ" Text="Re-send">
                    </asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="SentToVendor" HeaderText="Last Sent To Vendor" SortExpression="SentToVendor"
                ItemStyle-HorizontalAlign="Center" DataFormatString="{0:g}" />
            <asp:BoundField DataField="DueDate" HeaderText="Due Date" SortExpression="DueDate"
                ItemStyle-HorizontalAlign="Center" DataFormatString="{0:d}" />
            <asp:TemplateField ShowHeader="False" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <asp:LinkButton ID="deleteByID" clickeableInHeader="true" runat="server" CausesValidation="false" OnClientClick="javascript:return confirm('Are you sure?\nEvery information related to this RFQ will be deleted as well.');"
                        CommandName="deleteRFQ" Text="Delete">
                    </asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource" runat="server" OnInit="on_sqldatasource_Init"
        SelectCommand="SELECT * FROM [viewRFQHeader_ReadAll]"></asp:SqlDataSource>
</div>
<br />

<uc1:notifier ID="uscNotifier" runat="server" />
<asp:Panel ID="panelPopup" runat="server" Visible="false">
    <uc2:resendRFQ ID="uscResendRFQ" runat="server" OnOk_Click="on_resendRFQ" OnCancel_Click="on_cancel_resendRFQ" />
    <script type="text/javascript">
        document.getElementById("<%= this.panelPopup.ClientID %>").setAttribute("title", "Re-send RFQ");
        jQuery("#<%= this.panelPopup.ClientID %>").dialog({ autoOpen: true,
            appendTo: jQuery('form:first'),
            width: 440, modal: true,
            dialogClass: "no-close", closeOnEscape: false
        });
    </script>
</asp:Panel>