<%@ Control Language="C#" AutoEventWireup="true" CodeFile="sendNewRFQ.ascx.cs" Inherits="SendNewRFQ" %>
<%@ Register Src="rfqEAV.ascx" TagName="rfqEAV" TagPrefix="uc1" %>
<%@ Register Src="../Utils/Notifier/notifier.ascx" TagName="notifier" TagPrefix="uc2" %>
<%@ Register Src="../Utils/Validator/Validator.ascx" TagName="Validator" TagPrefix="uc3" %>
<%@ Register Src="../SIF/sifDetail.ascx" TagName="sifDetail" TagPrefix="uc4" %>
<%@ Register Src="SendNewRFQDetail.ascx" TagName="SendNewRFQDetail" TagPrefix="uc5" %>
<%@ Register Src="rfqCountPerBomLines.ascx" TagName="rfqCountPerBomLines" TagPrefix="uc6" %>
<asp:ScriptManager ID="ScriptManager1" runat="server">
</asp:ScriptManager>
<uc2:notifier ID="uscNotifier" OnPrompt="on_prompt" runat="server" />
<asp:SqlDataSource ID="SqlDataSourceMarketSector" runat="server" OnInit="on_sqldatasource_Init"
    ProviderName="System.Data.SqlClient" SelectCommand="SELECT [MarketSectorID], [Name] FROM [MarketSector] ORDER BY [Name]">
</asp:SqlDataSource>
<uc3:Validator ID="Validator1" runat="server" />
<asp:Label ID="lblBomDetailID" runat="server" Text="1" Visible="False"></asp:Label>
<asp:SqlDataSource OnInit="on_sqldatasource_Init" ID="SqlDataSource1" runat="server"
    SelectCommand="SELECT [SupplierName], [SupplierMasterKey], [ContactEmail] FROM [SupplierMaster] ORDER BY [SupplierName]">
</asp:SqlDataSource>
<asp:SqlDataSource OnInit="on_sqldatasource_Init" ID="SqlDataSourceRFQCountPerBOMDetail"
    runat="server" SelectCommand="SELECT InquiryNumber, TopPartNumber, PartDescription, PartNumber, Qty, Cost, Revision, Material, SIFHeaderKey FROM viewRFQCountPerBOMDetail WHERE (BOMDetailKey = @BOMDetailKey)"
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
                <tr>
                    <td>
                        <asp:FormView ID="frmBOMLine" runat="server" DataSourceID="SqlDataSourceRFQCountPerBOMDetail"
                            Width="480px">
                            <ItemTemplate>
                                <table cellspacing="0" class="style5">
                                    <tr>
                                        <td align="right" style="font-weight: bold;">
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
                                            Material
                                        </td>
                                        <td align="left">
                                            <asp:Label ID="MaterialLabel" runat="server" Text='<%# Bind("Material") %>' />
                                        </td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </asp:FormView>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div style="border-radius: 10px; border: solid #D3D3D3; background-color: #D3D3D3;
                            display: inline-block;">
                            EAV pulled from SIF
                            <uc4:sifDetail ID="uscSifDetail" runat="server" />
                        </div>
                        <br />
                        <br />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>
                                <table>
                                    <tr>
                                        <td>
                                            Vendor
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="cboSupplier" runat="server" AutoPostBack="True" chosen="true"
                                                DataSourceID="SqlDataSource1" DataTextField="SupplierName" DataValueField="SupplierMasterKey"
                                                Height="16px" OnDataBound="on_dataBound_supplier" OnSelectedIndexChanged="cboSupplier_SelectedIndexChanged"
                                                Width="285px">
                                            </asp:DropDownList>
                                            <asp:Button ID="btnNewSupplier" runat="server" TabIndex="1" Text="New" Width="60px" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Email
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtEmail" runat="server" TabIndex="2" Width="346px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" style="vertical-align:middle;">
                                            <asp:Button ID="btnAddEmail" runat="server" Text="Add" Width="60px" style="padding: 6px 0px;margin:0;"
                                                onclick="btnAddEmail_Click" /><div style="height:2px;"></div>
                                                <asp:Button ID="btnRemoveEmail" runat="server" Text="Remove" style="padding: 6px 0px;margin:0;"
                                                onclick="btnRemoveEmail_Click" Width="60px" />
                                        </td>
                                        <td style="vertical-align:middle;">
                                            <asp:ListBox ID="lstEmail" runat="server" Width="350px" TabIndex="4"></asp:ListBox>
                                        </td>
                                    </tr>
                                </table>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div align="right">
                            <asp:Button ID="btnSelectMaterial" runat="server" Text="Select Material" OnClick="btnSelectMaterial_Click"
                                TabIndex="5" Visible="false" />
                        </div>
                        <uc5:SendNewRFQDetail ID="SendNewRFQDetail1" runat="server" />
                    </td>
                </tr>
            </table>
        </td>
        <td>
            <table cellspacing="0" class="style5">
                <tr>
                    <td>
                        <table align="center" cellspacing="0" style="width: 491px">
                            <tr style="height: 10px;">
                                <td align="right" class="style2">
                                    Due Date
                                </td>
                                <td align="left" class="style4">
                                    <asp:TextBox ID="txtDueDate" runat="server" TabIndex="6" Width="200px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" class="style1">
                                    Market Sector
                                </td>
                                <td align="left" class="style3">
                                    <asp:DropDownList ID="cboMarketSector" runat="server" DataSourceID="SqlDataSourceMarketSector"
                                        DataTextField="Name" DataValueField="MarketSectorID" TabIndex="7" Width="124px">
                                    </asp:DropDownList>
                                    <asp:Button ID="btnNewMarketSector" runat="server" TabIndex="8" Text="New" Width="60px" />
                                </td>
                            </tr>
                            <tr style="height: 30px;">
                                <td align="right" class="style1">
                                    Target Price
                                </td>
                                <td align="left">
                                    <asp:CheckBox ID="chkTargetPrice" runat="server" onchange="toggleTargetPrice();"
                                        TabIndex="9" />
                                    <asp:TextBox ID="txtTargetPrice" runat="server" Style="display: none;" TabIndex="33"
                                        validate="number" validationid="validatingNewRFQ"></asp:TextBox>
                                </td>
                            </tr>
                            <tr style="height: 30px;">
                                <td align="right" class="style1">
                                    Comments to Vendor
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="txtCommentToVendor" runat="server" Height="50px" TabIndex="10" TextMode="MultiLine"
                                        Width="300px"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td style="padding: 0px 10px; vertical-align: top;">
                        Attachments (less than 4MB per file):
                        <div id="uploadContainer" style="height: 270px; overflow-y: auto; width: 444px;background-color: #D3D3D3;">
                            <div id="uploadZone">
                                Upload
                            </div>
                        </div>
                        <br />
                        <div id="divImgEmail" style="display: none;">
                            <img id="" alt="" src="../Utils/loading.gif" style="display: inline;" />
                            <span style="display: inline;">Sending Email, Please wait..</span>
                        </div>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
<br />
<div align="center">
    <input id="btnSendFiles" onclick="uploadFiles();" type="button" validationid="validatingNewRFQ"
        value="Send New RFQ" tabindex="11" />
    <asp:Button ID="btnCancel" runat="server" OnClick="btnCancel_Click" TabIndex="12"
        Text="Cancel" Width="136px" />
    <asp:Button ID="btnSendRFQ" runat="server" OnClick="btnSendRFQ_Click" Style="display: none;"
        TabIndex="35" Text="Send New RFQ" Width="136px" />
</div>
<asp:Panel ID="panelPopupSelectMaterial" runat="server" Visible="false">
    <uc6:rfqCountPerBomLines ID="uscRfqCountPerBomLines" runat="server" />

    <script type="text/javascript">

        document.getElementById("<%= this.panelPopupSelectMaterial.ClientID %>").setAttribute("title", "Selecting Material");
        var popupSelectMaterial = jQuery("#<%= this.panelPopupSelectMaterial.ClientID %>").dialog({ autoOpen: true,
            //appendTo: jQuery('form:first'),
            width: 440, height: 400, modal: true,
            dialogClass: "no-close", closeOnEscape: false
        });
        //popupSelectMaterial.dialog("moveToTop");
    </script>

    <br />
    <br />
    <div align="center" style="clear: both;">
        <asp:Button ID="btnOKSelectMaterial" runat="server" Text="OK" Width="60px" OnClick="btnOKSelectMaterial_Click" />
        <asp:Button ID="btnCancelSelectMaterial" runat="server" Text="Cancel" Width="60px"
            OnClick="btnCancelSelectMaterial_Click" TabIndex="-1" />
    </div>
</asp:Panel>

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
        jQuery('#<%= txtDueDate.ClientID %>').datepicker({
            showOn: "button",
            buttonImage: '<%= this.ResolveUrl("~/Scripts/jQuery/Dialog/calendar.gif") %>',
            buttonImageOnly: true
        });
        uploadObj = jQuery("#uploadZone").uploadFile({
            url: '<%= ResolveUrl("~/RFQ/RFQ.aspx") %>',
            multiple: true,
            fileName: "myfile",
            autoSubmit: false,
            uploadButtonClass: "ajax-file-upload-green",
            afterUploadAll: function() {
                setTimeout(jQuery("#<%= btnSendRFQ.ClientID %>").click(), 5);
                jQuery("#divImgEmail").css("display", "block");
            }
        });
    });
    function pageLoad(sender, args) {
        if (args.get_isPartialLoad()) {
            makeDropDownsChosen();
        }
    }
    function uploadFiles() {
        if (validate()) {
            var items = jQuery("#<%= lstEmail.ClientID %> option");
            if (items.length > 0) {
                if (uploadObj != null) {
                    jQuery("#btnSendFiles").prop("disabled", true);
                    if (uploadObj.fileCounter > 1) {
                        uploadObj.startUpload();
                    } else {
                        setTimeout(jQuery("#<%= btnSendRFQ.ClientID %>").click(), 5);
                        jQuery("#divImgEmail").css("display", "block");
                    }
                }
            }
            else {
                alertify.alert("You have not added any Supplier.");
            }
        }
    }
</script>