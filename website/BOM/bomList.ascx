<%@ Control Language="C#" AutoEventWireup="true" CodeFile="bomList.ascx.cs" Inherits="bomList" %>

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
<asp:SqlDataSource ID="SqlDataSourceUsers" runat="server" OnInit="on_sqldatasource_Init"
    ProviderName="System.Data.SqlClient" SelectCommand="SELECT 'All' AS AssignedTo, 0 AS orderNumber UNION SELECT DISTINCT AssignedTo, 2 AS orderNumber FROM viewBOMHeader_ReadAll ORDER BY orderNumber">
</asp:SqlDataSource>
<br />
<br />


<div align="center">
    <asp:Repeater ID="Repeater1" runat="server" OnItemDataBound="R1_ItemDataBound">
        <HeaderTemplate>
            <table border="1" id="tableBOM" class="display" style="display: none;">
                <thead>
                    <tr>
                        <th>
                            Finished Good PN
                        </th>
                        <th>
                            SIF
                        </th>
                        <th>
                            Revision
                        </th>
                        <th>
                            Part Description
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
                <td style="text-align:center;">
                    <asp:LinkButton ID="updateByID" runat="server" CommandArgument="" CommandName="bomID"
                        OnCommand="updateByID">                    
                    <%# DataBinder.Eval(Container.DataItem, "TopPartNumber")%>
                    </asp:LinkButton>
                </td>
                <td style="text-align:center;">
                    <asp:LinkButton ID="updateSIF" runat="server" CommandArgument="" CommandName="sifID"
                        OnCommand="updateBySIFID">                    
                        None
                    </asp:LinkButton>
                </td>
                <td style="text-align:center;">
                    <%# DataBinder.Eval(Container.DataItem, "Revision")%>
                </td>
                <td style="text-align:left;">
                    <%# DataBinder.Eval(Container.DataItem, "PartDescription")%>
                </td>
                <td style="text-align:center;">
                    <%# DataBinder.Eval(Container.DataItem, "AssignedTo")%>
                </td>
                <td style="text-align:center;">
                    <asp:LinkButton ID="deleteByID" runat="server" CommandArgument="" CommandName="bomID"
                        OnCommand="deleteByID" OnClientClick="return  confirm('Do you wish to delete this BOM?')">
                    Delete
                    </asp:LinkButton>
                </td>
            </tr>
        </ItemTemplate>
        <FooterTemplate>
            </tbody></table>
        </FooterTemplate>
    </asp:Repeater>
</div>

<script type="text/javascript">
    jQuery(document).ready(function() {
        jQuery('#tableBOM').dataTable({"bStateSave":true}).show();
    });
</script>

