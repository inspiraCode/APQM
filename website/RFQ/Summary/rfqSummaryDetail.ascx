﻿<%@ Control Language="C#" AutoEventWireup="true" CodeFile="rfqSummaryDetail.ascx.cs"
    Inherits="rfqSummaryDetail" %>
    <style type="text/css">
        .textManual
        {
            font-size: 12px;
            border:0px;
            height: 13px;
            background-color:Transparent;
            text-align: right;
        }
    </style>
<div align="center" style="font-size: 12px;">
    <%--<div style="float: left" runat="server" id="divHeader" visible="false">
    </div>--%>
    <div align="left">
        <asp:Repeater ID="repeaterRFQSummary" runat="server" OnItemDataBound="R1_ItemDataBound">
            <HeaderTemplate>
                <table border="0" style="text-align: right;float: left;margin-top: 8px;">
                    <tr>
                        <td>
                            <table>
                                <tr height='12px;'>
                                    <td>
                                        <asp:Label ID="Label13" runat="server" Text="Supplier Name">                            
                                        </asp:Label>
                                    </td>
                                </tr>
                                <tr height='12px;'>
                                    <td>
                                        <asp:Label ID="Label1" runat="server" Text="Material">                            
                                        </asp:Label>
                                    </td>
                                </tr>
                                <tr height='12px;'>
                                    <td>
                                        <asp:Label ID="Label2" runat="server" Text="Material O/S">
                                        </asp:Label>
                                    </td>
                                </tr>
                                <tr height='12px;'>
                                    <td>
                                        <asp:Label ID="Label3" runat="server" Text="Scrap">
                            
                                        </asp:Label>
                                    </td>
                                </tr>
                                <tr height='12px;'>
                                    <td>
                                        <asp:Label ID="Label4" runat="server" Text="Labor">
                            
                                        </asp:Label>
                                    </td>
                                </tr>
                                <tr height='12px;'>
                                    <td>
                                        <asp:Label ID="Label5" runat="server" Text="Burden">
                            
                                        </asp:Label>
                                    </td>
                                </tr>
                                <tr height='12px;'>
                                    <td>
                                        <asp:Label ID="Label6" runat="server" Text="Manufacturing Cost">
                            
                                        </asp:Label>
                                    </td>
                                </tr>
                                <tr height='12px;'>
                                    <td>
                                        <asp:Label ID="Label7" runat="server" Text="SGA&A Profit">
                            
                                        </asp:Label>
                                    </td>
                                </tr>
                                <tr height='12px;'>
                                    <td>
                                        <asp:Label ID="Label8" runat="server" Text="Packaging">
                            
                                        </asp:Label>
                                    </td>
                                </tr>
                                <tr height='12px;'>
                                    <td>
                                        <asp:Label ID="Label9" runat="server" Text="Assembly Cost Per Unit">
                            
                                        </asp:Label>
                                    </td>
                                </tr>
                                <tr height='12px;'>
                                    <td>
                                        <asp:Label ID="Label10" runat="server" Text="A Cost">
                            
                                        </asp:Label>
                                    </td>
                                </tr>
                                <tr height='12px;'>
                                    <td>
                                        <asp:Label ID="TextBox1" runat="server" Text="B Cost"></asp:Label>
                                    </td>
                                </tr>
                                 <tr height='12px;'>
                                    <td>
                                        <asp:Label ID="Label18" runat="server" Text="C Cost"></asp:Label>
                                    </td>
                                </tr>
                                <tr height='12px;'>
                                    <td>
                                        <asp:Label ID="Label12" runat="server" Text="Total Acquisition Cost">
                                        </asp:Label>
                                    </td>
                                </tr>
                                <tr height='12px;'>
                                    <td>
                                        <asp:Label ID="Label11" runat="server" Text="Estimated Annual Volume">
                                        </asp:Label>
                                    </td>
                                </tr>
                                <tr height='12px;'>
                                    <td>
                                        <asp:Label ID="Label14" runat="server" Text="Annual Purchase Cost">
                                        </asp:Label>
                                    </td>
                                </tr>
                                <tr height='12px;'>
                                    <td>
                                        <asp:Label ID="Label15" runat="server" Text="Tooling">
                                        </asp:Label>
                                    </td>
                                </tr>
                                <tr height='12px;'>
                                    <td>
                                        <asp:Label ID="Label16" runat="server" Text="Cavitation">
                                        </asp:Label>
                                    </td>
                                </tr>
                                <tr height='12px;'>
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
                    <table style="text-align: right;">
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
                                <asp:TextBox ID="txtTotalBCost" runat="server" Width="60px" class="textManual" Text='<%# DataBinder.Eval(Container.DataItem, "TotalBCost")%>'></asp:TextBox>
                            </td>
                        </tr>
                        <tr height='11px;'>
                            <td style="background-color:#C0C0C0;">
                                <asp:TextBox ID="txtTotalCCost" runat="server" Width="60px" class="textManual"  Text='<%# DataBinder.Eval(Container.DataItem, "TotalCCost")%>'></asp:TextBox>
                            </td>
                        </tr>
                       <tr height='11px;'>
                            <td>
                                <asp:Label ID="lblTotalAcquisitionCost" runat="server" Text=''>
                            00000.00
                                </asp:Label>
                            </td>
                        </tr>
                        <tr height='11px;'>
                            <td style="background-color:#C0C0C0;">
                                <asp:TextBox ID="txtEAV" runat="server" Width="60px" class="textManual" Text='<%# DataBinder.Eval(Container.DataItem, "EAV")%>'></asp:TextBox>
                            </td>
                        </tr>
                       <tr height='11px;'>
                            <td>
                                <asp:Label ID="lblAnnualPurchaseCost" runat="server" Text=''>
                                    00000.00
                                </asp:Label>
                            </td>
                        </tr>
                        <tr height='11px;'>
                            <td style="background-color:#C0C0C0;">
                                <asp:TextBox ID="txtTooling" runat="server" Width="60px" class="textManual" Text='<%# DataBinder.Eval(Container.DataItem, "Tooling")%>'></asp:TextBox>
                            </td>
                        </tr>
                        <tr height='11px;'>
                            <td style="background-color:#C0C0C0;">
                                <asp:TextBox ID="txtCavitation" runat="server" Width="60px" class="textManual" Text='<%# DataBinder.Eval(Container.DataItem, "Cavitation")%>'></asp:TextBox>
                            </td>
                        </tr>
                        <tr height='11px;'>
                            <td style="background-color:#C0C0C0;">
                                <asp:TextBox ID="txtMaterial" runat="server" Width="60px" class="textManual" style="text-align: right;" Text='<%# DataBinder.Eval(Container.DataItem, "MaterialTooling")%>'></asp:TextBox>
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
            width += 110;
        });
        jQuery('#zone').width(width);
        jQuery('.container').shapeshift();
    });
</script>