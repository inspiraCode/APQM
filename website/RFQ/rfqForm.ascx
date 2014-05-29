<%@ Control Language="C#" AutoEventWireup="true" CodeFile="rfqForm.ascx.cs" Inherits="rfqForm" %>
<%@ Register Src="../Utils/Notifier/notifier.ascx" TagName="notifier" TagPrefix="uc7" %>
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
<br />
<br />
<br />
<div style="border: solid; height: 0px; border-color: #D3D3D3; border-width: 2px;">
</div>
<br />
<div data-step='1' data-intro='Select "Quote" if you are able to quote this piece. Otherwise select "No Quote" and please specify your reason.'
    style="width: 300px;">
    <input id="optQuote" bindto="NoQuote" type="radio" name="optQuote" tabindex="1" checked="checked"
        onchange="on_change_option_quote()" />Quote&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <input id="optNoQuote" type="radio" name="optQuote" tabindex="2" onchange="on_change_option_quote()" />No
    Quote<br />
</div>
<br />
<div style="border: solid; height: 0px; border-color: #D3D3D3; border-width: 2px;">
</div>
<div id="quoteSection">
    <div>
        <br />
        <div data-step='2' data-intro='Sometimes you can receive some comments from our purchasing department that can be helpful for you to quote the piece.'
            style="width: 450px;">
            Comments to vendor:<br />
            <textarea rows="4" cols="50" id="txtCommentsToVendor" bindto="CommentsToVendor" class="ReadOnlyFields"
                tabindex="1" style="width:450px;"></textarea>
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
                    <label id="lblDueDate" style="text-align: center;width: 170px;height:20px;display: block;" class="ReadOnlyFields">
                        DueDate</label>
                </td>
                <td align="left" class="style79">
                </td>
                <td align="left" class="style29">
                </td>
                <td align="left" class="style29" rowspan="9">
                    <table cellspacing="0" data-step='16' data-intro='Please complete these fields as applicable.'
                        style="width: 449px;">
                        <tr>
                            <td align="right">
                                Lead Time PPAP/FAIR
                            </td>
                            <td align="left">
                                <input type="text" id="txtLeadTimePPAP_FAIR" bindto="LeadTimePPAPFAIR" value="txtLeadTimePPAP_FAIR"
                                    validationid="validatingRFQForm" style="text-align: right; width: 240px;" tabindex="4" />
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                Lead Time First Production Order
                            </td>
                            <td align="left">
                                <input type="text" id="txtLeadTimeFirstProductionOrder" bindto="LeadTimeFirstProductionOrder"
                                    value="txtLeadTimeFirstProductionOrder" validationid="validatingRFQForm" style="text-align: right;
                                    width: 240px;" tabindex="5" />
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                Lead Time Normal Production Orders
                            </td>
                            <td align="left">
                                <input type="text" id="txtLeadTimeNormalProductionOrders" bindto="LeadTimeNormalProductionOrders"
                                    value="txtLeadTimeNormalProductionOrders" validationid="validatingRFQForm" style="text-align: right;
                                    width: 240px" tabindex="6" />
                            </td>
                        </tr>
                    </table>
                    <table cellspacing="0" style="width: 449px; display: none;">
                        <tr>
                            <td align="right">
                                Production Lead Time
                            </td>
                            <td align="left">
                                <input type="text" id="txtProductionLeadTime" bindto="ProductionLeadTime" value="txtProductionLeadTime"
                                    validationid="validatingRFQForm" style="text-align: right; width: 240px;" tabindex="6" />
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                Production Tooling Lead Time
                            </td>
                            <td align="left">
                                <input type="text" id="txtProductionToolingLeadTime" value="txtProductionToolingLeadTime"
                                    validationid="validatingRFQForm" style="text-align: right; width: 240px;" tabindex="6" />
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                Prototype Tooling Lead Time
                            </td>
                            <td align="left">
                                <input type="text" id="txtPrototypeToolingLeadTime" bindto="ProductionToolingLeadTime"
                                    value="txtPrototypeToolingLeadTime" validationid="validatingRFQForm" style="text-align: right;
                                    width: 240px;" tabindex="6" />
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                Prototype Piece Lead Time
                            </td>
                            <td align="left">
                                <input type="text" id="txtPrototypePieceLeadTime" bindto="PrototypePieceLeadTime"
                                    value="txtPrototypePieceLeadTime" validationid="validatingRFQForm" style="text-align: right;
                                    width: 240px;" tabindex="6" />
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
                                <input type="text" id="txtLeadTimePPAP" value="txtLeadTimePPAP" validationid="validatingRFQForm"
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
                    <label id="lblRFQNumber" bindto="RfqGenerated" style="text-align: center;width: 170px;display: block;
                        height: 20px" class="ReadOnlyFields">
                        lblRFQNumber</label>
                </td>
                <td align="right" class="style79">
                    Supplier Name
                </td>
                <td align="left" class="style29" data-step='12' data-intro='If this is incorrect, please click Save & Continue Later button. Once saved, you can go back to initial supplier page to make the change to the information.'>
                    <label id="lblSupplierName" bindto="SupplierName" class="ReadOnlyFields" style="width: 220px;display: block;
                        height: 20px;">
                        lblSupplierName</label>
                </td>
            </tr>
            <tr>
                <td align="right" class="style78">
                    Market Sector
                </td>
                <td align="left" class="style77" data-step='6' data-intro='This is the Part Number to quote.'>
                    <label id="lblMarketSector" bindto="MarketSectorName" style="text-align: center;display: block;
                        width: 170px; height: 20px;" class="ReadOnlyFields">
                        lblMarketSector</label>
                </td>
                <td align="right" class="style79">
                    Manufacturing Location
                </td>
                <td align="left" class="style29" data-step='13' data-intro='If this is incorrect, please click Save & Continue Later button. Once saved, you can go back to initial supplier page to make the change to the information.'>
                    <label id="lblManufacturingLocation" bindto="ManufacturingLocation" class="ReadOnlyFields"
                        style="width: 220px; height: 20px;display: block;">
                        lblManufacturingLocation</label>
                </td>
            </tr>
            <tr>
                <td align="right" class="style78">
                    Component Part Number
                </td>
                <td align="left" class="style77" data-step='7' data-intro='Market Sector of this piece.'>
                    <label id="lblPartNumber" bindto="PartNumber" class="ReadOnlyFields" style="text-align: center;
                        width: 170px; height: 20px;display: block;">
                        lblPartNumber</label>
                </td>
                <td align="right" class="style79">
                    Ship From Location
                </td>
                <td align="left" class="style29" data-step='14' data-intro='If this is incorrect, please click Save & Continue Later button. Once saved, you can go back to initial supplier page to make the change to the information.'>
                    <label id="lblShipFromLocation" bindto="ShipLocation" class="ReadOnlyFields" style="width: 220px;display: block;
                        height: 20px">
                        lblShipFromLocation</label>
                </td>
            </tr>
            <tr align="left">
                <td align="right" class="style78" rowspan="2">
                    Part Description
                </td>
                <td align="left" class="style77" rowspan="2" data-step='8' data-intro='This is the material or name of the piece to quote.'>
                    <label id="lblPartName" bindto="PartMaterial" class="ReadOnlyFields" style="text-align: left;
                        width: 170px; height: 48px;display: block;">
                        lblPartName</label>
                </td>
                <td align="right" class="style79">
                    Prepared By
                </td>
                <td align="left" class="style29" data-step='15' data-intro='Please enter your name.'>
                    <input type="text" id="txtPreparedBy" bindto="PreparedBy" value="txtPreparedBy" validate="required"
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
                        width: 170px; height: 20px;display: block;">
                        lblDrawingLevel</label>
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
                    <label id="lblTargetPriceLabel" style="text-align: right;width:145px;height:20px;display:block;">Target Price<label>
                </td>
                <td align="left" class="style77" data-step='11' data-intro='Target Price. If specified by Purchasing Department.'>
                    <label id="lblTargetPrice" bindto="TargetPrice" style="text-align: right; width: 170px;
                        height: 20px;display:block;" class="ReadOnlyFields">
                        lblTargetPrice</label>
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
    <div style="border: solid; height: 0px; border-color: #FE0000; border-width: 1px;">
    </div>
    <div style="background-color: rgba(185, 198, 219, 0.28);">
        <br />
        <div id="divDetailSection">
        </div>
    </div>
    <div style="border: solid; height: 0px; border-color: #D3D3D3; border-width: 2px;">
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
                <td align="center" rowspan="4" data-step='42' data-intro='Outline your annual cost reduction commitment.'>
                </td>
            </tr>
            <tr>
                <td align="right" class="style61" style="width: 260px;">
                    Production Tooling
                </td>
                <td class="style62" align="right" data-step='39' data-intro='Enter Production Tooling Cost.'>
                    <input type="text" id="txtProductionTooling" bindto="ProductionTooling" value="txtProductionTooling"
                        validate="number" validationid="validatingRFQForm" style="text-align: right"
                        tabindex="24" />
                </td>
            </tr>
            <tr>
                <td align="right" class="style61">
                    Prototype Tooling
                </td>
                <td class="style62" align="right" data-step='40' data-intro='Enter Prototype Tooling Cost.'>
                    <input type="text" id="txtPrototypeTooling" bindto="PrototypeTooling" value="txtPrototypeTooling"
                        validate="number" validationid="validatingRFQForm" style="text-align: right"
                        tabindex="25" />
                </td>
            </tr>
            <tr>
                <td align="right" class="style61">
                    Prototype Piece
                </td>
                <td class="style62" align="right" data-step='41' data-intro='Enter Prototype Piece Cost.'>
                    <input type="text" id="txtPrototypePiece" bindto="PrototypePiece" value="txtPrototypePiece"
                        validate="number" validationid="validatingRFQForm" style="text-align: right"
                        tabindex="26" />
                </td>
            </tr>
        </table>
        <div style="float: left; margin-left: 50px; margin-right: 40px;">
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
                        <input type="text" id="txtWeight" bindto="Weight" value="txtWeight" validate="number"
                            validationid="validatingRFQForm" style="text-align: right; width: 94px" tabindex="32" />
                    </div>
                </td>
            </tr>
            <tr>
                <td align="right" data-step='44' data-intro='Enter the MOQ if applicable.' class="style78">
                    MOQ
                    <input type="text" id="txtMOQ" bindto="Moq" value="txtMOQ" style="text-align: right;
                        width: 130px" tabindex="33" />
                </td>
            </tr>
            <tr>
                <td align="right" data-step='45' data-intro='Enter the Brand if applicable.' class="style78">
                    Brand
                    <input type="text" value="txtMake" bindto="Make" id="txtMake" style="text-align: right;
                        width: 130px" tabindex="34" />
                </td>
            </tr>
            <tr>
                <td align="right" class="style78">
                    Cavitation
                    <input type="text" id="txtCavitation" bindto="Cavitation" value="txtCavitation" style="text-align: right;
                        width: 130px;" tabindex="35" />
                </td>
            </tr>
            <tr>
                <td align="right" class="style78">
                    Material
                    <input type="text" id="txtMaterial" bindto="Material" value="txtMaterial" style="text-align: right;
                        width: 130px" tabindex="36" />
                </td>
            </tr>
        </table>
    </div>
    <br />
    <br />
    <div style="clear: both;">
    <br />
    <br />
        <table align="center">
            <tr>
                <td style="vertical-align: top;width: 460px;">
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
                                style="width: 400px;height:100px;"></textarea>
                        </div>
                    </div>
                </td>
            </tr>
        </table>
    </div>
    <div style="display: inline;">
        <asp:HiddenField ID="hiddenInboxAttachments" runat="server" />
        <br />
        <div id="divImgEmail" style="display: none; position: fixed; bottom: 100px; right: 100px;">
            <img id="" alt="" src="../Utils/loading.gif" style="display: inline;" />
            <span style="display: inline;">Please wait..</span>
        </div>
    </div>
</div>
<asp:Button ID="btnFinalize" runat="server" Text="Finalize and submit" Width="132px"
    OnClick="btnFinalize_Click" Style="display: none;" />
<asp:Button ID="btnSave" runat="server" Text="Save and continue later" Width="160px"
    Style="display: none;" OnClick="btnSave_Click" />
<div id="noQuoteSection" style="vertical-align: top;">
    <br />
    <br />
    Reason
    <textarea rows="4" cols="50" id="txtReasonNoQuote" bindto="ReasonNoQuote" tabindex="38">txtReasonNoQuote</textarea>
</div>
<br />
<br />
<br />
<br />
<uc7:notifier ID="uscNotifier" runat="server" />
<script type="text/javascript">



    var uploadObj = null;


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

    var strSaveMode;
    function uploadFiles(e, strSaveModeParameter) {
        //        if (strSaveMode == "finalize") {
        //            //jQuery('#messageDisplayer').text('It is required to have at least one item added to the list.').show();

        //           
        //        } else if (strSaveMode == "save") {
        //        }
        strSaveMode = strSaveModeParameter;
        if (validate(e)) {
            if (uploadObj != null) {
                try {
                    enableCaller(false);
                } catch (e) {
                }
                jQuery("#divImgEmail").css("display", "block");
                var filesToUploadCount = jQuery(".ajax-file-upload-statusbar").children().filter("div:contains('Cancel'):visible").length;
                if (filesToUploadCount > 0) {
                    uploadObj.startUpload();
                } else {
                    save();
                }
            }
        }
    }


    jQuery(document).ready(function () {
        var params = urlParamsToObject();
        if (params.hasOwnProperty('rfq')) {
            getRFQ(params.rfq);
        }
    });




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
        jQuery.getJSON('<%= ResolveUrl("~/RFQ/RFQ.aspx") %>?cmd=read&id=' + id, function (result) {
            RFQ = result;
            refreshForm();
        });
        return true;
    }

    function resetForm() {
        jQuery("[bindTo]").each(function () {
            setValueForControl(this, jQuery(this), '');
        });

        jQuery(".handsontable").each(function () {
            jQuery(this).handsontable("getInstance").destroy();
        })

        jQuery(".rfqDetailTotals").remove();
        jQuery("#divDetailSection").empty();

        jQuery("#divAttachmentsToVendor").empty();
        jQuery("#divAttachmentsToBuyer").empty();

        jQuery("#lblDueDate").text("");

        //        jQuery("#uploadZone").empty().text("Upload");
        //        jQuery("#uploadZone").siblings().remove();
    }

    function deleteAttachmentToBuyer(directory, fileName) {
        jQuery("#divImgEmail").css("display", "block");
        jQuery.ajax({
            type: "POST",
            url: '<%= ResolveUrl("~/RFQ/RFQ.aspx") %>?cmd=deleteAttachmentToBuyer&Directory=' + directory + '&FileName=' + fileName,
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
                console.debug(jqXHR);
                console.debug(textStatus);
                console.debug(errorThrown);
            }
        });
    }

    function loadAttachmentsToBuyer() {
        if (RFQ.AttachmentsToBuyer != null) {

            var strTable = '<table id="tableAttachmentsToBuyer">';
            for (var i = 0; i < RFQ.AttachmentsToBuyer.length; i++) {
                var current = RFQ.AttachmentsToBuyer[i];

                strTable += '<tr fileName="' + current.FileName + '"><td style="width: 380px;">';
                strTable += '<a href="<%= ResolveUrl("~/RFQ/RFQ.aspx") %>?cmd=downloadAttachmentToBuyer&Directory=' + current.Directory + '&FileName=' + current.FileName + '">' + current.FileName + '</ a>';
                strTable += '</td><td>';
                strTable += '<a style="margin-left:10px;" href="#" onclick="deleteAttachmentToBuyer(\'' + current.Directory + '\', \'' + current.FileName + '\');return false;">Delete</ a><br />';
                strTable += '</td></ tr>';
            }

            strTable += '</ table>';
            jQuery("#divAttachmentsToBuyer").append(strTable);

        } else {
            jQuery("#divAttachmentsToBuyer").append('No files attached.');
        }
    }
    function refreshForm() {
        resetForm();
        if (RFQ.NoQuote == false) {
            jQuery("#optQuote").prop('checked', true);
            jQuery("#optNoQuote").prop('checked', false);
        } else {
            jQuery("#optQuote").prop('checked', false);
            jQuery("#optNoQuote").prop('checked', true);
        }

        if (RFQ.TargetPrice < 0)
        {
            lblTargetPrice.Visible = false;
            lblTargetPriceLabel.Visible = false;
        }

        on_change_option_quote();
        jQuery("[toHide]").hide();

        uploadObj = jQuery("#uploadZone").uploadFile({
            url: '<%= ResolveUrl("~/Vendor/RFQ.aspx") %>?RFQATTACHMENTSFOLDERINBOX=' + RFQ.InboxAttachmentsFolder,
            multiple: true,
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
            }
        });

        bindParentFields();
        jQuery("#lblDueDate").text((new Date(RFQ.DueDate)).toLocaleDateString());
        if (RFQ.RfqEAV != null) {
            for (var i = 0; i < RFQ.RfqEAV.length; i++) {
                var objEAU = RFQ.RfqEAV[i];
                var htmlEAU = '<div align="left" style="height: 20px;">' +
                    '<div style="display: inline;margin-right: 5px;">Estimated Annual Usage:</div>' +
                    '<label style="min-width: 300px; display: inline-block;">' + objEAU.Volume + '</ label>' +
                    '<div style="display: inline;margin-left:20px;margin-right: 5px;">Years:</div>' +
                    '<label style="min-width: 300px; display: inline-block;">' + objEAU.Year + '</ label></div>' +
                    '<div rfqeau_id=' + objEAU.Id + ' /><br /><br />';

                var htmlTotals = '<div class="rfqDetailTotals" style="width: 100%; height: 140px;">' +
                    '    <table cellspacing="0" align="right" style="width: 300px;">' +
                    '        <tr>' +
                    '            <td align="right" class="style75" style="border-top: solid gray; border-left: solid gray;">' +
                    '                Total Manufacturing Cost&nbsp;&nbsp;' +
                    '            </td>' +
                    '            <td align="left" class="style31" style="border-top: solid gray; border-right: solid gray;"' +
                    '                data-step="33" data-intro="Total Manufacturing Cost (formulated cell not to be completed by Supplier)."' +
                    '                data-position="left">' +
                    '                <label idTotalManufacturingCost="' + objEAU.Id + '" class="calculatedField" style="text-align: right;' +
                    '                    margin-left: 0px; width: 100px; height: 20px;display: block;padding-right: 3px;">' +
                    '                    0</label>' +
                    '            </td>' +
                    '        </tr>' +
                    '        <tr>' +
                    '            <td align="right" class="style75" style="border-left: solid gray;">' +
                    '                SG&amp;A Profit&nbsp;&nbsp;' +
                    '            </td>' +
                    '            <td align="left" class="style31" style="border-right: solid gray;" data-step="34"' +
                    '                data-intro="Enter cost for SG&A/Profit" data-position="left">' +
                    '                <input type="text" idSGAProfit="' + objEAU.Id + '" validate="number" validationid="validatingRFQForm"' +
                    '                    style="text-align: right; width: 100px;" onchange="summarizeTotalPieceCost(' + objEAU.Id + ')"' +
                    '                    onkeyup="summarizeTotalPieceCost(' + objEAU.Id + ')" tabindex="20" />' +
                    '            </td>' +
                    '        </tr>' +
                    '        <tr>' +
                    '            <td align="right" class="style75" style="border-left: solid gray;">' +
                    '                Packing Cost/Unit&nbsp;&nbsp;' +
                    '            </td>' +
                    '            <td align="left" class="style31" style="border-right: solid gray;" data-step="35"' +
                    '                data-intro="Enter packaging cost per unit." data-position="left">' +
                    '                <input type="text" idPackingCostUnit="' + objEAU.Id + '" validate="number" validationid="validatingRFQForm"' +
                    '                    style="text-align: right; width: 100px;" onchange="summarizeTotalPieceCost(' + objEAU.Id + ')"' +
                    '                    onkeyup="summarizeTotalPieceCost(' + objEAU.Id + ')" tabindex="21" />' +
                    '            </td>' +
                    '        </tr>' +
                    '        <tr align="left">' +
                    '            <td align="right" class="style75" style="border-left: solid gray;">' +
                    '                Assembly Cost/Unit&nbsp;&nbsp;' +
                    '            </td>' +
                    '           <td align="left" class="style31" style="border-right: solid gray;" data-step="36"' +
                    '                data-intro="Enter cost for assembly, if applicable." data-position="left">' +
                    '                <input type="text" idAssemblyCostUnit="' + objEAU.Id + '" validate="number" validationid="validatingRFQForm"' +
                    '                    style="text-align: right; width: 100px;" onchange="summarizeTotalPieceCost(' + objEAU.Id + ')"' +
                    '                    onkeyup="summarizeTotalPieceCost(' + objEAU.Id + ')" tabindex="22" />' +
                    '            </td>' +
                    '        </tr>' +
                    '        <tr>' +
                    '            <td align="right" class="style75" style="border-left: solid gray; border-bottom: solid gray;">' +
                    '                Total Piece Cost&nbsp;&nbsp;' +
                    '            </td>' +
                    '            <td align="left" class="style31" data-step="37" data-intro="Total Piece Cost (formulated cell not to be completed by the Supplier)."' +
                    '                data-position="left" style="border-right: solid gray; border-bottom: solid gray;">' +
                    '                <label idTotalPieceCost="' + objEAU.Id + '" class="calculatedField" style="text-align: right; width: 100px; height: 20px;display: block;padding-right: 3px;">' +
                    '                    0</label>' +
                    '            </td>' +
                    '        </tr>' +
                    '    </table>' +
                    '</div>'

                jQuery("#divDetailSection").append(htmlEAU);
                jQuery("#divDetailSection").append(htmlTotals);

            }
        }

        if (RFQ.AttachmentsToVendor != null) {
            for (var i = 0; i < RFQ.AttachmentsToVendor.length; i++) {
                var current = RFQ.AttachmentsToVendor[i];
                var htmlAttachmentToVendor = '<a href="<%= ResolveUrl("~/RFQ/RFQ.aspx") %>?cmd=downloadAttachmentToVendor&Directory=' + current.Directory + '&FileName=' + current.FileName + '">' + current.FileName + '</ a><br />'
                jQuery("#divAttachmentsToVendor").append(htmlAttachmentToVendor);
            }
        } else {
            jQuery("#divAttachmentsToVendor").append('No files attached.');
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
                                data: "Um"
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
                    if (source != "loadData") {
                        var data = this.getData();

                        var sumMaterialTotal = 0;
                        var sumServiceTotal = 0;
                        var sumScrapCost = 0;
                        var sumLaborCost = 0;
                        var sumTotalBurden = 0;
                        for (var i = 1; i < data.length - 1; i++) {

                            data[i].MaterialTotal = data[i].RpcQty * data[i].RpcCostPerUnit;
                            data[i].ServiceTotal = data[i].OSQty * data[i].OSCostPerUnit;
                            data[i].ScrapCost = (data[i].MaterialTotal + data[i].ServiceTotal) * data[i].ScrapValue / 100;
                            data[i].LaborCost = data[i].DirectHrlyLaborRate * data[i].StdHrs;
                            data[i].BurdenTotal = data[i].Burden;

                            sumMaterialTotal += data[i].MaterialTotal;
                            sumServiceTotal += data[i].ServiceTotal;
                            sumScrapCost += data[i].ScrapCost;
                            sumLaborCost += data[i].LaborCost;
                            sumTotalBurden += data[i].BurdenTotal;
                        }

                        jQuery('[idtotalmanufacturingcost="' + self.id_EAU + '"]').text((sumMaterialTotal + sumServiceTotal + sumScrapCost + sumLaborCost + sumTotalBurden).toFixed(4));
                        summarizeTotalPieceCost(self.id_EAU);

                        this.render();
                    }
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
                            data: "Year"
                        },
                        {
                            data: "Porcentage"
                        }
                    ]
        });

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

        for (var i = 0; i < RFQ.RfqEAV.length; i++) {
            var current = RFQ.RfqEAV[i];
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

        if (RFQ.NoQuote == false) {
            jQuery("#optQuote").prop('checked', false);
            jQuery("#optNoQuote").prop('checked', true);
        } else {
            jQuery("#optQuote").prop('checked', true);
            jQuery("#optNoQuote").prop('checked', false);
        }

        if (jQuery("#optQuote").is(':checked')) {
            RFQ.NoQuote = false;
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


    function save() {
        var to = '<%= ResolveUrl("~/RFQ/RFQ.aspx") %>?cmd=' + strSaveMode;

        retrieveValuesFromControls(); //For RFQ
        if (strSaveMode == "update") {
            RFQ.Status = "IN PROGRESS";
        } else if (strSaveMode == "finalize") {
            RFQ.Status = "COMPLETED";
        }
        else {
            return;
        }

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
                alertify.success("Information saved successfully.");
            },
            error: function (jqXHR, textStatus, errorThrown) {
                console.debug(jqXHR);
                console.debug(textStatus);
                console.debug(errorThrown);
            }
        });
    }
</script>
