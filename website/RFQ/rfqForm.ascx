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
            style="width: 555px;">
            Comments to vendor:<br />
            <textarea rows="4" cols="50" id="txtCommentsToVendor" bindto="CommentsToVendor" class="ReadOnlyFields"
                tabindex="1"></textarea>
        </div>
        <br />
        <br />
    </div>
    <div>
        <br />
        <div style="background-color: #D3D3D3; width: 550px; min-height: 20px;" data-step='3'
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
                    <label id="lblDueDate" bindto="DueDate" style="text-align: center" class="ReadOnlyFields">
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
                    <label id="lblRFQNumber" style="text-align: center; width: 145px; height: 20px" class="ReadOnlyFields">
                        lblRFQNumber</label>
                </td>
                <td align="right" class="style79">
                    Supplier Name
                </td>
                <td align="left" class="style29" data-step='12' data-intro='If this is incorrect, please click Save & Continue Later button. Once saved, you can go back to initial supplier page to make the change to the information.'>
                    <label id="lblSupplierName" bindto="SupplierName" class="ReadOnlyFields" style="width: 220px;
                        height: 20px;">
                        lblSupplierName</label>
                </td>
            </tr>
            <tr>
                <td align="right" class="style78">
                    Market Sector
                </td>
                <td align="left" class="style77" data-step='6' data-intro='This is the Part Number to quote.'>
                    <label id="lblMarketSector" bindto="MarketSectorName" style="text-align: center;
                        width: 145px; height: 20px;" class="ReadOnlyFields">
                        lblMarketSector</label>
                </td>
                <td align="right" class="style79">
                    Manufacturing Location
                </td>
                <td align="left" class="style29" data-step='13' data-intro='If this is incorrect, please click Save & Continue Later button. Once saved, you can go back to initial supplier page to make the change to the information.'>
                    <label id="lblManufacturingLocation" bindto="ManufacturingLocation" class="ReadOnlyFields"
                        style="width: 220px; height: 20px;">
                        lblManufacturingLocation</label>
                </td>
            </tr>
            <tr>
                <td align="right" class="style78">
                    Component Part Number
                </td>
                <td align="left" class="style77" data-step='7' data-intro='Market Sector of this piece.'>
                    <label id="lblPartNumber" bindto="PartNumber" class="ReadOnlyFields" style="text-align: center;
                        width: 145px; height: 20px">
                        lblPartNumber</label>
                </td>
                <td align="right" class="style79">
                    Ship From Location
                </td>
                <td align="left" class="style29" data-step='14' data-intro='If this is incorrect, please click Save & Continue Later button. Once saved, you can go back to initial supplier page to make the change to the information.'>
                    <label id="lblShipFromLocation" bindto="ShipLocation" class="ReadOnlyFields" style="width: 220px;
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
                        width: 200px; height: 48px;">
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
                        width: 145px; height: 20px;">
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
                    <asp:Label ID="lblTargetPriceLabel" runat="server" Style="text-align: right" Width="145px"
                        Height="20px">Target Price</asp:Label>
                </td>
                <td align="left" class="style77" data-step='11' data-intro='Target Price. If specified by Purchasing Department.'>
                    <label id="lblTargetPrice" bindto="TargetPrice" style="text-align: right; width: 145px;
                        height: 20px;" class="ReadOnlyFields">
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
                    <textarea rows="4" cols="50" id="txtToolingDetail" tabindex="23"></textarea>
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
        <div style="float: left; margin-left: 50px; margin-right: 50px;">
            <div style="width: 200px;">
                Annual Cost Reduction Commitment
            </div>
            <div id="divACR">
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
        <table>
            <tr>
                <td style="vertical-align: top;">
                    Attachments from Vendor to Buyer (less than 4MB per file):<br />
                    <div id="uploadContainer" data-position='right' data-step='46' data-intro='In this area you can upload attachments pressing the button or draggin a file into the area delimited.'
                        style="height: 200px; overflow-y: auto; width: 450px; background-color: #D3D3D3;"
                        align="center">
                        <div id="uploadZone">
                            Upload
                        </div>
                    </div>
                </td>
                <td style="vertical-align: top;">
                    <div style="background-color: #D3D3D3; width: 450px; min-height: 216px;" data-step='47'
                        data-position='left' data-intro='Here are the attachments that you sent to Purchasing Department.'>
                        Attachments from Vendor to Buyer, already sent:
                        <br />
                        <div id="divAttachmentsToBuyer">
                        </div>
                    </div>
                </td>
            </tr>
        </table>
    </div>
    <div align="left">
        Comments</div>
    <div data-step='48' data-intro='If you have any comments to share with us, please use this field.'
        data-position='top' style="width: 100%;">
        <textarea rows="4" cols="0" id="txtComments" bindto="CommentsToBuyer" tabindex="37"
            style="width: 100%;"></textarea>
    </div>
    <div style="display: inline;">
        <asp:HiddenField ID="hiddenInboxAttachments" runat="server" />
        <br />
        <div id="divImgEmail" style="display: none;">
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
<asp:HiddenField ID="hiddenSaveButtonClickedID" runat="server" />
<br />
<br />
<uc7:notifier ID="uscNotifier" runat="server" />

<script type="text/javascript">
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




    function test() {
        var json = "{Example:1,Example2:2}"
        var to = '<%= ResolveUrl("~/RFQ/RFQ.aspx") %>?Save=1';
        var options = {
            type: "POST",
            url: to,
            data: json,
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            async: false,
            success: function (response) {
                alert("success");
            },
            error: function (msg) { alert(msg); }
        };

        var returnText = $.ajax(options).responseText;
    }




    var RFQ;
    function getRFQ(id) {
        jQuery.getJSON('<%= ResolveUrl("~/RFQ/RFQ.aspx") %>?cmd=read&id=' + id, function (result) {
            RFQ = result;
            RFQ.DateFilledOut = new Date(RFQ.DateFilledOut);
            RFQ.DeadDate = new Date(RFQ.DeadDate);
            RFQ.DueDate = new Date(RFQ.DueDate);
            RFQ.FilledUp = new Date(RFQ.FilledUp);
            RFQ.SentToVendor = new Date(RFQ.SentToVendor);
            refreshForm();
        });
        return true;
    }





    function refreshForm() {
        bindParentFields();
        if (RFQ.RfqEAV != null) {
            for (var i = 0; i < RFQ.RfqEAV.length; i++) {
                var objEAU = RFQ.RfqEAV[i];
                var htmlEAU = '<div align="left" style="height: 20px;">' +
                    '<div style="display: inline;margin-right: 5px;">Estimated Annual Usage:</div>' +
                    '<label style="min-width: 300px; display: inline-block;">' + objEAU.Volume + '</ label>' +
                    '<div style="display: inline;margin-left:20px;margin-right: 5px;">Years:</div>' +
                    '<label style="min-width: 300px; display: inline-block;">' + objEAU.Year + '</ label></div>' +
                    '<div rfqeau_id=' + objEAU.Id + ' /><br /><br />';

                var htmlTotals ='<div style="width: 100%; height: 140px;">' +
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

        if (RFQ.AttachmentsToBuyer != null) {
            for (var i = 0; i < RFQ.AttachmentsToBuyer.length; i++) {
                var current = RFQ.AttachmentsToBuyer[i];
                var htmlAttachmentToBuyer = '<a href="<%= ResolveUrl("~/RFQ/RFQ.aspx") %>?cmd=downloadAttachmentToBuyer&Directory=' + current.Directory + '&FileName=' + current.FileName + '">' + current.FileName + '</ a><br />'
                jQuery("#divAttachmentsToBuyer").append(htmlAttachmentToBuyer);
            }
        } else {
            jQuery("#divAttachmentsToBuyer").append('No files attached.');
        }

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
                            data[i].ServiceTotal =  data[i].OSQty * data[i].OSCostPerUnit;
                            data[i].ScrapCost =  (data[i].MaterialTotal + data[i].ServiceTotal) * data[i].ScrapValue / 100;
                            data[i].LaborCost =  data[i].DirectHrlyLaborRate * data[i].StdHrs;
                            data[i].BurdenTotal =  data[i].Burden;

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

        var detailACR = [["", ""]];
        if (RFQ.RfqAcr != null && RFQ.RfqAcr.length > 0) {
            detailACR.pop();
            for (var k = 0; k < RFQ.RfqAcr.length; k++) {
                var currentACR = RFQ.RfqAcr[k];
                var oRFQACRAdapter = [
                    currentACR.Year,
                    currentACR.Porcentage
                ];
                detailACR.push(oRFQACRAdapter);
            }
        }


        jQuery("#divACR").handsontable({
            colWidths: [70, 70],
            colHeaders: ['Year', 'Cost %'],
            minRows: 5,
            data: detailACR
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
            setValueForControl(this, jQuery(this), RFQ);
        });
    }


    function setValueForControl(ref, control, sourceObject) {
        var value = sourceObject[control.attr("bindTo")];
        if (value instanceof Date) {
            value = value.toLocaleDateString();
        }
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

    
</script>
<script type="text/javascript">

    jQuery(document).ready(function () {
        on_change_option_quote();
        jQuery("[toHide]").hide();

        uploadObj = jQuery("#uploadZone").uploadFile({
            url: '<%= ResolveUrl("~/Vendor/RFQ.aspx") %>',
            multiple: true,
            fileName: "myfile",
            autoSubmit: false,
            uploadButtonClass: "ajax-file-upload-green",
            maxFileSize: 4194304,
            onError: function (files, status, errMsg) {
                //files: list of files
                //status: error status
                //errMsg: error message
                try {
                    enableCaller(true);
                } catch (e) {
                }
            },
            afterUploadAll: function () {
                setTimeout(jQuery("#" + jQuery("#<%= hiddenSaveButtonClickedID.ClientID %>").val()).click(), 5);
                jQuery("#divImgEmail").css("display", "block");
            }
        });
    });

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

    
    var uploadObj = null;

    function uploadFiles(e, strSaveMode) {
        //        if (strSaveMode == "finalize") {
        //            var btnAddRFQDetail =jQuery('#');
        //            if (btnAddRFQDetail.css('display') != "none" && btnAddRFQDetail.is(":visible")) {
        //                var iTotalRowsRFQDetail = jQuery("#tableRFQDetail tr").length;
        //                
        //                if (iTotalRowsRFQDetail < 6) {
        //                    var pos = btnAddRFQDetail.position();
        //                    jQuery('#messageDisplayer').css('left', (pos.left - 9) + 'px');
        //                    jQuery('#messageDisplayer').css('top', (pos.top + btnAddRFQDetail.outerHeight() + 2) + 'px');
        //                    jQuery('#scrim').show();
        //                    jQuery('#messageDisplayer').text('It is required to have at least one item added to the list.').show();
        //                    jQuery('html, body').animate({
        //                        scrollTop: btnAddRFQDetail.offset().top - 300
        //                    }, 100);
        //                    btnAddRFQDetail.focus();
        //                    return;
        //                }
        //            }
        //            jQuery("#<%= hiddenSaveButtonClickedID.ClientID %>").val("<%= btnFinalize.ClientID %>");
        //        } else if (strSaveMode == "save") {
        //            jQuery("#<%= hiddenSaveButtonClickedID.ClientID %>").val("<%= btnSave.ClientID %>");
        //        }

        //        if (validate(e)) {
        //            if (uploadObj != null) {
        //                try {
        //                    enableCaller(false);
        //                } catch (e) {
        //                }

        //                if (uploadObj.fileCounter > 1) {
        //                    uploadObj.startUpload();
        //                } else {
        //                    setTimeout(jQuery("#" + jQuery("#<%= hiddenSaveButtonClickedID.ClientID %>").val()).click(), 5);
        //                    jQuery("#divImgEmail").css("display", "block");
        //                }
        //            }
        //        }
        alert("update");
    }
</script>
