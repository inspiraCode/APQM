<%@ Control Language="C#" AutoEventWireup="true" CodeFile="sendNewRFQEdit.ascx.cs"
    Inherits="SendNewRFQEdit" %>
<%@ Register Src="rfqEAV.ascx" TagName="rfqEAV" TagPrefix="uc1" %>
<%@ Register Src="../Utils/Notifier/notifier.ascx" TagName="notifier" TagPrefix="uc2" %>
<%@ Register Src="../Utils/Validator/Validator.ascx" TagName="Validator" TagPrefix="uc3" %>
<%@ Register Src="../SIF/sifDetail.ascx" TagName="sifDetail" TagPrefix="uc4" %>
<%@ Register Src="rfqVendorAttachments.ascx" TagName="rfqVendorAttachments" TagPrefix="uc5" %>
<%@ Register Src="rfqAttachments.ascx" TagName="rfqAttachments" TagPrefix="uc6" %>
<uc2:notifier ID="uscNotifier" OnPrompt="on_prompt" runat="server" />
<asp:SqlDataSource ID="SqlDataSourceMarketSector" runat="server" OnInit="on_sqldatasource_Init"
    ProviderName="System.Data.SqlClient" SelectCommand="SELECT [MarketSectorID], [Name] FROM [MarketSector] ORDER BY [Name]">
</asp:SqlDataSource>
<uc3:Validator ID="Validator1" runat="server" />
<asp:Label ID="lblBomDetailID" runat="server" Text="1" Visible="False"></asp:Label>
<asp:SqlDataSource OnInit="on_sqldatasource_Init" ID="SqlDataSourceRFQCountPerBOMDetail"
    runat="server" SelectCommand="SELECT InquiryNumber, TopPartNumber, PartDescription, PartNumber, Qty, Cost, Revision, Material, SIFHeaderKey, EAU FROM viewRFQCountPerBOMDetail WHERE (BOMDetailKey = @BOMDetailKey)"
    ProviderName="System.Data.SqlClient">
    <SelectParameters>
        <asp:ControlParameter ControlID="lblBomDetailID" DefaultValue="-1" Name="BOMDetailKey"
            PropertyName="Text" Type="Decimal" />
    </SelectParameters>
</asp:SqlDataSource>
<table cellspacing="0">
    <tr>
        <td style="vertical-align: top;">
            <table cellspacing="0">
            <tr style="background-color:#D3D3D3;">
                <td align="left" style="font-weight: bold; width: 125px;">
                <div style="display:inline;width:400px;">
                RFQ Number: 
                    <asp:Label ID="lblRFQNumber" runat="server" Text=""></asp:Label>
                </div>
                </td>
            </tr>
                <tr>
                    <td>
                        <asp:FormView ID="frmBOMLine" runat="server" DataSourceID="SqlDataSourceRFQCountPerBOMDetail"
                            Width="480px">
                            <ItemTemplate>
                                <table cellspacing="0" class="style5">
                                    <tr>
                                        <td align="right" style="font-weight: bold; width: 125px;">
                                            Inquiry Number:
                                        </td>
                                        <td align="left">
                                            <asp:Label ID="InquiryNumberLabel" runat="server" Text='<%# Bind("InquiryNumber") %>' />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" style="font-weight: bold;">
                                            Revision:
                                        </td>
                                        <td align="left">
                                            <asp:Label ID="RevisionLabel" runat="server" Text='<%# Bind("Revision") %>' />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" style="font-weight: bold;">
                                            Product:
                                        </td>
                                        <td align="left">
                                            <asp:Label ID="PartDescriptionLabel" runat="server" Text='<%# Bind("PartDescription") %>' />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" style="font-weight: bold;">
                                            Part Number:
                                        </td>
                                        <td align="left">
                                            <asp:Label ID="PartNumberLabel" runat="server" Text='<%# Bind("PartNumber") %>' />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" style="font-weight: bold;">
                                            Part Description
                                        </td>
                                        <td align="left">
                                            <asp:Label ID="MaterialLabel" runat="server" Text='<%# Bind("Material") %>' />
                                        </td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </asp:FormView>
                        <table>
                            <tr>
                                <td align="right" style="font-weight: bold; width: 125px;">
                                    EAU
                                </td>
                                <td align="left">
                                    <asp:HiddenField ID="EAUHidden" runat="server" />
                                    <asp:TextBox onkeyup="on_txtEAU_change();" onchange="on_txtEAU_change();" ID="txtEAU"
                                        runat="server" validate="number" validationid="validatingNewRFQ"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                        <div id="divWarningEAU" style="font-size: 11px; color: Red; display: none;">
                            EAU different than original. Component within BOM will be updated if this RFQ is
                            saved.</div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <br />
                        <table>
                            <tr>
                                <td align="right" style="font-weight: bold; width: 125px;">
                                    Supplier
                                </td>
                                <td>
                                    <asp:Label ID="lblSupplier" runat="server" Text="Label" Width="250px"></asp:Label>
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td align="right" style="font-weight: bold;">
                                    Email
                                </td>
                                <td>
                                    <asp:TextBox ID="txtEmail" runat="server" Width="250px"></asp:TextBox>
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr style="height: 120px;">
                    <td style="padding: 0px 10px; vertical-align: top;">
                        Attachments (less than 4MB per file):
                        <div id="uploadContainer" style="height: 230px; overflow-y: auto; width: 444px; background-color: #D3D3D3;">
                            <div id="uploadZone">
                                Upload
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div style="border-radius: 10px; border: solid #D3D3D3; background-color: #D3D3D3;
                            display: inline-block;">
                            <uc4:sifDetail ID="uscSifDetail" runat="server" />
                        </div>
                        <br />
                        <br />
                    </td>
                </tr>
            </table>
        </td>
        <td>
            <table cellspacing="0">
                <tr>
                    <td>
                        <table align="center" cellspacing="0">
                            <tr style="height: 10px;">
                                <td align="right" style="font-weight: bold;width:150px;">
                                    Due Date
                                </td>
                                <td align="left" >
                                    <asp:TextBox ID="txtDueDate" datepicker="true" runat="server" TabIndex="7" Width="200px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" style="font-weight: bold;">
                                    Market Sector
                                </td>
                                <td align="left">
                                    <asp:DropDownList ID="cboMarketSector" runat="server" DataSourceID="SqlDataSourceMarketSector"
                                        DataTextField="Name" DataValueField="MarketSectorID" TabIndex="8" Width="124px">
                                    </asp:DropDownList>
                                    <asp:Button ID="btnNewMarketSector" runat="server" TabIndex="9" Text="New" Width="60px" />
                                </td>
                            </tr>
                            <tr style="height: 30px;">
                                <td align="right" style="font-weight: bold;">
                                    Drawing Level
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="txtDrawingLevel" runat="server" Width="120px" TabIndex="10"></asp:TextBox>
                                </td>
                            </tr>
                            <tr style="height: 30px;">
                                <td align="right" style="font-weight: bold;">
                                    Target Price
                                </td>
                                <td align="left">
                                    <asp:CheckBox ID="chkTargetPrice" runat="server" onchange="toggleTargetPrice();"
                                        TabIndex="11" />
                                    <asp:TextBox ID="txtTargetPrice" runat="server" Style="display: none; text-align: right;"
                                        TabIndex="12" validate="number" validationid="validatingNewRFQ"></asp:TextBox>
                                </td>
                            </tr>
                            <tr style="height: 30px;">
                                <td align="right" style="font-weight: bold;">
                                    Comments to Vendor
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="txtCommentToVendor" runat="server" Height="50px" TabIndex="13" TextMode="MultiLine"
                                        Width="280px"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td style="vertical-align: top;">
                        <div style="background-color: #D3D3D3; width: 440px; min-height: 230px;">
                            Attachments Sent:
                            <br />
                            <uc6:rfqAttachments ID="uscRfqAttachmentsSent" runat="server" OnAfterDeleteBuyerAttachment="on_after_delete_buyerAttachment" />
                        </div>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
<br />
<div align="right">
    <table>
        <tr>
            <td>
                <div id="divImgEmail" style="visibility: hidden;">
                    <img id="" alt="" src="../Utils/loading.gif" style="display: inline;" />
                    <span style="position: relative; top: -10px;">Please wait..</span>
                </div>
            </td>
            <td>
                <input id="btnSendFiles" onclick="uploadFiles(true);" type="button" validationid="validatingNewRFQ"
                    value="Send RFQ" tabindex="14" />
                <input id="btnSendFiles0" onclick="uploadFiles();" type="button" validationid="validatingNewRFQ"
                    value="Not Send, Just Save" tabindex="14" style="width: 160px" />
                &nbsp;
                <asp:Button ID="btnCancel" runat="server" OnClick="btnCancel_Click" TabIndex="15"
                    Text="Cancel" Width="136px" />
                <asp:Button ID="btnEditRFQ" runat="server" TabIndex="15" Style="display: none;" Text="Create RFQ without email"
                    Width="160px" OnClick="btnEditRFQ_Click" />
                <asp:Button ID="btnSendRFQ" runat="server" OnClick="btnSendRFQ_Click" Style="display: none;"
                    TabIndex="35" Text="Send New RFQ" Width="136px" />
            </td>
        </tr>
    </table>
</div>
<asp:HiddenField ID="hiddenAttachmentsSent" runat="server" />

<script type="text/javascript">
    function toggleTargetPrice() {
        var checkboxTargetPriceIsChecked = jQuery('#<%= chkTargetPrice.ClientID %>').is(":checked");
        if (checkboxTargetPriceIsChecked) {
            jQuery('#<%= txtTargetPrice.ClientID %>').show();
        }
        else {
            jQuery('#<%= txtTargetPrice.ClientID %>').hide();
        }
    }
    var uploadObj = null;
    jQuery(document).ready(function() {
        jQuery("[toHide]").hide();
        toggleTargetPrice();

        uploadObj = jQuery("#uploadZone").uploadFile({
            url: '<%= ResolveUrl("~/BOM/BOM_Form.aspx") %>',
            multiple: true,
            fileName: "myfile",
            autoSubmit: false,
            uploadButtonClass: "ajax-file-upload-green",
            afterUploadAll: function() {
                if (b_SendEmails)
                    setTimeout(jQuery("#<%= btnSendRFQ.ClientID %>").click(), 5);
                else
                    setTimeout(jQuery("#<%= btnEditRFQ.ClientID %>").click(), 5);
                jQuery("#divImgEmail").css("visibility", "visible");
            }
        });
    });
    function pageLoad(sender, args) {
        if (args.get_isPartialLoad()) {
            makeDropDownsChosen();
        }
    }
    var b_SendEmails = false;
    function uploadFiles(bSendEmails) {
        b_SendEmails = bSendEmails;
        if (validate()) {
            if (uploadObj != null) {
                jQuery("#btnSendFiles").prop("disabled", true);
                jQuery("#btnSendFiles0").prop("disabled", true);

                if (uploadObj.fileCounter > 1) {
                    uploadObj.startUpload();
                } else {
                    if (bSendEmails)
                        setTimeout(jQuery("#<%= btnSendRFQ.ClientID %>").click(), 5);
                    else
                        setTimeout(jQuery("#<%= btnEditRFQ.ClientID %>").click(), 5);
                    jQuery("#divImgEmail").css("visibility", "visible");
                }
            }
        }
    }
    function on_txtEAU_change() {
        var divWarningEAU = jQuery('#divWarningEAU');
        var txtEAU = jQuery('#<%= txtEAU.ClientID %>');
        var lblEAU = jQuery('#<%= EAUHidden.ClientID %>');
        if (txtEAU.val().trim() != lblEAU.val().trim())
            divWarningEAU.show();
        else
            divWarningEAU.hide();
    }
</script>

