<%@ Control Language="C#" AutoEventWireup="true" CodeFile="supplierList.ascx.cs"
    Inherits="supplierList" %>
<div class="mainSection" align="center">
<asp:Repeater ID="Repeater1" runat="server" OnItemDataBound="R1_ItemDataBound" >
    <HeaderTemplate>
        <table border="1" id="tableSupplier" class="display">
        <thead>
            <th>
                Supplier Name
            </th>
            <th>
                Manufacturing Location
            </th>
            <th>
                Ship Location
            </th>
            <th>
                Quoted Currency
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
        <tr height='40px;'>
            <td>
                <asp:LinkButton ID="updateByID" runat="server" CommandArgument="" CommandName="SupplierID" 
                OnCommand="updateByID">
                    <%# DataBinder.Eval(Container.DataItem, "SupplierName")%>
                </asp:LinkButton>                
            </td>
            <td>
                <%# DataBinder.Eval(Container.DataItem, "ManufacturingLocation")%>
            </td>
            <td>
                <%# DataBinder.Eval(Container.DataItem, "ShipLocation")%>
            </td>
            <td>
                <%# DataBinder.Eval(Container.DataItem, "QuotedCurrency")%>
            </td>
            <td>
                <%# DataBinder.Eval(Container.DataItem, "ContactName")%>
            </td>
            <td>
                <%# DataBinder.Eval(Container.DataItem, "ContactPhone")%>
            </td>
            <td>
                <%# DataBinder.Eval(Container.DataItem, "ContactEmail")%>
            </td>
            <td>
                <asp:LinkButton ID="deleteByID" runat="server" 
                    CommandArgument="" CommandName="SupplierID" OnCommand="deleteByID" 
                    OnClientClick="return  confirm('Do you wish to delete this Supplier?')">
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
<script type="text/javascript">
    jQuery(document).ready(function() {
        jQuery('#tableSupplier').dataTable();
    });
</script>