<%@ Control Language="C#" AutoEventWireup="true" CodeFile="rfqSummaryDetail.ascx.cs"
    Inherits="rfqSummaryDetail" %>
<div align="center" style="font-size: 11px;">
    <%--<div style="float: left" runat="server" id="divHeader" visible="false">
    </div>--%>
    <div align="left">
        <asp:Repeater ID="repeaterRFQSummary" runat="server" OnItemDataBound="R1_ItemDataBound">
            <HeaderTemplate>
                <table border="0" style="text-align: right;float: left;margin-top: 8px;">
                    <tr>
                        <td>
                            <table>
                                <tr height='11px;'>
                                    <td>
                                        <asp:Label ID="Label13" runat="server" Text="Supplier Name">                            
                                        </asp:Label>
                                    </td>
                                </tr>
                                <tr height='11px;'>
                                    <td>
                                        <asp:Label ID="Label1" runat="server" Text="Material">                            
                                        </asp:Label>
                                    </td>
                                </tr>
                                <tr height='11px;'>
                                    <td>
                                        <asp:Label ID="Label2" runat="server" Text="Material O/S">
                                        </asp:Label>
                                    </td>
                                </tr>
                                <tr height='11px;'>
                                    <td>
                                        <asp:Label ID="Label3" runat="server" Text="Scrap">
                            
                                        </asp:Label>
                                    </td>
                                </tr>
                                <tr height='11px;'>
                                    <td>
                                        <asp:Label ID="Label4" runat="server" Text="Labor">
                            
                                        </asp:Label>
                                    </td>
                                </tr>
                                <tr height='11px;'>
                                    <td>
                                        <asp:Label ID="Label5" runat="server" Text="Burden">
                            
                                        </asp:Label>
                                    </td>
                                </tr>
                                <tr height='11px;'>
                                    <td>
                                        <asp:Label ID="Label6" runat="server" Text="Manufacturing Cost">
                            
                                        </asp:Label>
                                    </td>
                                </tr>
                                <tr height='11px;'>
                                    <td>
                                        <asp:Label ID="Label7" runat="server" Text="SGA&A Profit">
                            
                                        </asp:Label>
                                    </td>
                                </tr>
                                <tr height='11px;'>
                                    <td>
                                        <asp:Label ID="Label8" runat="server" Text="Packaging">
                            
                                        </asp:Label>
                                    </td>
                                </tr>
                                <tr height='11px;'>
                                    <td>
                                        <asp:Label ID="Label9" runat="server" Text="Assembly Cost Per Unit">
                            
                                        </asp:Label>
                                    </td>
                                </tr>
                                <tr height='11px;'>
                                    <td>
                                        <asp:Label ID="Label10" runat="server" Text="Total A Cost">
                            
                                        </asp:Label>
                                    </td>
                                </tr>
                                <tr height='11px;'>
                                    <td>
                                        <asp:Label ID="TextBox1" runat="server" Text="Total B Cost"></asp:Label>
                                    </td>
                                </tr>
                                <tr height='11px;'>
                                    <td>
                                        <asp:Label ID="Label12" runat="server" Text="Total Acquisition">
                                        </asp:Label>
                                    </td>
                                </tr>
                                <tr height='11px;'>
                                    <td>
                                        <asp:Label ID="Label11" runat="server" Text="Estimated Annual Volume">
                                        </asp:Label>
                                    </td>
                                </tr>
                                <tr height='11px;'>
                                    <td>
                                        <asp:Label ID="Label14" runat="server" Text="Annual Purchase Cost">
                                        </asp:Label>
                                    </td>
                                </tr>
                                <tr height='11px;'>
                                    <td>
                                        <asp:Label ID="Label15" runat="server" Text="Tooling">
                                        </asp:Label>
                                    </td>
                                </tr>
                                <tr height='11px;'>
                                    <td>
                                        <asp:Label ID="Label16" runat="server" Text="Cavitation">
                                        </asp:Label>
                                    </td>
                                </tr>
                                <tr height='11px;'>
                                    <td>
                                        <asp:Label ID="Label17" runat="server" Text="Material">
                                        </asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
                <div id="zone" class="container" style="margin-left: 75px;position:relative;" >
                    
            </HeaderTemplate>
            <ItemTemplate>
                <div class="movible" style="position:absolute;">
                    <table>
                        <tr height='11px;'>
                            <td>
                                <asp:LinkButton ID="lnkSupplier" runat="server" CommandArgument="" CommandName="selectRFQCommand"
                                    OnCommand="selectRFQ">
                                    <%# DataBinder.Eval(Container.DataItem, "SupplierName")%>
                                </asp:LinkButton>
                            </td>
                        </tr>
                        <tr height='11px;'>
                            <td>
                                <asp:Label ID="lblMaterialTotal" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "MaterialTotal")%>'>                            
                                </asp:Label>
                            </td>
                        </tr>
                        <tr height='11px;'>
                            <td>
                                <asp:Label ID="lblServiceTotal" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "ServiceTotal")%>'>
                                </asp:Label>
                            </td>
                        </tr>
                        <tr height='11px;'>
                            <td>
                                <asp:Label ID="lblScrapTotal" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "ScrapTotal")%>'>
                            
                                </asp:Label>
                            </td>
                        </tr>
                        <tr height='11px;'>
                            <td>
                                <asp:Label ID="lblLaborTotal" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "LaborTotal")%>'>
                            
                                </asp:Label>
                            </td>
                        </tr>
                        <tr height='11px;'>
                            <td>
                                <asp:Label ID="lblBurdenTotal" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "BurdenTotal")%>'>
                            
                                </asp:Label>
                            </td>
                        </tr>
                        <tr height='11px;'>
                            <td>
                                <asp:Label ID="lblManufacturingCost" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "ManufacturingCost")%>'>
                            
                                </asp:Label>
                            </td>
                        </tr>
                        <tr height='11px;'>
                            <td>
                                <asp:Label ID="lblSgaProfit" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "SgaProfit")%>'>
                            
                                </asp:Label>
                            </td>
                        </tr>
                        <tr height='11px;'>
                            <td>
                                <asp:Label ID="lblPackingPerUnit" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "PackingPerUnit")%>'>
                            
                                </asp:Label>
                            </td>
                        </tr>
                        <tr height='11px;'>
                            <td>
                                <asp:Label ID="lblAssemblyCostPerUnit" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "AssemblyCostPerUnit")%>'>
                            
                                </asp:Label>
                            </td>
                        </tr>
                        <tr height='11px;'>
                            <td>
                                <asp:Label ID="lblTotalACost" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "TotalACost")%>'>
                            
                                </asp:Label>
                            </td>
                        </tr>
                        <tr height='11px;'>
                            <td style="background-color:#C0C0C0;">
                                <asp:TextBox ID="TextBox1" runat="server" Width="60px" Style="font-size: 11px;border:0px;background-color:Transparent;">"00000.00"</asp:TextBox>
                            </td>
                        </tr>
                        <tr height='11px;'>
                            <td>
                                <asp:Label ID="Label12" runat="server" Text=''>
                            00000.00
                                </asp:Label>
                            </td>
                        </tr>
                        <tr height='11px;'>
                            <td>
                                <asp:Label ID="Label11" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "EstimatedAnnualVolume")%>'>
                            
                                </asp:Label>
                            </td>
                        </tr>
                        <tr height='11px;'>
                            <td>
                                00000.00
                            </td>
                        </tr>
                        <tr height='11px;'>
                            <td>
                                00000.00
                            </td>
                        </tr>
                        <tr height='11px;'>
                            <td>
                                00000.00
                            </td>
                        </tr>
                        <tr height='11px;'>
                            <td>
                                00000.00
                            </td>
                        </tr>
                    </table>
                </div>
            </ItemTemplate>
            <FooterTemplate>                
                </div>
            </FooterTemplate>
        </asp:Repeater>
    </div>
</div>

<script type="text/javascript">
    jQuery(document).ready(function() {
        var width = 0;
        jQuery('.movible').each(function() {
            width += 120;
        });
        jQuery('#zone').width(width);
        jQuery('.container').shapeshift();
    });
</script>