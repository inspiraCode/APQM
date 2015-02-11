<%@ Control Language="C#" AutoEventWireup="true" CodeFile="bomStatusInfo.ascx.cs"
    Inherits="BOM_bomStatusInfo" %>
<style type="text/css">
    .colorColumn
    {
        width:15px;
    }
    .firstColumn
    {
        padding-right: 5px;
        font-weight: bold;
        width: 80px;
        font-size:11px;
    }
</style>
<table align="left" cellspacing="0" style="width: 500px;font-size: 11px;background-color: #e3e3e3;border: solid #424242 2px;">
    <tr>
        <td class="colorColumn Imported" align="right">
            &nbsp;</td>
        <td class="firstColumn" align="right">
            Imported</td>
        <td align="left">
            Imported from Sales Database.</td>
    </tr>
    <tr>
        <td class="colorColumn Created" align="right">
            &nbsp;</td>
        <td class="firstColumn" align="right">
            Created</td>
        <td align="left">
            This component was not imported from Sales DB, instead, a Buyer created it.</td>
    </tr>
    <tr>
        <td class="colorColumn ForAdd" align="right">
            &nbsp;</td>
        <td class="firstColumn" align="right">
            For Add
        </td>
        <td align="left">
            You are adding this BOM line, but need to click Save button to create it.</td>
    </tr>
    <tr>
        <td class="colorColumn ForEdit" align="right">
            &nbsp;</td>
        <td class="firstColumn" align="right">
            For Edit</td>
        <td align="left">
            You are editing this BOM line, but need to click Save button to update it.</td>
    </tr>
    <tr>
        <td class="colorColumn InProgress" align="right">
            &nbsp;</td>
        <td class="firstColumn" align="right">
            In Progress</td>
        <td align="left">
            Already sent several RFQs, but have not selected anyone.</td>
    </tr>
    <tr>
        <td class="colorColumn NoQuote" align="right">
            &nbsp;</td>
        <td class="firstColumn" align="right">
            No Quote
        </td>
        <td align="left">
            This Part Number is not going to be requested for quote.
        </td>
    </tr>
    <tr>
        <td class="colorColumn BoughtPart" align="right">
            &nbsp;</td>
        <td class="firstColumn" align="right">
            Bought Part</td>
        <td align="left">
            Take current info from component, not from RFQs.</td>
    </tr>
    <tr>
        <td class="colorColumn Processed" align="right">
            &nbsp;</td>
        <td class="firstColumn" align="right">
            Processed</td>
        <td align="left">
            Already requested to several vendors and selected one RFQ.</td>
    </tr>
</table>
