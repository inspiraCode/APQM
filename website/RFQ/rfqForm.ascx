<%@ Control Language="C#" AutoEventWireup="true" CodeFile="rfqForm.ascx.cs" Inherits="rfqForm" %>
<%@ Register Src="rfqACR.ascx" TagName="rfqACR" TagPrefix="uc2" %>
<%@ Register Src="../SIF/sifDetail.ascx" TagName="sifDetail" TagPrefix="uc4" %>
<%@ Register Src="rfqAttachments.ascx" TagName="rfqAttachments" TagPrefix="uc5" %>
<%@ Register Src="rfqVendorAttachments.ascx" TagName="rfqVendorAttachments" TagPrefix="uc6" %>
<%@ Register Src="../Utils/Notifier/notifier.ascx" TagName="notifier" TagPrefix="uc7" %>
<%@ Register Src="rfqDetailList.ascx" TagName="rfqDetailList" TagPrefix="uc1" %>
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
    <input id="optQuote" bindTo="NoQuote"
 type="radio" name="optQuote" tabindex="1" checked="checked" onchange="on_change_option_quote()"/>Quote&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <input id="optNoQuote" type="radio" name="optQuote" tabindex="2" onchange="on_change_option_quote()" />No Quote<br />

    
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
            <textarea rows="4" cols="50" id="txtCommentsToVendor" bindTo="CommentsToVendor"
 class="ReadOnlyFields" TabIndex="1"></textarea>
        </div>
        <br />
        <br />
    </div>
    <div>
        <br />
        <div style="background-color: #D3D3D3; width: 550px; min-height: 20px;" data-step='3'
            data-intro='Sometimes you can receive attachments from our purchasing department that can be helpful for you to quote the piece.'>
            Attachments from Buyer to Vendor:<br />
            <uc5:rfqAttachments ID="uscRfqAttachmentsSent" runat="server" OnAfterDeleteBuyerAttachment="on_after_delete_buyerAttachment" />
        </div>
        <asp:HiddenField ID="hiddenSentAttachmentsFolder" runat="server" />
        <asp:HiddenField ID="hiddenCreatedBy" runat="server" />
        <br />
    </div>
    <div align="center">
        <table cellspacing="0" style="min-width: 1294px; max-width: 1294px; width: 1294px;">
            <tr>
                <td align="right" class="style78">
                    Due Date
                </td>
                <td align="left" class="style77" data-step='4' data-intro='Please complete this RFQ before this date.'>
                <label id="lblDueDate" bindTo="DueDate"
 style="text-align: center" class="ReadOnlyFields">DueDate</label>
                </td>
                <td align="left" class="style79">
                    <asp:Label ID="lblID" runat="server" Visible="False"></asp:Label>
                </td>
                <td align="left" class="style29">
                    <asp:Label ID="lblMode" runat="server" Visible="False">New</asp:Label>
                </td>
                <td align="left" class="style29" rowspan="9">
                    <table cellspacing="0" data-step='16' data-intro='Please complete these fields as applicable.'
                        style="width: 449px;">
                        <tr>
                            <td align="right">
                                Lead Time PPAP/FAIR
                            </td>
                            <td align="left">
                                <input type="text" id="txtLeadTimePPAP_FAIR" bindTo="LeadTimePPAPFAIR"
 value="txtLeadTimePPAP_FAIR" validationid="validatingRFQForm" 
                                    style="text-align: right;Width:240px;" TabIndex="4" />
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                Lead Time First Production Order
                            </td>
                            <td align="left">
                                <input type="text" ID="txtLeadTimeFirstProductionOrder" bindTo="LeadTimeFirstProductionOrder"
 value="txtLeadTimeFirstProductionOrder" validationid="validatingRFQForm"
                                     style="text-align: right;Width:240px;" tabindex="5" />
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                Lead Time Normal Production Orders
                            </td>
                            <td align="left">
                            <input type="text"  ID="txtLeadTimeNormalProductionOrders" bindTo="LeadTimeNormalProductionOrders"
 value="txtLeadTimeNormalProductionOrders" validationid="validatingRFQForm"
                                    style="text-align: right;Width:240px" tabindex="6" />
                            </td>
                        </tr>
                    </table>
                    <table cellspacing="0" style="width: 449px; display: none;">
                        <tr>
                            <td align="right">
                                Production Lead Time
                            </td>
                            <td align="left">
                                <input type="text"  id="txtProductionLeadTime" bindTo="ProductionLeadTime"
 value="txtProductionLeadTime" validationid="validatingRFQForm"
                                    style="text-align: right;Width:240px;" tabindex="6" />
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                Production Tooling Lead Time
                            </td>
                            <td align="left">
                             <input type="text" id="txtProductionToolingLeadTime" 
  value="txtProductionToolingLeadTime" validationid="validatingRFQForm" 
                                    style="text-align: right;Width:240px;" tabindex="6" />
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                Prototype Tooling Lead Time
                            </td>
                            <td align="left">
                            <input type="text" id="txtPrototypeToolingLeadTime" bindTo="ProductionToolingLeadTime"
 value="txtPrototypeToolingLeadTime" validationid="validatingRFQForm" 
                                    style="text-align: right;Width:240px;" tabindex="6" />
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                Prototype Piece Lead Time
                            </td>
                            <td align="left">
                            <input type="text" id="txtPrototypePieceLeadTime" bindTo="PrototypePieceLeadTime"
 
 value="txtPrototypePieceLeadTime" validationid="validatingRFQForm"
                                    style="text-align: right;Width:240px;" tabindex="6" />
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
                            <input type="text" ID="txtLeadTimePPAP" value="txtLeadTimePPAP" validationid="validatingRFQForm" 
                                    style="text-align: right;Width:240px" TabIndex="6" />
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
                    <label ID="lblRFQNumber"  Style="text-align: center;Width:145px"
                        class="ReadOnlyFields" Height="20px">lblRFQNumber</label>
                </td>
                <td align="right" class="style79">
                    Supplier Name
                </td>
                <td align="left" class="style29" data-step='12' data-intro='If this is incorrect, please click Save & Continue Later button. Once saved, you can go back to initial supplier page to make the change to the information.'>
                    <label id="lblSupplierName" bindTo="SupplierName"
  class="ReadOnlyFields" style="Width:220px;Height:20px;">lblSupplierName</label>
                </td>
            </tr>
            <tr>
                <td align="right" class="style78">
                    Market Sector
                </td>
                <td align="left" class="style77" data-step='6' data-intro='This is the Part Number to quote.'>
                    <label id="lblMarketSector" bindTo="MarketSectorName"
 style="text-align: center;Width:145px;Height:20px;" class="ReadOnlyFields">lblMarketSector</label>
                </td>
                <td align="right" class="style79">
                    Manufacturing Location
                </td>
                <td align="left" class="style29" data-step='13' data-intro='If this is incorrect, please click Save & Continue Later button. Once saved, you can go back to initial supplier page to make the change to the information.'>
                    <label id="lblManufacturingLocation" bindTo="ManufacturingLocation"
 class="ReadOnlyFields" style="Width:220px;Height:20px;">lblManufacturingLocation</label>
                </td>
            </tr>
            <tr>
                <td align="right" class="style78">
                    Component Part Number
                </td>
                <td align="left" class="style77" data-step='7' data-intro='Market Sector of this piece.'>
                <label id="lblPartNumber" bindTo="PartNumber"
 class="ReadOnlyFields" style="text-align: center;Width:145px;Height:20px">lblPartNumber</label>
                </td>
                <td align="right" class="style79">
                    Ship From Location
                </td>
                <td align="left" class="style29" data-step='14' data-intro='If this is incorrect, please click Save & Continue Later button. Once saved, you can go back to initial supplier page to make the change to the information.'>
                    <label id="lblShipFromLocation" bindTo="ShipLocation"
  class="ReadOnlyFields" style="Width:220px;Height:20px">lblShipFromLocation</label>
                </td>
            </tr>
            <tr align="left">
                <td align="right" class="style78" rowspan="2">
                    Part Description
                </td>
                <td align="left" class="style77" rowspan="2" data-step='8' data-intro='This is the material or name of the piece to quote.'>
                    <label id="lblPartName" bindTo="PartMaterial" class="ReadOnlyFields" 
 style="text-align: left;Width:200px;Height:48px;" 
                        >lblPartName</label>
                </td>
                <td align="right" class="style79">
                    Prepared By
                </td>
                <td align="left" class="style29" data-step='15' data-intro='Please enter your name.'>
                    <input type="text" ID="txtPreparedBy" bindTo="PreparedBy"
 value="txtPreparedBy" validate="required" validationid="validatingRFQForm"
                        style="width: 216px;" TabIndex="3" />
                </td>
            </tr>
            <tr>
                <td align="right" class="style79">
                    <asp:Label ID="lblBOMDetailID" runat="server" Visible="False"></asp:Label>
                </td>
                <td align="left" class="style29">
                </td>
            </tr>
            <tr>
                <td align="right" class="style78">
                    Drawing Level
                </td>
                <td align="left" class="style77" data-step='9' data-intro='Drawing Level.'>
                    <label id="lblDrawingLevel" bindTo="DrawingLevel" class="ReadOnlyFields" 
 style="text-align: center;Width:145px;Height:20px;"
                        >lblDrawingLevel</ label>
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
                <label id="lblTargetPrice" bindTo="TargetPrice"
 style="text-align: right;Width:145px;Height="20px"" class="ReadOnlyFields"
                        >lblTargetPrice</ label>
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
        <div id="divDetailSection"></div>
    </div>
    <div style="border: solid; height: 0px; border-color: #D3D3D3; border-width: 2px;">
    </div>
    <br />
    <div align="center">
        <table cellspacing="0" class="style55">
            <tr align="center">
                <td class="style58" colspan="2">
                    Tooling Detail
                </td>
                <td class="style74" rowspan="5">
                </td>
                <td>
                    Annual Cost Reduction Commitment
                </td>
                <td rowspan="5" class="style73">
                </td>
                <td rowspan="5">
                    <table>
                        <tr>
                            <td align="right" class="style78">
                                <div style="width: 226px; display: inline;" align="right" data-step='43' data-intro='Please enter the weight of the part to be shipped.'>
                                    Shipping Weight (lb)
                                    <input type="text" id="txtWeight" bindTo="Weight"
 value="txtWeight" validate="number" validationid="validatingRFQForm" 
                                        style="text-align: right;Width:94px" tabindex="32" />
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" data-step='44' data-intro='Enter the MOQ if applicable.' class="style78">
                                MOQ
                                <input type="text" id="txtMOQ" bindTo="Moq" value="txtMOQ"  style="text-align: right;Width:130px" tabindex="33" />
                            </td>
                        </tr>
                        <tr>
                            <td align="right" data-step='45' data-intro='Enter the Brand if applicable.' class="style78">
                                Brand
                                <input type="text" value="txtMake" bindTo="Make"
 id="txtMake"  style="text-align: right;width:130px"
                                    tabindex="34" />
                            </td>
                        </tr>
                        <tr>
                            <td align="right" class="style78">
                                Cavitation
                                <input type="text" ID="txtCavitation" bindTo="Cavitation" value="txtCavitation" style="text-align: right;width:130px;"
                                    tabindex="35" />
                            </td>
                        </tr>
                        <tr>
                            <td align="right" class="style78">
                                Material
                                <input type="text" id="txtMaterial" bindTo="Material"
 value="txtMaterial" style="text-align: right;Width:130px"
                                    tabindex="36" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td class="style56" colspan="2" align="right" data-step='38' data-intro='Please provide tooling information.'>
                    <textarea rows="4" cols="50" id="txtToolingDetail" TabIndex="23"></textarea>
                </td>
                <td align="center" rowspan="4" data-step='42' data-intro='Outline your annual cost reduction commitment.'>
                    <uc2:rfqACR ID="uscRfqACR" runat="server" />
                </td>
            </tr>
            <tr>
                <td align="right" class="style61">
                    Production Tooling
                </td>
                <td class="style62" align="right" data-step='39' data-intro='Enter Production Tooling Cost.'>
                    <input type="text" id="txtProductionTooling" bindTo="ProductionTooling" value="txtProductionTooling" validate="number" validationid="validatingRFQForm"
                        style="text-align: right" tabindex="24" />
                </td>
            </tr>
            <tr>
                <td align="right" class="style61">
                    Prototype Tooling
                </td>
                <td class="style62" align="right" data-step='40' data-intro='Enter Prototype Tooling Cost.'>
                    <input type="text" id="txtPrototypeTooling" bindTo="PrototypeTooling" value="txtPrototypeTooling" validate="number" validationid="validatingRFQForm"
                        style="text-align: right" tabindex="25" />
                </td>
            </tr>
            <tr>
                <td align="right" class="style61">
                    Prototype Piece
                </td>
                <td class="style62" align="right" data-step='41' data-intro='Enter Prototype Piece Cost.'>
                    <input type="text" id="txtPrototypePiece" bindTo="PrototypePiece" value="txtPrototypePiece" validate="number" validationid="validatingRFQForm"
                        style="text-align: right" tabindex="26" />
                </td>
            </tr>
            <tr>
                <td colspan="6">
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td colspan="6" align="left">
                    <table>
                        <tr>
                            <td style="vertical-align: top;">
                                Attachments from Vendor to Buyer (less than 4MB per file):<br />
                                <div id="uploadContainer" data-position='right' data-step='46' data-intro='In this area you can upload attachments pressing the button or draggin a file into the area delimited.'
                                    style="height: 200px; overflow-y: auto; width: 324px; background-color: #D3D3D3;"
                                    align="center">
                                    <div id="uploadZone">
                                        Upload
                                    </div>
                                </div>
                            </td>
                            <td style="vertical-align: top;">
                                <div style="background-color: #D3D3D3; width: 324px; min-height: 216px;" data-step='47'
                                    data-position='left' data-intro='Here are the attachments that you sent to Purchasing Department.'>
                                    Attachments from Vendor to Buyer, already sent:
                                    <br />
                                    <uc6:rfqVendorAttachments ID="uscRfqInboxAttachments" runat="server" OnAfterDeleteVendorAttachment="on_after_delete_vendorAttachment" />
                                </div>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td colspan="6" align="left">
                    Comments
                </td>
            </tr>
            <tr>
                <td colspan="6" align="left">
                    <div data-step='48' data-intro='If you have any comments to share with us, please use this field.'
                        data-position='top' style="width: 100%;">
                        <textarea rows="4" cols="0" id="txtComments" bindTo="CommentsToBuyer"
 tabindex="37" style="width:100%;"></textarea>
                    </div>
                </td>
            </tr>
        </table>
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
</div>
<div id="noQuoteSection" style="vertical-align: top;">
    <br />
    <br />
    Reason
    <textarea rows="4" cols="50" id="txtReasonNoQuote" bindTo="ReasonNoQuote"
 tabindex="38">txtReasonNoQuote</textarea>
</div>
<br />
<br />
<asp:HiddenField ID="hiddenSupplierID" runat="server" />
<asp:HiddenField ID="hiddenSaveButtonClickedID" runat="server" />
<br />
<br />
<uc7:notifier ID="uscNotifier" runat="server" />
<script type="text/javascript">
    jQuery(document).ready(function () {
        getRFQ();
    });

    function test() {
        var json = "{Example:1,Example2:2}"
        var to='<%= ResolveUrl("~/RFQ/RFQ.aspx") %>?Save=1';
        var options = {
            type: "POST",
            url: to,
            data: json,
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            async: false,
            success: function(response) {
                alert("success");
            },
            error: function(msg) { alert(msg); }
        };

        var returnText = $.ajax(options).responseText;
    }
    var RFQ;
    function getRFQ(id) {
        jQuery.getJSON('<%= ResolveUrl("~/RFQ/RFQ.aspx") %>?cmd=read&id=12305006', function (result) {
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
    

    function setControlsToVars() {
        
    }
    function refreshForm() {
        bindParentFields();
        if (RFQ.RfqEAV != null) {
            for (var i = 0; i < RFQ.RfqEAV.length; i++) {
                var objEAU = RFQ.RfqEAV[i];
                var htmlEAU = '<div align="left" style="height: 20px;">' +
                    '<div style="display: inline;">Estimated Annual Usage:</div>' +
                    '<label style="min-width: 300px; display: inline-block;">' + objEAU.Year + '</ label>' +
                    '<div style="display: inline;">Years:</div>' +
                    '<label style="min-width: 300px; display: inline-block;">' + objEAU.Volume + '</ label></div>' +
                    '<div rfqeau_id=' + objEAU.Id + ' /><br /><br />';

                jQuery("#divDetailSection").append(htmlEAU);
            }
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

        jQuery('[rfqEAU_ID]').each(function () {
            //jQuery(this).load('<%= ResolveUrl("~/RFQ/RFQDetail.aspx") %>?EAV_ID=' + jQuery(this).attr('rfqEAU_ID') + '&noCache=' + Number(new Date()) + ' #RFQDetailContainer');

            var objEAV = getRFQEAUbyID(jQuery(this).attr("rfqEAU_ID"));
            var detailEAU = [];
            detailEAU.push(["Item Description", "UOM", "Quantity", "Cost/Unit", "Material Total", "Quantity", "Cost/Unit", "Service Total", "Scrap Value %", "Scrap Cost", "Directly Hrly Labor Rate", "Std Hrs.", "Labor Cost", "Burden", "Total Burden"]);
            for (var j = 0; j < objEAV.RfqDetail.length; j++) {
                console.debug(objEAV.RfqDetail[j]);
                var currentDetail = objEAV.RfqDetail[j];
                var oRFQDetailAdapter = [currentDetail.ItemDescription,
                currentDetail.Um,
                currentDetail.RpcQty,
                currentDetail.RpcCostPerUnit,
                currentDetail.MaterialTotal,
                currentDetail.OSQty,
                currentDetail.OSCostPerUnit,
                currentDetail.ServiceTotal,
                currentDetail.ScrapValue,
                currentDetail.ScrapCost,
                currentDetail.DirectHrlyLaborRate,
                currentDetail.StdHrs,
                currentDetail.LaborCost,
                currentDetail.Burden,
                currentDetail.BurdenTotal
                ]

                detailEAU.push(oRFQDetailAdapter);

            }

            jQuery(this).handsontable({
                data: detailEAU,
                //width: 1400,
                colWidths: [300, 60, 70, 70, 70, 70, 70, 70, 70, 70, 70, 70, 70, 70, 70],
                minRows: 5,
                minCols: 15,
                minSpareCols: 0,
                //always keep at least 1 spare row at the right
                minSpareRows: 1,
                //always keep at least 1 spare row at the bottom
                rowHeaders: false,
                colHeaders: ['Raw Material And Purchased Components', 'Outside Services', 'Scrap', 'Labor', 'Burden Per Unit'],
                contextMenu: false,
                cells: function (row, col, prop) {
                    if (row === 0) {
                        return {
                            type: {
                                renderer: pseudoHeaderRenderer
                            },
                            readOnly: true
                        }
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
    }
    function getRFQEAUbyID(id) {
        for (var i = 0; i < RFQ.RfqEAV.length; i++) {
            if (RFQ.RfqEAV[i].Id == id) {
                return RFQ.RfqEAV[i];
            }
        }
        return null;
    }
    function bindParentFields(){
        jQuery("[bindTo]").each(function () {
            setValueForControl(this, jQuery(this), RFQ);
        });
    }
    function setValueForControl(ref, control, sourceObject) {
        var value = sourceObject[control.attr("bindTo")];
        if(value instanceof Date){
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

</script>
<script type="text/javascript">

    jQuery(document).ready(function () {
        on_change_option_quote();
        jQuery("[toHide]").hide();

        summarizeTotalPieceCost();

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

    function summarizeTotalPieceCost() {

        //        var txtSGAProfit = document.getElementById("");
        //        if (txtSGAProfit && jQuery.trim(txtSGAProfit.value) != "") {
        //            txtSGAProfit = Number(txtSGAProfit.value);
        //        }
        //        else {
        //            txtSGAProfit = 0;
        //        }

        //        var lblTotalManufacturingCost = document.getElementById("");
        //        if (lblTotalManufacturingCost && jQuery.trim(lblTotalManufacturingCost.textContent) != "") {
        //            lblTotalManufacturingCost = Number(lblTotalManufacturingCost.textContent);
        //        }
        //        else {
        //            lblTotalManufacturingCost.textContent = 0;
        //        }

        //        var txtPackingCostUnit = document.getElementById("");
        //        if (txtPackingCostUnit && jQuery.trim(txtPackingCostUnit.value) != "") {
        //            txtPackingCostUnit = Number(txtPackingCostUnit.value);
        //        }
        //        else {
        //            txtPackingCostUnit = 0;
        //        }

        //        var txtAssemblyCostUnit = document.getElementById("");
        //        if (txtAssemblyCostUnit && jQuery.trim(txtAssemblyCostUnit.value) != "") {
        //            txtAssemblyCostUnit = Number(txtAssemblyCostUnit.value);
        //        }
        //        else {
        //            txtAssemblyCostUnit = 0;
        //        }

        //        var lblTotalPieceCost = document.getElementById("");

        //        lblTotalPieceCost.textContent = txtSGAProfit + lblTotalManufacturingCost + txtPackingCostUnit + txtAssemblyCostUnit;
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
