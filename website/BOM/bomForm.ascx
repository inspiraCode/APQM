<%@ Control Language="C#" AutoEventWireup="true" CodeFile="bomForm.ascx.cs" Inherits="bomForm" %>
<%@ Register Src="bomDetailList.ascx" TagName="bomDetailList" TagPrefix="uc1" %>
<%@ Register Src="../Utils/Validator/Validator.ascx" TagName="Validator" TagPrefix="uc2" %>
<div align="center">
    <br />
    <table cellspacing="1" align="left">
        <tr style="display: none;">
            <td align="right">
                Mode:
            </td>
            <td align="left">
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
            <td align="left">
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
            <td align="left">
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
            <td align="left">
                <asp:Label ID="lblInquiryNumber" runat="server"></asp:Label>
            </td>
            <td align="left" style="font-weight: bold">
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
            <td align="left">
                <asp:Label ID="lblRevision" runat="server"></asp:Label>
            </td>
            <td align="left" style="font-weight: bold">
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
            <td align="left">
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
            <td align="left">
                <asp:TextBox ID="txtPartNumber" runat="server" Width="120px"></asp:TextBox>
            </td>
            <td align="left">
            </td>
            <td align="left">
            </td>
        </tr>
        <tr style="height: 25px;">
            <td align="right" style="font-weight: bold">
                Annual Volume
            </td>
            <td align="left">
                <asp:TextBox ID="txtAnnualVolume" runat="server" Width="120px"></asp:TextBox>
            </td>
            <td align="left">
            </td>
            <td align="left">
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
<uc2:Validator ID="Validator1" runat="server" />