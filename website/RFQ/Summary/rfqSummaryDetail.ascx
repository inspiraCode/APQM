<%@ Control Language="C#" AutoEventWireup="true" CodeFile="rfqSummaryDetail.ascx.cs"
    Inherits="rfqSummaryDetail" %>
<%@ Register Src="selectRFQ.ascx" TagName="selectRFQ" TagPrefix="uc1" %>
<style type="text/css">
    .textManual
    {
        font-size: 12px;
        border: 0px;
        height: 13px;
        background-color: Transparent;
        text-align: right;
        max-width: 70px;
        width: 70px;
    }
    .rfqSelected
    {
        background: -webkit-linear-gradient(white,goldenrod);
        background: linear-gradient(white,goldenrod); /*border: solid 1px lawngreen;*/
    }
    .rfqUnselected
    {
        background: -webkit-linear-gradient(white,gainsboro);
        background: linear-gradient(white,gainsboro);
    }
</style>
<asp:HiddenField ID="hiddenBOMLineKey" runat="server" />
<div align="center" style="font-size: 12px;">
    <%--<div style="float: left" runat="server" id="divHeader" visible="false">
    </div>--%>
    <div align="left">
        <asp:Repeater ID="repeaterRFQSummary" runat="server" OnItemDataBound="R1_ItemDataBound">
            <HeaderTemplate>
                <table border="0" style="text-align: right; float: left; margin-top: 8px;">
                    <tr>
                        <td>
                            <table>
                                <tr height='16px;'>
                                </tr>
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
                                <tr height='12px;'>
                                    <td>                                        
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
                <div id="zone" class="container" style="margin-left: 125px; position: relative;">
            </HeaderTemplate>
            <ItemTemplate>
                <div class="movible" style="position: absolute;">
                    <table class="rfqUnselected" style="text-align: right; width: 100%;">
                        <tr height='11px;'>
                            <td align="center">
                                <asp:Label ID="lblSelected" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Status")%>'>                            
                                </asp:Label>
                            </td>
                        </tr>
                        <tr height='11px;'>
                            <td>
                                <asp:LinkButton ID="lnkSupplier" runat="server" CommandArgument="" CommandName="selectRFQCommand" validationid="rfqsummarydetail" OnClientClick="return validate();"
                                    OnCommand="selectRFQ" style="text-align:center;">
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
                            <td style="background-color: lightgray;">
                                <asp:TextBox ID="txtTotalBCost" validate="number" validationid="rfqsummarydetail" runat="server" Width="100%" class="textManual" Text='<%# DataBinder.Eval(Container.DataItem, "TotalBCost")%>'></asp:TextBox>
                            </td>
                        </tr>
                        <tr height='11px;'>
                            <td style="background-color: lightgray;">
                                <asp:TextBox ID="txtTotalCCost" validate="number" validationid="rfqsummarydetail" runat="server" class="textManual" Text='<%# DataBinder.Eval(Container.DataItem, "TotalCCost")%>'></asp:TextBox>
                            </td>
                        </tr>
                        <tr height='11px;'>
                            <td>
                                <asp:Label ID="lblTotalAcquisitionCost" runat="server" Text=''>
                            0.00
                                </asp:Label>
                            </td>
                        </tr>
                        <tr height='11px;'>
                            <td style="background-color: lightgray;">
                                <asp:TextBox ID="txtEAV" validate="number" validationid="rfqsummarydetail" runat="server" class="textManual" Text='<%# DataBinder.Eval(Container.DataItem, "EAV")%>'></asp:TextBox>
                            </td>
                        </tr>
                        <tr height='11px;'>
                            <td>
                                <asp:Label ID="lblAnnualPurchaseCost" runat="server" Text=''>
                                    0.00
                                </asp:Label>
                            </td>
                        </tr>
                        <tr height='11px;'>
                            <td style="background-color: lightgray;">
                                <asp:TextBox ID="txtTooling" validate="number" validationid="rfqsummarydetail" runat="server" class="textManual" Text='<%# DataBinder.Eval(Container.DataItem, "Tooling")%>'></asp:TextBox>
                            </td>
                        </tr>
                        <tr height='11px;'>
                            <td style="background-color: lightgray;">
                                <asp:TextBox ID="txtCavitation" validate="number" validationid="rfqsummarydetail" runat="server" class="textManual" Text='<%# DataBinder.Eval(Container.DataItem, "Cavitation")%>'></asp:TextBox>
                            </td>
                        </tr>
                        <tr height='11px;'>
                            <td style="background-color: lightgray;">
                                <asp:TextBox ID="txtMaterial" runat="server" class="textManual" Style="text-align: right;"
                                    Text='<%# DataBinder.Eval(Container.DataItem, "MaterialTooling")%>'></asp:TextBox>
                            </td>
                        </tr>
                        <tr height='11px;' style="display:none;">
                            <td>
                            <asp:TextBox ID="txtSeq" runat="server" class="Sequence" Width="20px"
                                    Text='<%# DataBinder.Eval(Container.DataItem, "Sequence")%>'></asp:TextBox>
                                    <asp:TextBox ID="txtKey" runat="server" Width="20px"
                                    Text='<%# DataBinder.Eval(Container.DataItem, "RfqHeaderKey")%>'></asp:TextBox>
                                <asp:HiddenField ID="txtHiddenRFQKey" runat="server" Value='<%# DataBinder.Eval(Container.DataItem, "RfqHeaderKey")%>' />
                                <asp:HiddenField ID="txtHiddenSeq" runat="server" Value='<%# DataBinder.Eval(Container.DataItem, "Sequence")%>' />
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
<asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
        <asp:Panel ID="panelPopup" runat="server" Visible="False" title="RFQ Selection">
            <uc1:selectRFQ ID="uscSelectRFQ" runat="server" OnOk_click="on_confirm_rfq" OnCancel_click="on_cancel_rfq" />
        </asp:Panel>
    </ContentTemplate>
</asp:UpdatePanel>

<script type="text/javascript">
    var arrColumns = {};
    jQuery(document).ready(function() {
        var width = 0;
        var count = 0;
        jQuery('.movible').each(function() {
            if (jQuery(this).outerWidth() > width) {
                width = jQuery(this).outerWidth() + 10;
            }
            count++;
        });
        jQuery('.movible').each(function() {
            jQuery(this).width(width);
            var strStatus = jQuery(this).children().children().children(":first").children().children().text();
            if (strStatus == "SELECTED" || strStatus == "AWARDED") {
                jQuery(this).children().removeClass("rfqUnselected").addClass("rfqSelected");
            }
        });
        width += 30;
        jQuery('#zone').width(width * count);
        jQuery('.container').shapeshift();
        jQuery('.container').on("ss-rearranged", function(e, selected) {
            var sort = 0;
            jQuery('.movible').each(function() {
                jQuery(this).find(".Sequence").val(sort++);
            });
        });

        jQuery('[item]').each(function() {
            if (!arrColumns.hasOwnProperty(jQuery(this).attr("item")))
                arrColumns[jQuery(this).attr("item")] = jQuery("[item = " + jQuery(this).attr("item") + "]");

            summarizeColumn(jQuery(this).attr("item"));
        });
    });

    function summarizeColumn(index) {
        var ACost = Number(arrColumns[index].filter('[fieldname=lblTotalACost]').text());
        var BCost = Number(arrColumns[index].filter('[fieldname=txtTotalBCost]').val());
        var CCost = Number(arrColumns[index].filter('[fieldname=txtTotalCCost]').val());

        var EAV = Number(arrColumns[index].filter('[fieldname=txtEAV]').val());

        var totalAcquisitionCost = ACost + BCost + CCost;

        arrColumns[index].filter('[fieldname=lblTotalAcquisitionCost]').text(totalAcquisitionCost.toFixed(2));
        arrColumns[index].filter('[fieldname=lblAnnualPurchaseCost]').text((EAV * totalAcquisitionCost).toFixed(2));
    }

    /******************************************************************/
    function openPopup() {

        var popupSelectRFQ = jQuery("#<%= this.panelPopup.ClientID %>").dialog({ autoOpen: true,
            appendTo: jQuery('form:first'),
            width: 430,
            modal: false,
            height: 320,
            dialogClass: "no-close",
            closeOnEscape: false,
            draggable: true
        }
        
        
        
        
//        )
//        .find('#<%= ((Button) uscSelectRFQ.FindControl("btnCancel")).ClientID %>').click(function() {
//            jQuery(this).closest(".ui-dialog-content").dialog("close").dialog("destroy").remove();
//        }
        );  
    }
//    function pageLoad(sender, args) {
//        if (args.get_isPartialLoad()) {
//            setTimeout(openPopup(), 100);
//        }
//    }
    function setSort() {
        var sort = 0;
        jQuery('.movible').each(function() {
            jQuery(this).find(":hidden").eq(1).val(sort++);
        });
        return true;
    }
    
</script>