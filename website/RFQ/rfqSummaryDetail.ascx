<%@ Control Language="C#" AutoEventWireup="true" CodeFile="rfqSummaryDetail.ascx.cs"
    Inherits="RFQ_rfqSummaryDetail" %>
<asp:Repeater ID="repeaterRFQSummary" runat="server" OnItemDataBound="R1_ItemDataBound">
    <HeaderTemplate>
        <table border="1">
            <tr>
    </HeaderTemplate>
    <ItemTemplate>
        <td>
            <table>
                <tr height='40px;'>
                    <td>
                        <asp:Label ID="Label13" runat="server" Text="Label">
                            <%# DataBinder.Eval(Container.DataItem, "SupplierName")%>
                        </asp:Label>
                    </td>
                </tr>
                <tr height='40px;'>
                    <td>
                        <asp:Label ID="Label1" runat="server" Text="Label">
                            <%# DataBinder.Eval(Container.DataItem, "MaterialTotal")%>
                        </asp:Label>
                    </td>
                </tr>
                <tr height='40px;'>
                    <td>
                        <asp:Label ID="Label2" runat="server" Text="Label">
                            <%# DataBinder.Eval(Container.DataItem, "ServiceTotal")%>
                        </asp:Label>
                    </td>                    
                </tr>
                <tr height='40px;'>
                    <td>
                        <asp:Label ID="Label3" runat="server" Text="Label">
                            <%# DataBinder.Eval(Container.DataItem, "ScrapCost")%>
                        </asp:Label>
                    </td>
                </tr>
                <tr height='40px;'>
                    <td>
                        <asp:Label ID="Label4" runat="server" Text="Label">
                            <%# DataBinder.Eval(Container.DataItem, "LaborCost")%>
                        </asp:Label>
                    </td>
                </tr>
                <tr height='40px;'>
                    <td>
                        <asp:Label ID="Label5" runat="server" Text="Label">
                            <%# DataBinder.Eval(Container.DataItem, "BurdenTotal")%>
                        </asp:Label>
                    </td>
                </tr>
                <tr height='40px;'>
                    <td>
                        <asp:Label ID="Label6" runat="server" Text="Label">
                            <%# DataBinder.Eval(Container.DataItem, "ManufacturingCost")%>
                        </asp:Label>
                    </td>
                </tr>
                <tr height='40px;'>
                    <td>
                        <asp:Label ID="Label7" runat="server" Text="Label">
                            <%# DataBinder.Eval(Container.DataItem, "SgaProfit")%>
                        </asp:Label>
                    </td>
                </tr>
                <tr height='40px;'>
                    <td>
                        <asp:Label ID="Label8" runat="server" Text="Label">
                            <%# DataBinder.Eval(Container.DataItem, "PackingPerUnit")%>
                        </asp:Label>
                    </td>
                </tr>
                <tr height='40px;'>
                    <td>
                        <asp:Label ID="Label9" runat="server" Text="Label">
                            <%# DataBinder.Eval(Container.DataItem, "AssemblyCostPerUnit")%>
                        </asp:Label>
                    </td>
                </tr>
                <tr height='40px;'>
                    <td>
                        <asp:Label ID="Label10" runat="server" Text="Label">
                            <%# DataBinder.Eval(Container.DataItem, "TotalACost")%>
                        </asp:Label>
                    </td>
                </tr>
                <tr height='40px;'>                    
                    <td>
                        <asp:TextBox ID="TextBox1" runat="server">"TotalBCost"</asp:TextBox>
                    </td>
                </tr>
                <tr height='40px;'>
                    <td>
                        <asp:Label ID="Label12" runat="server" Text="Label">
                            <%# DataBinder.Eval(Container.DataItem, "TotalAcquisition")%>
                        </asp:Label>
                    </td>
                </tr>
                <tr height='40px;'>
                    <td>
                        <asp:Label ID="Label11" runat="server" Text="Label">
                            <%# DataBinder.Eval(Container.DataItem, "EstimatedAnnualVolume")%>
                        </asp:Label>
                    </td>
                </tr>
                <tr height='40px;'>
                    <td>
                        AnnualPurchaseCost
                    </td>
                </tr>
                <tr height='40px;'>
                    <td>
                        Tooling
                    </td>
                </tr>
                <tr height='40px;'>
                    <td>
                        Cavitation
                    </td>
                </tr>
                <tr height='40px;'>
                    <td>
                        Material
                    </td>
                </tr>
            </table>
        </td>        
    </ItemTemplate>
    <FooterTemplate>
        </tr> </table>
    </FooterTemplate>
</asp:Repeater>
