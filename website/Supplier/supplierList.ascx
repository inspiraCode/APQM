<%@ Control Language="C#" AutoEventWireup="true" CodeFile="supplierList.ascx.cs"
    Inherits="supplierList" %>
<%@ Register Src="../Utils/Notifier/notifier.ascx" TagName="notifier" TagPrefix="uc1" %>
<div align="center">
    <asp:Repeater ID="Repeater1" runat="server" OnItemDataBound="R1_ItemDataBound">
        <HeaderTemplate>
            <table border="1" id="tableSupplier" class="display" style="display: none;">
                <thead>
                    <th>
                        Supplier Name
                    </th>
                    <th>
                        Contact Name
                    </th>
                    <th>
                        Contact Phone
                    </th>
                    <th>
                        Contact Email
                    </th>
                    <th>
                    </th>
                    </tr>
                </thead>
                <tbody>
        </HeaderTemplate>
        <ItemTemplate>
            <tr height='27px;'>
                <td style="text-align: center;">
                    <a id="aLinkSupplier" runat="server" href='#'>
                        <%# DataBinder.Eval(Container.DataItem, "SupplierName")%></a>
                </td>
                <td style="text-align: center;">
                    <%# DataBinder.Eval(Container.DataItem, "ContactName")%>
                </td>
                <td style="text-align: center;">
                    <%# DataBinder.Eval(Container.DataItem, "ContactPhone")%>
                </td>
                <td style="text-align: center;">
                    <%# DataBinder.Eval(Container.DataItem, "ContactEmail")%>
                </td>
                <td style="text-align: center;">
                    <asp:LinkButton ID="deleteByID" runat="server" CommandArgument="" CommandName="SupplierID"
                        OnCommand="deleteByID" OnClientClick="return  confirm('Do you wish to delete this Supplier?')">
                    Delete
                    </asp:LinkButton>
                </td>
            </tr>
        </ItemTemplate>
        <FooterTemplate>
            </tbody> </table>
        </FooterTemplate>
    </asp:Repeater>
</div>
<uc1:notifier ID="uscNotifier" runat="server" />

<script type="text/javascript">
    jQuery(document).ready(function() {
        jQuery('#tableSupplier').dataTable({ "bStateSave": true }).show();
    });
</script>