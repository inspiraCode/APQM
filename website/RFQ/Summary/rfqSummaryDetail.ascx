<%@ Control Language="C#" AutoEventWireup="true" CodeFile="rfqSummaryDetail.ascx.cs"
    Inherits="RFQ_rfqSummaryDetail" %>
<div align="center">
    <div style="float: left" runat="server" id="divHeader" visible="false">
        <table border="0" style="text-align: right">
            <tr>
                <td>
                    <table>
                        <tr height='35px;'>
                            <td>
                                <asp:Label ID="Label13" runat="server" Text="Supplier Name">                            
                                </asp:Label>
                            </td>
                        </tr>
                        <tr height='35px;'>
                            <td>
                                <asp:Label ID="Label1" runat="server" Text="Material">                            
                                </asp:Label>
                            </td>
                        </tr>
                        <tr height='35px;'>
                            <td>
                                <asp:Label ID="Label2" runat="server" Text="Material O/S">
                                </asp:Label>
                            </td>
                        </tr>
                        <tr height='35px;'>
                            <td>
                                <asp:Label ID="Label3" runat="server" Text="Scrap">
                            
                                </asp:Label>
                            </td>
                        </tr>
                        <tr height='35px;'>
                            <td>
                                <asp:Label ID="Label4" runat="server" Text="Labor">
                            
                                </asp:Label>
                            </td>
                        </tr>
                        <tr height='35px;'>
                            <td>
                                <asp:Label ID="Label5" runat="server" Text="Burden">
                            
                                </asp:Label>
                            </td>
                        </tr>
                        <tr height='35px;'>
                            <td>
                                <asp:Label ID="Label6" runat="server" Text="Manufacturing Cost">
                            
                                </asp:Label>
                            </td>
                        </tr>
                        <tr height='35px;'>
                            <td>
                                <asp:Label ID="Label7" runat="server" Text="SGA&A Profit">
                            
                                </asp:Label>
                            </td>
                        </tr>
                        <tr height='35px;'>
                            <td>
                                <asp:Label ID="Label8" runat="server" Text="Packaging">
                            
                                </asp:Label>
                            </td>
                        </tr>
                        <tr height='35px;'>
                            <td>
                                <asp:Label ID="Label9" runat="server" Text="Assembly Cost Per Unit">
                            
                                </asp:Label>
                            </td>
                        </tr>
                        <tr height='35px;'>
                            <td>
                                <asp:Label ID="Label10" runat="server" Text="Total A Cost">
                            
                                </asp:Label>
                            </td>
                        </tr>
                        <tr height='35px;'>
                            <td>
                                <asp:Label ID="TextBox1" runat="server" Text="Total B Cost"></asp:Label>
                            </td>
                        </tr>
                        <tr height='35px;'>
                            <td>
                                <asp:Label ID="Label12" runat="server" Text="Total Acquisition">
                                </asp:Label>
                            </td>
                        </tr>
                        <tr height='35px;'>
                            <td>
                                <asp:Label ID="Label11" runat="server" Text="Estimated Annual Volume">
                                </asp:Label>
                            </td>
                        </tr>
                        <tr height='35px;'>
                            <td>
                                <asp:Label ID="Label14" runat="server" Text="Annual Purchase Cost">
                                </asp:Label>
                            </td>
                        </tr>
                        <tr height='35px;'>
                            <td>
                                <asp:Label ID="Label15" runat="server" Text="Tooling">
                                </asp:Label>
                            </td>
                        </tr>
                        <tr height='35px;'>
                            <td>
                                <asp:Label ID="Label16" runat="server" Text="Cavitation">
                                </asp:Label>
                            </td>
                        </tr>
                        <tr height='35px;'>
                            <td>
                                <asp:Label ID="Label17" runat="server" Text="Material">
                                </asp:Label>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </div>
    <div align="left">
        <asp:Repeater ID="repeaterRFQSummary" runat="server">
            <HeaderTemplate>
                <table border="1">
                    <tr>
            </HeaderTemplate>
            <ItemTemplate>
                <td>
                    <table>
                        <tr height='35px;'>
                            <td>
                                <asp:Label ID="Label13" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "SupplierName")%>'>                            
                                </asp:Label>
                            </td>
                        </tr>
                        <tr height='35px;'>
                            <td>
                                <asp:Label ID="Label1" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "MaterialTotal")%>'>                            
                                </asp:Label>
                            </td>
                        </tr>
                        <tr height='35px;'>
                            <td>
                                <asp:Label ID="Label2" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "ServiceTotal")%>'>
                                </asp:Label>
                            </td>
                        </tr>
                        <tr height='35px;'>
                            <td>
                                <asp:Label ID="Label3" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "ScrapTotal")%>'>
                            
                                </asp:Label>
                            </td>
                        </tr>
                        <tr height='35px;'>
                            <td>
                                <asp:Label ID="Label4" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "LaborTotal")%>'>
                            
                                </asp:Label>
                            </td>
                        </tr>
                        <tr height='35px;'>
                            <td>
                                <asp:Label ID="Label5" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "BurdenTotal")%>'>
                            
                                </asp:Label>
                            </td>
                        </tr>
                        <tr height='35px;'>
                            <td>
                                <asp:Label ID="Label6" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "ManufacturingCost")%>'>
                            
                                </asp:Label>
                            </td>
                        </tr>
                        <tr height='35px;'>
                            <td>
                                <asp:Label ID="Label7" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "SgaProfit")%>'>
                            
                                </asp:Label>
                            </td>
                        </tr>
                        <tr height='35px;'>
                            <td>
                                <asp:Label ID="Label8" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "PackingPerUnit")%>'>
                            
                                </asp:Label>
                            </td>
                        </tr>
                        <tr height='35px;'>
                            <td>
                                <asp:Label ID="Label9" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "AssemblyCostPerUnit")%>'>
                            
                                </asp:Label>
                            </td>
                        </tr>
                        <tr height='35px;'>
                            <td>
                                <asp:Label ID="Label10" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "TotalACost")%>'>
                            
                                </asp:Label>
                            </td>
                        </tr>
                        <tr height='35px;'>
                            <td>
                                <asp:TextBox ID="TextBox1" runat="server">"TotalBCost"</asp:TextBox>
                            </td>
                        </tr>
                        <tr height='35px;'>
                            <td>
                                <asp:Label ID="Label12" runat="server" Text=''>
                            TotalAcquisition
                                </asp:Label>
                            </td>
                        </tr>
                        <tr height='35px;'>
                            <td>
                                <asp:Label ID="Label11" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "EstimatedAnnualVolume")%>'>
                            
                                </asp:Label>
                            </td>
                        </tr>
                        <tr height='35px;'>
                            <td>
                                AnnualPurchaseCost
                            </td>
                        </tr>
                        <tr height='35px;'>
                            <td>
                                Tooling
                            </td>
                        </tr>
                        <tr height='35px;'>
                            <td>
                                Cavitation
                            </td>
                        </tr>
                        <tr height='35px;'>
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
    </div>
</div>
