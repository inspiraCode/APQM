<%@ Control Language="C#" AutoEventWireup="true" CodeFile="rfqStatusInfo.ascx.cs"
    Inherits="RFQ_rfqStatusInfo" %>
<style type="text/css">
    .style1
    {
        width: 459px;
    }
    .style2
    {
        padding-right: 5px;
        font-weight:bold;
    }
</style>
<div style="background-color: #e3e3e3;border: solid #424242 2px;height: 110px;width: 440px;">
<table align="left" cellspacing="0" class="style1">
    <tr>
        <td class="style2" align="right">
        </td>
    </tr>
    <tr>
        <td class="style2" align="right">
            PENDING
        </td>
        <td align="left">
            RFQ recently created and sent to vendor.
        </td>
    </tr>
    <tr>
        <td class="style2" align="right">
            IN PROGRESS
        </td>
        <td align="left">
            Vendor has beginning to fill up the RFQ but not finished.
        </td>
    </tr>
    <tr>
        <td class="style2" align="right">
            COMPLETED
        </td>
        <td align="left">
            Vendor has completed the RFQ.
        </td>
    </tr>
    <tr>
        <td class="style2" align="right">
            AWARDED
        </td>
        <td align="left">
            A buyer chose this RFQ.
        </td>
    </tr>
    <tr>
        <td class="style2" align="right">
            DISMISSED
        </td>
        <td align="left">
            Other RFQ was selected, so this RFQ was dismissed.
        </td>
    </tr>
    <tr>
        <td class="style2" align="right">
            NO QUOTE
        </td>
        <td align="left">
            Vendor is not able to quote.
        </td>
    </tr>
</table>
</div>