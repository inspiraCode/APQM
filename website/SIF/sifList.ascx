<%@ Control Language="C#" AutoEventWireup="true" CodeFile="sifList.ascx.cs"
    Inherits="sifList" %>
<%--<form id="listSuppliersForm" runat="server">--%>
<asp:Repeater ID="Repeater1" runat="server" OnItemDataBound="R1_ItemDataBound">
    <HeaderTemplate>
        <table border="1">
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
    </HeaderTemplate>
    <ItemTemplate>
        <tr height='40px;'>
            <td>
                <asp:LinkButton ID="updateByID" runat="server" CommandArgument="" CommandName="sifID" 
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
                <asp:LinkButton ID="deleteByID" runat="server" PostBackUrl="default.aspx?section=sifs&delete="
                    CommandArgument="" CommandName="sifID" OnCommand="deleteByID" 
                    OnClientClick="return  confirm('Do you wish to delete this SIF?')">
                    Delete
                </asp:LinkButton>
            </td>
        </tr>
    </ItemTemplate>
    <FooterTemplate>
        </table>
    </FooterTemplate>
</asp:Repeater>
<%--</form>--%>
<div id="divSifList" runat="server" align="center">
</div>
