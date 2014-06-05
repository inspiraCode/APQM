<%@ Control Language="C#" AutoEventWireup="true" CodeFile="rfqForm.ascx.cs" Inherits="rfqForm" %>
<style type="text/css">
    .calculatedField
    {
        background-color: #4682B4;
        color: white;
    }
    .DeleteBuyerAttachment
    {
        display: none;
    }
    .ReadOnlyFields
    {
        background-color: #D3D3D3;
    }
</style>
<div id="divImgEmail" style="display: none; position: fixed; top: 50px; right: 100px;
    z-index: 1000;">
    <img id="" alt="" src="<%= ResolveUrl("~/Utils/loading.gif") %>" style="display: inline;
        position: relative;" />
    <span style="display: inline; position: relative;">Please wait..</span>
</div>
<br />
<br />
<br />
<br />
<div style="border: solid; height: 0px; border-color: #D3D3D3; border-width: 2px;">
</div>
<br />
<div data-step='1' data-intro='Select "Quote" if you are able to quote this piece. Otherwise select "No Quote" and please specify your reason.'
    style="width: 300px;">
    <input id="optQuote" type="radio" name="optQuote" tabindex="1" checked="checked"
        onchange="on_change_option_quote()" />Quote&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <input id="optNoQuote" type="radio" name="optQuote" tabindex="2" onchange="on_change_option_quote()" />No
    Quote<br />
</div>
<br />
<div style="border: solid; height: 0px; border-color: #D3D3D3; border-width: 2px;">
</div>
<div id="quoteSection" style="display:none;">
    <div>
        <br />
        <div data-step='2' data-intro='Sometimes you can receive some comments from our purchasing department that can be helpful for you to quote the piece.'
            style="width: 450px;">
            Comments to vendor:<br />
            <textarea rows="4" cols="50" id="txtCommentsToVendor" bindto="CommentsToVendor" class="ReadOnlyFields"
                tabindex="1" style="width: 450px;"></textarea>
        </div>
        <br />
        <br />
    </div>
    <div>
        <br />
        <div style="background-color: #D3D3D3; width: 456px; min-height: 20px;" data-step='3'
            data-intro='Sometimes you can receive attachments from our purchasing department that can be helpful for you to quote the piece.'>
            Attachments from Buyer to Vendor:<br />
            <div id="divAttachmentsToVendor">
            </div>
        </div>
        <br />
    </div>
    <div align="center">
        <table cellspacing="0" style="min-width: 1294px; max-width: 1294px; width: 1294px;">
            <tr>
                <td align="right" class="style78">
                    Due Date
                </td>
                <td align="left" class="style77" data-step='4' data-intro='Please complete this RFQ before this date.'>
                    <label id="lblDueDate" style="text-align: center; width: 170px; height: 20px; display: block;"
                        class="ReadOnlyFields">
                    </label>
                </td>
                <td align="left" class="style79">
                </td>
                <td align="left" class="style29">
                </td>
                <td align="left" class="style29" rowspan="9">
                    <table cellspacing="0" data-step='15' data-intro='Please complete these fields as applicable.'
                        style="width: 449px;">
                        <tr>
                            <td align="right">
                                Lead Time PPAP/FAIR
                            </td>
                            <td align="left">
                                <input type="text" id="txtLeadTimePPAP_FAIR" bindto="LeadTimePPAPFAIR" value="" validationid="validatingRFQForm"
                                    style="text-align: right; width: 240px;" tabindex="4" />
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                Lead Time First Production Order
                            </td>
                            <td align="left">
                                <input type="text" id="txtLeadTimeFirstProductionOrder" bindto="LeadTimeFirstProductionOrder"
                                    value="" validationid="validatingRFQForm" style="text-align: right; width: 240px;"
                                    tabindex="5" />
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                Lead Time Normal Production Orders
                            </td>
                            <td align="left">
                                <input type="text" id="txtLeadTimeNormalProductionOrders" bindto="LeadTimeNormalProductionOrders"
                                    value="" validationid="validatingRFQForm" style="text-align: right; width: 240px"
                                    tabindex="6" />
                            </td>
                        </tr>
                    </table>
                    <table cellspacing="0" style="width: 449px; display: none;">
                        <tr>
                            <td align="right">
                                Production Lead Time
                            </td>
                            <td align="left">
                                <input type="text" id="txtProductionLeadTime" bindto="ProductionLeadTime" value=""
                                    validationid="validatingRFQForm" style="text-align: right; width: 240px;" tabindex="6" />
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                Production Tooling Lead Time
                            </td>
                            <td align="left">
                                <input type="text" id="txtProductionToolingLeadTime" value="" validationid="validatingRFQForm"
                                    style="text-align: right; width: 240px;" tabindex="6" />
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                Prototype Tooling Lead Time
                            </td>
                            <td align="left">
                                <input type="text" id="txtPrototypeToolingLeadTime" bindto="ProductionToolingLeadTime"
                                    value="" validationid="validatingRFQForm" style="text-align: right; width: 240px;"
                                    tabindex="6" />
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                Prototype Piece Lead Time
                            </td>
                            <td align="left">
                                <input type="text" id="txtPrototypePieceLeadTime" bindto="PrototypePieceLeadTime"
                                    value="" validationid="validatingRFQForm" style="text-align: right; width: 240px;"
                                    tabindex="6" />
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                &nbsp;
                            </td>
                            <td align="left">
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                Lead Time PPAP
                            </td>
                            <td align="left">
                                <input type="text" id="txtLeadTimePPAP" value="" validationid="validatingRFQForm"
                                    style="text-align: right; width: 240px" tabindex="6" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td align="right" class="style78">
                    RFQ #
                </td>
                <td align="left" class="style77" data-step='5' data-intro='This is our RFQ number.'>
                    <label id="lblRFQNumber" bindto="RfqGenerated" style="text-align: center; width: 170px;
                        display: block; height: 20px" class="ReadOnlyFields">
                    </label>
                </td>
                <td align="right" class="style79">
                    Supplier Name
                </td>
                <td align="left" class="style29" data-step='11' data-intro='If this is incorrect, please click Save & Continue Later button. Once saved, you can go back to initial supplier page to make the change to the information.'>
                    <label id="lblSupplierName" bindto="SupplierName" class="ReadOnlyFields" style="width: 220px;
                        display: block; height: 20px;">
                    </label>
                </td>
            </tr>
            <tr>
                <td align="right" class="style78">
                    Market Sector
                </td>
                <td align="left" class="style77" data-step='6' data-intro='This is the Part Number to quote.'>
                    <label id="lblMarketSector" bindto="MarketSectorName" style="text-align: center;
                        display: block; width: 170px; height: 20px;" class="ReadOnlyFields">
                    </label>
                </td>
                <td align="right" class="style79">
                    Manufacturing Location
                </td>
                <td align="left" class="style29" data-step='12' data-intro='If this is incorrect, please click Save & Continue Later button. Once saved, you can go back to initial supplier page to make the change to the information.'>
                    <label id="lblManufacturingLocation" bindto="ManufacturingLocation" class="ReadOnlyFields"
                        style="width: 220px; height: 20px; display: block;">
                    </label>
                </td>
            </tr>
            <tr>
                <td align="right" class="style78">
                    Component Part Number
                </td>
                <td align="left" class="style77" data-step='7' data-intro='Market Sector of this piece.'>
                    <label id="lblPartNumber" bindto="PartNumber" class="ReadOnlyFields" style="text-align: center;
                        width: 170px; height: 20px; display: block;">
                    </label>
                </td>
                <td align="right" class="style79">
                    Ship From Location
                </td>
                <td align="left" class="style29" data-step='13' data-intro='If this is incorrect, please click Save & Continue Later button. Once saved, you can go back to initial supplier page to make the change to the information.'>
                    <label id="lblShipFromLocation" bindto="ShipLocation" class="ReadOnlyFields" style="width: 220px;
                        display: block; height: 20px">
                    </label>
                </td>
            </tr>
            <tr align="left">
                <td align="right" class="style78" rowspan="2">
                    Part Description
                </td>
                <td align="left" class="style77" rowspan="2" data-step='8' data-intro='This is the material or name of the piece to quote.'>
                    <label id="lblPartName" bindto="PartMaterial" class="ReadOnlyFields" style="text-align: left;
                        width: 170px; height: 48px; display: block;">
                    </label>
                </td>
                <td align="right" class="style79">
                    Prepared By
                </td>
                <td align="left" class="style29" data-step='14' data-intro='Please enter your name.'>
                    <input type="text" id="txtPreparedBy" bindto="PreparedBy" value="" validate="required"
                        validationid="validatingRFQForm" style="width: 216px;" tabindex="3" />
                </td>
            </tr>
            <tr>
                <td align="right" class="style79">
                </td>
                <td align="left" class="style29">
                </td>
            </tr>
            <tr>
                <td align="right" class="style78">
                    Drawing Level
                </td>
                <td align="left" class="style77" data-step='9' data-intro='Drawing Level.'>
                    <label id="lblDrawingLevel" bindto="DrawingLevel" class="ReadOnlyFields" style="text-align: center;
                        width: 170px; height: 20px; display: block;">
                    </label>
                </td>
                <td align="right" class="style79">
                    &nbsp;
                </td>
                <td align="left" class="style29">
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td align="right" class="style78">
                    <label id="lblTargetPriceLabel" style="text-align: right; width: 145px; height: 20px;
                        display: block;">
                    </label>
                </td>
                <td align="left" class="style77" data-step='10' data-intro='Target Price. If specified by Purchasing Department.'>
                    <label id="lblTargetPrice" bindto="TargetPrice" style="text-align: right; width: 170px;
                        height: 20px; display: block;" class="ReadOnlyFields">
                    </label>
                </td>
                <td align="right" class="style79">
                    &nbsp;
                </td>
                <td align="left" class="style29">
                    &nbsp;
                </td>
            </tr>
        </table>
        <br />
        <br />
    </div>
    <div id="divDetailSection">
    </div>
    <br />
    <div style="margin-left: auto; margin-right: auto; width: 980px;">
        <table cellspacing="0" class="style55" style="float: left;">
            <tr align="center">
                <td class="style58" colspan="2">
                    Tooling Detail
                </td>
                <td class="style74" rowspan="5">
                </td>
            </tr>
            <tr>
                <td class="style56" colspan="2" align="right" data-step='38' data-intro='Please provide tooling information.'>
                    <textarea bindto="ToolingDetail" rows="4" cols="50" id="txtToolingDetail" tabindex="23"></textarea>
                </td>
            </tr>
            <tr>
                <td align="right" class="style61" style="width: 260px;">
                    Production Tooling
                </td>
                <td class="style62" align="right" data-step='39' data-intro='Enter Production Tooling Cost.'>
                    <input type="text" id="txtProductionTooling" bindto="ProductionTooling" value=""
                        validate="number" validationid="validatingRFQForm" style="text-align: right"
                        tabindex="24" />
                </td>
            </tr>
            <tr>
                <td align="right" class="style61">
                    Prototype Tooling
                </td>
                <td class="style62" align="right" data-step='40' data-intro='Enter Prototype Tooling Cost.'>
                    <input type="text" id="txtPrototypeTooling" bindto="PrototypeTooling" value="" validate="number"
                        validationid="validatingRFQForm" style="text-align: right" tabindex="25" />
                </td>
            </tr>
            <tr>
                <td align="right" class="style61">
                    Prototype Piece
                </td>
                <td class="style62" align="right" data-step='41' data-intro='Enter Prototype Piece Cost.'>
                    <input type="text" id="txtPrototypePiece" bindto="PrototypePiece" value="" validate="number"
                        validationid="validatingRFQForm" style="text-align: right" tabindex="26" />
                </td>
            </tr>
        </table>
        <div data-step='42' data-intro='Outline your annual cost reduction commitment.' style="float: left;
            margin-left: 50px; margin-right: 40px;">
            <div style="width: 200px;">
                Annual Cost Reduction Commitment
            </div>
            <div id="divACR" style="margin-left: 30px; margin-top: 5px;">
            </div>
        </div>
        <table>
            <tr>
                <td align="right" class="style78">
                    <div style="width: 226px; display: inline;" align="right" data-step='43' data-intro='Please enter the weight of the part to be shipped.'>
                        Shipping Weight (lb)
                        <input type="text" id="txtWeight" bindto="Weight" value="" validate="number" validationid="validatingRFQForm"
                            style="text-align: right; width: 94px" tabindex="32" />
                    </div>
                </td>
            </tr>
            <tr>
                <td align="right" data-step='44' data-intro='Enter the Brand if applicable.' class="style78">
                    Brand
                    <input type="text" value="" bindto="Make" id="txtMake" style="text-align: right;
                        width: 130px" tabindex="34" />
                </td>
            </tr>
            <tr>
                <td align="right" data-step='45' data-intro='Enter the number of Cavitation if applicable.'
                    class="style78">
                    Cavitation
                    <input type="text" id="txtCavitation" bindto="Cavitation" value="" style="text-align: right;
                        width: 130px;" tabindex="35" />
                </td>
            </tr>
            <tr>
                <td align="right" data-step='46' data-intro='Enter the Material if applicable.' class="style78">
                    Material
                    <input type="text" id="txtMaterial" bindto="Material" value="" style="text-align: right;
                        width: 130px" tabindex="36" />
                </td>
            </tr>
        </table>
        <br />
        <br />
        <div style="clear: both;">
            <br />
            <br />
            <table align="center">
                <tr>
                    <td style="vertical-align: top; width: 460px;">
                        Attachments from Vendor to Buyer (less than 4MB per file):<br />
                        <div id="uploadZone">
                            Upload
                        </div>
                        <div style="background-color: #D3D3D3; width: 449px; min-height: 200px;" data-step='47'
                            data-position='left' data-intro='Here are the attachments that you sent to Purchasing Department.'>
                            <br />
                            <div id="divAttachmentsToBuyer">
                            </div>
                        </div>
                    </td>
                    <td>
                        <div style="margin-left: auto; margin-right: auto; width: 100%;">
                            <div align="left">
                                Comments</div>
                            <div data-step='48' data-intro='If you have any comments to share with us, please use this field.'
                                data-position='top' style="width: 100%;">
                                <textarea rows="4" cols="0" id="txtComments" bindto="CommentsToBuyer" tabindex="37"
                                    style="width: 400px; height: 100px;"></textarea>
                            </div>
                        </div>
                    </td>
                </tr>
            </table>
        </div>
        <div style="display: inline;">
            <asp:HiddenField ID="hiddenInboxAttachments" runat="server" />
            <br />
        </div>
    </div>
</div>
<div id="noQuoteSection" style="vertical-align: top;display:none;">
    <br />
    <br />
    Reason
    <textarea rows="4" cols="50" id="txtReasonNoQuote" bindto="ReasonNoQuote" tabindex="38"></textarea>
</div>
<br />
<br />
<br />
<br />
<script type="text/javascript">


    function on_change_option_quote() {
        var optQuote = jQuery("#optQuote");
        if (optQuote.is(':checked')) {
            jQuery("#quoteSection").show();
            jQuery("#noQuoteSection").hide();
        } else {
            jQuery("#quoteSection").hide();
            jQuery("#noQuoteSection").show();
        }
    }

    //    var strSaveMode;
    //    function uploadFiles(e, strSaveModeParameter,) {
    //        //        if (strSaveMode == "finalize") {
    //        //            //jQuery('#messageDisplayer').text('It is required to have at least one item added to the list.').show();

    //        //           
    //        //        } else if (strSaveMode == "save") {
    //        //        }
    //        strSaveMode = strSaveModeParameter;
    //        if (validate(e)) {
    //            if (uploadObj != null) {
    //                try {
    //                    enableCaller(false);
    //                } catch (e) {
    //                }
    //                jQuery("#divImgEmail").css("display", "block");
    //                var filesToUploadCount = jQuery(".ajax-file-upload-statusbar").children().filter("div:contains('Cancel'):visible").length;
    //                if (filesToUploadCount > 0) {
    //                    uploadObj.startUpload();
    //                } else {
    //                    save();
    //                }
    //            }
    //        }
    //    }


    function urlParamsToObject() {
        var result = {};
        var urlParams = location.search.split('?');
        for (var i = 1; i < urlParams.length; i++) {
            var paramsDictionary = urlParams[i].split('=');
            result[paramsDictionary[0]] = paramsDictionary[1];
        }
        return result;
    }

    var RFQ;
    function getRFQ(id) {
        jQuery.getJSON('<%= ResolveUrl("~/WebService/Public/RFQ.aspx") %>?cmd=read&id=' + id, function (result) {
            RFQ = result;
            refreshForm();
            jQuery("#divImgEmail").css("display", "none");

        });
        return true;
    }

    function resetForm() {

        jQuery("[bindTo]").each(function () {
            setValueForControl(this, jQuery(this), '');
        });

        jQuery(".handsontable").each(function () {
            var current = jQuery(this).handsontable("getInstance");
            if (current) {
                current.destroy();
            }
        })

        jQuery(".rfqDetailTotals").remove();
        jQuery("#divDetailSection").empty();

        jQuery("#divAttachmentsToVendor").empty();
        jQuery("#divAttachmentsToBuyer").empty();

        jQuery("#lblDueDate").text("");

        //        jQuery("#uploadZone").empty().text("Upload");
        jQuery(".ajax-upload-dragdrop").remove();
    }

    function deleteAttachmentToBuyer(directory, fileName) {
        jQuery("#divImgEmail").css("display", "block");
        jQuery.ajax({
            type: "POST",
            url: '<%= ResolveUrl("~/WebService/Public/RFQ.aspx") %>?cmd=deleteAttachmentToBuyer&Directory=' + directory + '&FileName=' + fileName,
            contentType: "application/json;charset=utf-8",
            dataType: "html",
            success: function (response) {
                response = jQuery.parseJSON(response);
                if (response.Result) {
                    jQuery("#tableAttachmentsToBuyer tr").filter('[FileName="' + fileName + '"]').remove();
                    alertify.success(response.Result);
                } else {
                    alertify.success("An error has occurried. Please try again.");
                }
                jQuery("#divImgEmail").css("display", "none");
            },
            error: function (jqXHR, textStatus, errorThrown) {
                console.log(jqXHR);
                console.log(textStatus);
                console.log(errorThrown);
            }
        });
    }

    function loadAttachmentsToBuyer() {
        if (RFQ.AttachmentsToBuyer != null) {

            var strTable = '<table id="tableAttachmentsToBuyer">';
            for (var i = 0; i < RFQ.AttachmentsToBuyer.length; i++) {
                var current = RFQ.AttachmentsToBuyer[i];

                strTable += '<tr fileName="' + current.FileName + '"><td style="width: 380px;">';
                strTable += '<a href="<%= ResolveUrl("~/WebService/Public/RFQ.aspx") %>?cmd=downloadAttachmentToBuyer&Directory=' + current.Directory + '&FileName=' + current.FileName + '">' + current.FileName + '</a>';
                strTable += '</td><td>';
                strTable += '<a style="margin-left:10px;" class="deleteAttachmentToBuyer" href="#" onclick="deleteAttachmentToBuyer(\'' + current.Directory + '\', \'' + current.FileName + '\');return false;">Delete</a><br />';
                strTable += '</td></tr>';
            }

            strTable += '</table>';
            jQuery("#divAttachmentsToBuyer").html(strTable);

        } else {
            jQuery("#divAttachmentsToBuyer").html('No files attached.');
        }
    }


    var urlAttachments = '<%= ResolveUrl("~/WebService/Public/RFQ.aspx") %>';


    function refreshForm() {

        var scrollPosition = jQuery("body").scrollTop();
        resetForm();

        if (RFQ.NoQuote == false) {
            jQuery("#optQuote").prop('checked', true);
            jQuery("#optNoQuote").prop('checked', false);
        } else {
            jQuery("#optQuote").prop('checked', false);
            jQuery("#optNoQuote").prop('checked', true);
        }

        if (RFQ.TargetPrice < 0) {
            jQuery("#lblTargetPrice").hide();
            jQuery("#lblTargetPriceLabel").hide();
        } else {
            jQuery("#lblTargetPrice").show();
            jQuery("#lblTargetPriceLabel").show();
        }

        on_change_option_quote();
        jQuery("[toHide]").hide();

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
                    RFQ.InboxAttachmentsFolder = resp[0].FolderName;
                    RFQ.AttachmentsToBuyer = resp[1];
                    jQuery("#divAttachmentsToBuyer").empty();
                    loadAttachmentsToBuyer();
                }
            },
            onSubmit: function (a, b, c, d) {
                this.url = urlAttachments + "?RFQATTACHMENTSFOLDERINBOX=" + RFQ.InboxAttachmentsFolder;
            }
        });

        bindParentFields();
        jQuery("#lblDueDate").text((new Date(RFQ.DueDate)).toLocaleDateString());
        if (RFQ.RfqEAV != null) {
            var htmlAll = '';
            for (var i = 0; i < RFQ.RfqEAV.length; i++) {
                var objEAU = RFQ.RfqEAV[i];
                var htmlEAU = '<div style="border: solid; height: 0px; border-color: #FE0000; border-width: 1px;clear:both;"></div>' +
                               '<div style="background-color: rgba(185, 198, 219, 0.28);"><br>';
                htmlEAU += '<div  data-step="16" data-intro="Please quote for this EAU and Calendar Years" align="left" style="height: 20px;">' +
                    '<div style="display: inline;margin-right: 5px;">Estimated Annual Usage:</div>' +
                    '<label style="display: inline-block;">' + objEAU.Volume + '</label>' +
                    '<div style="display: inline;margin-left:20px;margin-right: 5px;">Calendar Years:</div>' +
                    '<label style="min-width: 300px; display: inline-block;">' + objEAU.Year + '</label></div>' +
                    '<div style="margin-left: auto;margin-right: auto;width: 1295px;" rfqeau_id="' + objEAU.Id + '"></div>';

                var htmlMOQ = '<div data-step="37" data-intro="Please specify MOQ for each EAU." style="position: absolute;margin: 63px;">MOQ<input type="text" idMOQ="' + objEAU.Id + '" style="text-align: right; width: 100px;"' +
                    '              tabindex="20" value="' + objEAU.Moq + '"></div>';
                var htmlTotals = '<div class="rfqDetailTotals" style="width: 100%; height: 160px;background-color: rgba(185, 198, 219, 0.28);">' +
                    '    <table cellspacing="0" align="right" style="width: 305px;margin-right: 11px;margin-top: 7px;">' +
                    '        <tr>' +
                    '            <td align="right" class="style75" style="padding-top: 5px;border-top: solid gray; border-left: solid gray;border-width: 1px;">' +
                    '                Total Manufacturing Cost&nbsp;&nbsp;' +
                    '            </td>' +
                    '            <td align="left" class="style31" style="padding-top: 5px;border-top: solid gray; border-right: solid gray;border-width: 1px;"' +
                    '                data-step="32" data-intro="Total Manufacturing Cost (formulated cell not to be completed by Supplier)."' +
                    '                data-position="left">' +
                    '                <label idTotalManufacturingCost="' + objEAU.Id + '" class="calculatedField" style="text-align: right;' +
                    '                    margin-left: 0px; width: 140px; height: 20px;display: block;padding-right: 3px;">' +
                    '                    0</label>' +
                    '            </td>' +
                    '        </tr>' +
                    '        <tr>' +
                    '            <td align="right" class="style75" style="border-left: solid gray;border-width: 1px;">' +
                    '                SG&amp;A Profit&nbsp;&nbsp;' +
                    '            </td>' +
                    '            <td align="left" class="style31" style="border-right: solid gray;border-width: 1px;" data-step="33"' +
                    '                data-intro="Enter cost for SG&A/Profit" data-position="left">' +
                    '                <input type="text" idSGAProfit="' + objEAU.Id + '" validate="number" validationid="validatingRFQForm"' +
                    '                    style="text-align: right; width: 140px;" onchange="summarizeTotalPieceCost(' + objEAU.Id + ')"' +
                    '                    onkeyup="summarizeTotalPieceCost(' + objEAU.Id + ')" tabindex="20" value="' + objEAU.SgAProfit + '">' +
                    '            </td>' +
                    '        </tr>' +
                    '        <tr>' +
                    '            <td align="right" class="style75" style="border-left: solid gray;border-width: 1px;">' +
                    '                Packing Cost/Unit&nbsp;&nbsp;' +
                    '            </td>' +
                    '            <td align="left" class="style31" style="border-right: solid gray;border-width: 1px;" data-step="34"' +
                    '                data-intro="Enter packaging cost per unit." data-position="left">' +
                    '                <input type="text" idPackingCostUnit="' + objEAU.Id + '" validate="number" validationid="validatingRFQForm"' +
                    '                    style="text-align: right; width: 140px;" onchange="summarizeTotalPieceCost(' + objEAU.Id + ')"' +
                    '                    onkeyup="summarizeTotalPieceCost(' + objEAU.Id + ')" tabindex="21" value="' + objEAU.PackingPerUnit + '">' +
                    '            </td>' +
                    '        </tr>' +
                    '        <tr align="left">' +
                    '            <td align="right" class="style75" style="border-left: solid gray;border-width: 1px;">' +
                    '                Assembly Cost/Unit&nbsp;&nbsp;' +
                    '            </td>' +
                    '           <td align="left" class="style31" style="border-right: solid gray;border-width: 1px;" data-step="35"' +
                    '                data-intro="Enter cost for assembly, if applicable." data-position="left">' +
                    '                <input type="text" idAssemblyCostUnit="' + objEAU.Id + '" validate="number" validationid="validatingRFQForm"' +
                    '                    style="text-align: right; width: 140px;" onchange="summarizeTotalPieceCost(' + objEAU.Id + ')"' +
                    '                    onkeyup="summarizeTotalPieceCost(' + objEAU.Id + ')" tabindex="22" value="' + objEAU.AssemblyCostPerUnit + '">' +
                    '            </td>' +
                    '        </tr>' +
                    '        <tr>' +
                    '            <td align="right" class="style75" style="padding-bottom: 5px;border-left: solid gray; border-bottom: solid gray;border-width: 1px;">' +
                    '                Total Piece Cost&nbsp;&nbsp;' +
                    '            </td>' +
                    '            <td align="left" class="style31" data-step="36" data-intro="Total Piece Cost (formulated cell not to be completed by the Supplier)."' +
                    '                data-position="left" style="padding-bottom: 5px;border-right: solid gray; border-bottom: solid gray;border-width: 1px;">' +
                    '                <label idTotalPieceCost="' + objEAU.Id + '" class="calculatedField" style="text-align: right; width: 140px; height: 20px;display: block;padding-right: 3px;">' +
                    '                    0</label>' +
                    '            </td>' +
                    '        </tr>' +
                    '    </table><br><br><br>' +
                    '</div>';

                htmlTotals += '</div><div style="border: solid; height: 0px; border-color: #D3D3D3; border-width: 1px;"></div><br><br>';
                htmlAll += (htmlEAU + htmlMOQ + htmlTotals);

            }
            jQuery("#divDetailSection").html(htmlAll);
        }

        if (RFQ.AttachmentsToVendor != null) {
            var htmlAttachmentToVendor = '';
            for (var i = 0; i < RFQ.AttachmentsToVendor.length; i++) {
                var current = RFQ.AttachmentsToVendor[i];
                htmlAttachmentToVendor += '<a href="<%= ResolveUrl("~/WebService/Public/RFQ.aspx") %>?cmd=downloadAttachmentToVendor&Directory=' + current.Directory + '&FileName=' + current.FileName + '">' + current.FileName + '</a><br>'
            }
            jQuery("#divAttachmentsToVendor").html(htmlAttachmentToVendor);
        } else {
            jQuery("#divAttachmentsToVendor").html('No files attached.');
        }

        loadAttachmentsToBuyer();

        var pseudoHeaderRenderer = function (instance, td, row, col, prop, value, cellProperties) {
            Handsontable.TextCell.renderer.apply(this, arguments);

            var style = td.style;
            style.textAlign = 'center';
            style.fontStyle = 'normal';
            style.color = '#000';
            style.background = '#eee';

            return td;
        }

        var grayRenderer = function (instance, td, row, col, prop, value, cellProperties) {
            Handsontable.renderers.TextRenderer.apply(this, arguments);
            $(td).css({
                background: '#eee',
                "text-align": "right"
            });
        };

        jQuery('[rfqEAU_ID]').each(function () {
            //jQuery(this).load('<%= ResolveUrl("~/RFQ/RFQDetail.aspx") %>?EAV_ID=' + jQuery(this).attr('rfqEAU_ID') + '&noCache=' + Number(new Date()) + ' #RFQDetailContainer');

            var id_EAU = jQuery(this).attr("rfqEAU_ID");
            this.id_EAU = id_EAU;
            var objEAV = getRFQEAUbyID(id_EAU);
            var detailEAU = [];
            detailEAU.push({
                ItemDescription: "Item Description",
                Um: "UOM",
                RpcQty: "Quantity",
                RpcCostPerUnit: "Cost/Unit",
                MaterialTotal: "Material Total",
                OSQty: "Quantity",
                OSCostPerUnit: "Cost/Unit",
                ServiceTotal: "Service Total",
                ScrapValue: "Scrap Value %",
                ScrapCost: "Scrap Cost",
                DirectHrlyLaborRate: "Directly Hrly Labor Rate",
                StdHrs: "Std Hrs.",
                LaborCost: "Labor Cost",
                Burden: "Burden",
                BurdenTotal: "Total Burden"
            });
            for (var j = 0; j < objEAV.RfqDetail.length; j++) {
                var currentDetail = objEAV.RfqDetail[j];
                detailEAU.push(currentDetail);
            }
            var self = this;
            jQuery(this).handsontable({
                data: detailEAU,
                //width: 1400,
                colWidths: [200, 50, 80, 80, 80, 80, 80, 80, 80, 80, 80, 80, 80, 80, 80],
                minRows: 5,
                minCols: 15,
                minSpareCols: 0,
                //always keep at least 1 spare row at the right
                minSpareRows: 1,
                //always keep at least 1 spare row at the bottom
                rowHeaders: false,
                colHeaders: ['Raw Material And Purchased Components', 'Outside Services', 'Scrap', 'Labor', 'Burden Per Unit'],
                contextMenu: false,
                columns: [
                            {
                                data: "ItemDescription"
                            },
                            {
                                data: "Um",
                                type: "autocomplete",
                                source: ["each", "in", "ft", "yd", "mm", "cm", "m", "g", "kg", "oz", "lt", "gal", "cubic meter"],
                                strict: false
                            },
                            {
                                data: "RpcQty",
                                type: "numeric",
                                format: '0,0.0000',
                                language: 'en' //this is the default locale, set up for USD
                            },
                            {
                                data: "RpcCostPerUnit",
                                type: "numeric",
                                format: '0,0.0000',
                                language: 'en' //this is the default locale, set up for USD
                            },
                            {
                                data: "MaterialTotal",
                                renderer: grayRenderer,
                                readOnly: true,
                                type: "numeric",
                                format: '0,0.0000',
                                language: 'en' //this is the default locale, set up for USD
                            },
                            {
                                data: "OSQty",
                                type: "numeric",
                                format: '0,0.0000',
                                language: 'en' //this is the default locale, set up for USD
                            },
                            {
                                data: "OSCostPerUnit",
                                type: "numeric",
                                format: '0,0.0000',
                                language: 'en' //this is the default locale, set up for USD
                            },
                            {
                                data: "ServiceTotal",
                                renderer: grayRenderer,
                                readOnly: true,
                                type: "numeric",
                                format: '0,0.0000',
                                language: 'en' //this is the default locale, set up for USD
                            },
                            {
                                data: "ScrapValue",
                                type: "numeric",
                                format: '0,0.0000',
                                language: 'en' //this is the default locale, set up for USD
                            },
                            {
                                data: "ScrapCost",
                                renderer: grayRenderer,
                                readOnly: true,
                                type: "numeric",
                                format: '0,0.0000',
                                language: 'en' //this is the default locale, set up for USD
                            },
                            {
                                data: "DirectHrlyLaborRate",
                                type: "numeric",
                                format: '0,0.0000',
                                language: 'en' //this is the default locale, set up for USD
                            },
                            {
                                data: "StdHrs",
                                type: "numeric",
                                format: '0,0.0000',
                                language: 'en' //this is the default locale, set up for USD
                            },
                            {
                                data: "LaborCost",
                                renderer: grayRenderer,
                                readOnly: true,
                                type: "numeric",
                                format: '0,0.0000',
                                language: 'en' //this is the default locale, set up for USD
                            },
                            {
                                data: "Burden",
                                type: "numeric",
                                format: '0,0.0000',
                                language: 'en' //this is the default locale, set up for USD
                            },
                            {
                                data: "BurdenTotal",
                                renderer: grayRenderer,
                                readOnly: true,
                                type: "numeric",
                                format: '0,0.0000',
                                language: 'en' //this is the default locale, set up for USD
                            }
                          ],
                cells: function (row, col, prop) {
                    if (row === 0) {
                        return {
                            type: {
                                renderer: pseudoHeaderRenderer
                            },
                            readOnly: true
                        }
                    }
                },
                afterChange: function (changes, source) {
                    //Calculating formulas:
                    //if (source != "loadData") {
                    var data = this.getData();

                    var sumMaterialTotal = 0;
                    var sumServiceTotal = 0;
                    var sumScrapCost = 0;
                    var sumLaborCost = 0;
                    var sumTotalBurden = 0;
                    for (var i = 1; i < data.length - 1; i++) {

                        data[i].MaterialTotal = Number(data[i].RpcQty) * Number(data[i].RpcCostPerUnit);
                        data[i].ServiceTotal = Number(data[i].OSQty) * Number(data[i].OSCostPerUnit);
                        data[i].ScrapCost = (Number(data[i].MaterialTotal) + Number(data[i].ServiceTotal)) * Number(data[i].ScrapValue) / 100;
                        data[i].LaborCost = Number(data[i].DirectHrlyLaborRate) * Number(data[i].StdHrs);
                        data[i].BurdenTotal = Number(data[i].Burden);

                        sumMaterialTotal += Number(data[i].MaterialTotal);
                        sumServiceTotal += Number(data[i].ServiceTotal);
                        sumScrapCost += Number(data[i].ScrapCost);
                        sumLaborCost += Number(data[i].LaborCost);
                        sumTotalBurden += Number(data[i].BurdenTotal);
                    }

                    jQuery('[idtotalmanufacturingcost="' + self.id_EAU + '"]').text((sumMaterialTotal + sumServiceTotal + sumScrapCost + sumLaborCost + sumTotalBurden).toFixed(4));
                    summarizeTotalPieceCost(self.id_EAU);

                    this.render();
                    //}
                }
            });

            var hot = jQuery(this).handsontable('getInstance');
            var th = hot.rootElement.find('table').first().find('thead tr th');

            th.slice(-3).css('display', 'none');
            th.eq(0).attr('colspan', 5);
            th.eq(1).attr('colspan', 3);
            th.eq(2).attr('colspan', 2);
            th.eq(3).attr('colspan', 3);
            th.eq(4).attr('colspan', 2);

            var instructionCols = jQuery(".htCore:first tr").eq(2).children();
            if (instructionCols.length > 0) {
                instructionCols[0].setAttribute('data-step', '17');
                instructionCols[0].setAttribute('data-intro', 'Please indicate.');

                instructionCols[1].setAttribute('data-step', '18');
                instructionCols[1].setAttribute('data-intro', 'Please indicate the unit of measure.');

                instructionCols[2].setAttribute('data-step', '19');
                instructionCols[2].setAttribute('data-intro', 'Quantity of material used.');

                instructionCols[3].setAttribute('data-step', '20');
                instructionCols[3].setAttribute('data-intro', 'Material cost per unit.');

                instructionCols[4].setAttribute('data-step', '21');
                instructionCols[4].setAttribute('data-intro', 'This is the material cost total (formulated cell not to be completed by Supplier).<br/>Formula:<br/>Quantity x Cost/Unit');

                instructionCols[5].setAttribute('data-step', '22');
                instructionCols[5].setAttribute('data-intro', 'Outside services needed.');

                instructionCols[6].setAttribute('data-step', '23');
                instructionCols[6].setAttribute('data-intro', 'Cost of the outside service.');

                instructionCols[7].setAttribute('data-step', '24');
                instructionCols[7].setAttribute('data-intro', 'This is the outside service cost total (formulated cell not to be completed by Supplier).<br/>Formula:<br/>Quantity x Cost/Unit');

                instructionCols[8].setAttribute('data-step', '25');
                instructionCols[8].setAttribute('data-intro', 'Percentage of scrap.');

                instructionCols[9].setAttribute('data-step', '26');
                instructionCols[9].setAttribute('data-intro', 'This is the scrap cost total (formulated cell not to be completed by Supplier).<br/>Formula:<br/>(Material Total + Service Total) x Scrap Value');

                instructionCols[10].setAttribute('data-step', '27');
                instructionCols[10].setAttribute('data-intro', 'Enter directly labor rate.');

                instructionCols[11].setAttribute('data-step', '28');
                instructionCols[11].setAttribute('data-intro', 'Enter the number of standards hours required per part.');

                instructionCols[12].setAttribute('data-step', '29');
                instructionCols[12].setAttribute('data-position', 'left');
                instructionCols[12].setAttribute('data-intro', 'This is the labor cost total (formulated cell not to be completed by Supplier).<br/>Formula:<br/>Directly Hrly Labor Rate x Std Hrs.');

                instructionCols[13].setAttribute('data-step', '30');
                instructionCols[13].setAttribute('data-position', 'left');
                instructionCols[13].setAttribute('data-intro', 'Enter your total burden cost per unit.');

                instructionCols[14].setAttribute('data-step', '31');
                instructionCols[14].setAttribute('data-position', 'left');
                instructionCols[14].setAttribute('data-intro', 'This is the burden cost total (formulated cell not to be completed  by Supplier).<br/>Formula:<br/>=Burden');
            }
        });

        //var detailACR = [["", ""]];
        var detailACR = [];
        if (RFQ.RfqAcr != null && RFQ.RfqAcr.length > 0) {
            //detailACR.pop();
            for (var k = 0; k < RFQ.RfqAcr.length; k++) {
                var currentACR = RFQ.RfqAcr[k];
                detailACR.push(currentACR);
            }
        }

        jQuery("#divACR").handsontable({
            data: detailACR,
            colWidths: [70, 70],
            minRows: 5,
            minSpareRows: 1,
            rowHeaders: false,
            colHeaders: ['Year', 'Cost %'],
            columns: [
                        {
                            data: "Year",
                            type: "numeric"
                        },
                        {
                            data: "Porcentage",
                            type: "numeric"
                        }
                    ]
        });
        try {
            if (RFQ.Status == "COMPLETED")
                setTimeout(blockIfCompleted(), 1000);
        } catch (e) {//blockIfCompleted function implemented only for vendors in /Vendor/RFQ.aspx
            console.log(e);
        }
        jQuery("body").scrollTop(scrollPosition);
    }


    function getRFQEAUbyID(id) {
        for (var i = 0; i < RFQ.RfqEAV.length; i++) {
            if (RFQ.RfqEAV[i].Id == id) {
                return RFQ.RfqEAV[i];
            }
        }
        return null;
    }


    function bindParentFields() {
        jQuery("[bindTo]").each(function () {
            var value = RFQ[jQuery(this).attr("bindTo")];
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
            getValueFromControl(this, jQuery(this), RFQ);
        });

        if (jQuery("#optQuote").is(':checked')) {
            RFQ.NoQuote = false;

            for (var i = 0; i < RFQ.RfqEAV.length; i++) {
                var current = RFQ.RfqEAV[i];

                current.SgAProfit = jQuery('[idsgaprofit="' + current.Id + '"]').val();
                current.PackingPerUnit = jQuery('[idpackingcostunit="' + current.Id + '"]').val();
                current.AssemblyCostPerUnit = jQuery('[idassemblycostunit="' + current.Id + '"]').val();
                current.Moq = jQuery('[idMOQ="' + current.Id + '"]').val();

                var ht = jQuery('[rfqeau_id="' + current.Id + '"]').handsontable('getInstance');
                var data = ht.getData();
                current.RfqDetail = [];
                for (var j = 1; j < data.length - 1; j++) {
                    if (data[j].ItemDescription != null && data[j].ItemDescription != "") {
                        for (prop in data[j]) {
                            if (data[j].hasOwnProperty(prop)) {
                                if (data[j][prop] == null) {
                                    data[j][prop] = 0;
                                }
                            }
                        }
                        current.RfqDetail.push(data[j]);
                    }
                }
            }

            RFQ.RfqAcr = [];
            var htACR = jQuery('#divACR').handsontable('getInstance');
            var dataACR = htACR.getData();
            for (var j = 0; j < dataACR.length - 1; j++) {
                if (dataACR[j].Year != null && dataACR[j].Year != "" && dataACR[j].Porcentage != null && dataACR[j].Porcentage != "")
                    RFQ.RfqAcr.push(dataACR[j]);
            }


        } else {
            RFQ.NoQuote = true;
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

    function summarizeTotalPieceCost(id_EAU) {
        var txtSGAProfit = jQuery('[idsgaprofit="' + id_EAU + '"]');
        if (txtSGAProfit && jQuery.trim(txtSGAProfit.val()) != "") {
            txtSGAProfit = Number(txtSGAProfit.val());
        }
        else {
            txtSGAProfit = 0;
        }

        var lblTotalManufacturingCost = jQuery('[idtotalmanufacturingcost="' + id_EAU + '"]');
        if (lblTotalManufacturingCost && jQuery.trim(lblTotalManufacturingCost.text()) != "") {
            lblTotalManufacturingCost = Number(lblTotalManufacturingCost.text());
        }
        else {
            lblTotalManufacturingCost.text(0);
        }

        var txtPackingCostUnit = jQuery('[idpackingcostunit="' + id_EAU + '"]');
        if (txtPackingCostUnit && jQuery.trim(txtPackingCostUnit.val()) != "") {
            txtPackingCostUnit = Number(txtPackingCostUnit.val());
        }
        else {
            txtPackingCostUnit = 0;
        }

        var txtAssemblyCostUnit = jQuery('[idassemblycostunit="' + id_EAU + '"]');
        if (txtAssemblyCostUnit && jQuery.trim(txtAssemblyCostUnit.val()) != "") {
            txtAssemblyCostUnit = Number(txtAssemblyCostUnit.val());
        }
        else {
            txtAssemblyCostUnit = 0;
        }

        var lblTotalPieceCost = jQuery('[idtotalpiececost="' + id_EAU + '"]');

        lblTotalPieceCost.text((txtSGAProfit + lblTotalManufacturingCost + txtPackingCostUnit + txtAssemblyCostUnit).toFixed(4));
    }


    function save(e, strSaveMode, onSuccess, onFail) {
        
        if (validate(e)) {
            retrieveValuesFromControls(); //For RFQ variable

            if (strSaveMode == "update") {
                RFQ.Status = "IN PROGRESS";
            } else if (strSaveMode == "finalize") {
                RFQ.Status = "COMPLETED";
            }
            else {
                return;
            }

            var to = '<%= ResolveUrl("~/WebService/Public/RFQ.aspx") %>?cmd=update';

            jQuery("#divImgEmail").css("display", "block");

            jQuery.ajax({
                type: "POST",
                url: to,
                data: JSON.stringify(RFQ),
                contentType: "application/json;charset=utf-8",
                dataType: "html",
                success: function (response) {
                    RFQ = jQuery.parseJSON(response);
                    refreshForm();
                    jQuery("#divImgEmail").css("display", "none");
                    onSuccess();
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    console.log(jqXHR);
                    console.log(textStatus);
                    console.log(errorThrown);
                    onFail();
                }
            });
        }
    }
</script>
