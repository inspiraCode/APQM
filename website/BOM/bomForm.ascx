<%@ Control Language="C#" AutoEventWireup="true" CodeFile="bomForm.ascx.cs" Inherits="bomForm" %>
<%@ Register Src="bomDetailList.ascx" TagName="bomDetailList" TagPrefix="uc1" %>
<%@ Register src="bomStatusInfo.ascx" tagname="bomStatusInfo" tagprefix="uc2" %>
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

<div align="center">
    <br />
    <table cellspacing="1" align="left" style="width: 1232px">
        <tr style="display:none;">
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
                &nbsp;</td>
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
                &nbsp;</td>
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
                &nbsp;</td>
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
                Status</td>
            <td align="left" class="style6">
                <div id="progressBar" style="height:20px;width:100px;"><div id="progress-label"></div></div></td>
        </tr>
        <tr style="height: 25px;">
            <td align="right" style="font-weight: bold" class="style7">
                Annual Volume
            </td>
            <td align="left" class="style4">
                <asp:TextBox ID="txtAnnualVolume" style="text-align:right;" validate="number" validationid="validatingBOMHeader" runat="server" Width="120px"></asp:TextBox>
            </td>
            <td align="left" class="style8">
            </td>
            <td align="left" class="style6">
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
    <asp:Button ID="btnSave" runat="server" Text="Save" Width="70px" OnClick="btnSave_Click" OnClientClick="return validate();" validationid="validatingBOMHeader"/>
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