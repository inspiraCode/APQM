﻿<%@ Control Language="C#" AutoEventWireup="true" CodeFile="rfqList.ascx.cs" Inherits="rfqList" %>
<div class="mainSection" align="center">
    <asp:Repeater ID="Repeater1" runat="server" OnItemDataBound="R1_ItemDataBound">
        <HeaderTemplate>
            <table border="1">
                <th>
                    RFQ Number
                </th>                
                <th>
                    Part Name
                </th>
                <th>
                    Vendor
                </th>
                <th>
                    Due Date
                </th>
                <th>
                    Sent To Vendor
                </th>                
                <th>
                </th>
            </tr>
        </HeaderTemplate>
        <ItemTemplate>
            <tr height='40px;'>
                <td >
                    <asp:LinkButton ID="updateByID" runat="server" CommandArgument="" CommandName="rfqID"
                        OnCommand="updateByID">                    
                    <%# DataBinder.Eval(Container.DataItem, "RfqNumber")%>
                    </asp:LinkButton>
                </td>
                <td>
                    <asp:LinkButton ID="updateBOM" runat="server" CommandArgument="" CommandName="bomID"
                        OnCommand="updateByBomID">                    
                        None
                    </asp:LinkButton>
                </td>                
                <td>
                   <%--<%# DataBinder.Eval(Container.DataItem, "SupplierName")%>   --%> 
                   Vendor name               
                </td>
                <td>
                    <%# DataBinder.Eval(Container.DataItem, "DueDate")%>
                </td>
                <td>
                    <%# DataBinder.Eval(Container.DataItem, "SentToVendor")%>
                </td>                
                <td>
                    <asp:LinkButton ID="deleteByID" runat="server" CommandArgument="" CommandName="rfqID"
                        OnCommand="deleteByID" OnClientClick="return  confirm('Do you wish to delete this RFQ?')">
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
<div id="divRfqList" runat="server" align="center">
</div>