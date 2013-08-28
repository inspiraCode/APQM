﻿<%@ Control Language="C#" AutoEventWireup="true" CodeFile="rfqList.ascx.cs" Inherits="sifList" %>
<div class="mainSection" align="center">
    <asp:Repeater ID="Repeater1" runat="server" OnItemDataBound="R1_ItemDataBound">
        <HeaderTemplate>
            <table border="1">
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
                </th>
            </tr>
        </HeaderTemplate>
        <ItemTemplate>
            <tr height='40px;'>
                <td>
                    <asp:LinkButton ID="updateByID" runat="server" CommandArgument="" CommandName="sifID"
                        OnCommand="updateByID">                    
                    <%# DataBinder.Eval(Container.DataItem, "InquiryNumber")%>
                    </asp:LinkButton>
                </td>
                <td>
                    <asp:LinkButton ID="updateBOM" runat="server" CommandArgument="" CommandName="bomID"
                        OnCommand="updateByBomID">                    
                        None
                    </asp:LinkButton>
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
                    <asp:LinkButton ID="deleteByID" runat="server" CommandArgument="" CommandName="sifID"
                        OnCommand="deleteByID" OnClientClick="return  confirm('Do you wish to delete this SIF?')">
                    Delete
                    </asp:LinkButton>
                </td>
            </tr>
        </ItemTemplate>
        <FooterTemplate>
            </table>
        </FooterTemplate>
    </asp:Repeater>
</div>
<div id="divSifList" runat="server" align="center">
</div>
