<%@ Control Language="C#" AutoEventWireup="true" CodeFile="rfqForm.ascx.cs" Inherits="rfqForm" %>
<%@ Register Src="rfqDetailList.ascx" TagName="rfqDetailList" TagPrefix="uc1" %>
<%@ Register Src="rfqACR.ascx" TagName="rfqACR" TagPrefix="uc2" %>
<%@ Register Src="rfqEAV.ascx" TagName="rfqEAV" TagPrefix="uc3" %>
<%@ Register Src="../SIF/sifDetail.ascx" TagName="sifDetail" TagPrefix="uc4" %>
<%@ Register Src="rfqAttachments.ascx" TagName="rfqAttachments" TagPrefix="uc5" %>
<%@ Register Src="rfqVendorAttachments.ascx" TagName="rfqVendorAttachments" TagPrefix="uc6" %>
<style type="text/css">
    .style2
    {
        width: 191px;
    }
    .style29
    {
        width: 226px;
    }
    .style31
    {
    }
    .style55
    {
        width: 911px;
    }
    .style56
    {
    }
    .style58
    {
    }
    .style61
    {
        width: 151px;
    }
    .style62
    {
        width: 147px;
    }
    .style70
    {
        width: 157px;
    }
    .style73
    {
        width: 12px;
    }
    .style74
    {
        width: 3px;
    }
    .calculatedField
    {
        background-color: #4682B4;
        color: white;
    }
    .style75
    {
        width: 198px;
    }
    .style77
    {
        width: 270px;
    }
    .style78
    {
        width: 245px;
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
    <asp:RadioButton ID="optQuote" runat="server" GroupName="Quote" Text="Quote" Checked="True"
        onchange="on_change_option_quote()" TabIndex="1" />
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:RadioButton ID="optNoQuote" runat="server" GroupName="Quote" Text="No Quote"
        onchange="on_change_option_quote()" TabIndex="1" />
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
            <asp:TextBox ID="txtCommentsToVendor" runat="server" BackColor="#D3D3D3" Height="45px"
                ReadOnly="True" TextMode="MultiLine" Width="550px" TabIndex="1" Style="border: 0;"></asp:TextBox>
        </div>
        <br />
        <br />
    </div>
    <div>
        <br />
        <div style="background-color: #D3D3D3; width: 550px; min-height: 20px;" data-step='3'
            data-intro='Sometimes you can receive attachments from our purchasing department that can be helpful for you to quote the piece.'>
            Attachments:<br />
            <uc5:rfqAttachments ID="uscRfqAttachmentsSent" runat="server" />
        </div>
        <asp:HiddenField ID="hiddenSentAttachmentsFolder" runat="server" />
        <asp:HiddenField ID="hiddenCreatedBy" runat="server" />
        <br />
    </div>
    <div align="center">
        <table cellspacing="0" 
            style="min-width: 995px; max-width: 995px; width: 1294px;">
            <tr>
                <td align="right" class="style78">
                    Due Date
                </td>
                <td align="left" class="style77" data-step='4' 
                    data-intro='Please complete this RFQ  before this date.'>
                    <asp:Label ID="lblDueDate" runat="server" BackColor="#D3D3D3" Style="text-align: center"
                        Width="145px" Height="20px"></asp:Label>
                </td>
                <td align="left" class="style70">
                    <asp:Label ID="lblID" runat="server" Visible="False"></asp:Label>
                </td>
                <td align="left" class="style29">
                    <asp:Label ID="lblMode" runat="server" Visible="False">New</asp:Label>
                </td>
                <td align="left" class="style29" rowspan="9">
                    <table cellspacing="0" data-step='16' data-intro='Please complete these fields as applicable.' 
                        style="width: 449px">
                        <tr>
                            <td align="right">
                                Production Lead Time
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtProductionLeadTime" validationid="validatingRFQForm" runat="server"
                                    Style="text-align: right" Width="240px" TabIndex="5"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                Production Tooling Lead Time
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtProductionToolingLeadTime" validationid="validatingRFQForm" runat="server"
                                    Style="text-align: right" Width="240px" TabIndex="6"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                Prototype Tooling Lead Time
                            </td>
                            <td align="left"'">
                                <asp:TextBox ID="txtPrototypeToolingLeadTime" validationid="validatingRFQForm" runat="server"
                                    Style="text-align: right" Width="240px" TabIndex="7"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                Prototype Piece Lead Time
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtPrototypePieceLeadTime" validationid="validatingRFQForm" runat="server"
                                    Style="text-align: right" Width="240px" TabIndex="8"></asp:TextBox>
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
                                <asp:TextBox ID="txtLeadTimePPAP" validationid="validatingRFQForm" runat="server"
                                    Style="text-align: right" Width="240px" TabIndex="9"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td align="right" class="style78">
                    RFQ #
                </td>
                <td align="left" class="style77" data-step='5' 
                    data-intro='This is our RFQ number.'>
                    <asp:Label ID="lblRFQNumber" runat="server" Style="text-align: center" Width="145px"
                        BackColor="#D3D3D3" Height="20px"></asp:Label>
                </td>
                <td align="right" class="style70">
                    Supplier Name
                </td>
                <td align="left" class="style29" data-step='12' data-intro='If this is incorrect, please click Save & Continue Later button. Once saved, you can go back to initial supplier page to make the change to the information.'>
                    <asp:Label ID="lblSupplierName" runat="server" BackColor="#D3D3D3" Width="220px"
                        Height="20px"></asp:Label>
                </td>
            </tr>
            <tr>
                <td align="right" class="style78">
                    Market Sector
                </td>
                <td align="left" class="style77" data-step='6' 
                    data-intro='This is the Part Number to quote.'>
                    <asp:Label ID="lblMarketSector" runat="server" Style="text-align: center" BackColor="#D3D3D3"
                        Width="145px" Height="20px"></asp:Label>
                </td>
                <td align="right" class="style70">
                    Manufacturing Location
                </td>
                <td align="left" class="style29" data-step='13' data-intro='If this is incorrect, please click Save & Continue Later button. Once saved, you can go back to initial supplier page to make the change to the information.'>
                    <asp:Label ID="lblManufacturingLocation" runat="server" BackColor="#D3D3D3" Width="220px"
                        Height="20px"></asp:Label>
                </td>
            </tr>
            <tr>
                <td align="right" class="style78">
                    Component Part Number
                </td>
                <td align="left" class="style77" data-step='7' 
                    data-intro='Market Sector of this piece.'>
                    <asp:Label ID="lblPartNumber" Style="text-align: center" runat="server" BackColor="#D3D3D3"
                        Width="145px" Height="20px"></asp:Label>
                </td>
                <td align="right" class="style70">
                    Ship From Location
                </td>
                <td align="left" class="style29" data-step='14' data-intro='If this is incorrect, please click Save & Continue Later button. Once saved, you can go back to initial supplier page to make the change to the information.'>
                    <asp:Label ID="lblShipFromLocation" runat="server" BackColor="#D3D3D3" Width="220px"
                        Height="20px"></asp:Label>
                </td>
            </tr>
            <tr align="left">
                <td align="right" class="style78" rowspan="2">
                    Part Description
                </td>
                <td align="left" class="style77" rowspan="2" data-step='8' 
                    data-intro='This is the material or name of the piece to quote.'>
                    <asp:Label ID="lblPartName" Style="text-align: left" runat="server" BackColor="LightGray"
                        Width="200px" Height="48px"></asp:Label>
                </td>
                <td align="right" class="style70">
                    Prepared By
                </td>
                <td align="left" class="style29" data-step='15' data-intro='Please enter your name.'>
                    <asp:TextBox ID="txtPreparedBy" validate="required" validationid="validatingRFQForm"
                        runat="server" Style="width: 216px" TabIndex="1"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td align="right" class="style70">
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
                    <asp:Label ID="lblDrawingLevel" Style="text-align: center" runat="server" BackColor="LightGray"
                        Width="145px" Height="20px"></asp:Label>
                </td>
                <td align="right" class="style70">
                    &nbsp;
                </td>
                <td align="left" class="style29">
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td align="right" class="style78">
                    Estimated Annual Usage
                </td>
                <td align="left" class="style77" data-step='10' 
                    data-intro='EAU for the current year.'>
                    <asp:Label ID="lblEAV" runat="server" BackColor="LightGray" Style="text-align: center"
                        Width="145px" Height="20px"></asp:Label>
                </td>
                <td align="right" class="style70">
                </td>
                <td align="left" class="style29">
                </td>
            </tr>
            <tr>
                <td align="right" class="style78">
                    <asp:Label ID="lblTargetPriceLabel" runat="server" Style="text-align: right" Width="145px"
                        Height="20px">Target Price</asp:Label>
                </td>
                <td align="left" class="style77" data-step='11' 
                    data-intro='Target Price. If specified by Purchasing Department.'>
                    <asp:Label ID="lblTargetPrice" runat="server" Style="text-align: right" BackColor="#D3D3D3"
                        Width="145px" Height="20px"></asp:Label>
                </td>
                <td align="right" class="style70">
                    &nbsp;
                </td>
                <td align="left" class="style29">
                    &nbsp;
                </td>
            </tr>
        </table>
        <br />
        <table style="min-width: 200px;">
            <tr>
                <td align="center">
                    &nbsp;</td>
            </tr>
        </table>
        <br />
        <div style="border: solid; height: 0px; border-color: #D3D3D3; border-width: 2px;">
        </div>
        <br />
        <uc1:rfqDetailList ID="uscRFQDetailList" runat="server" />
    
    </div>
    <div style="width:100%;height: 160px;">
    <table cellspacing="0" align="right" 
        style="width:300px;">
        <tr>
            <td align="right" class="style75" 
                style="border-top: solid gray; border-left: solid gray;">
                Total Manufacturing Cost&nbsp;&nbsp;
            </td>
            <td align="left" class="style31" style="border-top: solid gray; border-right: solid gray;"
                data-step='33' data-intro='Total Manufacturing Cost (formulated cell not to be completed by Supplier).'>
                <asp:Label ID="lblTotalManufacturingCost" CssClass="calculatedField" Style="text-align: right; margin-left: 0px;"
                    runat="server" Width="104px" Height="20px">0</asp:Label>
            </td>
        </tr>
        <tr>
            <td align="right" class="style75" style="border-left: solid gray;">
                SG&amp;A Profit&nbsp;&nbsp;
            </td>
            <td align="left" class="style31" style="border-right: solid gray;" data-step='34'
                data-intro='Enter cost for SG&A/Profit'>
                <asp:TextBox ID="txtSGAProfit" validate="number" validationid="validatingRFQForm"
                    Style="text-align: right" runat="server" onchange="summarizeTotalPieceCost()"
                    onkeyup="summarizeTotalPieceCost()" Width="100px" TabIndex="2"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right" class="style75" style="border-left: solid gray;">
                Packing Cost/Unit&nbsp;&nbsp;
            </td>
            <td align="left" class="style31" style="border-right: solid gray;" data-step='35'
                data-intro='Enter packaging cost per unit.'>
                <asp:TextBox ID="txtPackingCostUnit" validate="number" validationid="validatingRFQForm"
                    Style="text-align: right" onchange="summarizeTotalPieceCost()" onkeyup="summarizeTotalPieceCost()"
                    runat="server" Width="100px" TabIndex="3"></asp:TextBox>
            </td>
        </tr>
        <tr align="left">
            <td align="right" class="style75" style="border-left: solid gray;">
                Assembly Cost/Unit&nbsp;&nbsp;
            </td>
            <td align="left" class="style31" style="border-right: solid gray;" data-step='36'
                data-intro='Enter cost for assembly, if applicable.'>
                <asp:TextBox ID="txtAssemblyCostUnit" validate="number" validationid="validatingRFQForm"
                    Style="text-align: right" onchange="summarizeTotalPieceCost()" onkeyup="summarizeTotalPieceCost()"
                    runat="server" Width="100px" TabIndex="4"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right" class="style75" 
                style="border-left: solid gray; border-bottom: solid gray;">
                Total Piece Cost&nbsp;&nbsp;
            </td>
            <td align="left" class="style31" data-step='37' data-intro='Total Piece Cost (formulated cell not to be completed by the Supplier).'
                style="border-right: solid gray; border-bottom: solid gray;">
                <asp:Label ID="lblTotalPieceCost" runat="server" CssClass="calculatedField" Style="text-align: right"
                    Width="104px" Height="20px">0</asp:Label>
            </td>
        </tr>
    </table>
    </div>
    
   
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
                            <td align="right">
                                <div style="width: 226px; display: inline;" align="right" data-step='43' data-intro='Please enter the weight of the part to be shipped.'>
                                    Shipping Weight (lb)
                                    <asp:TextBox ID="txtWeight" validate="number" validationid="validatingRFQForm" runat="server"
                                        Style="text-align: right" Width="94px" TabIndex="31"></asp:TextBox>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" data-step='44' data-intro='Enter the MOQ if applicable.'>
                                MOQ
                                <asp:TextBox ID="txtMOQ" runat="server" Style="text-align: right" Width="130px" TabIndex="33"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" data-step='45' data-intro='Enter the Brand if applicable.'>
                                Brand
                                <asp:TextBox ID="txtMake" runat="server" Style="text-align: right" Width="130px"
                                    TabIndex="34"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align="left">
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td align="left">
                                &nbsp;
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td class="style56" colspan="2" align="right" data-step='38' data-intro='Please provide tooling information.'>
                    <asp:TextBox ID="txtToolingDetail" runat="server" Width="300px" Height="40px" TabIndex="22"
                        TextMode="MultiLine"></asp:TextBox>
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
                    <asp:TextBox ID="txtProductionTooling" validate="number" validationid="validatingRFQForm"
                        Style="text-align: right" runat="server" TabIndex="23"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td align="right" class="style61">
                    Prototype Tooling
                </td>
                <td class="style62" align="right" data-step='40' data-intro='Enter Prototype Tooling Cost.'>
                    <asp:TextBox ID="txtPrototypeTooling" validate="number" validationid="validatingRFQForm"
                        Style="text-align: right" runat="server" TabIndex="24"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td align="right" class="style61">
                    Prototype Piece
                </td>
                <td class="style62" align="right" data-step='41' data-intro='Enter Prototype Piece Cost.'>
                    <asp:TextBox ID="txtPrototypePiece" validate="number" validationid="validatingRFQForm"
                        Style="text-align: right" runat="server" TabIndex="25"></asp:TextBox>
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
                                Attachments (less than 4MB per file):<br />
                                <div id="uploadContainer" data-step='46' data-intro='In this area you can upload attachments pressing the button or draggin a file into the area delimited.'
                                    style="height: 200px; overflow-y: auto; width: 444px; background-color: #D3D3D3;"
                                    align="center">
                                    <div id="uploadZone">
                                        Upload
                                    </div>
                                </div>
                            </td>
                            <td style="vertical-align: top;">
                                <div style="background-color: #D3D3D3; width: 444px; min-height: 216px;" data-step='47'
                                    data-intro='Here are the attachments that you sent to Purchasing Department.'>
                                    Attachments Sent:
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
                        data-position='right' style="width: 305px;">
                        <asp:TextBox ID="txtComments" runat="server" Style="text-align: left" Width="300px"
                            TabIndex="35" Height="62px" TextMode="MultiLine"></asp:TextBox>
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
        <div align="center" style="visibility: hidden;">
            <br />
            <asp:CheckBox ID="chkIAgree" runat="server" Text="I agree the NDA sent to my EMail."
                TabIndex="36" />
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
    <asp:TextBox ID="txtReasonNoQuote" runat="server" Height="100px" TextMode="MultiLine"
        Width="400px" TabIndex="37"></asp:TextBox>
</div>
<br />
<br />
<asp:HiddenField ID="hiddenSupplierID" runat="server" />
<asp:HiddenField ID="hiddenSaveButtonClickedID" runat="server" />
<br />
<br />

<script type="text/javascript">
    jQuery(document).ready(function() {
        on_change_option_quote();
        jQuery("[toHide]").hide();

        uploadObj = jQuery("#uploadZone").uploadFile({
            url: '<%= ResolveUrl("~/Vendor/RFQ.aspx") %>',
            multiple: true,
            fileName: "myfile",
            autoSubmit: false,
            uploadButtonClass: "ajax-file-upload-green",
            maxFileSize: 4194304,
            onError: function(files, status, errMsg) {
                //files: list of files
                //status: error status
                //errMsg: error message
                try {
                    enableCaller(true);
                } catch (e) {
                }
            },
            afterUploadAll: function() {
                setTimeout(jQuery("#" + jQuery("#<%= hiddenSaveButtonClickedID.ClientID %>").val()).click(), 5);
                jQuery("#divImgEmail").css("display", "block");
            }
        });
    });

    function on_change_option_quote() {
        var optQuote = jQuery("#<%= optQuote.ClientID %>");
        if (optQuote.is(':checked')) {
            jQuery("#quoteSection").show();
            jQuery("#noQuoteSection").hide();
        } else {
            jQuery("#quoteSection").hide();
            jQuery("#noQuoteSection").show();
        }
    }

    function summarizeTotalPieceCost() {

        var txtSGAProfit = document.getElementById("<%= txtSGAProfit.ClientID %>");
        if (txtSGAProfit && txtSGAProfit.value.trim() != "") {
            txtSGAProfit = Number(txtSGAProfit.value);
        }
        else {
            txtSGAProfit = 0;
        }

        var lblTotalManufacturingCost = document.getElementById("<%= lblTotalManufacturingCost.ClientID %>");
        if (lblTotalManufacturingCost && lblTotalManufacturingCost.textContent.trim() != "") {
            lblTotalManufacturingCost = Number(lblTotalManufacturingCost.textContent);
        }
        else {
            lblTotalManufacturingCost.textContent = 0;
        }

        var txtPackingCostUnit = document.getElementById("<%= txtPackingCostUnit.ClientID %>");
        if (txtPackingCostUnit && txtPackingCostUnit.value.trim() != "") {
            txtPackingCostUnit = Number(txtPackingCostUnit.value);
        }
        else {
            txtPackingCostUnit = 0;
        }

        var txtAssemblyCostUnit = document.getElementById("<%= txtAssemblyCostUnit.ClientID %>");
        if (txtAssemblyCostUnit && txtAssemblyCostUnit.value.trim() != "") {
            txtAssemblyCostUnit = Number(txtAssemblyCostUnit.value);
        }
        else {
            txtAssemblyCostUnit = 0;
        }

        var lblTotalPieceCost = document.getElementById("<%= lblTotalPieceCost.ClientID %>");

        lblTotalPieceCost.textContent = txtSGAProfit + lblTotalManufacturingCost + txtPackingCostUnit + txtAssemblyCostUnit;
    }
    window.onload = summarizeTotalPieceCost();

    var uploadObj = null;

    function uploadFiles(strSaveMode) {
        if (strSaveMode == "finalize") {
            jQuery("#<%= hiddenSaveButtonClickedID.ClientID %>").val("<%= btnFinalize.ClientID %>");
        } else if (strSaveMode == "save") {
            jQuery("#<%= hiddenSaveButtonClickedID.ClientID %>").val("<%= btnSave.ClientID %>");
        }

        if (validate()) {
            if (uploadObj != null) {
                try {
                    enableCaller(false);
                } catch (e) {
                }

                if (uploadObj.fileCounter > 1) {
                    uploadObj.startUpload();
                } else {
                    setTimeout(jQuery("#" + jQuery("#<%= hiddenSaveButtonClickedID.ClientID %>").val()).click(), 5);
                    jQuery("#divImgEmail").css("display", "block");
                }
            }
        }
    }
</script>