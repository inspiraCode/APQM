<%@ Control Language="C#" AutoEventWireup="true" CodeFile="multipleComponentsToRFQ.ascx.cs"
    Inherits="BOM_multipleComponentsToRFQ" %>
<%@ Register Src="../Utils/Notifier/notifier.ascx" TagName="notifier" TagPrefix="uc1" %>
<%@ Register Src="../Utils/Validator/Validator.ascx" TagName="Validator" TagPrefix="uc2" %>
<%@ Register Src="../SIF/sifDetail.ascx" TagName="sifDetail" TagPrefix="uc3" %>
<%@ Register Src="SendNewRFQDetail.ascx" TagName="SendNewRFQDetail" TagPrefix="uc4" %>
<%@ Register src="EAU.ascx" tagname="EAU" tagprefix="uc6" %>
<asp:ScriptManager ID="ScriptManager1" runat="server">
</asp:ScriptManager>
<uc1:notifier ID="uscNotifier" runat="server" OnPrompt="on_prompt" />
<asp:SqlDataSource ID="SqlDataSourceMarketSector" runat="server" OnInit="on_sqldatasource_Init"
    ProviderName="System.Data.SqlClient" SelectCommand="SELECT [MarketSectorID], [Name] FROM [MarketSector] ORDER BY [Name]">
</asp:SqlDataSource>
<uc2:Validator ID="Validator1" runat="server" />
<asp:Label ID="lblBomDetailID" runat="server" Text="1" Visible="False"></asp:Label>
<asp:SqlDataSource ID="SqlDataSourceCommodities" runat="server" ProviderName="System.Data.SqlClient"
    OnInit="on_sqldatasource_Init" SelectCommand="SELECT 0 AS 'CommodityKey', 'ALL' AS 'Commodity', 'A' AS sortColumn UNION SELECT CommodityKey, Commodity, 'B' AS sortColumn FROM CommodityMaster ORDER BY sortColumn">
</asp:SqlDataSource>
<asp:SqlDataSource OnInit="on_sqldatasource_Init" ID="SqlDataSourceSuppliers" runat="server"
    SelectCommand="SELECT [SupplierName], [SupplierMasterKey], [ContactEmail] FROM [SupplierMaster] ORDER BY [SupplierName]">
</asp:SqlDataSource>
<table cellspacing="0">
    <tr>
        <td style="vertical-align: top;">
            <table cellspacing="0">
                <tr>
                    <td>
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>
                                <table>
                                    <tr>
                                        <td align="right" style="width: 125px;">
                                            Filter by Commodity
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="cboCommodities" runat="server" AutoPostBack="True" DataSourceID="SqlDataSourceCommodities"
                                                DataTextField="Commodity" DataValueField="CommodityKey" Height="20px" TabIndex="1"
                                                Width="285px" OnSelectedIndexChanged="cboCommodities_SelectedIndexChanged" OnDataBound="cboCommodities_DataBound">
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            Vendor
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="cboSupplier" runat="server" AutoPostBack="True" chosen="true"
                                                DataSourceID="SqlDataSourceSuppliers" DataTextField="SupplierName" DataValueField="SupplierMasterKey"
                                                Height="16px" OnDataBound="on_dataBound_supplier" OnSelectedIndexChanged="cboSupplier_SelectedIndexChanged"
                                                TabIndex="1" Width="285px">
                                            </asp:DropDownList>
                                            <asp:Button ID="btnNewSupplier" runat="server" TabIndex="2" Text="New" Width="60px" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            Email
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtEmail" validate="email" validationid="newvendor" runat="server"
                                                TabIndex="3" Width="346px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" style="vertical-align: middle;">
                                            <asp:Button ID="btnAddEmail" runat="server" OnClientClick="return validate();" validationid="newvendor"
                                                Text="Add" Width="60px" Style="padding: 6px 0px; margin: 0;" OnClick="btnAddEmail_Click"
                                                TabIndex="4" /><div style="height: 2px;">
                                                </div>
                                            <asp:Button ID="btnRemoveEmail" runat="server" Text="Remove" Style="padding: 6px 0px;
                                                margin: 0;" OnClick="btnRemoveEmail_Click" Width="60px" TabIndex="6" />
                                        </td>
                                        <td style="vertical-align: middle;">
                                            <asp:ListBox ID="lstEmail" runat="server" Width="350px" TabIndex="5"></asp:ListBox>
                                        </td>
                                    </tr>
                                </table>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </td>
                </tr>
                <tr style="height: 70px;">
                    <td>
                        &nbsp;
                        <div style="border-radius: 10px; border: solid #D3D3D3; background-color: #D3D3D3;
                            display: inline-block; width: 400px;height: 130px; overflow-y: auto;">
                            
                            <uc6:EAU ID="uscEAUs" runat="server" />
                            
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <br />
                        <div style="height: 180px; overflow-y: auto;">
                        
                            <uc4:SendNewRFQDetail ID="uscSendNewRFQDetail" runat="server" />
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
                                    <asp:TextBox ID="txtDueDate" datepicker="true" runat="server" TabIndex="7" Width="200px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" class="style1">
                                    Market Sector
                                </td>
                                <td align="left" class="style3">
                                    <asp:DropDownList ID="cboMarketSector" runat="server" DataSourceID="SqlDataSourceMarketSector"
                                        DataTextField="Name" DataValueField="MarketSectorID" TabIndex="8" Width="124px">
                                    </asp:DropDownList>
                                    <asp:Button ID="btnNewMarketSector" runat="server" TabIndex="9" Text="New" Width="60px" />
                                </td>
                            </tr>
                            <tr style="height: 30px;">
                                <td align="right" class="style1">
                                    Drawing Level
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="txtDrawingLevel" runat="server" Width="120px" TabIndex="10"></asp:TextBox>
                                </td>
                            </tr>
                            <tr style="height: 30px;">
                                <td align="right" class="style1">
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
                                <td align="right" class="style1">
                                    Comments to Vendor
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="txtCommentToVendor" runat="server" Height="50px" TabIndex="13" TextMode="MultiLine"
                                        Width="300px"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td style="padding: 0px; vertical-align: top;" align="right">
                    <br />
                        Attachments (less than 4MB per file)
                        <div id="uploadContainer" style="height: 230px; overflow-y: auto; width: 449px; background-color: #D3D3D3;">
                            <div id="uploadZone" style="width:100px;">
                                Upload
                            </div>
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
                    value="Send New RFQ" tabindex="14" />
                <input id="btnSendFiles0" onclick="uploadFiles();" type="button" validationid="validatingNewRFQ"
                    value="Create RFQ without email" tabindex="14" />
                &nbsp;<asp:Button ID="btnCancel" runat="server" OnClick="btnCancel_Click" TabIndex="15"
                    Text="Cancel" Width="136px" />
                <asp:Button ID="btnCreateRFQ" runat="server" TabIndex="15" Style="display: none;"
                    Text="Create RFQ without email" Width="160px" OnClick="btnCreateRFQ_Click" /><asp:Button
                        ID="btnSendRFQ" runat="server" OnClick="btnSendRFQ_Click" Style="display: none;"
                        TabIndex="35" Text="Send New RFQ" Width="136px" />
            </td>
        </tr>
    </table>
</div>

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
                    setTimeout(jQuery("#<%= btnCreateRFQ.ClientID %>").click(), 5);
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
            var items = jQuery("#<%= lstEmail.ClientID %> option");
            if (items.length > 0) {
                if (uploadObj != null) {
                    jQuery("#btnSendFiles").prop("disabled", true);
                    jQuery("#btnSendFiles0").prop("disabled", true);

                    if (uploadObj.fileCounter > 1) {
                        uploadObj.startUpload();
                    } else {
                        if (bSendEmails)
                            setTimeout(jQuery("#<%= btnSendRFQ.ClientID %>").click(), 5);
                        else
                            setTimeout(jQuery("#<%= btnCreateRFQ.ClientID %>").click(), 5);
                        jQuery("#divImgEmail").css("visibility", "visible");
                    }
                }
            }
            else {
                alertify.alert("You have not added any Supplier.");
            }
        }
    }
    
</script>

