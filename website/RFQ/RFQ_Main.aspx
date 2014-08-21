<%@ Page Title="" Language="C#" MasterPageFile="~/_Layouts/MasterMenu.master" AutoEventWireup="true"
    CodeFile="RFQ_Main.aspx.cs" Inherits="RFQ_RFQ_Main" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PlaceHolderMain" runat="Server">
 <span class="mainTitle">RFQs</span>
    <div id="divImgEmail" style="display: block; position: fixed; width: 105px; height: 35px;
        z-index: 1000; background-color: white; border: 2px solid gray; padding: 5px;">
        <img alt="" src="<%= ResolveUrl("~/Utils/loading.gif") %>" style="display: inline;
            position: relative;" />
        <span style="display: inline; position: relative;">Please wait..</span>
    </div>
    <br />
    <div id="tabs" style="border:0;">
        <ul>
            <li><a href="#tabs-1">All RFQs</a></li>
            <li><a href="#tabs-2">RFQs per BOM Lines</a></li>
        </ul>
        <div id="tabs-1" style="min-height: 400px;">
            <div id="tab-1-content" style="display: none;">
                <div id="divFilterByUser">
                    <table cellspacing="0" align="left">
                        <tr>
                            <td align="right">
                                Filter Created By:
                            </td>
                            <td>
                                <div id="divUsers">
                                </div>
                            </td>
                            <td>
                                <input type="button" value="Filter" onclick="on_filter_rfqList();return false;" />
                            </td>
                        </tr>
                    </table>
                </div>
                <br />
                <br />
                <div id="divRFQList">
                    <table class="display RFQList" style="display:none;font-size:10px;">
                        <thead>
                            <tr>
                                <th>
                                </th>
                                <th>
                                    Created By
                                </th>
                                <th>
                                    Drawing Rev
                                </th>
                                <th>
                                    RFQ Number
                                </th>
                                <th>
                                    Due Date
                                </th>
                                <th>
                                    Status
                                </th>
                                <th>
                                    Vendor
                                </th>
                                <th>
                                    Last Sent To Vendor
                                </th>
                                <th>
                                    Last Email
                                </th>
                            </tr>
                        </thead>
                        <tbody></tbody>
                    </table>
                </div>
            </div>
        </div>
        <div id="tabs-2" style="min-height: 400px;">
            <div id="tab-2-content">
                <div id="divRFQCountPerBOMList">
                    <input type="button" id="btnRefreshRFQCountPerBOM" value="Refresh" onclick="on_refresh_rfqCountPerBOM();return false;" />
                    <table class="display RFQCountPerBOMTable" style="display:none;font-size:10px;width:1700px;">
                        <thead>
                            <tr>
                                <th>
                                </th>
                                <th>
                                    Inquiry Number
                                </th>
                                <th>
                                    Revision
                                </th>
                                <th>
                                    Finished Good Part Number
                                </th>
                                <th>
                                    Product
                                </th>
                                <th>
                                    Annual Volume
                                </th>
                                <th>
                                    Market Sector
                                </th>
                                <th>
                                    Component Part Number
                                </th>
                                <th>
                                    Part Material
                                </th>
                                <th>
                                    Comm Code
                                </th>
                                <th>
                                    Vendor Quote Est
                                </th>
                                <th>
                                    Qty Required
                                </th>
                                <th>
                                    Directed Buy
                                </th>
                                <th>
                                    Purchasing Comments
                                </th>
                                <th>
                                    Sales Comments
                                </th>
                                <th>
                                    RFQ Sent
                                </th>
                            </tr>
                        </thead>
                        <tbody></tbody>
                    </table>
                </div>
            </div>
        </div>
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
                    <tr style="height: 20px;">
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
    <script type="text/javascript">
        var Users = [];
        var RFQList = []; var Suppliers = [];
        var RFQCountPerBOMList = [];
        jQuery(document).ready(function () {
            jQuery('#divImgEmail').css("top", (jQuery(window).height() / 2) - (jQuery('#divImgEmail').outerHeight() / 2));
            jQuery('#divImgEmail').css("left", (jQuery(window).width() / 2) - (jQuery('#divImgEmail').outerWidth() / 2));
            jQuery("#tabs").tabs();
            getResources();
        });
        function getResources() {
            getUsers();
            getSuppliers();
        }
        function getSuppliers() {
            jQuery.getJSON('<%= ResolveUrl("~/WebService/Catalogs.aspx") %>?cmd=read&catalog=supplier', function (result) {
                Suppliers = result;
                readCallBack();
            });
            return true;
        }
        function getUsers() {
            jQuery.getJSON('<%= ResolveUrl("~/WebService/Catalogs.aspx") %>?cmd=read&catalog=user', function (result) {
                Users = result;
                readCallBack();
            });
            return true;
        }
        var readCounter = 0;
        function readCallBack() {
            readCounter++;
            if (readCounter == 2) {
                readCounter = 0;
                load();
                jQuery("#divImgEmail").hide();
            }
        }

        function load() {
            populateUsers();
        }

        function populateUsers() {
            var strUsers = '<select id="cboUsers" tabindex="0">';
            strUsers += '<option value ="All">All</option>';
            for (var i = 0; i < Users.length; i++) {
                var current = Users[i];
                strUsers += '<option value="' + current.UserName + '">' + current.UserName + '</option>';
            }
            strUsers += '</select>';

            jQuery("#divUsers").html(strUsers);
            jQuery("#cboUsers").chosen({ disable_search: true, width: "285px" });
            jQuery("#tab-1-content").show();
        }

        function on_filter_rfqList() {
            filterRFQList();
        }

        function filterRFQList() {
            RFQList = [];
            jQuery("#divImgEmail").show();
            var strSelectedUser = jQuery("#cboUsers option:selected").val()
            jQuery.getJSON('<%= ResolveUrl("~/WebService/RFQ.aspx") %>?cmd=readbyuser&user=' + strSelectedUser, function (response) {
                RFQList = response.Result;
                refreshRFQList();
                jQuery("#divImgEmail").hide();
            });
        }

        function refreshRFQList() {
            
            var theTable = jQuery(".RFQList").DataTable();
            theTable.css("visibility", "hidden");
            try {
                theTable.fnDestroy();
            } catch (e) { }

            theTable.dataTable({
                "aaData": getRFQArray(RFQList),
                "aoColumns": [
                    null,
                    null,
                    null,
                    null,
                    {
                        "sType": "date",
                        "mRender": function (data, type, full) {
                            return formatDate(new Date(data));
                        }
                    },
                    null,
                    null,
                    {
                        "sType": "date",
                        "mRender": function (data, type, full) {
                            return formatDateTime(new Date(data));
                        }
                    },
                    null
                ],
                "bStateSave": true,
                "bFilter": true,
                "bLengthChange": true,
                "bInfo": true,
                "bPaginate": true,
                "bDeferRender": true
            }).show();
            theTable.css("visibility", "visible");
        }

        function getRFQArray(arrRFQList) {
            var result = [];
            for (var i = 0; i < arrRFQList.length; i++) {
                var currentRFQ = arrRFQList[i];
                var oCurrent = ['<input type="image" src="../pics/delete-icon.png" style="height:20px;" ' +
                    '    onclick="deleteRFQByID(' + currentRFQ.Id + ');return false;" />' +
                    '<input type="image" src="../pics/edit-icon.png" style="height:20px;margin-left: 5px;" onclick="updateRFQByID(' + currentRFQ.Id + ');return false;" />' +
                    '<input type="image" src="../pics/mail_send_icon.png" style="height:20px;margin-left: 5px;" onclick="on_openResendRFQ(' + currentRFQ.Id + ');return false;" />',
                                currentRFQ.CreatedBy,
                                currentRFQ.DrawingLevel,
                                currentRFQ.RfqGenerated,
                                new Date(currentRFQ.DueDate),
                                currentRFQ.Status,
                                currentRFQ.SupplierName,
                                new Date(currentRFQ.SentToVendor),
                                currentRFQ.LastEmail
                                ];
                result.push(oCurrent);
            }
            return result;
        }
        function deleteRFQByID(iRFQ_ID) {
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
                            afterDeleteRFQ(iRFQ_ID);
                        } else {
                            alertify.error(response);
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
                    }
                });
            }
        }
        function updateRFQByID(iRFQ_ID) {
            window.open("../RFQ/rfqFormMain.aspx?rfq=" + iRFQ_ID);
        }
        function on_openResendRFQ(iRFQ_ID) {
            jQuery("#btnResendRFQ").prop("disabled", false);
            jQuery("#btnCancelResendRFQ").prop("disabled", false);
            jQuery("#divPleaseWait").hide();

            var rfqToResend = getRFQByID(iRFQ_ID);
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
        function getRFQByID(iRFQ_ID) {
            for (var j = 0; j < RFQList.length; j++) {
                if (RFQList[j].Id == iRFQ_ID) {
                    return RFQList[j];
                }
            }
            return null;
        }
        function getSupplierByID(idSupplier) {
            for (var i = 0; i < Suppliers.length; i++) {
                if (Suppliers[i].Id == idSupplier) {
                    return Suppliers[i];
                }
            }
            return null;
        }
        function afterDeleteRFQ(iRFQ_ID) {
            for (var j = 0; j < RFQList.length; j++) {
                var currentRFQ = RFQList[j];
                if (currentRFQ.Id == iRFQ_ID) {
                    RFQList.splice(j, 1);
                    refreshRFQList();
                    alertify.success("RFQ deleted successfully;");
                    return;
                }
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

        function on_refresh_rfqCountPerBOM() {
            getRFQCountPerBOMLine();
        }

        function getRFQCountPerBOMLine() {
            RFQCountPerBOMList = [];
            jQuery("#divImgEmail").show();
            jQuery.getJSON('<%= ResolveUrl("~/WebService/RFQ.aspx") %>?cmd=readrfqcountperbomline', function (response) {
                RFQCountPerBOMList = response.Result;
                refreshRFQCountPerBOMLine();
                jQuery("#divImgEmail").hide();
            });
        }

        function refreshRFQCountPerBOMLine() {

            var theTable = jQuery(".RFQCountPerBOMTable").DataTable();
            theTable.css("visibility", "hidden");
            try {
                theTable.fnDestroy();
            } catch (e) { }

            theTable.dataTable({
                "aaData": getRFQCountPerBOMLineArray(RFQCountPerBOMList),
                "bStateSave": true,
                "bFilter": true,
                "bLengthChange": true,
                "bInfo": true,
                "bPaginate": true,
                "bDeferRender": true
            }).show();
            theTable.css("visibility", "visible");
        }

        function getRFQCountPerBOMLineArray(arrRFQList) {
            var result = [];
            for (var i = 0; i < arrRFQList.length; i++) {
                var currentRFQ = arrRFQList[i];
                var oCurrent = ['',
                                currentRFQ.InquiryNumber,
                                currentRFQ.Revision,
                                currentRFQ.TopPartNumber,
                                currentRFQ.PartDescription,
                                currentRFQ.AnnualVolume,
                                currentRFQ.MarketSector,
                                currentRFQ.PartNumber,
                                currentRFQ.Material,
                                currentRFQ.CommCode,
                                currentRFQ.VendorQuoteEst,
                                currentRFQ.Qty,
                                currentRFQ.DirectedBuy,
                                currentRFQ.PurchasingComments,
                                currentRFQ.SalesComments,
                                currentRFQ.RFQCount
                                ];
                result.push(oCurrent);
            }
            return result;
        }
    </script>
</asp:Content>
