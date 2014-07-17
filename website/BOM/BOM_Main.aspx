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
            left: 170px;
            position: relative;
            border-radius: 4px;
            border: solid 1px dimgray;
            color: black;
            background-color: darkgray;
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
    </style>
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
    <div align="center" style="clear: both;">
        <table cellspacing="0" align="left" style="margin-left: 110px;">
            <tr>
                <th class="camposSinBordes" style="width: 73px; min-width: 73px; max-width: 73px;">
                    Assigned To
                </th>
                <th class="camposSinBordes" style="width: 55px; min-width: 55px; max-width: 55px;">
                    Status
                </th>
                <th class="camposSinBordes" style="width: 30px; min-width: 30px; max-width: 30px;">
                    #
                </th>
                <th class="camposSinBordes itemFields" style="width: 120px; min-width: 120px; max-width: 120px;">
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
                <th class="camposSinBordes itemFields" style="width: 90px; min-width: 90px; max-width: 90px;">
                    Manufacture PN
                </th>
                <th class="camposSinBordes itemFields" style="width: 80px; min-width: 80px; max-width: 80px;
                    display: none;">
                    Supplier PN
                </th>
                <th class="camposSinBordes itemFields" style="width: 80px; min-width: 80px; max-width: 80px;">
                    Comm Code
                </th>
                <th class="camposSinBordes itemFields" style="width: 145px; min-width: 145px; max-width: 145px;">
                    Component Part Description/Material
                </th>
                <th class="camposSinBordes itemFields" style="width: 68px; min-width: 68px; max-width: 68px;">
                    UM
                </th>
                <th class="camposSinBordes itemFields" style="width: 52px; min-width: 52px; max-width: 52px;">
                    Cost
                </th>
                <th class="camposSinBordes" style="width: 70px; min-width: 70px; max-width: 70px;">
                    Vendor Quote Est
                </th>
                <th class="camposSinBordes" style="width: 60px; min-width: 60px; max-width: 60px;">
                    Qty Required
                </th>
                <th class="camposSinBordes" style="width: 50px; min-width: 50px; max-width: 50px;">
                    Cap Com Assm
                </th>
                <th class="camposSinBordes" style="width: 80px; min-width: 80px; max-width: 80px;">
                    Purchasing Comments
                </th>
                <th class="camposSinBordes" style="width: 70px; min-width: 70px; max-width: 70px;">
                    Sales Status
                </th>
                <th class="camposSinBordes" style="width: 70px; min-width: 70px; max-width: 70px;">
                    Sales Comments
                </th>
                <th class="camposSinBordes" style="width: 50px; min-width: 50px; max-width: 50px;">
                    Directed Buy
                </th>
                <th class="camposSinBordes" style="width: 110px; min-width: 110px; max-width: 110px;">
                    Purchasing Status
                </th>
                <th style="border-color: Gray;" class="camposSinBordes">
                </th>
            </tr>
        </table>
        <div id="divBOMDetailList">
        </div>
    </div>
    <br />
    <div align="center" class="gradientBG" style="position: fixed; left: 0px; width: 100%;
        bottom: 0; padding: 5px; border-top: solid 1px black;">
        <input type="button" value="SIF Volumes" onclick="on_openSIFDetail();" />
        <input type="button" id="btnNewRFQ" value="New RFQ" style="width: 100px;" />
        <input type="button" id="btnSaveBOM" value="Save" style="width: 100px;" />
        <input type="button" id="btnCancel" value="Cancel" style="width: 100px;" />
        <input type="button" id="btnReportSelectedRFQs" value="Report Selected RFQs" style="width: 150px;" />
        <input type="button" id="btnReportAllRFQs" value="Report All RFQs" style="width: 150px;" />
    </div>
    <br />
    <div id="divDialog_SifDetail" style="display: none;">
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
    <asp:Panel ID="panelSendRFQ" runat="server" Visible="false">
        <div align="center">
            <div id="divCreateRFQ">
            </div>
        </div>
        <script type="text/javascript">
            document.getElementById("<%= this.panelSendRFQ.ClientID %>").setAttribute("title", "New RFQs");
            jQuery("#<%= this.panelSendRFQ.ClientID %>").dialog({ autoOpen: true,
                appendTo: jQuery('form:first'),
                width: 1000, height: 600, modal: false,
                dialogClass: "no-close", closeOnEscape: false
            });
        </script>
    </asp:Panel>
    <script type="text/javascript">
        jQuery(document).ready(function () {
            load();
        });

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
                jQuery("#divImgEmail").css("display", "none");

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
            document.getElementById("divDialog_SifDetail").setAttribute("title", "Projected Annual Volume");
            jQuery("#divDialog_SifDetail").dialog({ autoOpen: true,
                appendTo: jQuery('form:first'),
                width: 520, modal: false,
                dialogClass: "no-close", closeOnEscape: false
            });
        }

        function on_closeSIFDetail() {
            jQuery("#divDialog_SifDetail").dialog("close");
        }


        function loadBOMDetailList() {

            var strBOMDetailList = '<div style="clear: both; top: 30px;"> ' +
'    <div id="accordionBOM" style="position: relative; width: 1560px;"> ';

            for (var j = 0; j < BOM.BomDetail.length; j++) {
                var current = BOM.BomDetail[j];
                strBOMDetailList += '<div class="group"><h3 style="height: 20px;"> ' +
'    <div> <label class="LN" style="float: left; position: absolute;left: 5px;top: 8px;">' + (j + 1) + '</label>' +
'    <input type="checkbox" id="chkSelect"  style="float: left; position: absolute;left: 30px;" clickeableInHeader="true" /> ' +
'    <input type="image" src="../pics/delete-icon.png" style="height:20px;float: left;position: absolute; left: 60px;" id="deleteByID" ' +
'    onclick="deleteBOMLineByID(' + current.Id + ');return false;" clickeableInHeader="true" /> ' +
'    <input type="image" src="../pics/edit-icon.png" style="height:20px;float: left; position: absolute;left: 90px;" ' +
'    id="updateByID" clickeableInHeader="true" onclick="updateByID();" /> ' +
'    <label id="linkAssignedToLine" clickeableInHeader="true" ' +
'    onclick="takeBOMLine();" style="float: left; position: absolute;left: 120px;top: 8px;">Take</label> ' +
'    <table cellspacing="0" align="left" class="BOMLine"> ' +
'    <tr style="height: 19px; white-space: nowrap;"> ' +
'    <td align="center" class="tableCell" style="width: 60px; min-width: 60px; max-width: 650px;"> ' +
'        <label id="lblStatus" >' + current.Status + '</label> ' +
'    </td> ' +
'    <td align="center" class="tableCell" style="width: 30px; min-width: 30px; max-width: 30px;"> ' +
'        <label id="lblSalesLN" >' + current.LinePosition + '</label> ' +
'    </td> ' +
'    <td class="tableCell" style="width: 132px; min-width: 132px; max-width: 132px;"> ' +
'        <label id="lblPartNumber" >' + current.PartNumber + '</label> ' +
'    </td> ' +
'    <td align="center" class="tableCell" style="width: 81px; min-width: 81px; max-width: 81px; ' +
'        display: none;"> ' + current.CapsonicPN +
'    </td> ' +
'    <td align="center" class="tableCell" style="width: 81px; min-width: 81px; max-width: 81px; ' +
'        display: none;"> ' + current.CustomerPN +
'    </td> ' +
'    <td align="center" class="tableCell" style="width: 100px; min-width: 100px; max-width: 100px;"> ' + current.ManufacturePN +
'    </td> ' +
'    <td align="center" class="tableCell" style="width: 81px; min-width: 81px; max-width: 81px; ' +
'        display: none;"> ' + current.SupplierPN +
'    </td> ' +
'    <td align="center" class="tableCell" style="width: 85px; min-width: 85px; max-width: 85px;"> ' + current.CommCode +
'    </td> ' +
'    <td class="tableCell" style="width: 145px; min-width: 145px; max-width: 145px;"> ' + current.Material +
'    </td> ' +
'    <td align="center" class="tableCell" style="width: 70px; min-width: 70px; max-width: 70px;"> ' + current.Um +
'    </td> ' +
'    <td align="right" class="tableCell" style="width: 60px; min-width: 60px; max-width: 60px;"> ' + current.Cost +
'    </td> ' +
'    <td align="center" class="tableCell" style="width: 70px; min-width: 70px; max-width: 70px;"> ' + current.VendorQuoteEst +
'    </td> ' +
'    <td align="right" class="tableCell" style="width: 63px; min-width: 63px; max-width: 63px;"> ' + current.Qty +
'    </td> ' +
'    <td align="center" class="tableCell" style="width: 60px; min-width: 60px; max-width: 60px;"> ' + current.CapComAssm +
'    </td> ' +
'    <td align="center" class="tableCell" style="width: 145px; min-width: 145px; max-width: 145px;"> ' + current.PurchasingComments +
'    </td> ' +
'    <td align="center" class="tableCell" style="width: 70px; min-width: 70px; max-width: 70px;"> ' + current.SalesStatus +
'    </td> ' +
'    <td class="tableCell" style="width: 70px; min-width: 70px; max-width: 70px;"> ' + current.SalesComments +
'    </td> ' +
'    <td align="center" class="tableCell" style="width: 60px; min-width: 60px; max-width: 60px;"> ' + current.DirectedBuy +
'    </td> ' +
'    <td align="center" class="tableCell" style="width: 125px; min-width: 125px; max-width: 125px;"> ' + current.PurchasingStatus +
'    </td></tr></table></div></h3><div accordionContainer>';

                strBOMDetailList += getRFQsTableByBOMDetail(current);
            }


            strBOMDetailList += '</div></div><br><br>';

            jQuery("#divBOMDetailList").html(strBOMDetailList);

            jQuery("#accordionBOM").accordion({
                activate: function (event, ui) {
                    //                    var vActive = jQuery(this).accordion("option", "active");
                    //                    if (vActive.toString() !== "false") {
                    //                        var bomDetailKey;
                    //                        bomDetailKey = ui.newHeader.children().children()[4].value;
                    //                        ui.newPanel.load('<%= ResolveUrl("~/RFQ/RFQList.aspx") %>?bomComponent=' + bomDetailKey + '&noCache=' + Number(new Date()) + ' #clientID_GridRFQList',
                    //                function (responseTxt, statusTxt, xhr) {
                    //                    if (statusTxt == "success")
                    //                        jQuery('.dataTable').dataTable({
                    //                            "bDestroy": true,
                    //                            "bStateSave": true,
                    //                            "bFilter": false,
                    //                            "bLengthChange": false,
                    //                            "bInfo": false,
                    //                            "bPaginate": false
                    //                        }).show();
                    //                    if (statusTxt == "error")
                    //                        alert("Error: " + xhr.status + ": " + xhr.statusText);
                    //                });
                    //                        ui.newPanel.show();
                    //                    }
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
                        jQuery(this).text((index + 1));
                    });
                }
            });

            jQuery('.dataTable').dataTable({
                "bDestroy": true,
                "bStateSave": true,
                "bFilter": false,
                "bLengthChange": false,
                "bInfo": false,
                "bPaginate": false
            }).show();

            clickeableInHeader();
        }
        function getRFQsTableByBOMDetail(bomLine) {
            var strRFQDetailList = '<table class="display dataTable" parentID=' + bomLine.Id + '><thead>';
            strRFQDetailList += '<tr><th style="width: 30px;min-width: 30px;max-width: 30px;"></th><th style="width: 80px;min-width: 80px;max-width: 80px;"></th><th>Created By</th><th>RFQ Number</th><th>Due Date</th>' +
            //'<th>Component Part Number</th>' +
                '<th>Status</th><th>Vendor</th><th>Last Sent To Vendor</th></tr></thead><tbody>';
            for (var r = 0; r < bomLine.RFQList.length; r++) {
                var currentRFQ = bomLine.RFQList[r];
                strRFQDetailList += '<tr>';
                strRFQDetailList += '<td>SetAwrd</td>';
                strRFQDetailList += '<td><input type="image" src="../pics/delete-icon.png" style="height:20px;" id="deleteRFQByID" ' +
                    '    onclick="deleteRFQByID(' + bomLine.Id + ',' + currentRFQ.Id + ');return false;" />' +
                    '<input type="image" src="../pics/edit-icon.png" style="height:20px;margin-left: 5px;" id="updateRFQByID" onclick="updateRFQByID();" />' +
                    '<input type="image" src="../pics/mail_send_icon.png" style="height:20px;margin-left: 5px;" onclick="resendRFQ();" /></td>';
                strRFQDetailList += '<td>' + currentRFQ.CreatedBy + '</td>';
                strRFQDetailList += '<td>' + currentRFQ.RfqGenerated + '</td>';
                strRFQDetailList += '<td>' + currentRFQ.DueDate + '</td>';
                strRFQDetailList += '<td>' + currentRFQ.Status + '</td>';
                //strRFQDetailList += '<td>' + currentRFQ.PartNumber + '</td>';
                strRFQDetailList += '<td>' + currentRFQ.SupplierName + '</td>';
                strRFQDetailList += '<td>' + currentRFQ.SentToVendor + '</td>';
                strRFQDetailList += '</tr>';
            }
            strRFQDetailList += '</tbody></table></div></div>';
            return strRFQDetailList;
        }
        function clickeableInHeader() {
            jQuery('[clickeableInHeader="true"]').click(function (e) {
                e.stopPropagation();
                //Your Code here(For example a call to your function)
            });
        }
        function refreshForm() {

            var scrollPosition = jQuery("body").scrollTop();
            resetForm();
            bindParentFields();
            //jQuery("#lblDueDate").text((new Date(RFQ.DueDate)).toLocaleDateString());
            loadSIFDetail();
            loadBOMDetailList();
            makeProgresBar();

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

        function save(e, strSaveMode, onSuccess, onFail) {

            if (validate(e)) {
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
                        jQuery("#divImgEmail").css("display", "none");
                        try {
                            onSuccess();
                        } catch (e) { }
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
                            theTable.parent().html(getRFQsTableByBOMDetail(currentBOMLine));

                            jQuery("[parentid=" + iBOMLineID + "]").dataTable({
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

        function afterDeleteBOMLine(iBOMLineID) {
            for (var i = 0; i < BOM.BomDetail.length; i++) {
                var currentBOMLine = BOM.BomDetail[i];
                if (currentBOMLine.Id == iBOMLineID) {
                    BOM.BomDetail.splice(i, 1);
                    jQuery("#divBOMDetailList").css("visibility", "hidden");
                    jQuery(".dataTable").DataTable().fnDestroy();
                    jQuery("#accordionBOM").accordion("destroy");
                    jQuery("#divBOMDetailList").empty();
                    loadBOMDetailList();
                    jQuery("#divBOMDetailList").css("visibility", "visible");
                    alertify.success("RFQ deleted successfully;");
                    return;
                }
            }
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
                        console.debug(response);
                        response = JSON.parse(response);
                        if (response.Result == "OK") {
                            afterDeleteRFQ(iBOMLineID, iRFQ_ID);
                        } else {
                            alertify.error(response);
                        }
                        //refreshForm();

                        jQuery("#divImgEmail").css("display", "none");
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

        function deleteBOMLineByID(iBOMLineID) {
            if (confirm("Are you sure?")) {
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
                            afterDeleteBOMLine(iBOMLineID);
                        } else {
                            alertify.error(response);
                        }
                        //refreshForm();

                        jQuery("#divImgEmail").css("display", "none");
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
    </script>
</asp:Content>
