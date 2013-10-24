﻿<%@ Control Language="C#" AutoEventWireup="true" CodeFile="bomForm.ascx.cs"
    Inherits="bomForm" %>
<%@ Register src="bomDetailList.ascx" tagname="bomDetailList" tagprefix="uc1" %>
<%@ Register src="../Utils/Validator/Validator.ascx" tagname="Validator" tagprefix="uc2" %>
<div align="center">
<br />
    <table cellspacing="1"  align="left">
        <tr style="display: none;">
            <td align="right" >
                Mode:
            </td>
            <td align="left">
                <asp:Label ID="lblMode" runat="server" Text="New"></asp:Label>
            </td>
        </tr>
        <tr style="display: none;">
            <td align="right">
                ID:
            </td>
            <td align="left">
                <asp:Label ID="lblID" runat="server"></asp:Label>
            </td>
        </tr>
        <tr style="display: none;">
            <td align="right">
                SIF ID:</td>
            <td align="left">
                <asp:Label ID="lblSifID" runat="server"></asp:Label>
            </td>
        </tr>
        <tr style="display: none">
            <td align="right">
                Part #</td>
            <td align="left">
                <asp:TextBox ID="txtPartNumber" runat="server" Width="380px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right" style="font-weight: bold">
                Inquiry Number</td>
            <td align="left">
                <asp:Label ID="lblInquiryNumber" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td align="right" style="font-weight: bold">
                Revision</td>
            <td align="left">
                <asp:Label ID="lblRevision" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td align="right" style="font-weight: bold">
                Product</td>
            <td align="left">
                <asp:Label ID="lblProduct" runat="server"></asp:Label>
            </td>
        </tr>
        </table>
        
        
        
        <table cellspacing="1" align="center">
        <tr align="left">
            <td align="right" height="25px" colspan="2">
                <div style="border: solid;border-color: gray;border-width: 2px;"></div>
            </td> 
        </tr>
        <tr>
            <td colspan="2">
                <div id="divDetail" runat="server">
                    <uc1:bomDetailList ID="uscBOMDetailList" runat="server" />
                </div></td>
        </tr>
        <tr>
            <td align="right">
                &nbsp;
            </td>
            <td align="left">
                &nbsp;
            </td>
        </tr>        
    </table>
</div>
<div align="center">
    <asp:Button ID="btnSave" runat="server" Text="Save" Width="70px" OnClick="btnSave_Click" />
    <asp:Button ID="btnCancel" runat="server" Text="Cancel" Width="70px" OnClick="btnCancel_Click" />
</div>
<br />
<uc2:Validator ID="Validator1" runat="server" />