﻿<%@ Control Language="C#" AutoEventWireup="true" CodeFile="sifList.ascx.cs" Inherits="sifList" %>
<br />
<table cellspacing="0">
    <tr>
        <td align="right">
            Filter Assigned To:
        </td>
        <td>
            <asp:DropDownList ID="cboFilterByUser" runat="server" Width="180px" AutoPostBack="True"
                DataSourceID="SqlDataSourceUsers" DataTextField="AssignedTo" DataValueField="AssignedTo"
                OnSelectedIndexChanged="cboFilterByUser_SelectedIndexChanged">
            </asp:DropDownList>
        </td>
    </tr>
</table>
<br />
<br />
<div align="center">
    <asp:Repeater ID="Repeater1" runat="server" OnItemDataBound="R1_ItemDataBound">
        <HeaderTemplate>
            <table border="1" id="tableSIF" class="display" style="display:none;">
                <thead>
                    <tr>
                        <th>
                            Inquiry Number
                        </th>
                        <th>
                            BOM
                        </th>
                        <th>
                            Revision
                        </th>
                        <th>
                            Priority
                        </th>
                        <th>
                            Sales Person
                        </th>
                        <th>
                            Cost Model Location
                        </th>
                        <th>
                            Customer
                        </th>
                        <th>
                            Assigned To
                        </th>
                        <th>
                        </th>
                    </tr>
                </thead>
                <tbody>
        </HeaderTemplate>
        <ItemTemplate>
            <tr height='27px;'>
                <td>
                    <asp:LinkButton ID="updateByID" runat="server" CommandArgument="" CommandName="sifID"
                        OnCommand="updateByID"> <%# DataBinder.Eval(Container.DataItem, "InquiryNumber")%> </asp:LinkButton>
                </td>
                <td>
                    <asp:LinkButton ID="updateBOM" runat="server" CommandArgument="" CommandName="bomID"
                        OnCommand="updateByBomID"> None </asp:LinkButton>
                </td>
                <td>
                    <%# DataBinder.Eval(Container.DataItem, "Revision")%>
                </td>
                <td>
                    <%# DataBinder.Eval(Container.DataItem, "Priority")%>
                </td>
                <td>
                    <%# DataBinder.Eval(Container.DataItem, "SalesPerson")%>
                </td>
                <td>
                    <%# DataBinder.Eval(Container.DataItem, "CostModelLoc")%>
                </td>
                <td>
                    <%# DataBinder.Eval(Container.DataItem, "CustomerName")%>
                </td>
                <td>
                    <asp:LinkButton ID="linkAssignedTo" runat="server" CommandArgument="" OnCommand="takeSIF"
                        OnClientClick="return confirm('Do you really want to take this SIF?');"> Take </asp:LinkButton>
                </td>
                <td>
                    <asp:LinkButton ID="deleteByID" runat="server" CommandArgument="" CommandName="sifID"
                        OnCommand="deleteByID" OnClientClick="return  confirm('Do you wish to delete this SIF?')"> Delete </asp:LinkButton>
                </td>
            </tr>
        </ItemTemplate>
        <FooterTemplate>
            </tbody> </table>
        </FooterTemplate>
    </asp:Repeater>
</div>

<script type="text/javascript">
    var doChangeFilter;
    var listSIFs;
    jQuery(document).ready(function() {
        listSIFs = jQuery('#tableSIF').dataTable({ "bStateSave": true }).show();
        doChangeFilter = jQuery('#<%= cboFilterByUser.ClientID %>').attr("onchange");
        jQuery('#<%= cboFilterByUser.ClientID %>').attr("onchange", "onFilterUserChange()");
    });
    function onFilterUserChange() {
        listSIFs.parent().hide();
        listSIFs.fnFilter("");
        setTimeout(doChangeFilter, 0);
    }
</script>

<asp:SqlDataSource ID="SqlDataSourceUsers" runat="server" ConnectionString="Data Source=CAPSP;Initial Catalog=APQM_DB;Integrated Security=True"
    ProviderName="System.Data.SqlClient" SelectCommand="SELECT 'All' AS AssignedTo, 0 AS orderNumber UNION SELECT DISTINCT AssignedTo, 2 AS orderNumber FROM SIFHeader ORDER BY orderNumber">
</asp:SqlDataSource>