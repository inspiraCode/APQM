<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SendNewRFQDetail.ascx.cs"
    Inherits="RFQ_SendNewRFQDetail" %>
<asp:Repeater ID="repeaterNewRFQDetail" runat="server">
    <HeaderTemplate>
        <table border="1" id="tableNewRFQDetail" class="display" style="display: inline;">
            <thead>
                <tr>
                    <th>
                        Part Number
                    </th>
                    <th>
                        Qty. Required
                    </th>
                    <th>
                        Materia/Description
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
                <asp:LinkButton ID="updateByID" runat="server" CommandArgument="" CommandName="partID">                    
                    <%# DataBinder.Eval(Container.DataItem, "partNumber")%>
                </asp:LinkButton>
            </td>
            <td>
                <%# DataBinder.Eval(Container.DataItem, "qtyRequired")%>
            </td>
            <td>
                <%# DataBinder.Eval(Container.DataItem, "partName")%>
            </td>
            <td>
                <asp:LinkButton ID="deleteByID" runat="server" CommandArgument="" CommandName="partID"
                     OnClientClick="return  confirm('Do you wish to delete this line?')">
                    Delete
                </asp:LinkButton>
            </td>
        </tr>
    </ItemTemplate>
    <FooterTemplate>
        </tbody></table>
    </FooterTemplate>
</asp:Repeater>