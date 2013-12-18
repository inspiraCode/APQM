<%@ Control Language="C#" AutoEventWireup="true" CodeFile="bomForm.ascx.cs" Inherits="bomForm" %>
<%@ Register Src="bomDetailList.ascx" TagName="bomDetailList" TagPrefix="uc1" %>
<style type="text/css">
    .style1
    {
        width: 228px;
    }
</style>
<div align="center">
    <br />
    <table cellspacing="1" align="left">
        <tr style="display: none;">
            <td align="right">
                Mode:
            </td>
            <td align="left" class="style1">
                <asp:Label ID="lblMode" runat="server" Text="New"></asp:Label>
            </td>
            <td align="left">
            </td>
            <td align="left">
            </td>
        </tr>
        <tr style="display: none;">
            <td align="right">
                ID:
            </td>
            <td align="left" class="style1">
                <asp:Label ID="lblID" runat="server"></asp:Label>
            </td>
            <td align="left">
            </td>
            <td align="left">
            </td>
        </tr>
        <tr style="display: none;">
            <td align="right">
                SIF ID:
            </td>
            <td align="left" class="style1">
                <asp:Label ID="lblSifID" runat="server"></asp:Label>
            </td>
            <td align="left">
            </td>
            <td align="left">
            </td>
        </tr>
        <tr style="height: 25px;">
            <td align="right" style="font-weight: bold">
                Inquiry Number
            </td>
            <td align="left" class="style1">
                <asp:Label ID="lblInquiryNumber" runat="server"></asp:Label>
            </td>
            <td align="right" style="font-weight: bold">
                Sales Rep
            </td>
            <td align="left">
                <asp:Label ID="lblSalesRep" runat="server"></asp:Label>
            </td>
        </tr>
        <tr style="height: 25px;">
            <td align="right" style="font-weight: bold">
                Revision
            </td>
            <td align="left" class="style1">
                <asp:Label ID="lblRevision" runat="server"></asp:Label>
            </td>
            <td align="right" style="font-weight: bold">
                Customer
            </td>
            <td align="left">
                <asp:Label ID="lblCustomer" runat="server"></asp:Label>
            </td>
        </tr>
        <tr style="height: 25px;">
            <td align="right" style="font-weight: bold">
                Product
            </td>
            <td align="left" class="style1">
                <asp:Label ID="lblProduct" runat="server"></asp:Label>
            </td>
            <td align="left" style="font-weight: bold">
                Market Sector
            </td>
            <td align="left">
                <asp:Label ID="lblMarketSector" runat="server"></asp:Label>
            </td>
        </tr>
        <tr style="height: 25px;">
            <td align="right" style="font-weight: bold">
                Finished Good PN
            </td>
            <td align="left" class="style1">
                <asp:TextBox ID="txtPartNumber" runat="server" Width="120px"></asp:TextBox>
            </td>
            <td align="right" style="font-weight: bold">
                Status</td>
            <td align="left">
                <div id="progressBar" style="height:20px;width:100px;"><div id="progress-label"></div></div></td>
        </tr>
        <tr style="height: 25px;">
            <td align="right" style="font-weight: bold">
                Annual Volume
            </td>
            <td align="left" class="style1">
                <asp:TextBox ID="txtAnnualVolume" runat="server" Width="120px"></asp:TextBox>
            </td>
            <td align="left">
            </td>
            <td align="left">
            <a href="../HTMLReports/SalesReport.aspx?BOM=<%= lblID.Text %>"  target="_blank">Report to Sales
            </a>
            </td>
        </tr>
    </table>
    <table cellspacing="1" align="center">
        <tr align="left">
            <td align="right" height="25px" colspan="2">
                <div style="border: solid; border-color: gray; border-width: 2px;">
                </div>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <div id="divDetail" runat="server">
                    <uc1:bomDetailList ID="uscBOMDetailList" runat="server" />
                </div>
            </td>
        </tr>
        <tr>
            <td align="right">
            </td>
            <td align="left">
            </td>
        </tr>
    </table>
</div>
<div align="center">
    <asp:Button ID="btnSave" runat="server" Text="Save" Width="70px" OnClick="btnSave_Click" />
    <asp:Button ID="btnCancel" runat="server" Text="Cancel" Width="70px" OnClick="btnCancel_Click" />
</div>
<br />
<asp:HiddenField ID="hiddenProgressBar" runat="server" Value="0" />




<script type="text/javascript">
    jQuery(document).ready(function() {
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
    });
</script>