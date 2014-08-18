<%@ Page Title="" Language="C#" MasterPageFile="~/_Layouts/MasterStatic.master" AutoEventWireup="true"
    CodeFile="NewRFQ.aspx.cs" Inherits="RFQ_NewRFQ" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderBase" runat="Server">
    <style type="text/css">
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
    </style>
    <div id="divImgEmail" style="display: block; position: fixed; width: 105px; height: 35px;
        z-index: 1000; background-color: white; border: 2px solid gray; padding: 5px;">
        <img alt="" src="<%= ResolveUrl("~/Utils/loading.gif") %>" style="display: inline;
            position: relative;" />
        <span style="display: inline; position: relative;">Please wait..</span>
    </div>
    <div id="divMain" style="visibility: hidden;">
        <table cellspacing="0" style="margin-left: auto; margin-right: auto; width: 100%;">
            <tr>
                <td style="vertical-align: top;">
                    <table cellspacing="0" style="margin-left: auto;">
                        <tr>
                            <td>
                                <table style="margin-left: auto;">
                                    <tr>
                                        <td align="right">
                                            Filter by Commodity
                                        </td>
                                        <td style="width: 360px;">
                                            <div id="divCommodities">
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            Vendor
                                        </td>
                                        <td>
                                            <div id="divSuppliers" style="display: inline-block; width: 306px;">
                                            </div>
                                            <input type="button" id="btnNewSupplier" tabindex="2" value="New" onclick="on_newSupplier_click();return false;"
                                                style="width: 50px; display: inline-block;" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr style="height: 70px;">
                            <td style="text-align: right;">
                                <div style="border-radius: 10px; border: solid #D3D3D3; background-color: #D3D3D3;
                                    display: inline-block; width: 170px; height: 170px; overflow-y: auto;">
                                    <div id="divEAUs">
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <br />
                                <div id="divBOMLines">
                                </div>
                            </td>
                        </tr>
                    </table>
                </td>
                <td style="vertical-align: top;">
                    <table cellspacing="0" class="style5">
                        <tr>
                            <td>
                                <table align="center" cellspacing="0" style="width: 491px">
                                    <tr style="height: 10px;">
                                        <td align="right" class="style2">
                                            Due Date
                                        </td>
                                        <td align="left" class="style4">
                                            <input type="text" id="txtDueDate" datepicker="true" validate="date" validationid="validatingNewRFQ"
                                                tabindex="7" style="width: 200px;" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" class="style1">
                                            Market Sector
                                        </td>
                                        <td align="left" class="style3">
                                            <div id="divMarketSector">
                                            </div>
                                            <input type="button" id="btnNewMarketSector" tabindex="9" value="New" style="width: 60px;
                                                display: none;" />
                                        </td>
                                    </tr>
                                    <tr style="height: 30px;">
                                        <td align="right" class="style1">
                                            Drawing Level
                                        </td>
                                        <td align="left">
                                            <input type="text" id="txtDrawingLevel" bindto="DrawingLevel" style="width: 120px;
                                                text-transform: uppercase;" tabindex="10" />
                                        </td>
                                    </tr>
                                    <tr style="height: 30px;">
                                        <td align="right" class="style1">
                                            Target Price
                                        </td>
                                        <td align="left">
                                            <input type="checkbox" id="chkTargetPrice" onchange="toggleTargetPrice();" tabindex="11" />
                                            <input type="text" id="txtTargetPrice" bindto="TargetPrice" style="display: none;
                                                text-align: right;" tabindex="12" validate="number" validationid="validatingNewRFQ" />
                                        </td>
                                    </tr>
                                    <tr style="height: 30px;">
                                        <td align="right" class="style1">
                                            Comments to Vendor
                                        </td>
                                        <td align="left">
                                            <textarea id="txtCommentToVendor" bindto="CommentsToVendor" style="height: 50px;
                                                width: 300px;" rows="2" cols="30" tabindex="13"></textarea>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td style="padding: 0px; vertical-align: top;" align="right">
                                <br />
                                <div id="uploadZone">
                                    Upload
                                </div>
                                <div style="background-color: #D3D3D3; width: 449px; min-height: 200px;">
                                    <br />
                                    <div id="divAttachments">
                                    </div>
                                </div>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <br />
    </div>
    <br />
    <br />
    <div align="center" class="gradientBG" style="position: fixed; left: 0px; width: 100%;
        bottom: 0; padding: 5px; border-top: solid 1px black;">
        <table style="margin-left: auto; margin-right: auto;">
            <tr>
                <td>
                </td>
                <td>
                    <input id="btnSendRFQ" onclick="sendRFQ(event,'sendrfq',opener.afterCreateOrSendRFQ);"
                        type="button" validationid="validatingNewRFQ" value="Send New RFQ" tabindex="14" />
                    <input id="btnCreateRFQ" onclick="sendRFQ(event,'createrfq',opener.afterCreateOrSendRFQ);"
                        type="button" validationid="validatingNewRFQ" value="Create RFQ without email"
                        tabindex="14" />
                </td>
            </tr>
        </table>
    </div>
    <div id="divDialog_NewSupplier" title="New Supplier" style="display: none;">
        <div align="center">
            <div id="divNewSupplier">
                <table cellspacing="0">
                    <tr>
                        <td align="right">
                            <b style="margin-right: 5px;">Supplier:</b>
                        </td>
                        <td>
                            <input type="text" id="txtNewSupplier" style="width: 350px;" validate="required" validationid="validatingNewSupplier" />
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <b style="margin-right: 5px;">Email:</b>
                        </td>
                        <td>
                            <input type="text" id="txtNewEmail" style="width: 350px;" validate="email" validationid="validatingNewSupplier" />
                        </td>
                    </tr>
                    <tr style="height: 40px;">
                        <td colspan="2">
                            
                        </td>
                    </tr>
                    <tr>
                        <td align="center" colspan="3">
                            <input type="button" id="btnCreateSupplier" onclick="return false;" style="width: 80px;" validationid="validatingNewSupplier"
                                value="Create" />
                            <input type="button" id="btnCancelCreateSupplier" onclick="on_closeCreateSupplier();"
                                value="Cancel" style="width: 80px;" />
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
    <script type="text/javascript">

        var newRFQScreen = {
            SIFVolumesList: [],
            BomDetailList: [],
            SupplierList: [],
            SIFHeaderID: -1,
            DueDate: new Date(1985, 1, 10),
            MarketSectorID: -1,
            DrawingLevel: '',
            TargetPrice: -1,
            CommentsToVendor: '',
            FolderAttachments: ''
        };

        var Commodities = [];
        var Suppliers = [];
        var MarketSectors = [];
        var Attachments = [];
        var urlAttachments = '../WebService/Public/RFQ.aspx';
        var InboxAttachmentsFolder = '';


        jQuery(document).ready(function () {

            jQuery("#spanTitle").text("New RFQ");
            newRFQScreen.SIFHeaderID = opener.BOM.SifId;
            jQuery('#divImgEmail').css("top", (jQuery(window).height() / 2) - (jQuery('#divImgEmail').outerHeight() / 2));
            jQuery('#divImgEmail').css("left", (jQuery(window).width() / 2) - (jQuery('#divImgEmail').outerWidth() / 2));

            getResources();

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
                    try {
                        enableCaller(true);
                    } catch (e) {
                    }
                },
                onSuccess: function (files, data, xhr) {
                    var resp = jQuery.parseJSON(data);
                    if (resp.length == 2) {
                        InboxAttachmentsFolder = resp[0].FolderName;
                        Attachments = resp[1];
                        populateAttachments();
                    }
                },
                onSubmit: function (a, b, c, d) {
                    this.url = urlAttachments + "?RFQATTACHMENTSFOLDER=" + InboxAttachmentsFolder;
                }
            });
        });

        function getResources() {
            getCommodities();
            getSuppliers();
            getMarketSectors();
        }

        var readCounter = 0;
        function readCallBack() {
            readCounter++;
            if (readCounter == 3) {
                readCounter = 0;
                load();
                jQuery("#divImgEmail").hide();
                jQuery("#divMain").css("visibility", "visible");
            }
        }

        function load() {
            populateCommodities();
            populateSuppliers();
            populateSIFVolumes();
            populateMarketSectors();
            populateBOMLines();
        }

        function getCommodities() {
            jQuery.getJSON('<%= ResolveUrl("~/WebService/Catalogs.aspx") %>?cmd=read&catalog=commodity', function (result) {
                Commodities = result;
                readCallBack();
            });
            return true;
        }

        function getSuppliers() {
            jQuery.getJSON('<%= ResolveUrl("~/WebService/Catalogs.aspx") %>?cmd=read&catalog=supplier', function (result) {
                Suppliers = result;
                readCallBack();
            });
            return true;
        }

        function getMarketSectors() {
            jQuery.getJSON('<%= ResolveUrl("~/WebService/Catalogs.aspx") %>?cmd=read&catalog=marketsector', function (result) {
                MarketSectors = result;
                readCallBack();
            });
            return true;
        }

        function populateCommodities() {
            var strCommodities = '<select id="cboCommodities" tabindex="1" data-placeholder="This filter is not working yet :P" style="width: 285px;">';
            for (var i = 0; i < Commodities.length; i++) {
                var current = Commodities[i];
                strCommodities += '<option value="' + current.Id + '">' + current.CommidityName + '</option>';
            }
            strCommodities += '</select>';

            jQuery("#divCommodities").html(strCommodities);
            jQuery("#cboCommodities").chosen();
        }

        function populateSuppliers() {
            var strSuppliers = '<select id="cboSuppliers" multiple tabindex="2" data-placeholder="Select Emails" style="width: 309px;">';
            for (var i = 0; i < Suppliers.length; i++) {
                var current = Suppliers[i];
                strSuppliers += '<option value="' + current.Id + '">' + current.NameAndEmail + '</option>';
            }
            strSuppliers += '</select>';

            jQuery("#divSuppliers").html(strSuppliers);
            jQuery("#cboSuppliers").chosen();
        }

        function populateMarketSectors() {
            var strMarketSectors = '<select id="cboMarketSectors" tabindex="5" style="width: 285px;">';
            for (var i = 0; i < MarketSectors.length; i++) {
                var current = MarketSectors[i];
                strMarketSectors += '<option value="' + current.Id + '">' + current.Name + '</option>';
            }
            strMarketSectors += '</select>';

            jQuery("#divMarketSector").html(strMarketSectors);
            jQuery("#cboMarketSectors").chosen();
        }
        function populateBOMLines() {
            var BOM = opener.BOM;
            newRFQScreen.BomDetailList = [];
            for (var i = 0; i < BOM.BomDetail.length; i++) {
                var currentBOMLine = BOM.BomDetail[i];
                if (currentBOMLine.selected) newRFQScreen.BomDetailList.push(jQuery.extend(true, {}, currentBOMLine));
            }

            repaintTableBOMLines();
        }
        function repaintTableBOMLines() {
            jQuery("#divBOMLines").css("visibility", "hidden");
            try {
                jQuery('#tableNewRFQDetail').dataTable().fnDestroy();
            } catch (e) { }  //there is no table yet}
            var strBOMLines = '<table id="tableNewRFQDetail" border="1" class="display dataTable" style="font-size: 10px;width:640px;">' +
            '<thead><tr><th>Part Number</th><th style="width:200px;">Material/Description</th><th>Qty. Required</th><th>Attachments</th><th></th></tr></thead><tbody>';

            for (var j = 0; j < newRFQScreen.BomDetailList.length; j++) {
                var current = newRFQScreen.BomDetailList[j];
                strBOMLines += '<tr><td>' + current.PartNumber + '</td>';
                strBOMLines += '<td style="white-space: normal;">' + current.Material + '</td>';
                strBOMLines += '<td>' + current.Qty + '</td>';
                strBOMLines += '<td style="vertical-align:top;">';
                strBOMLines += getAttachmentsSelect(current);
                strBOMLines += '</td>';
                strBOMLines += '<td><input type="image" src="../pics/delete-small.png" style="height:20px;" ' +
                                ' onclick="deleteLine(' + j + ');return false;" /></td>';
                strBOMLines += '</tr>';
            }
            strBOMLines += '</tbody></table>';
            jQuery("#divBOMLines").html(strBOMLines);

            jQuery("[toChosen]").chosen({ display_selected_options: false });
            jQuery("#tableNewRFQDetail tr").each(function () { jQuery(this).height(jQuery(this).height() + 30); });

            jQuery('#tableNewRFQDetail').dataTable({
                "bFilter": false,
                "bLengthChange": false,
                "bInfo": false,
                "bPaginate": false
            }).show();
            jQuery("#divBOMLines").css("visibility", "visible");
        }
        function deleteLine(index) {
            if (confirm('Do you wish to delete this line?')) {
                newRFQScreen.BomDetailList.splice(index, 1);
            }
            repaintTableBOMLines();
        }
        function getAttachmentsSelect(oBOMLine) {
            if (oBOMLine.AttachmentsList != null && oBOMLine.AttachmentsList.length > 0) {
                //var strAttachments = '<div style="height:' + (oBOMLine.AttachmentsList.length * 30) + 'px;">';
                var strAttachments = '<select size="5" id="cboAttachments_' + oBOMLine.Id + '" style="width:200px;" toChosen multiple>';
                for (var i = 0; i < oBOMLine.AttachmentsList.length; i++) {
                    var current = oBOMLine.AttachmentsList[i];
                    strAttachments += '<option selected value="' + current.FileName + '">' + current.FileName + '</option>';
                }
                strAttachments += '</select>'; //</div>';

                return strAttachments;

            }
            return "No files attached.";
        }
        function populateSIFVolumes() {
            newRFQScreen.SIFVolumesList = [];

            if (opener.BOM.SifDetail != null && opener.BOM.SifDetail.length > 0) {
                //detailACR.pop();
                for (var k = 0; k < opener.BOM.SifDetail.length; k++) {
                    var currentSIFDetail = opener.BOM.SifDetail[k];
                    newRFQScreen.SIFVolumesList.push(currentSIFDetail);
                }
            }

            jQuery("#divEAUs").handsontable({
                data: newRFQScreen.SIFVolumesList,
                colWidths: [70, 70],
                minRows: 5,
                minSpareRows: 1,
                width: 145,
                rowHeaders: false,
                colHeaders: ['Year', 'Volume'],
                columns: [
                        {
                            data: "ProgramYear"
                        },
                        {
                            data: "ProjectedAnnualVolume",
                            type: "numeric"
                        }
                    ],
                afterChange: function (changes, source) {
                    if (source != "loadData") {
                        var data = this.getData();
                        for (var i = 0; i < changes.length; i++) {
                            var current = data[changes[i][0]];
                            current.Sequence = 0;
                            current.Id = -1;
                            current.SifHeaderKey = -1;
                            current.PercentVolumePerAward = 0;
                            current.ProjectedTargetPrice = 0;
                            current.AnnualRevenue = 0;
                        }
                    }
                }
            });
        }
        function toggleTargetPrice() {
            var checkboxTargetPriceIsChecked = jQuery('#chkTargetPrice').is(":checked");
            if (checkboxTargetPriceIsChecked) {
                jQuery('#txtTargetPrice').show();
            }
            else {
                jQuery('#txtTargetPrice').hide();
            }
        }
        function populateAttachments() {
            jQuery("#divAttachments").empty();
            if (Attachments.length > 0) {

                var strTable = '<table id="tableAttachments">';
                for (var i = 0; i < Attachments.length; i++) {
                    var current = Attachments[i];

                    strTable += '<tr fileName="' + current.FileName + '"><td style="width: 380px;">';
                    strTable += '<a href="../WebService/Public/RFQ.aspx?cmd=downloadAttachmentToVendor&Directory=' + current.Directory + '&FileName=' + current.FileName + '">' + current.FileName + '</a>';
                    strTable += '</td><td>';
                    strTable += '<a style="margin-left:10px;" href="#" onclick="deleteAttachment(\'' + current.Directory + '\', \'' + current.FileName + '\',afterDeleteAttachment);return false;">Delete</a><br />';
                    strTable += '</td></tr>';
                }

                strTable += '</table>';
                jQuery("#divAttachments").html(strTable);

            } else {
                jQuery("#divAttachments").html('No files attached.');
            }
        }
        function afterDeleteAttachment(response) {
            jQuery("#tableAttachments tr").filter('[FileName="' + response.Result + '"]').remove();
        }
        function deleteAttachment(directory, fileName, onSuccess, onFail) {
            jQuery("#divImgEmail").css("display", "block");
            jQuery.ajax({
                type: "POST",
                url: '../WebService/Public/RFQ.aspx?cmd=deleteAttachmentToVendor&Directory=' + directory + '&FileName=' + fileName,
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
                    alertify.alert('An error has occurred.');
                    jQuery("#divImgEmail").hide();
                }
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
        function getSupplierByID(idSupplier) {
            for (var i = 0; i < Suppliers.length; i++) {
                if (Suppliers[i].Id == idSupplier) {
                    return Suppliers[i];
                }
            }
            return null;
        }

        function retrieveValuesFromControls() {

            jQuery("[bindTo]").each(function () {
                getValueFromControl(this, jQuery(this), newRFQScreen);
            });


            if (!jQuery("#chkTargetPrice").is(':checked')) {
                newRFQScreen.TargetPrice = -1;
            }

            var dueDate = jQuery('#txtDueDate').val();
            if (jQuery.trim(dueDate) == "") {
                newRFQScreen.DueDate = (new Date(1985, 1, 10)).toJSON();
            } else {
                newRFQScreen.DueDate = (new Date(jQuery('#txtDueDate').val())).toJSON();
            }

            newRFQScreen.MarketSectorID = Number(jQuery("#cboMarketSectors option:selected").val());
            newRFQScreen.FolderAttachments = InboxAttachmentsFolder;

            for (var i = newRFQScreen.SIFVolumesList.length - 1; i >= 0; i--) {
                var current = newRFQScreen.SIFVolumesList[i];
                if (current.ProjectedAnnualVolume == null || current.ProjectedAnnualVolume == "" || isNaN(current.ProjectedAnnualVolume) || current.ProgramYear == "" || isNaN(current.ProgramYear) || current.ProjectedAnnualVolume == null) {
                    newRFQScreen.SIFVolumesList.splice(i, 1);
                }
            }

            jQuery("#divEAUs").handsontable("render");

            newRFQScreen.SupplierList = [];
            jQuery("#cboSuppliers option:selected").each(function () {
                var vendor = getSupplierByID(jQuery(this).val());
                if (vendor != null) {
                    newRFQScreen.SupplierList.push(vendor);
                }
            });


            newRFQScreen.BomDetailList = jQuery.extend(true, [], newRFQScreen.BomDetailList);
            for (var j = 0; j < newRFQScreen.BomDetailList.length; j++) {
                var currentLine = newRFQScreen.BomDetailList[j];
                jQuery("#cboAttachments_" + currentLine.Id + " option:not(:selected)").each(function () {
                    for (var k = currentLine.AttachmentsList.length - 1; k >= 0; k--) {
                        var currentAttachment = currentLine.AttachmentsList[k];
                        if (currentAttachment.FileName == jQuery(this).text()) {
                            currentLine.AttachmentsList.splice(k, 1);
                        }
                    }
                });
            }

        }

        function sendRFQ(e, strSaveMode, onSuccess, onFail) {
            jQuery('#btnSendRFQ').prop("disabled", true);
            jQuery('#btnCreateRFQ').prop("disabled", true);
            if (validate(e)) {
                retrieveValuesFromControls(); //For newRFQScreen variable

                var strValidation = "";
                if (newRFQScreen.SupplierList.length <= 0) {
                    strValidation = "You must select at least one Supplier.";
                }
                if (newRFQScreen.BomDetailList.length <= 0) {
                    strValidation = "You must select at least one BOM Line.";
                }
                if (newRFQScreen.SIFVolumesList.length <= 0) {
                    strValidation = "There must be at least one EAU.";
                    populateSIFVolumes();
                }
                if (newRFQScreen.SIFHeaderID == -1) {
                    strValidation = "SIF ID missing.";
                }
                if (newRFQScreen.DueDate == -1) {
                    strValidation = "SIF ID missing.";
                }
                if (strSaveMode == "" || strSaveMode == null) {
                    strValidation = "Error: SaveMode missing.";
                }
                if (strValidation != "") {
                    alertify.alert(strValidation);
                    jQuery('#btnSendRFQ').prop("disabled", null);
                    jQuery('#btnCreateRFQ').prop("disabled", null);
                    return;
                }

                var to = '<%= ResolveUrl("~/WebService/RFQ.aspx") %>?cmd=' + strSaveMode;

                jQuery("#divImgEmail").css("display", "block");

                jQuery.ajax({
                    type: "POST",
                    url: to,
                    data: JSON.stringify(newRFQScreen),
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
                        jQuery('#btnSendRFQ').prop("disabled", null);
                        jQuery('#btnCreateRFQ').prop("disabled", null);
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        if (console && console.log) {
                            console.log(jqXHR);
                            console.log(textStatus);
                            console.log(errorThrown);
                        }
                        alertify.alert('An error has occurred.');
                        jQuery("#divImgEmail").hide();
                        jQuery('#btnSendRFQ').prop("disabled", null);
                        jQuery('#btnCreateRFQ').prop("disabled", null);
                    }
                });

            }
            else {
                jQuery('#btnSendRFQ').prop("disabled", null);
                jQuery('#btnCreateRFQ').prop("disabled", null);
            }
        }
        function on_newSupplier_click() {
            jQuery("#btnCreateSupplier").prop("disabled", false);
            jQuery("#btnCancelCreateSupplier").prop("disabled", false);
            
            jQuery("#txtNewSupplier").val('');
            jQuery("#txtNewEmail").val('');
            jQuery("#btnCreateSupplier").unbind("click").click(function () { createSupplier(this, afterCreateSupplier); });

            jQuery("#divDialog_NewSupplier").dialog({ autoOpen: true,
                appendTo: jQuery('form:first'),
                width: 520, modal: false, closeOnEscape: false
            });
        }
        function createSupplier(e, onSuccess) {
            if (validate()) {
                jQuery("#btnCreateSupplier").prop("disabled", true);
                jQuery("#btnCancelCreateSupplier").prop("disabled", true);

                var vendorToCreate = {
                    SupplierName: jQuery("#txtNewSupplier").val(),
                    ContactEmail: jQuery("#txtNewEmail").val()
                };
                
                var to = '<%= ResolveUrl("~/WebService/Catalogs.aspx") %>?cmd=create&catalog=supplier';

                jQuery("#divImgEmail").css("display", "block");
                jQuery.ajax({
                    type: "POST",
                    url: to,
                    data: JSON.stringify(vendorToCreate),
                    contentType: "application/json;charset=utf-8",
                    dataType: "html",
                    success: function (response) {
                        response = jQuery.parseJSON(response);
                        if (response.ErrorThrown === true) {
                            try { onFail(); } catch (e) { }
                            alertify.alert(response.ResponseDescription);
                        } else {
                            try { onSuccess(response); } catch (e) { }
                            alertify.success(response.ResponseDescription);
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
                        jQuery("#btnCreateSupplier").prop("disabled", false);
                        jQuery("#btnCancelCreateSupplier").prop("disabled", false);
                        jQuery("#divImgEmail").hide();
                    }
                });
            } else {
                jQuery("#btnCreateSupplier").prop("disabled", false);
                jQuery("#btnCancelCreateSupplier").prop("disabled", false);
                return;
            }
        }
        function afterCreateSupplier(response) {
            var vendorCreated = response.Result;
            Suppliers.push(vendorCreated);
            jQuery("#divDialog_NewSupplier").dialog("close");
            jQuery("#cboSuppliers").append('<option value="' + vendorCreated.Id + '">' + vendorCreated.NameAndEmail + '</option>')
            jQuery("#cboSuppliers").trigger("chosen:updated");
        }
        function on_closeCreateSupplier() {
            jQuery("#divDialog_NewSupplier").dialog("close");
        }
    </script>
</asp:Content>
