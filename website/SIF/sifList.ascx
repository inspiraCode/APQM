﻿<%@ Control Language="C#" AutoEventWireup="true" CodeFile="sifList.ascx.cs" Inherits="sifList" %>
<asp:Repeater ID="Repeater1" runat="server" OnItemDataBound="R1_ItemDataBound">
    <HeaderTemplate>
        <table border="1">
            <th>
                BOM
            </th>
            <th>
                Inquiry Number
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
            </th>
        </tr>
    </HeaderTemplate>
    <ItemTemplate>
        <tr height='40px;'>
            <td>
                Product name (BOM)
                <%--<asp:LinkButton ID="updateByID" runat="server" CommandArgument="" CommandName="sifID" 
                OnCommand="updateByID">
                    <%# DataBinder.Eval(Container.DataItem, "SupplierName")%>
                </asp:LinkButton>--%>
            </td>
            <td>
                <%# DataBinder.Eval(Container.DataItem, "InquiryNumber")%>
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
                <%# DataBinder.Eval(Container.DataItem, "CustomerKey")%>
            </td>
            <td>
                <asp:LinkButton ID="deleteByID" runat="server" PostBackUrl="default.aspx?section=sifs&delete="
                    CommandArgument="" CommandName="sifID" OnCommand="deleteByID" OnClientClick="return  confirm('Do you wish to delete this SIF?')">
                    Delete
                </asp:LinkButton>
            </td>
        </tr>
    </ItemTemplate>
    <FooterTemplate>
        </table>
    </FooterTemplate>
</asp:Repeater>
<div id="divSifList" runat="server" align="center">
</div>
