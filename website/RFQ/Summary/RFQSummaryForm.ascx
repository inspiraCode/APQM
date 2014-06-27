<%@ Control Language="C#" AutoEventWireup="true" CodeFile="RFQSummaryForm.ascx.cs"
    Inherits="RFQSummaryForm" %>
<%@ Register Src="../../Utils/Validator/Validator.ascx" TagName="Validator" TagPrefix="uc2" %>
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
    .styleRFQSelectionTable
    {
        width: 350px;
        border-color: lightgray;
        height: 140px;
    }
    .columnInfo
    {
        width: 200px;
    }
</style>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" OnInit="on_sqldatasource_Init"
    SelectCommand="SELECT SIFHeader.SIFHeaderKey, SIFHeader.InquiryNumber, BOMHeader.BOMHeaderKey, BOMDetail.BOMDetailKey, ItemMaster.PartNumber, SIFHeader.Application,
                BOMDetail.Material, BOMDetail.Description, SIFHeader.Product 
                FROM SIFHeader INNER JOIN BOMHeader ON SIFHeader.SIFHeaderKey = BOMHeader.SIFHeaderKey INNER JOIN 
                BOMDetail ON BOMHeader.BOMHeaderKey = BOMDetail.BOMHeaderKey INNER JOIN ItemMaster ON BOMDetail.ItemMasterKey = ItemMaster.ItemMasterKey 
                WHERE (BOMDetail.BOMDetailKey = @BOMDetailID)" ProviderName="System.Data.SqlClient">
    <SelectParameters>
        <asp:ControlParameter ControlID="txtBomDetailID" Name="BOMDetailID" PropertyName="Value" />
    </SelectParameters>
</asp:SqlDataSource>
<div id="divImgEmail" style="display: none; position: fixed; top: 50px; right: 100px;
    z-index: 1000;">
    <img id="" alt="" src="<%= ResolveUrl("~/Utils/loading.gif") %>" style="display: inline;
        position: relative;" />
    <span style="display: inline; position: relative;">Please wait..</span>
</div>
<div style="width: 100%; height: 120px;">
    <asp:FormView ID="frmRFQSummaryHeader" runat="server" DataSourceID="SqlDataSource1"
        Style="margin-top: 8px;" align="right">
        <ItemTemplate>
            <table cellspacing="0" class="style1">
                <tr>
                    <td align="right" class="style5">
                        InquiryNumber:
                    </td>
                    <td class="style4" style="background-color: #C0C0C0; width: 300px;">
                        <asp:Label ID="InquiryNumberLabel" inquiryNumber runat="server" Text='<%# Bind("InquiryNumber") %>' />
                    </td>
                </tr>
                <tr>
                    <td align="right" class="style5">
                        Finished Good Description:
                    </td>
                    <td class="style4" style="background-color: #C0C0C0">
                        <asp:Label ID="PartDescriptionLabel"  Width="100%" runat="server" Text='<%# Bind("Product") %>' />
                    </td>
                </tr>
                <tr>
                    <td align="right" class="style5">
                        SIF Program:
                    </td>
                    <td class="style4" style="background-color: #C0C0C0">
                        <asp:Label ID="TopPartNumberLabel" runat="server" Text='<%# Bind("Application") %>' />
                    </td>
                </tr>
                <tr>
                    <td align="right" class="style5">
                        Component Part Number:
                    </td>
                    <td class="style4" style="background-color: #C0C0C0">
                        <asp:Label ID="PartNumberLabel" partNumber runat="server" Text='<%# Bind("PartNumber") %>' />
                    </td>
                </tr>
                <tr>
                    <td align="right" class="style5">
                        Component Material:
                    </td>
                    <td class="style4" style="background-color: #C0C0C0">
                        <asp:Label ID="MaterialLabel" runat="server" Text='<%# Bind("Material") %>' />
                    </td>
                </tr>
                <%--<tr>
                <td align="right" class="style5">
                    Component Description:
                </td>
                <td class="style4" style="background-color: #C0C0C0">
                    <asp:Label ID="DescriptionLabel" runat="server" Text='<%# Bind("Description") %>' />
                </td>
            </tr>--%>
                <tr>
                    <td align="right" class="style5">
                        EAU:
                    </td>
                    <td class="style4" style="background-color: #C0C0C0">
                        <asp:TextBox ID="txtEAV" Width="100px" runat="server" mainEAV="" onchange="setEAVValues()"
                            onkeyup="setEAVValues()" Style="text-align: right;"></asp:TextBox>
                    </td>
                </tr>
            </table>
        </ItemTemplate>
    </asp:FormView>
    <div id="divEAV">
    </div>
</div>
<div align="center">
    <br />
    <div id="divSummaryDetail">
    </div>
</div>
<div id="divRFQSummaryHeader" align="left" style="clear: both; height: 500px;" runat="server"
    visible="false">
    <table align="left">
        <tr>
            <td>
                PPAP Date:
            </td>
            <td>
                <input type="text" id="txtPPAPDate" validate="date" validationid="rfqSummary" datepicker="true" />
            </td>
            <td style="width: 100px;">
            </td>
            <td>
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td>
                Initial Release Quantity:
            </td>
            <td>
                <input type="text" id="txtInitialReleaseQty" bindto="InitialReleaseQty" />
            </td>
            <td>
            </td>
            <td>
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td>
                Initial Release Date:
            </td>
            <td>
                <input type="text" id="txtInitialReleaseDate"validate="date" validationid="rfqSummary" datepicker="true" />
            </td>
            <td>
            </td>
            <td>
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td>
                Pre-Build Quanity:
            </td>
            <td>
                <input type="text" id="txtPreBuildQty" bindto="PrebuildQty" />
            </td>
            <td>
            </td>
            <td>
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td>
                Pre-Build Date
            </td>
            <td>
                <input type="text" id="txtPreBuildDate" validate="date" validationid="rfqSummary" datepicker="true" />
            </td>
            <td>
            </td>
            <td>
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td>
                Recommended Supplier
            </td>
            <td>
                <label id="lblRecommendedSupplier" value='' bindto="RecommendedSupplier" style="width: 300px;
                    background-color: #d3d3d3; height: 20px; display: block;">
                </label>
            </td>
            <td>
            </td>
            <td>
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td>
            </td>
            <td>
            </td>
            <td>
            </td>
            <td>
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td>
            </td>
            <td>
                &nbsp;
            </td>
            <td style="font-weight: bold">
                Purchasing
            </td>
            <td>
                All Recommendations
            </td>
            <td>
                <input type="text" id="txtPurchasingAllRecommendations" bindto="PurchasingAllRecommendations" />
            </td>
        </tr>
        <tr>
            <td>
            </td>
            <td>
            </td>
            <td style="font-weight: bold">
                Engineering
            </td>
            <td>
                All Concurrences
            </td>
            <td>
                <input type="text" id="txtEnginneringAllConcurrences" bindto="EngineeringAllConcurrences" />
            </td>
        </tr>
        <tr>
            <td>
            </td>
            <td>
            </td>
            <td style="font-weight: bold">
                Manufacturing
            </td>
            <td>
                All Concurrences
            </td>
            <td>
                <input type="text" id="txtManfufacturingAllConcurrences" bindto="ManufacturingAllConcurrences" />
            </td>
        </tr>
        <tr>
            <td>
            </td>
            <td>
            </td>
            <td style="font-weight: bold">
                Quality
            </td>
            <td>
                All Concurrences
            </td>
            <td>
                <input type="text" id="txtQualityAllConcurrences" bindto="QualityAllConcurrences" />
            </td>
        </tr>
        <tr>
            <td>
            </td>
            <td>
            </td>
            <td style="font-weight: bold">
                Sales
            </td>
            <td>
                All Concurrences
            </td>
            <td>
                <input type="text" id="txtSalesAllConcurrences" bindto="SalesAllConcurrences" />
            </td>
        </tr>
        <tr>
            <td>
            </td>
            <td>
            </td>
            <td>
            </td>
            <td>
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td align="right">
                Notes:
            </td>
            <td colspan="4" rowspan="3">
                <input type="text" id="txtNotes" bindto="Notes" style="height: 100px; width: 100%;" />
            </td>
        </tr>
        <tr>
            <td>
            </td>
        </tr>
        <tr>
            <td>
            </td>
        </tr>
    </table>
</div>
<asp:HiddenField ID="txtBomDetailID" runat="server" />
<input type="button" id="btnSave" value="Save" class="btnInTitle dontprint" style="right: 125px;
    width: 110px;" onclick="save(event, onSaveSuccess, onSaveFail)" validationid="rfqSummary" />


<div id="popupSelectRFQ" style="display:none;">
    <p>
        Do you wish to select this RFQ as a winner?
    </p>
    <table cellspacing="0" class="styleRFQSelectionTable" align="center" border="1px"
        style="width: 405px;">
        <tr>
            <td align="right" class="columnInfo">
                RFQ Number:
            </td>
            <td>
                <label id="RFQNumberLabel"></label>
            </td>
        </tr>
        <tr>
            <td align="right" class="columnInfo">
                Supplier Name:
            </td>
            <td>
                <label id="SupplierNameLabel">
                </label>
            </td>
        </tr>
        <tr>
            <td align="right" class="columnInfo">
                Inquiry Number:
            </td>
            <td>
                <label id="InquiryNumberLabel"></label>
            </td>
        </tr>
        <tr>
            <td align="right" class="columnInfo">
                Component Part Number:
            </td>
            <td>
                <label id="PartNumberLabel"></label>
            </td>
        </tr>
        <tr>
            <td align="right" class="columnInfo">
                Component Current Cost:
            </td>
            <td>
                <label id="CostLabel"></label>
            </td>
        </tr>
    </table>
    <br />
    <div style="border: solid 1px gray; background-color: #DADADA;">
        New Cost from RFQ:
        <label id="lblNewCost">
        </label>
        <br />
        <input type="checkbox" id="chkUpdateBOMLineCost" />Update Cost for this BOM Component
    </div>
    <br />
    <div align="center">
        <input type="button" id="btnSlectRFQ" value="Select" style="width: 90px" validationid="rfqSummary"  />
        <input type="button" id="btnCancel" value="Cancel" style="width:90px" />
    </div>
</div>



<uc2:Validator ID="uscValidator" runat="server" />
<script type="text/javascript">
    var bomDetailID;
    var RFQSummary;
    var dialogSelectRFQ;
    jQuery(document).ready(function () {
        

        dialogSelectRFQ = jQuery("#popupSelectRFQ").dialog({ autoOpen: false,
            appendTo: jQuery('form:first'),
            width: 560, height: 315, modal: false,
            dialogClass: "no-close", closeOnEscape: false
        });

        jQuery('#btnSlectRFQ').click(on_select_rfq);
        jQuery('#btnCancel').click(on_cancel_select_rfq);

        bomDetailID = jQuery('#<%= txtBomDetailID.ClientID %>').val();
        if (bomDetailID != "")
            getRFQSummary(bomDetailID);

    });
    function getRFQSummary(id) {
        jQuery.getJSON('<%= ResolveUrl("~/WebService/RFQSummary.aspx") %>?cmd=read&id=' + id, function (result) {
            RFQSummary = result;
            refreshForm();
            jQuery("#divImgEmail").css("display", "none");
        });
        return true;
    }
    var arrColumns = {};

    function resetForm() {

        jQuery("[bindTo]").each(function () {
            setValueForControl(this, jQuery(this), '');
        });

        jQuery("#txtPPAPDate").val("");
        jQuery("#txtInitialReleaseDate").val("");
        jQuery("#txtPreBuildDate").val("");

        jQuery("#divEAV").empty();
        jQuery('#divSummaryDetail').empty();


    }
    function loadEAUs() {
        var strTable = '<table id="tableEAUs" cellspacing="0" border="0">';
        //        strTable += '<tr><td><input type="radio" name="optEAU" checked="checked"></td><td>Manual</ td><td></ td></ tr>';
        //        strTable += '<tr><td><input type="radio" name="optEAU"></td><td>Equal to:</ td><td><input type="text" value="" id="txtEqualEAU" style="width:100px;"></ td></ tr>';
        strTable += '<tr><td></td><td style="text-align: right;">EAV</ td><td style="text-align: right;">Calendar Years</ td></ tr>';
        var eauGroupped = getEAUGroupped();
        for (current in eauGroupped) {
            if (eauGroupped.hasOwnProperty(current)) {
                strTable += '<tr><td><input optEAU_ID="' + current + '" type="radio" name="optEAU" onclick="onFilterEAU(event);"></td><td style="width: 70px;text-align: right;">' + current + '</ td><td style="width: 130px;text-align: right;"></ td></ tr>';
            }
        }
        strTable += '</ table>';
        jQuery("#divEAV").append(strTable);
        jQuery(":radio").eq(0).attr("checked", true);
        filterColumnsByEAU(jQuery(":radio").eq(0).parent().siblings().eq(0).text());
    }
    function getEAUGroupped() {
        var result = {};
        if (RFQSummary.RfqSummaryList != null) {
            for (var i = 0; i < RFQSummary.RfqSummaryList.length; i++) {
                var current = RFQSummary.RfqSummaryList[i];
                if (!(current.EstimatedAnnualVolume in result)) {
                    result[current.EstimatedAnnualVolume] = current.EstimatedAnnualVolume;
                }
            }
        }
        return result;
    }
    function onFilterEAU(e) {
        if (!e) e = window.event;
        var target = e.target || e.srcElement;
        var eau = jQuery(target).parent().siblings().eq(0).text();
        filterColumnsByEAU(eau);
    }
    var currentEAUFilter;
    function filterColumnsByEAU(eau) {
        jQuery('#opt' + eau).attr("checked", true);
        jQuery('[eav_volume]').hide();
        jQuery('[eav_volume="' + eau + '"]').show();
        currentEAUFilter = eau;
        jQuery('#divSummaryDetail').empty();
        loadDeatil();
        makeShapeshift();
    }
    function loadDeatil() {
        var htmlDetail = '<div align="left">';
        htmlDetail += '<table border="0" style="text-align: right; float: left; margin-top: 8px;">' +
        '            <tr>' +
        '                <td>' +
        '                    <table>' +
        '                        <tr style="height:16px;">' +
        '                        </tr>' +
        '                        <tr style="height:12px;">' +
        '                            <td>' +
        '                                <label>Supplier Name</ label>' +
        '                            </td>' +
        '                        </tr>' +
        '                        <tr style="height:12px;">' +
        '                            <td>' +
        '                                <label>Material</ label>' +
        '                            </td>' +
        '                        </tr>' +
        '                        <tr style="height:12px;">' +
        '                            <td>' +
        '                                <label>Material O/S</ label>' +
        '                            </td>' +
        '                        </tr>' +
        '                        <tr style="height:12px;">' +
        '                            <td>' +
        '                                <label>Scrap</ label>' +
        '                            </td>' +
        '                        </tr>' +
        '                        <tr style="height:12px;">' +
        '                            <td>' +
        '                                <label>Labor</ label>' +
        '                            </td>' +
        '                        </tr>' +
        '                        <tr style="height:12px;">' +
        '                            <td>' +
        '                                <label>Burden</ label>' +
        '                            </td>' +
        '                        </tr>' +
        '                        <tr style="height:12px;">' +
        '                            <td>' +
        '                                <label>Manufacturing Cost</ label>' +
        '                            </td>' +
        '                       </tr>' +
        '                        <tr style="height:12px;">' +
        '                            <td>' +
        '                                <label>SGA&A Profit</ label>' +
        '                            </td>' +
        '                        </tr>' +
        '                        <tr style="height:12px;">' +
        '                            <td>' +
        '                                <label>Packaging</ label>' +
        '                            </td>' +
        '                        </tr>' +
        '                        <tr style="height:12px;">' +
        '                            <td>' +
        '                                <label>Assembly Cost Per Unit</ label>' +
        '                            </td>' +
        '                        </tr>' +
        '                        <tr style="height:12px;">' +
        '                            <td>' +
        '                                <label>A Cost</ label>' +
        '                            </td>' +
        '                        </tr>' +
        '                        <tr style="height:12px;">' +
        '                            <td>' +
        '                                <label>B Cost</ label>' +
        '                            </td>' +
        '                        </tr>' +
        '                        <tr style="height:12px;">' +
        '                            <td>' +
        '                                <label>C Cost</ label>' +
        '                            </td>' +
        '                        </tr>' +
        '                        <tr style="height:12px;">' +
        '                            <td>' +
        '                                <label>Total Acquisition Cost</ label>' +
        '                            </td>' +
        '                        </tr>' +
        '                        <tr style="height:12px;">' +
        '                            <td>' +
        '                                <label>Estimated Annual Volume</ label>' +
        '                            </td>' +
        '                        </tr>' +
        '                        <tr style="height:12px;">' +
        '                            <td>' +
        '                                <label>Annual Purchase Cost</ label>' +
        '                            </td>' +
        '                        </tr>' +
        '                        <tr style="height:12px;">' +
        '                            <td>' +
        '                                <label>Tooling</ label>' +
        '                            </td>' +
        '                        </tr>' +
        '                        <tr style="height:12px;">' +
        '                            <td>' +
        '                                <label>Cavitation</ label>' +
        '                            </td>' +
        '                        </tr>' +
        '                        <tr style="height:12px;">' +
        '                            <td>' +
        '                                <label>Material</ label>' +
        '                            </td>' +
        '                        </tr>' +
        '                        <tr style="height:12px;">' +
        '                            <td></td>' +
        '                        </tr>' +
        '                    </table>' +
        '                </td>' +
        '            </tr>' +
        '        </table>' +
        '        <div id="zone" class="container" style="margin-left: 125px; position: relative;">';


        for (var i = 0; i < RFQSummary.RfqSummaryList.length; i++) {
            var current = RFQSummary.RfqSummaryList[i];
            if (current.EstimatedAnnualVolume == currentEAUFilter) {
                htmlDetail += '<div class="movible" style="position: absolute;" eav_volume="' + current.EstimatedAnnualVolume + '" >' +
        '            <table class="rfqUnselected" style="text-align: right; width: 100%;">' +
        '                <tr style="height:11px;">' +
        '                    <td align="center">' +
        '                        <label id="lblSelected">' + jQuery.trim(current.Eav_status) + '</ label>' +
        '                    </td>' +
        '                </tr>' +
        '                <tr style="height:11px;">' +
        '                    <td>' +
        '                        <a id="lnkSupplier" rfqHeaderKey=' + current.RfqHeaderKey + ' eavvol=' + current.EstimatedAnnualVolume + ' href="#" validationid="rfqSummary" onclick="on_selectRFQ(this);return false;"' +
        '                            title="" style="text-align: center;display: block; text-overflow: ellipsis; overflow: hidden; white-space: nowrap;' +
        '                            width: 70px;">' + jQuery.trim(current.SupplierName) + '</ a>' +
        '                    </td>' +
        '                </tr>' +
        '                <tr style="height:11px;">' +
        '                    <td>' +
        '                        <label id="lblMaterialTotal">' + jQuery.trim(current.MaterialTotal) + '</ label>' +
        '                    </td>' +
        '                </tr>' +
        '                <tr style="height:11px;">' +
        '                    <td>' +
        '                        <label id="lblServiceTotal">' + jQuery.trim(current.ServiceTotal) + '</ label>' +
        '                    </td>' +
        '                </tr>' +
        '                <tr style="height:11px;">' +
        '                    <td>' +
        '                        <label id="lblScrapTotal">' + current.ScrapTotal + '</ label>' +
        '                    </td>' +
        '                </tr>' +
        '                <tr style="height:11px;">' +
        '                    <td>' +
        '                        <label id="lblLaborTotal">' + current.LaborTotal + '</ label>' +
        '                    </td>' +
        '                </tr>' +
        '                <tr style="height:11px;">' +
        '                    <td>' +
        '                        <label id="lblBurdenTotal">' + current.BurdenTotal + '</ label>' +
        '                    </td>' +
        '                </tr>' +
        '                <tr style="height:11px;">' +
        '                    <td>' +
        '                        <label id="lblManufacturingCost">' + current.ManufacturingCost + '</ label>' +
        '                    </td>' +
        '                </tr>' +
        '                <tr style="height:11px;">' +
        '                    <td>' +
        '                        <label id="lblSgaProfit">' + current.SgaProfit + '</ label>' +
        '                    </td>' +
        '                </tr>' +
        '                <tr style="height:11px;">' +
        '                    <td>' +
        '                        <label id="lblPackingPerUnit">' + current.PackingPerUnit + '</ label>' +
        '                    </td>' +
        '                </tr>' +
        '                <tr style="height:11px;">' +
        '                    <td>' +
        '                       <label id="lblAssemblyCostPerUnit">' + current.AssemblyCostPerUnit + '</ label>' +
        '                    </td>' +
        '                </tr>' +
        '                <tr style="height:11px;">' +
        '                    <td>' +
        '                        <label id="lblTotalACost" item="' + i + '"  fieldName="lblTotalACost">' + current.TotalACost + '</ label>' +
        '                    </td>' +
        '                </tr>' +
        '                <tr style="height:11px;">' +
        '                    <td style="background-color: lightgray;">' +
        '                        <input type="text"  id="txtTotalBCost" item="' + i + '"  fieldName="txtTotalBCost" validate="number" validationid="rfqSummary"' +
        '                          onchange="summarizeColumn(' + i + ')" onkeyup="summarizeColumn(' + i + ')" style="width:100%;" class="textManual" value="' + current.TotalBCost + '" / >' +
        '                    </td>' +
        '                </tr>' +
        '                <tr style="height:11px;">' +
        '                    <td style="background-color: lightgray;">' +
        '                        <input type="text"  id="txtTotalCCost" item="' + i + '"  fieldName="txtTotalCCost" validate="number" validationid="rfqSummary"' +
        '                          onchange="summarizeColumn(' + i + ')" onkeyup="summarizeColumn(' + i + ')"   class="textManual" value="' + current.TotalCCost + '" / >' +
        '                    </td>' +
        '                </tr>' +
        '                <tr style="height:11px;">' +
        '                    <td>' +
        '                        <label id="lblTotalAcquisitionCost" item="' + i + '" fieldName="lblTotalAcquisitionCost" >0.000</ label>' +
        '                    </td>' +
        '                </tr>' +
        '                <tr style="height:11px;">' +
        '                    <td style="background-color: lightgray;">' +
        '                        <input type="text"  id="txtEAV"  item="' + i + '"  fieldName="txtEAV" validate="number" validationid="rfqSummary" ' +
        '                          onchange="summarizeColumn(' + i + ')" onkeyup="summarizeColumn(' + i + ')"    class="textManual" value="' + current.EAV + '" / >' +
        '                    </td>' +
        '                </tr>' +
        '                <tr style="height:11px;">' +
        '                    <td>' +
        '                        <label  id="lblAnnualPurchaseCost"  item="' + i + '"  fieldName="lblAnnualPurchaseCost">0.000</ label>' +
        '                    </td>' +
        '                </tr>' +
        '                <tr style="height:11px;">' +
        '                    <td>' +
        '                        <label id="txtTooling">' + current.Tooling + '</ label>' +
        '                    </td>' +
        '                </tr>' +
        '                <tr style="height:11px;">' +
        '                    <td>' +
        '                        <label id="txtCavitation" >' + current.Cavitation + '</ label>' +
        '                    </td>' +
        '                </tr>' +
        '                <tr style="height:11px;">' +
        '                    <td>' +
        '                        <label id="txtMaterial"  style="text-align: right;">' + current.MaterialTooling + '</ label>' +
        '                    </td>' +
        '                </tr>' +
        '                <tr style="height:11px;display: none;">' +
        '                    <td>' +
        '                        <input type="text"  id="txtSeq"  class="Sequence" style="width:20px;" value="' + current.Sequence + '" / >' +
        '                        <input type="text"  id="txtKey" style="width:20px;" value="' + current.RfqHeaderKey + '" / >' +
        '                        <input type="text"  id="txtRFQ_EAU"  style="width:20px;" value="' + current.EstimatedAnnualVolume + '" / >' +
        '                    </td>' +
        '                </tr>' +
        '            </table>' +
        '        </div></ div>';
            }
        }
        jQuery('#divSummaryDetail').append(htmlDetail);
        arrColumns = {};
        jQuery('[item]').each(function () {
            if (!arrColumns.hasOwnProperty(jQuery(this).attr("item")))
                arrColumns[jQuery(this).attr("item")] = jQuery("[item = " + jQuery(this).attr("item") + "]");

            summarizeColumn(jQuery(this).attr("item"));
        });
    }
    function refreshForm() {
        var scrollPosition = jQuery("body").scrollTop();
        resetForm();
        bindParentFields();

        loadDeatil();
        loadEAUs();

        //onFilterEAU(jQuery(":radio").eq(0));
        jQuery("body").scrollTop(scrollPosition);
    }


    function makeShapeshift() {
        var width = 0;
        var count = 0;
        jQuery('.movible:visible').each(function () {
            if (jQuery(this).outerWidth() > width) {
                width = jQuery(this).outerWidth() + 10;
            }
            count++;
        });
        jQuery('.movible').each(function () {
            jQuery(this).width(width);
            var strStatus = jQuery(this).children().children().children(":first").children().children().text();
            if (jQuery.trim(strStatus) == "SELECTED" || jQuery.trim(strStatus) == "AWARDED") {
                jQuery(this).children().removeClass("rfqUnselected").addClass("rfqSelected");
            }
        });
        width += 30;
        jQuery('#zone').width(width * count);
        jQuery('.container').shapeshift();
        jQuery('.container').on("ss-rearranged", function (e, selected) {
            var sort = 0;
            jQuery('.movible').each(function () {
                jQuery(this).find(".Sequence").val(sort++);
            });
        });
    }

    function setSort() {
        var sort = 0;
        jQuery('.movible').each(function () {
            jQuery(this).find(":hidden").eq(1).val(sort++);
        });
        return true;
    }

    function summarizeColumn(index) {
        var ACost = Number(arrColumns[index].filter('[fieldname=lblTotalACost]').text());
        var BCost = Number(arrColumns[index].filter('[fieldname=txtTotalBCost]').val());
        var CCost = Number(arrColumns[index].filter('[fieldname=txtTotalCCost]').val());

        var EAV = Number(arrColumns[index].filter('[fieldname=txtEAV]').val());

        var totalAcquisitionCost = ACost + BCost + CCost;

        arrColumns[index].filter('[fieldname=lblTotalAcquisitionCost]').text(totalAcquisitionCost.toFixed(3));
        arrColumns[index].filter('[fieldname=lblAnnualPurchaseCost]').text((EAV * totalAcquisitionCost).toFixed(3));

        RFQSummary.RfqSummaryList[index].TotalACost = ACost;
        RFQSummary.RfqSummaryList[index].TotalBCost = BCost;
        RFQSummary.RfqSummaryList[index].TotalCCost = CCost;
        RFQSummary.RfqSummaryList[index].EAV = EAV;
        RFQSummary.RfqSummaryList[index].TotalAcquisitionCost = totalAcquisitionCost.toFixed(3);
        RFQSummary.RfqSummaryList[index].AnnualPurchaseCost = (EAV * totalAcquisitionCost).toFixed(3);

    }


    function bindParentFields() {
        jQuery("[bindTo]").each(function () {
            var value = RFQSummary[jQuery(this).attr("bindTo")];
            setValueForControl(this, jQuery(this), value);
        });
        jQuery('#txtPPAPDate').val((new Date(RFQSummary.PpapDate)).toLocaleDateString());
        jQuery('#txtInitialReleaseDate').val((new Date(RFQSummary.InitialReleaseDate)).toLocaleDateString());
        jQuery('#txtPreBuildDate').val((new Date(RFQSummary.PrebuildDate)).toLocaleDateString());
    }

    function setValueForControl(ref, control, value) {
        switch (ref.type) {
            case 'text':
                control.val(value);
                break;
            case 'textarea':
                control.val(value);
                break;
            default:
                control.text(value);
                break;
        }
    }

    function retrieveValuesFromControls() {

        jQuery("[bindTo]").each(function () {
            getValueFromControl(this, jQuery(this), RFQSummary);
        });

        RFQSummary.PpapDate = jQuery('#txtPPAPDate').val();
        RFQSummary.InitialReleaseDate = jQuery('#txtInitialReleaseDate').val();
        RFQSummary.PrebuildDate = jQuery('#txtPreBuildDate').val();

        //        if (jQuery("#optQuote").is(':checked')) {
        //            RFQ.NoQuote = false;
        RFQSummary.BomDetailKey = bomDetailID;
    }

    function getValueFromControl(ref, control, sourceObject) {
        switch (ref.type) {
            case 'text':
                sourceObject[control.attr("bindTo")] = control.val();
                break;
            case 'textarea':
                sourceObject[control.attr("bindTo")] = control.val();
                break;
            default:
                sourceObject[control.attr("bindTo")] = control.text();
                break;
        }
    }

    function save(e, onSuccess, onFail) {

        if (validate(e)) {
            retrieveValuesFromControls(); //For RFQSummary variable

            var to = '<%= ResolveUrl("~/WebService/RFQSummary.aspx") %>?cmd=save';

            jQuery("#divImgEmail").css("display", "block");

            jQuery.ajax({
                type: "POST",
                url: to,
                data: JSON.stringify(RFQSummary),
                contentType: "application/json;charset=utf-8",
                dataType: "html",
                success: function (response) {
                    RFQSummary = jQuery.parseJSON(response);
                    refreshForm();
                    jQuery("#divImgEmail").css("display", "none");
                    try { onSuccess(); } catch (e) { }
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    if (console && console.log) {
                        console.debug(jqXHR);
                        console.debug(textStatus);
                        console.debug(errorThrown);
                    }
                    try { onFail(); } catch (e) { }
                }
            });
        }
    }

    function onSaveSuccess() {
        alertify.success("Information saved successfully.");
    }
    function onSaveFail() {
        alertify.error("An error has occurred.");
    }

    var mainEAV = jQuery('[mainEAV]');
    function setEAVValues() {
        jQuery('[fieldName=txtEAV]').each(function () { jQuery(this).val(mainEAV.val()) });
        jQuery('[item]').each(function () { summarizeColumn(jQuery(this).attr("item")) });
    }
    function getRFQSummaryDetail(rfqHeaderKey, EAU) {
        if (RFQSummary.RfqSummaryList != null) {
            for (var i = 0; i < RFQSummary.RfqSummaryList.length; i++) {
                var current = RFQSummary.RfqSummaryList[i];
                if (current.RfqHeaderKey == rfqHeaderKey && current.EstimatedAnnualVolume == EAU) {
                    return current;
                }
            }
        }
        return null;
    }
    function on_select_rfq() {
        var e = event;
        if (validate(e)) {
            retrieveValuesFromControls(); //For RFQSummary variable
            var costBom = -1;
            if (jQuery("#chkUpdateBOMLineCost").is(':checked')){
                costBom = selected.TotalACost
            }
            var to = '<%= ResolveUrl("~/WebService/RFQSummary.aspx") %>?cmd=selectRFQ&rfqheaderkey=' + selected.RfqHeaderKey + '&eavKey=' + selected.RfqEAVKey + '&newBomCost=' + costBom;

            jQuery("#divImgEmail").css("display", "block");

            jQuery.ajax({
                type: "POST",
                url: to,
                data: JSON.stringify(RFQSummary),
                contentType: "application/json;charset=utf-8",
                dataType: "html",
                success: function (response) {
                    RFQSummary = jQuery.parseJSON(response);
                    refreshForm();
                    jQuery("#divImgEmail").css("display", "none");
                    dialogSelectRFQ.dialog("close");
                    alertify.success("Information saved successfully.");
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    if (console && console.log) {
                        console.debug(jqXHR);
                        console.debug(textStatus);
                        console.debug(errorThrown);
                    }
                    alertify.error("An error has occurred.");
                }
            });
        }
    }
    var selected = null;
    function on_selectRFQ(link) {
        link = jQuery(link);

        selected = getRFQSummaryDetail(link.attr("rfqheaderkey"), link.attr("eavvol"));
        if (selected != null) {
            jQuery('#RFQNumberLabel').text(selected.RfqNumber);
            jQuery('#SupplierNameLabel').text(selected.SupplierName);
            jQuery('#InquiryNumberLabel').text(jQuery('[inquiryNumber]').text());
            jQuery('#PartNumberLabel').text(jQuery('[partNumber]').text());
//            jQuery('#CostLabel').text();
            jQuery('#lblNewCost').text(selected.TotalACost);
            dialogSelectRFQ.dialog("open");
        }
        
    }
    function on_cancel_select_rfq() {
        dialogSelectRFQ.dialog("close");
        selected = null;
    }
</script>
