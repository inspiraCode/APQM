﻿<%@ Control Language="C#" AutoEventWireup="true" CodeFile="rfqSummaryDetail.ascx.cs"
    Inherits="rfqSummaryDetail" %>
<div align="center" style="font-size: 11px;">
    <%--<div style="float: left" runat="server" id="divHeader" visible="false">
    </div>--%>
    <div align="left">
        <asp:Repeater ID="repeaterRFQSummary" runat="server" OnItemDataBound="R1_ItemDataBound">
            <HeaderTemplate>
                <table border="0" style="text-align: right;float: left;margin-top: 7px;">
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
                <div id="zone" class="container" style="margin-left: 160px;position:relative;" >
                    
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
                                <asp:Label ID="Label1" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "MaterialTotal")%>'>                            
                                </asp:Label>
                            </td>
                        </tr>
                        <tr height='11px;'>
                            <td>
                                <asp:Label ID="Label2" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "ServiceTotal")%>'>
                                </asp:Label>
                            </td>
                        </tr>
                        <tr height='11px;'>
                            <td>
                                <asp:Label ID="Label3" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "ScrapTotal")%>'>
                            
                                </asp:Label>
                            </td>
                        </tr>
                        <tr height='11px;'>
                            <td>
                                <asp:Label ID="Label4" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "LaborTotal")%>'>
                            
                                </asp:Label>
                            </td>
                        </tr>
                        <tr height='11px;'>
                            <td>
                                <asp:Label ID="Label5" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "BurdenTotal")%>'>
                            
                                </asp:Label>
                            </td>
                        </tr>
                        <tr height='11px;'>
                            <td>
                                <asp:Label ID="Label6" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "ManufacturingCost")%>'>
                            
                                </asp:Label>
                            </td>
                        </tr>
                        <tr height='11px;'>
                            <td>
                                <asp:Label ID="Label7" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "SgaProfit")%>'>
                            
                                </asp:Label>
                            </td>
                        </tr>
                        <tr height='11px;'>
                            <td>
                                <asp:Label ID="Label8" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "PackingPerUnit")%>'>
                            
                                </asp:Label>
                            </td>
                        </tr>
                        <tr height='11px;'>
                            <td>
                                <asp:Label ID="Label9" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "AssemblyCostPerUnit")%>'>
                            
                                </asp:Label>
                            </td>
                        </tr>
                        <tr height='11px;'>
                            <td>
                                <asp:Label ID="Label10" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "TotalACost")%>'>
                            
                                </asp:Label>
                            </td>
                        </tr>
                        <tr height='11px;'>
                            <td>
                                <asp:TextBox ID="TextBox1" runat="server" Width="100px" Style="font-size: 11px">"TotalBCost"</asp:TextBox>
                            </td>
                        </tr>
                        <tr height='11px;'>
                            <td>
                                <asp:Label ID="Label12" runat="server" Text=''>
                            TotalAcquisition
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
                                AnnualPurchaseCost
                            </td>
                        </tr>
                        <tr height='11px;'>
                            <td>
                                Tooling
                            </td>
                        </tr>
                        <tr height='11px;'>
                            <td>
                                Cavitation
                            </td>
                        </tr>
                        <tr height='11px;'>
                            <td>
                                Material
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
        var count = 1;
        //        jQuery('.movible').each(function() {
        //            jQuery(this).attr('data-row', '1');
        //            jQuery(this).attr('data-col', count++);
        //            jQuery(this).attr('data-sizex', '1');
        //            jQuery(this).attr('data-sizey', '1');
        //            jQuery(this).css('list-style-type', 'none');            
        //        });


        //        jQuery(".gridster ul").gridster({
        //            max_size_x: 9,
        //            max_size_y: 8,            
        //            widget_margins: [14][14],
        //            widget_base_dimensions: [1000][1000]
        //        });

        //[110][319]
        var width = 0;
        jQuery('.movible').each(function() {
            width += 150;
        });
        jQuery('#zone').width(width);
        jQuery('.container').shapeshift();
    });
</script>

