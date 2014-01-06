﻿<%@ Control Language="C#" AutoEventWireup="true" CodeFile="bomStatusInfo.ascx.cs"
    Inherits="BOM_bomStatusInfo" %>
<style type="text/css">
    .style1
    {
        width: 587px;
    }
    .style2
    {
        padding-right: 5px;
        font-weight: bold;
        width: 94px;
    }
</style>
<div style="background-color: #e3e3e3;border: solid #424242 2px;height: 115px;width: 530px;" >
<table align="left" cellspacing="0" class="style1">
    <tr>
        <td class="style2" align="right">
            Imported</td>
        <td align="left">
            Imported from Sales Database.</td>
    </tr>
    <tr>
        <td class="style2" align="right">
            Created</td>
        <td align="left">
            This component was not imported from Sales DB, instead, a Buyer created it.</td>
    </tr>
    <tr>
        <td class="style2" align="right">
            For Add
        </td>
        <td align="left">
            You are adding this BOM line, but need to click Save button to create it.</td>
    </tr>
    <tr>
        <td class="style2" align="right">
            For Edit</td>
        <td align="left">
            You are editing this BOM line, but need to click Save button to update it.</td>
    </tr>
    <tr>
        <td class="style2" align="right">
            In Progress</td>
        <td align="left">
            Already sent several RFQs, but have not selected anyone.</td>
    </tr>
    <tr>
        <td class="style2" align="right">
            No Quote
        </td>
        <td align="left">
            This Part Number is not going to be requested for quote.
        </td>
    </tr>
    <tr>
        <td class="style2" align="right">
            Processed</td>
        <td align="left">
            Already requested to several vendors and selected one RFQ.</td>
    </tr>
</table>
</div>