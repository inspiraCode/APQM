<%@ Control Language="C#" AutoEventWireup="true" CodeFile="rfqAttachments.ascx.cs"
    Inherits="RFQ_rfqAttachments" %>
<asp:Repeater ID="repeaterRFQAttachments" runat="server" OnItemDataBound="R1_ItemDataBound">
    <HeaderTemplate>
        <table>
    </HeaderTemplate>
    <ItemTemplate>
        <tr>
            <td>
                <asp:LinkButton ID="downloadByName" runat="server" CommandArgument="" OnCommand="downloadByName">
                    <%# DataBinder.Eval(Container.DataItem, "FileName")%>
                </asp:LinkButton>
            </td>
            <td>
                <%# DataBinder.Eval(Container.DataItem, "Comments")%>
            </td>
        </tr>
    </ItemTemplate>
    <FooterTemplate>
        </table></FooterTemplate>
</asp:Repeater>