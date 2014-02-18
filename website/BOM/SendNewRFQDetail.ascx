<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SendNewRFQDetail.ascx.cs"
    Inherits="BOM_SendNewRFQDetail" %>
<asp:Repeater ID="repeaterNewRFQDetail" runat="server">
    <HeaderTemplate>
        <table border="1" cellspacing=0 id="tableNewRFQDetail">
            <thead>
                <tr>
                    <th>
                        Part Number
                    </th>
                    <th>
                        Materia/Description
                    </th>
                    <th>
                        Qty. Required
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
                <%# DataBinder.Eval(Container.DataItem, "PartNumber")%>
            </td>
            <td>
                <%# DataBinder.Eval(Container.DataItem, "Material")%>
            </td>
            <td>
                <%# DataBinder.Eval(Container.DataItem, "Qty")%>
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