﻿<%@ Page Title="" Language="C#" MasterPageFile="~/_Layouts/MasterStatic.master" AutoEventWireup="true"
    CodeFile="NewRFQ.aspx.cs" Inherits="RFQ_NewRFQ" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderBase" runat="Server">
    <div id="divImgEmail" style="display: none; position: fixed; top: 27px; right: 246px;
        z-index: 1000;">
        <img id="Img1" alt="" src="<%= ResolveUrl("~/Utils/loading.gif") %>" style="display: inline;
            position: relative;" />
        <span style="display: inline; position: relative;">Please wait..</span>
    </div>
    
    <div id="divMain">
        <table cellspacing="0" style="margin-left: auto; margin-right: auto;">
            <tr>
                <td style="vertical-align: top;">
                    <table cellspacing="0">
                        <tr>
                            <td>
                                <table>
                                    <tr>
                                        <td align="right" style="width: 125px;">
                                            Filter by Commodity
                                        </td>
                                        <td>
                                            <div id="divCommodities">
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            Vendor
                                        </td>
                                        <td>
                                            <div id="divSuppliers">
                                            </div>
                                            <input type="button" id="btnNewSupplier" tabindex="2" value="New" style="width: 60px;
                                                display: none;" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr style="height: 70px;">
                            <td>
                                &nbsp;
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
                                <div style="height: 180px; overflow-y: auto;">
                                    <div id="divBOMLines">
                                    </div>
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
                                            <input type="text" id="txtDueDate" datepicker="true" validate="date"
                                    validationid="validatingNewRFQ"  tabindex="7" style="width: 200px;" />
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
                                            <input type="text" id="txtDrawingLevel" bindto="DrawingLevel" style="width: 120px;" tabindex="10" />
                                        </td>
                                    </tr>
                                    <tr style="height: 30px;">
                                        <td align="right" class="style1">
                                            Target Price
                                        </td>
                                        <td align="left">
                                            <input type="checkbox" id="chkTargetPrice" onchange="toggleTargetPrice();" tabindex="11" />
                                            <input type="text" id="txtTargetPrice" bindTo="TargetPrice" style="display: none; text-align: right;"
                                                tabindex="12" validate="number" validationid="validatingNewRFQ" />
                                        </td>
                                    </tr>
                                    <tr style="height: 30px;">
                                        <td align="right" class="style1">
                                            Comments to Vendor
                                        </td>
                                        <td align="left">
                                            <textarea id="txtCommentToVendor" bindTo="CommentsToVendor" style="height: 50px; width: 300px;" tabindex="13"></textarea>
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
        <table style="margin-left: auto; margin-right: auto;">
            <tr>
                <td>
                </td>
                <td>
                    <input id="btnSendRFQ" onclick="sendRFQ(event,'sendrfq',opener.afterCreateOrSendRFQ);" type="button" validationid="validatingNewRFQ"
                        value="Send New RFQ" tabindex="14" />
                    <input id="btnCreateRFQ" onclick="sendRFQ(event,'createrfq',opener.afterCreateOrSendRFQ);" type="button" validationid="validatingNewRFQ"
                        value="Create RFQ without email" tabindex="14" />
                </td>
            </tr>
        </table>
    </div>
    <script type="text/javascript">

        var newRFQScreen = {
            SIFVolumesList:[],
            BomDetailList:[],
            SupplierList:[],
            SIFHeaderID:-1,
            DueDate: new Date(1985,1,10),
            MarketSectorID:-1,
            DrawingLevel:'',
            TargetPrice:-1,
            CommentsToVendor:'',
            FolderAttachments:''
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

            jQuery("#divImgEmail").css("display", "block");
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
                jQuery("#divImgEmail").css("display", "none");
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
            var strSuppliers = '<select id="cboSuppliers" multiple tabindex="2" data-placeholder="Select Emails" style="width: 285px;">';
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
                if (currentBOMLine.selected) newRFQScreen.BomDetailList.push(currentBOMLine);
            }

            var strBOMLines = '<table id="tableNewRFQDetail" border="1" class="display dataTable" style="font-size: 10px;">' +
            '<thead><tr><th>Part Number</th><th>Material/Description</th><th>Qty. Required</th></tr></thead><tbody>';
            
            for (var j = 0; j < newRFQScreen.BomDetailList.length; j++) {
                var current = newRFQScreen.BomDetailList[j];
                strBOMLines += '<tr height="20px;"><td>' + current.PartNumber + '</td>';
                strBOMLines += '<td>' + current.Material + '</td>';
                strBOMLines += '<td>' + current.Qty + '</td>';
                //strBOMLines += '<td><a onclick="return confirm(\'Do you wish to delete this line?\');" href="">Delete</a></td>';
                strBOMLines += '</tr>';
            }
            strBOMLines+= '</tbody></table>';
            jQuery("#divBOMLines").html(strBOMLines);
            jQuery('#tableNewRFQDetail').dataTable({
                "bFilter": false,
                "bLengthChange": false,
                "bInfo": false,
                "bPaginate": false
            }).show();
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
                    jQuery("#divImgEmail").css("display", "none");
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    if (console && console.log) {
                        console.log(jqXHR);
                        console.log(textStatus);
                        console.log(errorThrown);
                    }
                    alertify.alert('An error has occurred.');
                    jQuery("#divImgEmail").css("display", "none");
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

        }
        
        function sendRFQ(e, strSaveMode, onSuccess, onFail) {

            if (validate(e)) {
                retrieveValuesFromControls(); //For newRFQScreen variable

                var strValidation = "";
                if (newRFQScreen.SupplierList.length <= 0) {
                    strValidation = "You must select at least one Supplier.";
                }
                if(newRFQScreen.BomDetailList.length <= 0){
                    strValidation = "You must select at least one BOM Line.";
                }
                if(newRFQScreen.SIFVolumesList.length <= 0){
                    strValidation = "There must be at least one EAU.";
                }
                if(newRFQScreen.SIFHeaderID == -1){
                    strValidation = "SIF ID missing.";
                }
                if(newRFQScreen.DueDate == -1){
                    strValidation = "SIF ID missing.";
                }
                if (strSaveMode == "" || strSaveMode == null) {
                    strValidation = "Error: SaveMode missing.";
                }
                if (strValidation != "") {
                    alertify.alert(strValidation);
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
                        jQuery("#divImgEmail").css("display", "none");
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        if (console && console.log) {
                            console.log(jqXHR);
                            console.log(textStatus);
                            console.log(errorThrown);
                        }
                        alertify.alert('An error has occurred.');
                        jQuery("#divImgEmail").css("display", "none");
                    }
                });
            }
        }
        
    </script>
</asp:Content>
