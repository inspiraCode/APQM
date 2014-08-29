<%@ Page Language="C#" AutoEventWireup="true" CodeFile="BOM_Main.aspx.cs" MasterPageFile="~/_Layouts/MasterStatic.master"
    Inherits="BOM_BOM_Main" %>

<%@ Register Src="bomStatusInfo.ascx" TagName="bomStatusInfo" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderBase" runat="Server">
    <style type="text/css">
        .camposSinBordes
        {
            border-top: 0px;
            border-bottom: 0px;
            border-right: 0px;
            border-left: 0px;
        }
        .itemFields
        {
            background-color: #D3D3D3;
            border: solid #D3D3D3 2px;
        }
        .tableCell
        {
            overflow: hidden; /*border: solid 1px;
        border-left: 0px;*/
            font-size: 10px;
        }
        .BOMLine
        {
            left: 200px;
            position: relative;
            border-radius: 4px;
            border: solid 1px dimgray;
            color: black; /*background-color:#A9A9A9;*/
        }
        .Imported
        {
            background: #A9A9A9;
        }
        .Created
        {
            background: #B0E0E6;
        }
        .ForAdd
        {
            background: #FFD700;
        }
        .ForEdit
        {
            background: #D8BFD8;
        }
        .InProgress
        {
            background: #8FBC8F;
        }
        .NoQuote
        {
            background: #F0E68C;
        }
        .Processed
        {
            background: #F0E68C;
        }
        
        
        #accordion .ui-accordion-content
        {
            width: 100%;
            background-color: #f3f3f3;
            color: #777;
            font-size: 10pt;
            line-height: 16pt;
        }
        .gradientBG
        {
            background-image: -webkit-gradient(
	linear,
	left top,
	left bottom,
	color-stop(0, #A9A9A9 ),
	color-stop(1, #EDE6EA)
);
            background-image: -o-linear-gradient(bottom, #A9A9A9  0%, #EDE6EA 100%);
            background-image: -moz-linear-gradient(bottom, #A9A9A9  0%, #EDE6EA 100%);
            background-image: -webkit-linear-gradient(bottom, #A9A9A9  0%, #EDE6EA 100%);
            background-image: -ms-linear-gradient(bottom, #A9A9A9  0%, #EDE6EA 100%);
            background-image: linear-gradient(to bottom, #A9A9A9  0%, #EDE6EA 100%);
        }
        .style3
        {
            width: 125px;
        }
        .group
        {
            zoom: 1;
        }
        .labelContent
        {
            background-color: #D3D3D3;
        }
    </style>
    <div id="divImgEmail" style="display: block; position: fixed; width: 105px; height: 35px;
        z-index: 1000; background-color: white; border: 2px solid gray; padding: 5px;">
        <img alt="" src="<%= ResolveUrl("~/Utils/loading.gif") %>" style="display: inline;
            position: relative;" />
        <span style="display: inline; position: relative;">Please wait..</span>
    </div>
    <div style="position: absolute; top: 32px; left: 135px; font-size: 30px;">
        <label id="lblInquiryNumber" bindto="InquiryNumber">
        </label>
        <label id="lblRevision" bindto="Revision">
        </label>
    </div>
    <div align="left">
        <br />
        <table cellspacing="1" align="left" style="width: 600px;">
            <tr style="height: 25px;">
                <td align="right" style="font-weight: bold" class="style3">
                    Product
                </td>
                <td align="left" class="style4" colspan="3">
                    <label id="lblProduct" bindto="PartDescription">
                    </label>
                </td>
                <td align="left" class="style6" rowspan="5">
                </td>
            </tr>
            <tr style="height: 25px;">
                <td align="right" style="font-weight: bold" class="style3">
                    Finished Good PN
                </td>
                <td align="left" class="style4">
                    <input type="text" id="txtPartNumber" style="width: 120px;" bindto="TopPartNumber" />
                </td>
                <td align="right" style="font-weight: bold" class="style8">
                    Market Sector
                </td>
                <td align="left" class="style6">
                    <label id="lblMarketSector" bindto="MarketSector">
                    </label>
                </td>
            </tr>
            <tr style="height: 25px;">
                <td align="right" style="font-weight: bold" class="style3">
                    Sales Rep
                </td>
                <td align="left" class="style4">
                    <label id="lblSalesRep" bindto="SalesPerson">
                    </label>
                </td>
                <td align="right" style="font-weight: bold" class="style8">
                    Status
                </td>
                <td align="left" class="style6">
                    <div id="progressBar" style="height: 20px; width: 100px;">
                        <div id="progress-label">
                        </div>
                    </div>
                </td>
            </tr>
            <tr style="height: 25px;">
                <td align="right" style="font-weight: bold" class="style3">
                    Customer
                </td>
                <td align="left" class="style4">
                    <label id="lblCustomer" bindto="CustomerName">
                    </label>
                </td>
                <td align="right" style="font-weight: bold" class="style8">
                    &nbsp;
                </td>
                <td align="left" class="style6">
                    &nbsp;
                </td>
            </tr>
            <tr style="height: 25px;">
                <td class="style3">
                </td>
                <td colspan="2" align="left">
                    &nbsp;
                </td>
                <td align="left">
                </td>
            </tr>
        </table>
    </div>
    <div style="position: relative; float: right;">
        <uc1:bomStatusInfo ID="uscBomStatusInfo" runat="server" />
    </div>
    <div style="clear: both; width: 1280px; margin-left: auto; margin-right: auto;">
        <table cellspacing="0" align="left" style="margin-left: 130px;">
            <tr>
                <th class="camposSinBordes" style="width: 73px; min-width: 73px; max-width: 73px;">
                    Assigned To
                </th>
                <th class="camposSinBordes" style="width: 75px; min-width: 75px; max-width: 75px;">
                    Status
                </th>
                <th class="camposSinBordes" style="width: 72px; min-width: 72px; max-width: 72px;display: none;">
                    Sales LN
                </th>
                <th class="camposSinBordes itemFields" style="width: 132px; min-width: 132px; max-width: 132px;">
                    Component Part Number
                </th>
                <th class="camposSinBordes itemFields" style="width: 80px; min-width: 80px; max-width: 80px;
                    display: none;">
                    Capsonic PN
                </th>
                <th class="camposSinBordes itemFields" style="width: 80px; min-width: 80px; max-width: 80px;
                    display: none;">
                    Customer PN
                </th>
                <th class="camposSinBordes itemFields" style="width: 90px; min-width: 90px; max-width: 90px;
                    display: none;">
                    Manufacture PN
                </th>
                <th class="camposSinBordes itemFields" style="width: 80px; min-width: 80px; max-width: 80px;
                    display: none;">
                    Supplier PN
                </th>
                <th class="camposSinBordes itemFields" style="width: 80px; min-width: 80px; max-width: 80px;
                    display: none;">
                    Comm Code
                </th>
                <th class="camposSinBordes itemFields" style="width: 220px; min-width: 220px; max-width: 220px;">
                    Component Part Description/Material
                </th>
                <th class="camposSinBordes itemFields" style="width: 68px; min-width: 68px; max-width: 68px;">
                    UM
                </th>
                <th class="camposSinBordes itemFields" style="width: 60px; min-width: 60px; max-width: 60px;">
                    Cost
                </th>
                <th class="camposSinBordes" style="width: 70px; min-width: 70px; max-width: 70px;
                    display: none;">
                    Vendor Quote Est
                </th>
                <th class="camposSinBordes" style="width: 60px; min-width: 60px; max-width: 60px;">
                    Qty Required
                </th>
                <th class="camposSinBordes" style="width: 50px; min-width: 50px; max-width: 50px;
                    display: none;">
                    Cap Com Assm
                </th>
                <th class="camposSinBordes" style="width: 147px; min-width: 147px; max-width: 147px;">
                    Purchasing Comments
                </th>
                <th class="camposSinBordes" style="width: 70px; min-width: 70px; max-width: 70px;
                    display: none;">
                    Sales Status
                </th>
                <th class="camposSinBordes" style="width: 147px; min-width: 147px; max-width: 147px;">
                    Sales Comments
                </th>
                <th class="camposSinBordes" style="width: 50px; min-width: 50px; max-width: 50px;
                    display: none;">
                    Directed Buy
                </th>
                <th class="camposSinBordes" style="width: 110px; min-width: 110px; max-width: 110px;">
                    Purchasing Status
                </th>
                <th style="border-color: Gray;" class="camposSinBordes">
                </th>
            </tr>
        </table>
        <div id="divBOMDetailList" style="width: 1280px;">
        </div>
    </div>
    <br />
    <div align="center" class="gradientBG" style="position: fixed; left: 0px; width: 100%;
        bottom: 0; padding: 5px; border-top: solid 1px black;">
        <div id="divButtonsLeftSide" style="float: left;">
            <input type="button" id="btnNewRFQ" value="New RFQ" />
            <input type="button" value="Select All" onclick="on_select_all_lines();" />
            <input type="button" value="Unselect All" onclick="on_unselect_all_lines();" />
            <input type="button" id="btnNoQuote" onclick="on_noQuote_click();" value="No Quote" />
            <input type="button" id="btnQuote" onclick="on_Quote_click();" value="Quote" />
        </div>
        <div id="divButtonsRightSide" style="float: right; margin-right: 10px;">
            <input type="button" id="btnEdifBOM" onclick="on_btnEditBOM_click();" value="Edit BOM" />
            <input type="button" id="btnSaveBOM" onclick="on_save_bom();" value="Save" />
            <input type="button" id="btnCancel" value="Refresh" onclick="location.reload(true);return false;" />
            <input type="button" value="SIF Volumes" onclick="on_openSIFDetail();" />
            <input type="button" id="btnReportSelectedRFQs" value="Report Selected RFQs" />
            <input type="button" id="btnReportAllRFQs" value="Report All RFQs" />
            <input type="button" id="btnPrintBOM" value="BOM Print" />
        </div>
    </div>
    <br />
    <div id="divDialog_SifDetail" title="Projected Annual Volume" style="display: none;">
        <div align="center">
            <div style="border-radius: 10px; border: solid #D3D3D3; background-color: #D3D3D3;
                height: 45px; min-width: 160px; display: inline-block;">
                <div id="divSIFDetail">
                </div>
            </div>
        </div>
        <div align="right">
            <input type="button" value="Close" id="btnClosePopup" onclick="on_closeSIFDetail();" />
        </div>
    </div>
    <div id="divDialog_EditBOM" title="BOM Edit" style="display: none; font-size: 9px;">
        <%--<div id="divEditBOMContainer" style="height: 420px; width: 960px; overflow-y: auto;
            align: center;">--%>
        <div id="divEditBOM">
        </div>
        <%--</div>--%>
        <br />
        <input type="button" id="btnOKBOMEdit" value="OK" onclick="on_ok_BOM_Edit();" style="width: 100px;
            float: right;" />
    </div>
    <div id="divDialog_ResendRFQ" title="Re-send RFQ" style="display: none;">
        <div align="center">
            <div id="divResendRFQ">
                <table cellspacing="0">
                    <tr>
                        <td align="right">
                            <b style="margin-right: 5px;">RFQ to Re-Send:</b>
                        </td>
                        <td>
                            <label id="lblRFQNumber" style="width: 350px;">
                            </label>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <b style="margin-right: 5px;">Supplier:</b>
                        </td>
                        <td>
                            <label id="lblSupplier" style="width: 350px;">
                            </label>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <b style="margin-right: 5px;">Email:</b>
                        </td>
                        <td>
                            <input type="text" id="txtEmail" style="width: 350px;" />
                        </td>
                    </tr>
                    <tr style="height: 40px;">
                        <td colspan="2">
                            <div id="divPleaseWait" style="display: none;">
                                <img id="imgPleaseWaitResendRFQ" alt="" src="../Utils/loading.gif" style="display: inline;" />
                                <span style="position: relative; top: -10px;">Please wait..</span>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td align="center" colspan="3">
                            <input type="button" id="btnResendRFQ" onclick="return false;" style="width: 80px;"
                                value="Re-Send" />
                            <input type="button" id="btnCancelResendRFQ" onclick="on_closeResendRFQ();" value="Cancel"
                                style="width: 80px;" />
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
    <div id="divDialog_PartNumber" title="Part Number" style="display: none;">
        <div id="divPartNumberContent">
            <table>
                <tr>
                    <td>
                        Part Number
                    </td>
                    <td>
                        <div id="divPartNumber">
                        </div>
                    </td>
                </tr>
            </table>
        </div>
        <br />
        <input type="button" id="btnCancelPartNumber" onclick="on_cancel_PartNumber();return false;"
            value="Cancel" style="width: 100px; float: right;" />
        <input type="button" id="btnOKPartNumber" value="OK" style="width: 100px; float: right;" />
    </div>
    <div id="divDialog_EditOrCreate_BOMLine" title="BOM Component" style="display: none;">
        <div id="divDialog_EditOrCreate_Content" style="height: 500px;">
            <table>
                <tr>
                    <td style="vertical-align: top;">
                        <table cellspacing="1" style="margin-left: auto; margin-right: auto;">
                            <tr>
                                <td align="right">
                                    <b>#</b>
                                </td>
                                <td align="left" class="labelContent">
                                    <label id="lblLineNumberPopup">
                                    </label>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <b>Assigned To</b>
                                </td>
                                <td align="left" class="labelContent">
                                    <label id="lblAssignedToPopup">
                                    </label>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <b>Status</b>
                                </td>
                                <td align="left" class="labelContent">
                                    <label id="lblStatusPopup">
                                    </label>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <b>Sales LN</b>
                                </td>
                                <td align="left" class="labelContent">
                                    <label id="lblSalesLNPopup">
                                    </label>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <b>Part Number</b>
                                </td>
                                <td align="left">
                                    <div id="divPartNumberPopup">
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <b>Capsonic PN</b>
                                </td>
                                <td align="left">
                                    <input type="text" id="txtCapsonicPNPopup" />
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <b>Customer PN</b>
                                </td>
                                <td align="left">
                                    <input type="text" id="txtCustomerPNPopup" />
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <b>Manufacture PN</b>
                                </td>
                                <td align="left">
                                    <input type="text" id="txtManufacturePNPopup" />
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <b>Supplier PN</b>
                                </td>
                                <td align="left">
                                    <input type="text" id="txtSupplierPNPopup" />
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <b>Comm Code</b>
                                </td>
                                <td align="left">
                                    <input type="text" id="txtCommCodePopup" />
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <b>Material</b>
                                </td>
                                <td align="left">
                                    <textarea id="txtMaterialPopup" rows="3" cols="40"></textarea>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <b>UOM</b>
                                </td>
                                <td align="left">
                                    <div id="divUMPopup">
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <b>Cost</b>
                                </td>
                                <td align="left">
                                    <input type="text" id="txtCostPopup" />
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <b>Vendor Quote Est</b>
                                </td>
                                <td align="left">
                                    <input type="text" id="txtVendorQuoteEstPopup" />
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <b>Quantity Required</b>
                                </td>
                                <td align="left">
                                    <input type="text" id="txtQtyPopup" />
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td>
                        <table>
                            <tr>
                                <td align="right">
                                    <b>Cap Com Assm</b>
                                </td>
                                <td align="left">
                                    <input type="text" id="txtCapComAssmPopup" />
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <b>Purchasing Comments</b>
                                </td>
                                <td align="left">
                                    <textarea id="txtPurchasingCommentsPopup" rows="3" cols="40"></textarea>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <b>Sales Status</b>
                                </td>
                                <td align="left" class="labelContent">
                                    <label id="lblSalesStatusPopup">
                                    </label>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <b>Sales Comments</b>
                                </td>
                                <td align="left" class="labelContent">
                                    <label id="lblSalesCommentsPopup">
                                    </label>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <b>Drected Buy</b>
                                </td>
                                <td align="left">
                                    <input type="checkbox" id="chkDirectedBuyPopup" />
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <b>Purchasing Status</b>
                                </td>
                                <td align="left" class="labelContent">
                                </td>
                            </tr>
                            <tr>
                                <tr style="height: 30px;">
                                </tr>
                                <td colspan="2">
                                    <div>
                                        Attachments (less than 4MB per file):<br />
                                        <div id="uploadZone">
                                            Upload
                                        </div>
                                        <div style="background-color: #D3D3D3; width: 449px; min-height: 200px;">
                                            <br />
                                            <div id="divAttachmentsPopup">
                                            </div>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </div>
        <br />
        <input type="button" id="btnCancelEditOrCreateBOMLine" onclick="on_cancel_EditOrCreateBOMLine();return false;"
            value="Cancel" style="width: 100px; float: right;" />
        <input type="button" id="btnOKEditOrCreateBOMLine" value="OK" style="width: 100px;
            float: right;" />
    </div>
    <script type="text/javascript">
        var popupRFQScreen = null;
        jQuery(document).ready(function () {
            jQuery("#spanTitle").text("BOM");
            jQuery('#divImgEmail').css("top", (jQuery(window).height() / 2) - (jQuery('#divImgEmail').outerHeight() / 2));
            jQuery('#divImgEmail').css("left", (jQuery(window).width() / 2) - (jQuery('#divImgEmail').outerWidth() / 2));
            load();
            jQuery('#divDialog_EditBOM').on('shown.bs.modal', function () {
                jQuery(document).off('focusin.bs.modal');
            });

            jQuery("#btnReportAllRFQs").click(function () {
                window.open("../HTMLReports/SalesReport_AllRFQs.aspx?BOM=" + BOM.Id);
            });

            jQuery("#btnReportSelectedRFQs").click(function () {
                window.open("../HTMLReports/SalesReport.aspx?BOM=" + BOM.Id);
            });

            jQuery("#btnNewRFQ").click(function () {
                if (jQuery("h3 input:checkbox:checked").length > 0) {
                    popupRFQScreen = window.open("../RFQ/NewRFQ.aspx");
                } else {
                    alertify.log("You have not selected any component to quote.");
                }
            });

            jQuery("#btnPrintBOM").click(function () {
                window.open("BOM_Print.aspx?bom=" + BOM.Id);
            });

        });
        function setEventHanlderToCheckBoxes() {
            jQuery("#accordionBOM [type=checkbox]").click(function () {
                BOM.BomDetail[jQuery(this).parents("[bomlineindex]").attr("bomlineindex")].selected = this.checked;
            });
        }

        function load() {
            jQuery("#divImgEmail").css("display", "block");
            var params = urlParamsToObject();
            if (params.hasOwnProperty('bom')) {
                getBOM(params.bom);
            }
        }

        function urlParamsToObject() {
            var result = {};
            var urlParams = location.search.split('?');
            for (var i = 1; i < urlParams.length; i++) {
                var paramsDictionary = urlParams[i].split('=');
                result[paramsDictionary[0]] = paramsDictionary[1];
            }
            return result;
        }

        var BOM;
        function getBOM(id) {
            jQuery.getJSON('<%= ResolveUrl("~/WebService/BOM.aspx") %>?cmd=read&id=' + id, function (result) {
                BOM = result;
                refreshForm();
                getResources();
            });
            return true;
        }

        function resetForm() {

            jQuery("[bindTo]").each(function () {
                setValueForControl(this, jQuery(this), '');
            });

            jQuery("#lblDueDate").text("");

            jQuery("#divSIFDetail").empty();
            jQuery("#divBOMDetailList").empty();
        }

        function loadSIFDetail() {

            var strSIFDetail = '<table border="0" style="text-align: right; float: left;">' +
                '    <tr> ' +
                '        <td> ' +
                '            <table> ' +
                '                <tr height="12px;"> ' +
                '                    <td> ' +
                '                        <label id="lblProgramYear" >Program Year' +
                '                        </label> ' +
                '                    </td> ' +
                '                </tr> ' +
                '                <tr height="12px;"> ' +
                '                    <td> ' +
                '                        <label id="lblProjectedAnnualVolume" >Projected Annual Volume' +
                '                        </label> ' +
                '                    </td> ' +
                '                </tr> ' +
                '            </table> ' +
                '        </td> ' +
                '    </tr> ' +
                '</table> ' +
                '<table> ' +
                '<tr> ';
            for (var i = 0; i < BOM.SifDetail.length; i++) {
                var current = BOM.SifDetail[i];
                strSIFDetail += '<td> ' +
                    '<table style="text-align: right;"> ' +
                    '    <tr height="11px;"> ' +
                    '        <td> ' +
                    '            <label id="lblYear"' + i + '>' + current.ProgramYear +
                    '            </label> ' +
                    '        </td> ' +
                    '    </tr> ' +
                    '    <tr height="11px;"> ' +
                    '        <td> ' +
                    '            <label id="lblMaterialTotal"' + i + '>' + current.ProjectedAnnualVolume +
                    '            </label> ' +
                    '        </td> ' +
                    '    </tr> ' +
                    '</table> ' +
                    '</td> ';
            }
            strSIFDetail += '</tr></table>';

            jQuery("#divSIFDetail").html(strSIFDetail);
        }

        function on_openSIFDetail() {
            jQuery("#divDialog_SifDetail").dialog({ autoOpen: true,
                appendTo: jQuery('form:first'),
                width: 520, modal: false, closeOnEscape: false
            });
        }

        function getRFQByID(iBOMLine_ID, iRFQ_ID) {
            for (var i = 0; i < BOM.BomDetail.length; i++) {
                if (BOM.BomDetail[i].Id == iBOMLine_ID) {
                    for (var j = 0; j < BOM.BomDetail[i].RFQList.length; j++) {
                        if (BOM.BomDetail[i].RFQList[j].Id == iRFQ_ID) {
                            return BOM.BomDetail[i].RFQList[j];
                        }
                    }
                }
            }
            return null;
        }
        function on_openResendRFQ(iBOMLine_ID, iRFQ_ID) {
            jQuery("#btnResendRFQ").prop("disabled", false);
            jQuery("#btnCancelResendRFQ").prop("disabled", false);
            jQuery("#divPleaseWait").hide();

            var rfqToResend = getRFQByID(iBOMLine_ID, iRFQ_ID);
            if (rfqToResend != null) {

                jQuery("#lblSupplier").text(rfqToResend.SupplierName);
                jQuery("#lblRFQNumber").text(rfqToResend.RfqGenerated);

                jQuery("#txtEmail").val('');
                if (rfqToResend.LastEmail != "") {
                    jQuery("#txtEmail").val(rfqToResend.LastEmail);
                } else {
                    var aSupplier = getSupplierByID(rfqToResend.SupplierId);
                    if (aSupplier != null) {
                        jQuery("#txtEmail").val(aSupplier.ContactEmail);
                    }
                }

                jQuery("#btnResendRFQ").unbind("click").click(function () { resendRFQ(rfqToResend, afterResendRFQ); });

                jQuery("#divDialog_ResendRFQ").dialog({ autoOpen: true,
                    appendTo: jQuery('form:first'),
                    width: 520, modal: false, closeOnEscape: false
                });
            } else {
                alertify.alert("An error has occurried. Could not find RFQ to Re-Send.");
            }
        }

        function afterResendRFQ(response) {
            var rfqUpdated = response.Result;
            jQuery("#divDialog_ResendRFQ").dialog("close");
        }

        function resendRFQ(rfqToResend, onSuccess) {

            if (rfqToResend == null) {
                alertify.alert("Error: RFQ not found, try refreshing the page.");
                jQuery("#btnResendRFQ").prop("disabled", false);
                jQuery("#btnCancelResendRFQ").prop("disabled", false);
                return;
            }
            jQuery("#btnResendRFQ").prop("disabled", true);
            jQuery("#btnCancelResendRFQ").prop("disabled", true);

            rfqToResend.LastEmail = jQuery("#txtEmail").val();

            var to = '<%= ResolveUrl("~/WebService/RFQ.aspx") %>?cmd=resendrfq';

            jQuery("#divPleaseWait").show();
            jQuery("#divImgEmail").css("display", "block");
            var rfqUpdated = null;
            jQuery.ajax({
                type: "POST",
                url: to,
                data: JSON.stringify(rfqToResend),
                contentType: "application/json;charset=utf-8",
                dataType: "html",
                success: function (response) {
                    response = jQuery.parseJSON(response);
                    if (response.ErrorThrown === false) {
                        try { onSuccess(response); } catch (e) { }
                        alertify.success(response.ResponseDescription);
                    } else {
                        try { onFail(); } catch (e) { }
                        alertify.alert(response.ResponseDescription);
                    }
                    jQuery("#divImgEmail").hide();
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    if (console && console.log) {
                        console.log(jqXHR);
                        console.log(textStatus);
                        console.log(errorThrown);
                    }
                    try {
                        onFail();
                    } catch (e) { }
                    jQuery("#btnResendRFQ").prop("disabled", false);
                    jQuery("#btnCancelResendRFQ").prop("disabled", false);
                    jQuery("#divPleaseWait").hide();
                    jQuery("#divImgEmail").hide();
                }
            });
        }

        function on_closeSIFDetail() {
            jQuery("#divDialog_SifDetail").dialog("close");
        }
        function on_closeResendRFQ() {
            jQuery("#divDialog_ResendRFQ").dialog("close");
        }

        var indexSortFrom = -1;
        var indexSortTo = -1;

        function loadBOMDetailList() {

            var strBOMDetailList = '<div style="clear: both; top: 30px;"> ' +
'    <div id="accordionBOM" style="position: relative;"> ';

            for (var j = 0; j < BOM.BomDetail.length; j++) {
                var current = BOM.BomDetail[j];
                if (current.Status == null) current.Status = "";
                if (current.User == '') current.User = 'Take';
                strBOMDetailList += '<div class="group" bomLineIndex="' + j + '"><h3 bomDetailID="' + current.Id + '" class="' + current.internalAction.replace(' ', '') + '" style="height: 37px;"> ' +
'    <div> <label class="LN" style="float: left; position: absolute;left: 5px;top: 16px;">' + (j + 1) + '</label>' +
'    <input type="checkbox" internalAction="' + current.internalAction.replace(' ', '') + '"  style="float: left; position: absolute;left: 30px;top:14px;" clickeableInHeader="true" /> ' +
'    <input type="image" internalAction="' + current.internalAction.replace(' ', '') + '" src="../pics/delete-small.png" style="height:20px;top:14px;float: left;position: absolute; left: 60px;" ' +
'    onclick="deleteBOMLineByID(' + current.Id + ',this);return false;" clickeableInHeader="true" /> ' +
'    <input type="image" internalAction="' + current.internalAction.replace(' ', '') + '" src="../pics/edit-small.png" style="height:20px;top:14px;float:left;position:absolute;left: 90px;" onclick="updateBOMLineByID(' + current.Id + ',this);return false;" clickeableInHeader="true"/>' +
'    <input type="image" internalAction="' + current.internalAction.replace(' ', '') + '" src="../pics/FilterIcon.png" style="height:20px;top:14px;float: left;position: absolute; left: 120px;" ' +
'    onclick="openRFQSummary(' + current.Id + ',this);return false;" clickeableInHeader="true" /> ' +
'<a href="#" clickeableInHeader="true" onclick="on_takeSIF_click(' + current.Id + ',afterTakeSIF);return false;" style="float: left; position: absolute;left: 150px;top: 16px;">' + current.User + '</a>' +
'    <table cellspacing="0" align="left" style="top:-3px;" class="BOMLine"> ' +
'    <tr style="height: 40px; white-space: nowrap;"> ' +
'    <td align="center" class="tableCell" style="width: 70px; min-width: 70px; max-width: 70px;"> ' +
'        <label id="lblStatus" >' + current.Status + '</label> ' +
'    </td> ' +
'    <td align="center" class="tableCell" style="width: 70px; min-width: 70px; max-width: 70px;display: none;"> ' +
'        <label id="lblSalesLN" >' + current.LinePosition + '</label> ' +
'    </td> ' +
'    <td class="tableCell" style="width: 132px; min-width: 132px; max-width: 132px;text-align:center;"> ' +
'        <label id="lblPartNumber" >' + current.PartNumber + '</label> ' +
'    </td> ' +
'    <td align="center" class="tableCell" style="width: 81px; min-width: 81px; max-width: 81px; ' +
'        display: none;"> ' + current.CapsonicPN +
'    </td> ' +
'    <td align="center" class="tableCell" style="width: 81px; min-width: 81px; max-width: 81px; ' +
'        display: none;"> ' + current.CustomerPN +
'    </td> ' +
'    <td align="center" class="tableCell" style="width: 100px; min-width: 100px; max-width: 100px;display:none;"> ' + current.ManufacturePN +
'    </td> ' +
'    <td align="center" class="tableCell" style="width: 81px; min-width: 81px; max-width: 81px; ' +
'        display: none;"> ' + current.SupplierPN +
'    </td> ' +
'    <td align="center" class="tableCell" style="width: 85px; min-width: 85px; max-width: 85px;display:none;"> ' + current.CommCode +
'    </td> ' +
'    <td class="tableCell" style="width: 230px; min-width: 230px; max-width: 230px;white-space: normal;"><div style="overflow-y:auto;height: 40px;">' + current.Material +
'    </div></td> ' +
'    <td align="center" class="tableCell" style="width: 70px; min-width: 70px; max-width: 70px;"> ' + current.Um +
'    </td> ' +
'    <td align="right" class="tableCell" style="width: 60px; min-width: 60px; max-width: 60px;"> ' + current.Cost +
'    </td> ' +
'    <td align="center" class="tableCell" style="width: 70px; min-width: 70px; max-width: 70px;display:none;"> ' + current.VendorQuoteEst +
'    </td> ' +
'    <td align="right" class="tableCell" style="width: 63px; min-width: 63px; max-width: 63px;"> ' + current.Qty +
'    </td> ' +
'    <td align="center" class="tableCell" style="width: 60px; min-width: 60px; max-width: 60px;display:none;"> ' + current.CapComAssm +
'    </td> ' +
'    <td align="left" class="tableCell" style="width: 147px; min-width: 147px; max-width: 147px;white-space: normal;"><div style="overflow-y:auto;height: 30px;padding-left: 5px;">' + current.PurchasingComments +
'    </div></td> ' +
'    <td align="center" class="tableCell" style="width: 70px; min-width: 70px; max-width: 70px;display:none;"> ' + current.SalesStatus +
'    </td> ' +
'    <td class="tableCell" style="width: 147px; min-width: 147px; max-width: 147px;"> ' + current.SalesComments +
'    </td> ' +
'    <td align="center" class="tableCell" style="width: 60px; min-width: 60px; max-width: 60px;display:none;"> ' + current.DirectedBuy +
'    </td> ' +
'    <td align="center" class="tableCell" style="width: 125px; min-width: 125px; max-width: 125px;"> ' + current.PurchasingStatus +
'    </td></tr></table></div></h3><div accordionContainer>';

                strBOMDetailList += getRFQsDataTableByBOMLine(current);
                strBOMDetailList += '</div></div>';
            }


            strBOMDetailList += '</div></div><br><br>';

            jQuery("#divBOMDetailList").html(strBOMDetailList);

            jQuery("#accordionBOM").accordion({
                activate: function (event, ui) {
                    var vActive = jQuery(this).accordion("option", "active");
                    if (vActive.toString() !== "false") {
                        var bomDetailKey;
                        bomDetailKey = ui.newHeader.attr("bomDetailId");

                        var to = '<%= ResolveUrl("~/WebService/RFQ.aspx") %>?cmd=readbybomlineid&bomlineid=' + bomDetailKey;
                        jQuery("#divImgEmail").css("display", "block");

                        var theTable = jQuery("[parentid=" + bomDetailKey + "]").DataTable();
                        theTable.css("visibility", "hidden");
                        theTable.fnDestroy();

                        jQuery.ajax({
                            type: "POST",
                            url: to,
                            data: null,
                            contentType: "application/json;charset=utf-8",
                            dataType: "html",
                            success: function (response) {
                                response = jQuery.parseJSON(response);
                                if (response.ErrorThrown === false) {
                                    for (var i = 0; i < BOM.BomDetail.length; i++) {
                                        var currentBOMLine = BOM.BomDetail[i];
                                        if (currentBOMLine.Id == bomDetailKey) {
                                            currentBOMLine.RFQList = response.Result;
                                            theTable.parent().html(getRFQsDataTableByBOMLine(currentBOMLine));

                                            jQuery("[parentid=" + bomDetailKey + "]").dataTable({
                                                "aaData": getRFQArray(currentBOMLine, currentBOMLine.RFQList),
                                                "aoColumns": [
                                                null,
                                               null,
                                                null,
                                                null,
                                                { "sType": "date",
                                                    "mRender": function (data, type, full) {
                                                        return formatDate(data);
                                                    }
                                                },
                                                null,
                                                null,
                                                { "sType": "date",
                                                    "mRender": function (data, type, full) {
                                                        return formatDateTime(data);
                                                    }
                                                },
                                                null
                                            ],
                                                "bDestroy": true,
                                                "bStateSave": true,
                                                "bFilter": false,
                                                "bLengthChange": false,
                                                "bInfo": false,
                                                "bPaginate": false

                                            }).show();
                                            break;
                                        }
                                    }

                                } else {
                                    theTable.parent().html(response.ResponseDescription);
                                }
                                jQuery("#divImgEmail").hide();
                            },
                            error: function (jqXHR, textStatus, errorThrown) {
                                if (console && console.log) {
                                    console.log(jqXHR);
                                    console.log(textStatus);
                                    console.log(errorThrown);
                                }
                                try {
                                    onFail();
                                } catch (e) { }
                                jQuery("#divImgEmail").hide();
                            }
                        });

                        //                        ui.newPanel.load('<%= ResolveUrl("~/RFQ/RFQList.aspx") %>?bomComponent=' + bomDetailKey + '&noCache=' + Number(new Date()) + ' #clientID_GridRFQList',
                        //                                    function (responseTxt, statusTxt, xhr) {
                        //                                        if (statusTxt == "success")
                        //                                            jQuery('.dataTable').dataTable({
                        //                                                "bDestroy": true,
                        //                                                "bStateSave": true,
                        //                                                "bFilter": false,
                        //                                                "bLengthChange": false,
                        //                                                "bInfo": false,
                        //                                                "bPaginate": false
                        //                                            }).show();
                        //                                        if (statusTxt == "error")
                        //                                            alert("Error: " + xhr.status + ": " + xhr.statusText);
                        //                                    });
                        //                        ui.newPanel.show();
                    }
                },
                active: false,
                collapsible: true,
                heightStyle: "content",
                icons: null,
                clearStyle: true,
                header: "> div > h3"
            }).sortable({
                axis: "y",
                handle: "h3",
                stop: function (event, ui) {
                    ui.item.children("h3").triggerHandler("focusout");
                    jQuery(this).accordion("refresh");
                    jQuery(".LN").each(function (index, value) {
                        var line = jQuery(this).parents("[bomlineindex]");
                        var currentIndex = line.attr("bomLineIndex");
                        if (currentIndex == indexSortFrom) indexSortTo = index;
                        jQuery(this).text((index + 1));
                        line.attr("bomLineIndex", index);
                    });
                    arraymove(BOM.BomDetail, Number(indexSortFrom), Number(indexSortTo));
                    for (var i = 0; i < BOM.BomDetail.length; i++) {
                        BOM.BomDetail[i].Sequence = i;
                    }
                },
                start: function (event, ui) {
                    var draggedLine = jQuery(event.toElement);
                    indexSortFrom = jQuery(draggedLine.parents("[bomLineIndex]")).attr("bomLineIndex");
                }
            });

            //            jQuery('.dataTable').dataTable({
            //                "bDestroy": true,
            //                "bStateSave": true,
            //                "bFilter": false,
            //                "bLengthChange": false,
            //                "bInfo": false,
            //                "bPaginate": false
            //            }).show();


            clickeableInHeader();
            hideLineButtonsForUnsavedLines();

        }

        function openRFQSummary(iBOMLineID) {
            window.open("../RFQ/Summary/RFQSummary_Main.aspx?bomline=" + iBOMLineID);
        }

        function hideLineButtonsForUnsavedLines() {
            jQuery('[internalAction]').css("visibility", "visible");
            jQuery('[internalAction="ForAdd"],[internalAction="ForEdit"]').css("visibility", "hidden");
        }

        function arraymove(arr, fromIndex, toIndex) {
            var element = arr[fromIndex]
            arr.splice(fromIndex, 1);
            arr.splice(toIndex, 0, element);
        }
        function getRFQArray(bomLine, arrRFQList) {
            var result = [];
            for (var i = 0; i < arrRFQList.length; i++) {
                var currentRFQ = arrRFQList[i];
                var oCurrent = ['<input type="image" src="../pics/delete-icon.png" style="height:20px;" ' +
                    '    onclick="deleteRFQByID(' + bomLine.Id + ',' + currentRFQ.Id + ');return false;" />' +
                    '<input type="image" src="../pics/edit-icon.png" style="height:20px;margin-left: 5px;" id="updateRFQByID" onclick="updateRFQByID(' + currentRFQ.Id + ');return false;" />' +
                    '<input type="image" src="../pics/mail_send_icon.png" style="height:20px;margin-left: 5px;" onclick="on_openResendRFQ(' + bomLine.Id + ',' + currentRFQ.Id + ');return false;" />',
                                currentRFQ.CreatedBy,
                                currentRFQ.DrawingLevel,
                                currentRFQ.RfqGenerated,
                                currentRFQ.DueDate,
                                currentRFQ.Status,
                                currentRFQ.SupplierName,
                                currentRFQ.SentToVendor,
                                currentRFQ.LastEmail
                                ];
                result.push(oCurrent);
            }
            return result;
        }
        //        function getRFQsTableByBOMDetail(bomLine) {
        //            var strRFQDetailList = '<table class="display dataTable" parentID=' + bomLine.Id + '><thead>';
        //            strRFQDetailList += '<tr><th style="width: 30px;min-width: 30px;max-width: 30px;"></th><th>Created By</th><th>Drawing Rev</th><th>RFQ Number</th><th>Due Date</th>' +
        //            //'<th>Component Part Number</th>' +
        //                '<th>Status</th><th>Vendor</th><th>Last Sent To Vendor</th><th>Last Email</th></tr></thead><tbody>';
        //            if (bomLine.RFQList != null) {
        //                for (var r = 0; r < bomLine.RFQList.length; r++) {
        //                    var currentRFQ = bomLine.RFQList[r];

        //                    strRFQDetailList += '<tr>';
        //                    strRFQDetailList += '<td><input type="image" src="../pics/delete-icon.png" style="height:20px;" id="deleteRFQByID" ' +
        //                    '    onclick="deleteRFQByID(' + bomLine.Id + ',' + currentRFQ.Id + ');return false;" />' +
        //                    '<input type="image" src="../pics/edit-icon.png" style="height:20px;margin-left: 5px;" id="updateRFQByID" onclick="updateRFQByID(' + currentRFQ.Id + ');return false;" />' +
        //                    '<input type="image" src="../pics/mail_send_icon.png" style="height:20px;margin-left: 5px;" onclick="on_openResendRFQ(' + bomLine.Id + ',' + currentRFQ.Id + ');return false;" /></td>';
        //                    strRFQDetailList += '<td>' + currentRFQ.CreatedBy + '</td>';
        //                    strRFQDetailList += '<td>' + currentRFQ.DrawingLevel + '</td>';
        //                    strRFQDetailList += '<td>' + currentRFQ.RfqGenerated + '</td>';
        //                    strRFQDetailList += '<td>' + currentRFQ.DueDate + '</td>';
        //                    strRFQDetailList += '<td>' + currentRFQ.Status + '</td>';
        //                    strRFQDetailList += '<td>' + currentRFQ.SupplierName + '</td>';
        //                    strRFQDetailList += '<td>' + currentRFQ.SentToVendor + '</td>';
        //                    strRFQDetailList += '<td>' + currentRFQ.LastEmail + '</td>';
        //                    strRFQDetailList += '</tr>';
        //                }
        //            }
        //            strRFQDetailList += '</tbody></table></div></div>';
        //            return strRFQDetailList;
        //        }

        function getRFQsDataTableByBOMLine(bomLine) {
            var strRFQDetailList = '<table class="display dataTable" style="text-align: center;" parentID=' + bomLine.Id + '><thead>';
            strRFQDetailList += '<tr><th style="width: 30px;min-width: 30px;max-width: 30px;"></th><th>Created By</th><th>Drawing Rev</th><th>RFQ Number</th><th>Due Date</th>' +
            //'<th>Component Part Number</th>' +
                '<th>Status</th><th>Vendor</th><th>Last Sent To Vendor</th><th>Last Email</th></tr></thead><tbody></table>';
            return strRFQDetailList;
        }


        function clickeableInHeader() {
            jQuery('[clickeableInHeader="true"]').click(function (e) {
                e.stopPropagation();
            });
        }
        function refreshForm() {

            var scrollPosition = jQuery("body").scrollTop();
            resetForm();
            bindParentFields();
            loadSIFDetail();
            loadBOMDetailList();
            makeProgresBar();
            setEventHanlderToCheckBoxes();
            jQuery("body").scrollTop(scrollPosition);

        }

        function refreshDetail() {
            var scrollPosition = jQuery("body").scrollTop();
            jQuery("#divBOMDetailList").empty();
            loadBOMDetailList();
            makeProgresBar();
            setEventHanlderToCheckBoxes();
            jQuery("body").scrollTop(scrollPosition);
        }

        function bindParentFields() {
            jQuery("[bindTo]").each(function () {
                var value = BOM[jQuery(this).attr("bindTo")];
                setValueForControl(this, jQuery(this), value);
            });
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
                getValueFromControl(this, jQuery(this), BOM);
            });


            for (var i = 0; i < BOM.BomDetail.length; i++) {
                var current = BOM.BomDetail[i];
                current.BomHeaderKey = BOM.Id;
                if (current.CapComAssm == null) current.CapComAssm = '';
                if (current.CapsonicPN == null) current.CapsonicPN = '';
                if (current.CommCode == null) current.CommCode = '';
                if (current.Cost == null) current.Cost = 0;
                if (current.CustomerPN == null) current.CustomerPN = '';
                if (current.Description == null) current.Description = '';
                if (current.DirectedBuy == null) current.DirectedBuy = false;
                if (current.Id == null) current.Id = -1;
                //if (current.Item == null) current.Item = '';
                if (current.ItemDescription == null) current.ItemDescription = '';
                if (current.ItemMasterkey == null) current.ItemMasterkey = -1;
                if (current.ItemMaterial == null) current.ItemMaterial = '';
                if (current.ItemUm == null) current.ItemUm = '';
                if (current.LinePosition == null) current.LinePosition = '';
                if (current.ManufacturePN == null) current.ManufacturePN = '';
                if (current.Material == null) current.Material = '';
                if (current.PartNumber == null) current.PartNumber = '';
                if (current.PurchasingComments == null) current.PurchasingComments = '';
                if (current.PurchasingStatus == null) current.PurchasingStatus = '';
                if (current.Qty == null) current.Qty = 0;
                if (current.SalesComments == null) current.SalesComments = '';
                if (current.SalesStatus == null) current.SalesStatus = '';
                if (current.Status == null) current.Status = '';
                if (current.SupplierPN == null) current.SupplierPN = '';
                if (current.Um == null) current.Um = '';
                if (current.User == null) current.User = '';
                if (current.VendorQuoteEst == null) current.VendorQuoteEst = '';
                if (current.internalAction == null) current.internalAction = '';
            }
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

        function afterDeleteRFQ(iBOMLineID, iRFQ_ID) {
            for (var i = 0; i < BOM.BomDetail.length; i++) {
                var currentBOMLine = BOM.BomDetail[i];
                if (currentBOMLine.Id == iBOMLineID) {
                    for (var j = 0; j < currentBOMLine.RFQList.length; j++) {
                        var currentRFQ = currentBOMLine.RFQList[j];
                        if (currentRFQ.Id == iRFQ_ID) {
                            currentBOMLine.RFQList.splice(j, 1);
                            var theTable = jQuery("[parentid=" + iBOMLineID + "]").DataTable();
                            theTable.css("visibility", "hidden");
                            theTable.fnDestroy();
                            theTable.parent().html(getRFQsDataTableByBOMLine(currentBOMLine));

                            jQuery("[parentid=" + iBOMLineID + "]").dataTable({
                                "aaData": getRFQArray(currentBOMLine, currentBOMLine.RFQList),
                                "aoColumns": [
                                                null,
                                                null,
                                                null,
                                                null,
                                                {
                                                    "sType": "date",
                                                    "mRender": function (data, type, full) {
                                                        return formatDate(data);
                                                    }
                                                },
                                                null,
                                                null,
                                                {
                                                    "sType": "date",
                                                    "mRender": function (data, type, full) {
                                                        return formatDateTime(data);
                                                    }
                                                },
                                                null
                                            ],
                                "bDestroy": true,
                                "bStateSave": true,
                                "bFilter": false,
                                "bLengthChange": false,
                                "bInfo": false,
                                "bPaginate": false

                            }).show();
                            alertify.success("RFQ deleted successfully;");
                            return;
                        }
                    }
                }
            }
        }

        function afterDeleteBOMLine(iIndex) {
            BOM.BomDetail.splice(iIndex, 1);
            jQuery("#divBOMDetailList").css("visibility", "hidden");
            jQuery(".dataTable").DataTable().fnDestroy();
            jQuery("#accordionBOM").accordion("destroy");
            jQuery("#divBOMDetailList").empty();
            loadBOMDetailList();
            jQuery("#divBOMDetailList").css("visibility", "visible");
            setEventHanlderToCheckBoxes();
            alertify.success("BOM Line deleted successfully;");
        }
        function updateRFQByID(iRFQ_ID) {
            window.open("../RFQ/rfqFormMain.aspx?rfq=" + iRFQ_ID);
        }
        function deleteRFQByID(iBOMLineID, iRFQ_ID) {
            if (confirm("Are you sure?")) {
                var to = '<%= ResolveUrl("~/WebService/RFQ.aspx") %>?cmd=delete&id=' + iRFQ_ID;

                jQuery("#divImgEmail").css("display", "block");

                jQuery.ajax({
                    type: "POST",
                    url: to,
                    data: {},
                    contentType: "application/json;charset=utf-8",
                    dataType: "html",
                    success: function (response) {
                        response = JSON.parse(response);
                        if (response.Result == "OK") {
                            afterDeleteRFQ(iBOMLineID, iRFQ_ID);
                        } else {
                            alertify.error(response);
                        }
                        //refreshForm();

                        jQuery("#divImgEmail").hide();
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        if (console && console.log) {
                            console.log(jqXHR);
                            console.log(textStatus);
                            console.log(errorThrown);
                        }
                        try {
                            onFail();
                        } catch (e) { }
                    }
                });
            }
        }

        var selectizePartNumberCreateEdit, selectizeUMCreateEdit;
        function populatePartNumberPopup() {
            var strPartNumberSelect = '<select id="cboPartNumbersEditCreate" style="width: 263px;">';
            //            for (var i = 0; i < Items.length; i++) {
            //                var current = Items[i];
            //                strPartNumberSelect += '<option value="' + current.Id + '">' + current.PartNumber + '</option>';
            //            }
            strPartNumberSelect += '</select>';

            jQuery("#divPartNumberPopup").html(strPartNumberSelect);
            var selectizePartNumber = jQuery("#cboPartNumbersEditCreate").selectize({
                create: true,
                options: Items,
                valueField: 'Id',
                labelField: 'PartNumber',
                searchField: 'PartNumber',
                openOnFocus: false
            });

            selectizePartNumberCreateEdit = jQuery(selectizePartNumber)[0].selectize;
        }
        function populateUMPopup() {
            var strUMSelect = '<select id="cboUMsEditCreate" style="width: 263px;">';
            strUMSelect += '</select>';

            jQuery("#divUMPopup").html(strUMSelect);
            var selectizeUM = jQuery("#cboUMsEditCreate").selectize({
                create: true,
                options: UMs,
                valueField: 'Um',
                labelField: 'Um',
                searchField: 'Um',
                openOnFocus: false
            });

            selectizeUMCreateEdit = jQuery(selectizeUM)[0].selectize;
        }
        function updateBOMLineByID(iBOMLineID, src) {
            try {
                populatePartNumberPopup();
                populateUMPopup();

                var index = jQuery(src).parents("[bomLineIndex]").attr("bomLineIndex");
                var oBOMLineToUpdate = BOM.BomDetail[index];
                if (oBOMLineToUpdate != null) {

                    jQuery("#lblLineNumberPopup").text((Number(oBOMLineToUpdate.Sequence) + 1));
                    jQuery("#lblAssignedToPopup").text(oBOMLineToUpdate.User);
                    jQuery("#lblStatusPopup").text(oBOMLineToUpdate.Status);
                    jQuery("#lblSalesLNPopup").text(oBOMLineToUpdate.LinePosition);
                    selectizePartNumberCreateEdit.setValue(oBOMLineToUpdate.ItemMasterkey);
                    jQuery("#txtCapsonicPNPopup").val(oBOMLineToUpdate.CapsonicPN);
                    jQuery("#txtManufacturePNPopup").val(oBOMLineToUpdate.ManufacturePN);
                    jQuery("#txtSupplierPNPopup").val(oBOMLineToUpdate.SupplierPN);
                    jQuery("#txtCustomerPNPopup").val(oBOMLineToUpdate.CustomerPN);
                    jQuery("#txtCommCodePopup").val(oBOMLineToUpdate.CommCode);
                    jQuery("#txtMaterialPopup").val(oBOMLineToUpdate.Material);
                    selectizeUMCreateEdit.addOption({ Um: oBOMLineToUpdate.Um.toLowerCase() });
                    selectizeUMCreateEdit.setValue(oBOMLineToUpdate.Um.toLowerCase());
                    jQuery("#txtCostPopup").val(oBOMLineToUpdate.Cost);
                    jQuery("#txtVendorQuoteEstPopup").val(oBOMLineToUpdate.VendorQuoteEst);
                    jQuery("#txtQtyPopup").val(oBOMLineToUpdate.Qty);
                    jQuery("#txtCapComAssmPopup").val(oBOMLineToUpdate.CapComAssm);
                    jQuery("#txtPurchasingCommentsPopup").val(oBOMLineToUpdate.PurchasingComments);
                    jQuery("#lblSalesStatusPopup").text(oBOMLineToUpdate.SalesStatus);
                    jQuery("#lblSalesCommentsPopup").text(oBOMLineToUpdate.SalesComments);
                    jQuery("#chkDirectedBuyPopup").prop('checked', oBOMLineToUpdate.DirectedBuy);

                    jQuery("#btnOKEditOrCreateBOMLine").unbind("click").click(function () { saveOrCreateBOMLine(oBOMLineToUpdate); });

                    var urlAttachments = '<%= ResolveUrl("~/WebService/BOM.aspx") %>';

                    jQuery(".ajax-upload-dragdrop").remove();
                    jQuery("#divAttachmentsPopup").empty();
                    loadAttachments(oBOMLineToUpdate);
                    jQuery("#uploadZone").uploadFile({
                        url: urlAttachments,
                        multiple: false,
                        fileName: "myfile",
                        uploadButtonClass: "ajax-file-upload-green",
                        maxFileSize: 4194304,
                        showStatusAfterSuccess: false,
                        showAbort: false,
                        showDone: false,
                        onError: function (files, status, errMsg) {
                            //files: list of files
                            //status: error status
                            //errMsg: error message
                            alertify.alert("Error: " + errMsg);
                        },
                        onSuccess: function (files, data, xhr) {
                            var resp = jQuery.parseJSON(data);
                            if (resp.length == 2) {
                                oBOMLineToUpdate.AttachmentsFolder = resp[0].FolderName;
                                oBOMLineToUpdate.AttachmentsList = resp[1];
                                jQuery("#divAttachmentsPopup").empty();
                                loadAttachments(oBOMLineToUpdate);
                            }
                        },
                        onSubmit: function (a, b, c, d) {
                            this.url = urlAttachments + "?ATTACHMENTSFOLDER=" + oBOMLineToUpdate.Id;
                        }
                    });

                    loadAttachments(oBOMLineToUpdate);

                    jQuery("#divDialog_EditOrCreate_BOMLine").dialog({ autoOpen: true,
                        appendTo: jQuery('form:first'),
                        width: 900, modal: true, closeOnEscape: false
                    });

                } else {
                    alertify.alert("An error has occurried. Could not find BOM Line to update.");
                }
            } catch (e) {
                alertify.alert("An error has occurried: " + e.message);
            }
        }
        function loadAttachments(oBOMLine) {
            if (oBOMLine.AttachmentsList != null) {

                var strTable = '<table id="tableAttachments">';
                for (var i = 0; i < oBOMLine.AttachmentsList.length; i++) {
                    var current = oBOMLine.AttachmentsList[i];

                    strTable += '<tr fileName="' + current.FileName + '"><td style="width: 380px;">';
                    strTable += '<a href="<%= ResolveUrl("~/WebService/BOM.aspx") %>?cmd=downloadAttachment&Directory=' + current.Directory + '&FileName=' + current.FileName + '">' + current.FileName + '</a>';
                    strTable += '</td><td>';
                    strTable += '<a style="margin-left:10px;" href="#" onclick="deleteAttachment(\'' + current.Directory + '\', \'' + current.FileName + '\');return false;">Delete</a><br />';
                    strTable += '</td></tr>';
                }

                strTable += '</table>';
                jQuery("#divAttachmentsPopup").html(strTable);

            } else {
                jQuery("#divAttachmentsPopup").html('No files attached.');
            }
        }
        function deleteAttachment(directory, fileName) {
            jQuery("#divImgEmail").css("display", "block");
            jQuery.ajax({
                type: "POST",
                url: '<%= ResolveUrl("~/WebService/BOM.aspx") %>?cmd=deleteAttachment&Directory=' + directory + '&FileName=' + fileName,
                contentType: "application/json;charset=utf-8",
                dataType: "html",
                success: function (response) {
                    response = jQuery.parseJSON(response);
                    if (response.Result) {
                        jQuery("#tableAttachments tr").filter('[FileName="' + fileName + '"]').remove();
                        alertify.success(response.Result);
                    } else {
                        alertify.error("An error has occurried. Please try again.");
                    }
                    jQuery("#divImgEmail").hide();
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    if (console && console.log) {
                        console.log(jqXHR);
                        console.log(textStatus);
                        console.log(errorThrown);
                    }
                    alertify.error('An error has occurred.');
                }
            });
        }
        function on_cancel_EditOrCreateBOMLine() {
            jQuery("#divDialog_EditOrCreate_BOMLine").dialog("close");
        }
        function saveOrCreateBOMLine(oBOMLineToSave) {
            oBOMLineToSave.internalAction = "For Edit";
            var oPartNumber = getItemByID(selectizePartNumberCreateEdit.getValue());
            if (oPartNumber != null) {
                oBOMLineToSave.PartNumber = oPartNumber.PartNumber;
            }
            else {
                oBOMLineToSave.PartNumber = selectizePartNumberCreateEdit.getValue();
            }
            oBOMLineToSave.CapsonicPN = jQuery("#txtCapsonicPNPopup").val();
            oBOMLineToSave.ManufacturePN = jQuery("#txtManufacturePNPopup").val();
            oBOMLineToSave.SupplierPN = jQuery("#txtSupplierPNPopup").val();
            oBOMLineToSave.CustomerPN = jQuery("#txtCustomerPNPopup").val();
            oBOMLineToSave.CommCode = jQuery("#txtCommCodePopup").val();
            oBOMLineToSave.Material = jQuery("#txtMaterialPopup").val();
            var oUM = null; // getItemByID(selectizeUMCreateEdit.getValue());
            if (oUM != null) {
                oBOMLineToSave.Um = oUM.UM;
            }
            else {
                oBOMLineToSave.Um = selectizeUMCreateEdit.getValue();
            }
            oBOMLineToSave.Cost = jQuery("#txtCostPopup").val();
            oBOMLineToSave.VendorQuoteEst = jQuery("#txtVendorQuoteEstPopup").val();
            oBOMLineToSave.Qty = jQuery("#txtQtyPopup").val();
            oBOMLineToSave.CapComAssm = jQuery("#txtCapComAssmPopup").val();
            oBOMLineToSave.PurchasingComments = jQuery("#txtPurchasingCommentsPopup").val();
            oBOMLineToSave.DirectedBuy = jQuery("#chkDirectedBuyPopup").is(':checked');
            refreshDetail();
            jQuery("#divDialog_EditOrCreate_BOMLine").dialog("close");
        }

        function deleteBOMLineByID(iBOMLineID, src) {
            if (confirm("Are you sure?")) {
                if (iBOMLineID == null) {
                    afterDeleteBOMLine(jQuery(src).parents("[bomLineIndex]").attr("bomLineIndex"));
                    return;
                }

                var to = '<%= ResolveUrl("~/WebService/BOM.aspx") %>?cmd=delete&id=' + iBOMLineID;

                jQuery("#divImgEmail").css("display", "block");

                jQuery.ajax({
                    type: "POST",
                    url: to,
                    data: {},
                    contentType: "application/json;charset=utf-8",
                    dataType: "html",
                    success: function (response) {
                        console.debug(response);
                        response = JSON.parse(response);
                        if (response.Result == "OK") {
                            afterDeleteBOMLine(jQuery(src).parents("[bomLineIndex]").attr("bomLineIndex"));
                        } else {
                            alertify.error(response);
                        }
                        //refreshForm();

                        jQuery("#divImgEmail").hide();
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        if (console && console.log) {
                            console.log(jqXHR);
                            console.log(textStatus);
                            console.log(errorThrown);
                        }
                        try {
                            onFail();
                        } catch (e) { }
                    }
                });
            }
        }
        function makeProgresBar() {

            var countProcessed = 0;
            for (var i = 0; i < BOM.BomDetail.length; i++) {
                var currentLine = BOM.BomDetail[i];
                if (currentLine.Status == "Processed" || currentLine.Status == "No Quote") {
                    countProcessed++;
                }
            }
            var value = 0;
            if (countProcessed > 0)
                value = countProcessed * 100 / BOM.BomDetail.length;

            var progressBar = jQuery('#progressBar');
            var progressLabel = jQuery('#progress-label');
            progressBar.css("position", "relative");
            progressLabel.css("position", "absolute").css("left", "40%").css("top", "3px");
            progressBar.progressbar({
                value: false,
                change: function () {
                    progressLabel.text(progressBar.progressbar("value") + "%");
                    progressLabel.css("left", "40%");
                },
                complete: function () {
                    progressLabel.text("Complete!");
                    progressLabel.css("left", "23%");
                }
            });
            progressBar.progressbar({ value: Number(value.toFixed(1)) });
        }

        function on_ok_BOM_Edit() {
            jQuery("#divDialog_EditBOM").dialog("close");
        }

        function on_btnEditBOM_click() {
            jQuery("#divDialog_EditBOM").dialog({ autoOpen: true,
                appendTo: jQuery('form:first'),
                width: 1020, height: 550, modal: false,
                resizable: false,
                closeOnEscape: false,
                close: function (event, ui) {
                    var oneWasEdited = false;
                    for (var i = BOM.BomDetail.length - 1; i >= 0; i--) {
                        var current = BOM.BomDetail[i];
                        var toDelete = true;
                        if (current.internalAction == "For Edit" || current.internalAction == "For Add") oneWasEdited = true;
                        for (prop in current) {
                            if (current.hasOwnProperty(prop)) {
                                if (current[prop] != null && prop != 'internalAction') {
                                    toDelete = false;
                                    break;
                                }
                            }
                        }
                        if (toDelete) {
                            BOM.BomDetail.splice(i, 1);
                        }
                    }

                    if (oneWasEdited) {
                        for (var i = 0; i < BOM.BomDetail.length; i++) {
                            BOM.BomDetail[i].Sequence = i;
                        }

                        refreshForm();
                        on_unselect_all_lines();
                    }
                },
                resize: function (event, ui) {
                    //                    var divEditBOMContainer = jQuery("#divEditBOMContainer");
                    //                    divEditBOMContainer.width(ui.size.width - 40);
                    //                    divEditBOMContainer.height(ui.size.height - 95);
                },
                open: function () {
                    //                    var divEditBOMContainer = jQuery("#divEditBOMContainer");
                    //                    divEditBOMContainer.width(jQuery(this).width() - 30);
                    //                    divEditBOMContainer.height(jQuery(this).height() - 65);
                }
            });

            var bomContent = BOM.BomDetail;
            for (var i = 0; i < BOM.BomDetail.length; i++) {
                BOM.BomDetail[i].PartNumberCell = '<input type="button" onclick="on_partNumber_click(' + i + ');return false;" />' + BOM.BomDetail[i].PartNumber;
            }

            jQuery("#divEditBOM").handsontable({
                data: bomContent,
                //width: 1850,
                width: 1000,
                height: 450,
                colWidths: [70, 70, 60, 130, 90, 90, 90, 90, 70, 200, 50, 80, 100, 80, 70, 150, 70, 90, 70, 110],
                minRows: 20,
                minSpareRows: 1,
                fixedColumnsLeft: 4,
                rowHeaders: true,
                manualColumnResize: true,
                colHeaders: ['Assigned To', 'Status', 'Sales LN', 'Part Number',
                            'Capsonic PN', 'Customer PN', 'Manufacture PN', 'Supplier PN', 'Comm Code',
                            'Material', 'UOM', 'Cost', 'Vendor Quote Est', 'Qty', 'Cap Com Assm', 'Purchasing Comments',
                             'Sales Status', 'Sales Comments', 'Directed Buy', 'Purchasing Status'],
                columns: [

                            {
                                data: "User",
                                readOnly: true
                            },
                            {
                                data: "Status",
                                readOnly: true
                            },
                            {
                                data: "LinePosition",
                                readOnly: true
                            },
                            {
                                data: "PartNumberCell",
                                readOnly: true,
                                renderer: "html"
                            },
                            {
                                data: "CapsonicPN"
                            },
                            {
                                data: "CustomerPN"
                            },
                            {
                                data: "ManufacturePN"
                            },
                            {
                                data: "SupplierPN"
                            },
                            {
                                data: "CommCode"
                            },
                            {
                                data: "Material"
                            },
                            {
                                data: "Um",
                                type: "autocomplete",
                                source: ["each", "lb", "in", "ft", "yd", "mm", "cm", "m", "g", "kg", "oz", "lt", "gal", "cubic meter"],
                                strict: false
                            },
                            {
                                data: "Cost",
                                type: "numeric",
                                format: '0,0.0000',
                                language: 'en' //this is the default locale, set up for USD
                            },
                            {
                                data: "VendorQuoteEst"
                            },
                            {
                                data: "Qty",
                                type: "numeric",
                                format: '0,0.0000',
                                language: 'en' //this is the default locale, set up for USD
                            },
                            {
                                data: "CapComAssm"
                            },
                            {
                                data: "PurchasingComments"
                            },
                            {
                                data: "SalesStatus",
                                readOnly: true
                            },
                            { data: "SalesComments",
                                readOnly: true
                            },
                            {
                                data: "DirectedBuy",
                                type: "checkbox"
                            },
                            {
                                data: "PurchasingStatus",
                                type: "autocomplete",
                                source: ["Quote", "Estimate", "Pass Thru", "Manufacture", "Firm Requirement"],
                                strict: false
                            }],
                afterChange: function (changes, source) {
                    //Calculating formulas:
                    //if (source != "loadData") {
                    if (source != "loadData") {
                        var data = this.getData();
                        for (var i = 0; i < changes.length; i++) {
                            var current = data[changes[i][0]];
                            if (current.internalAction == null) {
                                current.internalAction = "For Add";
                            } else {
                                if (current.internalAction != "ForAdd") {
                                    current.internalAction = "For Edit";
                                }
                            }
                        }
                    }
                }
            });
        }
        var selectizePartNumber = null;
        function on_partNumber_click(indexLine) {

            var strPartNumberSelect = '<select id="cboPartNumbers" style="width: 300px;">';
            //            for (var i = 0; i < Items.length; i++) {
            //                var current = Items[i];
            //                strPartNumberSelect += '<option value="' + current.Id + '">' + current.PartNumber + '</option>';
            //            }
            strPartNumberSelect += '</select>';

            jQuery("#divPartNumber").html(strPartNumberSelect);
            selectizePartNumber = jQuery("#cboPartNumbers").selectize({
                create: true,
                options: Items,
                valueField: 'Id',
                labelField: 'PartNumber',
                searchField: 'PartNumber',
                openOnFocus: false
            });
            jQuery("#btnOKPartNumber").unbind("click").click(function () {
                on_ok_PartNumber(indexLine, jQuery("#cboPartNumbers").val());
            });
            jQuery("#divDialog_PartNumber").dialog({ autoOpen: true,
                appendTo: jQuery('form:first'),
                width: 600, height: 300, modal: true,
                resizable: false,
                closeOnEscape: true
            });
        }
        function on_ok_PartNumber(indexLine, value) {
            BOM.BomDetail[indexLine].internalAction = "For Edit";
            BOM.BomDetail[indexLine].PartNumber = value;
            BOM.BomDetail[indexLine].PartNumberCell = '<input type="button" onclick="on_partNumber_click(' + indexLine + ');return false;" />' + BOM.BomDetail[indexLine].PartNumber;
            jQuery("#divDialog_PartNumber").dialog("close");
            jQuery("#divEditBOM").handsontable("render");
        }
        function on_cancel_PartNumber() {
            jQuery("#divDialog_PartNumber").dialog("close");
        }
        function on_unselect_all_lines() {
            jQuery('[type="checkbox"]').prop('checked', false);
            for (var i = 0; i < BOM.BomDetail.length; i++) {
                BOM.BomDetail[i].selected = false;
            }
        }

        function on_select_all_lines() {
            jQuery('[type="checkbox"]').prop('checked', true);
            for (var i = 0; i < BOM.BomDetail.length; i++) {
                BOM.BomDetail[i].selected = true;
            }
        }

        function on_save_bom() {
            save(event, 'update', getResources);
        }

        function save(e, strSaveMode, onSuccess, onFail) {

            //if (validate(e)) {
            retrieveValuesFromControls(); //For BOM variable

            var to = '<%= ResolveUrl("~/WebService/BOM.aspx") %>?cmd=update';

            jQuery("#divImgEmail").css("display", "block");

            jQuery.ajax({
                type: "POST",
                url: to,
                data: JSON.stringify(BOM),
                contentType: "application/json;charset=utf-8",
                dataType: "html",
                success: function (response) {
                    BOM = jQuery.parseJSON(response);
                    refreshForm();
                    try {
                        onSuccess();
                    } catch (e) { }
                    jQuery("#divImgEmail").hide();
                    alertify.success("BOM saved successfully");
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    if (console && console.log) {
                        console.log(jqXHR);
                        console.log(textStatus);
                        console.log(errorThrown);
                    }
                    try {
                        onFail();
                    } catch (e) { }
                }
            });
            //}
        }

        function on_noQuote_click() {
            if (jQuery("h3 input:checkbox:checked").length > 0) {
                var someOneEdited = false;
                for (var i = 0; i < BOM.BomDetail.length; i++) {
                    var current = BOM.BomDetail[i];
                    if (current.selected) {
                        current.internalAction = "For Edit";
                        current.Status = "No Quote";
                        someOneEdited = true;
                    }
                }
                if (someOneEdited) refreshDetail();
            } else {
                alertify.log("You have not selected any item to No Quote.");
            }
        }

        function on_Quote_click() {
            if (jQuery("h3 input:checkbox:checked").length > 0) {
                var someOneEdited = false;
                for (var i = 0; i < BOM.BomDetail.length; i++) {
                    var current = BOM.BomDetail[i];
                    if (current.selected) {
                        current.internalAction = "For Edit";
                        current.Status = "In Progress";
                        someOneEdited = true;
                    }
                }
                if (someOneEdited) refreshDetail();
            } else {
                alertify.log("You have not selected any item to Quote.");
            }
        }

        function afterCreateOrSendRFQ(response) {
            popupRFQScreen.close();
            for (var i = 0; i < response.Result.length; i++) {
                var current = response.Result[i];
                var currentDataTable = jQuery('[parentID="' + current.BomDetailId + '"]').DataTable();
                currentDataTable.fnAddData(['<input type="image" src="../pics/delete-icon.png" style="height:20px;"' +
                    '    onclick="deleteRFQByID(' + current.BomDetailId + ',' + current.Id + ');return false;" />' +
                    '<input type="image" src="../pics/edit-icon.png" style="height:20px;margin-left: 5px;" id="updateRFQByID" onclick="updateRFQByID(' + current.Id + ');return false;" />' +
                    '<input type="image" src="../pics/mail_send_icon.png" style="height:20px;margin-left: 5px;" onclick="on_openResendRFQ(' + current.BomDetailId + ',' + current.Id + ');return false;" />',
                                            current.CreatedBy,
                                            current.DrawingLevel,
                                            current.RfqGenerated,
                                            current.DueDate,
                                            current.Status,
                                            current.SupplierName,
                                            current.SentToVendor,
                                            current.LastEmail]);
            }

            alertify.success(response.ResponseDescription);

        }

        var Suppliers = [];
        var Items = [];
        var UMs = [];

        function getSuppliers() {
            jQuery.getJSON('<%= ResolveUrl("~/WebService/Catalogs.aspx") %>?cmd=read&catalog=supplier', function (result) {
                Suppliers = result;
                readCallBack();
            });
            return true;
        }

        function getItems() {
            jQuery.getJSON('<%= ResolveUrl("~/WebService/Catalogs.aspx") %>?cmd=read&catalog=item', function (result) {
                Items = result;
                readCallBack();
            });
            return true;
        }
        function getUMs() {
            jQuery.getJSON('<%= ResolveUrl("~/WebService/Catalogs.aspx") %>?cmd=read&catalog=um', function (result) {
                UMs = result;
                readCallBack();
            });
            return true;
        }
        function getSupplierByID(idSupplier) {
            for (var i = 0; i < Suppliers.length; i++) {
                if (Suppliers[i].Id == idSupplier) {
                    return Suppliers[i];
                }
            }
            return null;
        }

        function getItemByID(idItem) {
            for (var i = 0; i < Items.length; i++) {
                if (Items[i].Id == idItem) {
                    return Items[i];
                }
            }
            return null;
        }

        function getResources() {
            getSuppliers();
            getItems();
            getUMs();
        }
        var readCounter = 0;
        function readCallBack() {
            readCounter++;
            if (readCounter == 3) {
                readCounter = 0;
                jQuery("#divImgEmail").hide();
            }
        }
    </script>
</asp:Content>
