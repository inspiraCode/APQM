<%@ Control Language="C#" AutoEventWireup="true" CodeFile="sendNewRFQ.ascx.cs" Inherits="SendNewRFQ" %>
<%@ Register Src="rfqEAV.ascx" TagName="rfqEAV" TagPrefix="uc1" %>
<%@ Register Src="../Utils/Notifier/notifier.ascx" TagName="notifier" TagPrefix="uc2" %>
<%@ Register Src="../Utils/Validator/Validator.ascx" TagName="Validator" TagPrefix="uc3" %>
<%@ Register Src="../SIF/sifDetail.ascx" TagName="sifDetail" TagPrefix="uc4" %>
<style type="text/css">
    .style1
    {
    }
    .style2
    {
        width: 139px;
        height: 10px;
    }
    .style3
    {
        height: 19px;
    }
    .style4
    {
        height: 10px;
    }
    .style5
    {
        width: 100%;
    }
</style>
<asp:ScriptManager ID="ScriptManager1" runat="server">
</asp:ScriptManager>
<table cellspacing="0" class="style5">
    <tr>
        <td style="vertical-align: top;">
            <div align="center">
                <br />
                <asp:Label ID="lblBomDetailID" runat="server" Text="1" Visible="False"></asp:Label>
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
                <div style="border-radius: 10px; border: solid #D3D3D3; background-color: #D3D3D3;
                    display: inline-block;">
                    EAV pulled from SIF
                    <uc4:sifDetail ID="uscSifDetail" runat="server" />
                </div>
                <br />
                <br />
                <table cellspacing="0" style="width: 491px" align="center">
                    <tr>
                        <td align="right" class="style1" colspan="2">
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <ContentTemplate>
                                    <table>
                                        <tr>
                                            <td>
                                                Vendor
                                            </td>
                                            <td>
                                                <asp:DropDownList ID="cboSupplier" chosen="true" runat="server" AutoPostBack="True"
                                                    DataSourceID="SqlDataSource1" DataTextField="SupplierName" DataValueField="SupplierMasterKey"
                                                    OnDataBound="on_dataBound_supplier" OnSelectedIndexChanged="cboSupplier_SelectedIndexChanged"
                                                    Width="285px" Height="16px" TabIndex="26">
                                                </asp:DropDownList>
                                                <asp:Button ID="btnNewSupplier" runat="server" Text="New" Width="60px" TabIndex="27" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Email
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtEmail" runat="server" Width="346px" TabIndex="28"></asp:TextBox>
                                            </td>
                                        </tr>
                                    </table>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                    <tr style="height: 10px;">
                        <td class="style2">
                        </td>
                        <td class="style4">
                        </td>
                    </tr>
                    <tr style="height: 10px;">
                        <td class="style2" align="right">
                            Due Date
                        </td>
                        <td class="style4" align="left">
                            <asp:TextBox ID="txtDueDate" runat="server" Width="200px" TabIndex="29"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" class="style1">
                            Market Sector
                        </td>
                        <td class="style3" align="left">
                            <asp:DropDownList ID="cboMarketSector" runat="server" chosen="true" Width="124px"
                                TabIndex="31" DataSourceID="SqlDataSourceMarketSector" DataTextField="Name" DataValueField="MarketSectorID">
                            </asp:DropDownList>
                            <asp:Button ID="btnNewMarketSector" runat="server" Text="New" Width="60px" TabIndex="27" />
                        </td>
                    </tr>
                    <tr style="height: 30px;">
                        <td align="right" class="style1">
                            Target Price
                        </td>
                        <td align="left">
                            <asp:CheckBox ID="chkTargetPrice" onchange="toggleTargetPrice();" TabIndex="32" runat="server" />
                            <asp:TextBox ID="txtTargetPrice" TabIndex="33" Style="display: none;" validate="number"
                                validationid="validatingNewRFQ" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr style="height: 30px;">
                        <td class="style1" align="right">
                            Comments to Vendor
                        </td>
                        <td align="left">
                            <asp:TextBox ID="txtCommentToVendor" runat="server" Height="50px" Width="300px" TextMode="MultiLine"
                                TabIndex="34"></asp:TextBox>
                        </td>
                    </tr>
                </table>
                <br />
                <div>
                    <asp:Button ID="btnSendRFQ" runat="server" OnClick="btnSendRFQ_Click" OnClientClick="return validate();"
                        validationid="validatingNewRFQ" Text="Send New RFQ" Width="136px" TabIndex="35" />
                    <asp:Button ID="btnCancel" runat="server" OnClick="btnCancel_Click" Text="Cancel"
                        Width="70px" TabIndex="36" />
                </div>
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
            </div>
        </td>
        <td style="padding: 0px 10px; vertical-align: top;">
            Attachments (less than 4MB per file):<br />
            <div id="uploadContainer" style="height: 360px; overflow-y: auto; align: center;
                width: 470px;">
                <div id="uploadZone">
                    Upload
                </div>
            </div>
        </td>
    </tr>
    <tr>
        <td>
            &nbsp;
        </td>
        <td>
            &nbsp;
        </td>
    </tr>
</table>
<uc2:notifier ID="uscNotifier" OnPrompt="on_prompt" runat="server" />
<asp:SqlDataSource ID="SqlDataSourceMarketSector" runat="server" OnInit="on_sqldatasource_Init"
    ProviderName="System.Data.SqlClient" SelectCommand="SELECT [MarketSectorID], [Name] FROM [MarketSector] ORDER BY [Name]">
</asp:SqlDataSource>

<script type="text/javascript">
    function EnviarMail() {
        event.srcElement.disabled = true;
        return true;
    }
    function toggleTargetPrice() {
        var checkboxTargetPriceIsChecked = jQuery('#<%= chkTargetPrice.ClientID %>').is(":checked");
        if (checkboxTargetPriceIsChecked) {
            jQuery('#<%= txtTargetPrice.ClientID %>').show();
        }
        else {
            jQuery('#<%= txtTargetPrice.ClientID %>').hide();
        }

    }
    jQuery(document).ready(function() {
        jQuery("[toHide]").hide();
        toggleTargetPrice();
        jQuery('#<%= txtDueDate.ClientID %>').datepicker({
            showOn: "button",
            buttonImage: '<%= this.ResolveUrl("~/Scripts/jQuery/Dialog/calendar.gif") %>',
            buttonImageOnly: true
        });
        jQuery("#uploadZone").uploadFile({
            url: '<%= ResolveUrl("~/RFQ/RFQ.aspx") %>',
            multiple: true,
            fileName: "myfile",
            uploadButtonClass: "ajax-file-upload-green"
        });
    });
    function pageLoad(sender, args) {
        if (args.get_isPartialLoad()) {
            makeDropDownsChosen();
        }
    }
</script>

<uc3:Validator ID="Validator1" runat="server" />
