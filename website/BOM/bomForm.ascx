<%@ Control Language="C#" AutoEventWireup="true" CodeFile="bomForm.ascx.cs" Inherits="bomForm" %>
<%@ Register Src="bomDetailList.ascx" TagName="bomDetailList" TagPrefix="uc1" %>
<%@ Register Src="bomStatusInfo.ascx" TagName="bomStatusInfo" TagPrefix="uc2" %>
<%@ Register Src="../SIF/sifDetail.ascx" TagName="sifDetail" TagPrefix="uc3" %>
<%@ Register Src="../Utils/Notifier/notifier.ascx" TagName="notifier" TagPrefix="uc4" %>
<style type="text/css">
    .style1
    {
        width: 228px;
    }
    .style4
    {
        width: 200px;
    }
    .style6
    {
        width: 140px;
    }
    .style7
    {
        width: 100px;
    }
    .style8
    {
        width: 109px;
    }
</style>
<div align="left" style="margin-left: 40px;">
    <br />
    <table cellspacing="1" align="left" style="width: 1232px;">
        <tr style="display: none;">
            <td align="right" class="style7">
                Mode:
            </td>
            <td align="left" class="style4">
                <asp:Label ID="lblMode" runat="server" Text="New"></asp:Label>
            </td>
            <td align="left" class="style8">
            </td>
            <td align="left" class="style6">
            </td>
            <td align="left" class="style6">
                &nbsp;
            </td>
        </tr>
        <tr style="display: none;">
            <td align="right" class="style7">
                ID:
            </td>
            <td align="left" class="style4">
                <asp:Label ID="lblID" runat="server"></asp:Label>
            </td>
            <td align="left" class="style8">
            </td>
            <td align="left" class="style6">
            </td>
            <td align="left" class="style6">
                &nbsp;
            </td>
        </tr>
        <tr style="display: none;">
            <td align="right" class="style7">
                SIF ID:
            </td>
            <td align="left" class="style4">
                <asp:Label ID="lblSifID" runat="server"></asp:Label>
            </td>
            <td align="left" class="style8">
            </td>
            <td align="left" class="style6">
            </td>
            <td align="left" class="style6">
                &nbsp;
            </td>
        </tr>
        <tr style="height: 25px;">
            <td align="right" style="font-weight: bold" class="style7">
                Inquiry Number
            </td>
            <td align="left" class="style4">
                <asp:Label ID="lblInquiryNumber" runat="server"></asp:Label>
            </td>
            <td align="right" style="font-weight: bold" class="style8">
                Sales Rep
            </td>
            <td align="left" class="style6">
                <asp:Label ID="lblSalesRep" runat="server"></asp:Label>
            </td>
            <td align="left" class="style6" rowspan="5">
                <uc2:bomStatusInfo ID="uscBomStatusInfo" runat="server" />
            </td>
        </tr>
        <tr style="height: 25px;">
            <td align="right" style="font-weight: bold" class="style7">
                Revision
            </td>
            <td align="left" class="style4">
                <asp:Label ID="lblRevision" runat="server"></asp:Label>
            </td>
            <td align="right" style="font-weight: bold" class="style8">
                Customer
            </td>
            <td align="left" class="style6">
                <asp:Label ID="lblCustomer" runat="server"></asp:Label>
            </td>
        </tr>
        <tr style="height: 25px;">
            <td align="right" style="font-weight: bold" class="style7">
                Product
            </td>
            <td align="left" class="style4">
                <asp:Label ID="lblProduct" runat="server"></asp:Label>
            </td>
            <td align="right" style="font-weight: bold" class="style8">
                Market Sector
            </td>
            <td align="left" class="style6">
                <asp:Label ID="lblMarketSector" runat="server"></asp:Label>
            </td>
        </tr>
        <tr style="height: 25px;">
            <td align="right" style="font-weight: bold" class="style7">
                Finished Good PN
            </td>
            <td align="left" class="style4">
                <asp:TextBox ID="txtPartNumber" runat="server" Width="120px"></asp:TextBox>
            </td>
            <td align="right" style="font-weight: bold" class="style8">
                Status
            </td>
            <td align="left" class="style6">
                <div id="progressBar" style="height: 20px; width: 100px;">
                    <div id="progress-label">
                    </div>
                </div>
            </td>
        </tr>
        <tr style="height: 25px;">
            <td align="right" style="font-weight: bold; border: solid 1px; border-style: dotted;
                border-right: 0px;" class="style7">
                Annual Volume
            </td>
            <td align="left" class="style4" style="border: solid 1px; border-style: dotted; border-left: 0px;">
                <asp:TextBox ID="txtAnnualVolume" Style="text-align: right;" validate="number" validationid="validatingBOMHeader"
                    runat="server" Width="120px"></asp:TextBox>
                <asp:Button ID="btnOpenSIFDetail" runat="server" Text="..." OnClick="btnOpenSIFDetail_Click"
                    Style="margin-bottom: 5px;" />
                <asp:Button ID="btnApplyAnnualVolume" runat="server" Text="Apply to lines not Processed"
                    OnClick="btnApplyAnnualVolume_Click" Width="184px" OnClientClick="return validate();"
                    validationid="validatingBOMHeader" />
            </td>
            <td align="left" class="style8">
            </td>
            <td align="left" class="style6">
                <a href="../HTMLReports/SalesReport.aspx?BOM=<%= lblID.Text %>" target="_blank">Report
                    to Sales </a>
            </td>
        </tr>
    </table>
</div>
<div align="center" style="clear: both;">
<br />
    <div style="border: solid; border-color: gray; border-width: 2px;">
    </div>
    <br />
    <uc1:bomDetailList ID="uscBOMDetailList" runat="server" />
</div>
    <br />
    <div align="center">
    <asp:Button ID="btnSave" runat="server" Text="Save" Width="70px" OnClick="btnSave_Click"
        OnClientClick="return validate();" validationid="validatingBOMHeader" />
    <asp:Button ID="btnCancel" runat="server" Text="Cancel" Width="70px" OnClick="btnCancel_Click" />
    </div>
    

<br />
<asp:HiddenField ID="hiddenProgressBar" runat="server" Value="0" />
<asp:Panel ID="panelPopup" runat="server" Visible="false">
    <asp:MultiView ID="multiViewPopup" runat="server" ActiveViewIndex="0">
        <asp:View ID="viewSIFDetail" runat="server">
            <div align="center">
                <div style="border-radius: 10px; border: solid #D3D3D3; background-color: #D3D3D3;
                    height: 100px; min-width: 160px; display: inline-block;">
                    <uc3:sifDetail ID="uscSifDetail" runat="server" />
                </div>
            </div>
            <div align="right">
                <asp:Button ID="btnClosePopup" runat="server" Text="Close" OnClick="btnClosePopup_Click" /></div>

            <script type="text/javascript">
                document.getElementById("<%= this.panelPopup.ClientID %>").setAttribute("title", "Projected Annual Volume");
                jQuery("#<%= this.panelPopup.ClientID %>").dialog({ autoOpen: true,
                    appendTo: jQuery('form:first'),
                    width: 520, modal: true,
                    dialogClass: "no-close", closeOnEscape: false
                });
            </script>

        </asp:View>
    </asp:MultiView>
</asp:Panel>
<uc4:notifier ID="uscNotifier" runat="server" />

<script type="text/javascript">
    var txtAnnualVolume;
    var txtQtyRequired;
    var txtEAU;
    jQuery(document).ready(function() {
        txtAnnualVolume = jQuery('#<%= txtAnnualVolume.ClientID %>');
        txtQtyRequired = jQuery('#<%= uscBOMDetailList.FindControl("txtQuantity").ClientID %>');
        txtEAU = jQuery('#<%= uscBOMDetailList.FindControl("txtEAU").ClientID %>');
        makeProgresBar();
    });
    function makeProgresBar() {
        var progressBar = jQuery('#progressBar');
        var progressLabel = jQuery('#progress-label');
        progressBar.css("position", "relative");
        progressLabel.css("position", "absolute").css("left", "40%").css("top", "3px");
        progressBar.progressbar({
            value: false,
            change: function() {
                progressLabel.text(progressBar.progressbar("value") + "%");
                progressLabel.css("left", "40%");
            },
            complete: function() {
                progressLabel.text("Complete!");
                progressLabel.css("left", "23%");
            }
        });
        progressBar.progressbar({ value: Number("<%= hiddenProgressBar.Value  %>") });
    }
    function calculateEAU() {
        var nAnnualVolume;
        var nQtyRequired;
        var nEAU;

        if (!isNaN(txtAnnualVolume.val()) && txtAnnualVolume.val().trim() != "") {
            nAnnualVolume = Number(txtAnnualVolume.val());
            if (nAnnualVolume > 0) {
                nQtyRequired = Number(txtQtyRequired.val());
                nEAU = Number(txtEAU.val());

                if (nQtyRequired > 0) {
                    txtEAU.val((nAnnualVolume * nQtyRequired).toFixed(0));
                }
                else {
                    txtEAU.val("0");
                }
            }
        }
    }
    function calculateQtyRequired() {
        var nAnnualVolume;
        var nQtyRequired;
        var nEAU;

        if (txtEAU.val().indexOf(",") < 0) {
            if (!isNaN(txtAnnualVolume.val()) && txtAnnualVolume.val().trim() != "") {
                nAnnualVolume = Number(txtAnnualVolume.val());
                if (nAnnualVolume > 0) {
                    nQtyRequired = Number(txtQtyRequired.val());
                    nEAU = Number(txtEAU.val());
                    if (nEAU > 0) {
                        txtQtyRequired.val((nEAU / nAnnualVolume).toFixed(2));
                    } else {
                        txtQtyRequired.val("0.00");
                    }
                }
            }
        }
    }
</script>