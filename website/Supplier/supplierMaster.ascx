<%@ Control Language="C#" AutoEventWireup="true" CodeFile="supplierMaster.ascx.cs"
    Inherits="supplierMaster" %>
<div align="center">
    <table cellspacing="1" style="width: 590px">
        <tr>
            <td align="right">
                Mode:
            </td>
            <td align="left">
                <asp:Label ID="lblMode" runat="server" Text="New"></asp:Label>
            </td>
        </tr>
        <tr>
            <td align="right">
                ID:
            </td>
            <td align="left">
                <asp:Label ID="lblID" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td align="right">
                Supplier Name
            </td>
            <td align="left">
                <asp:TextBox ID="txtSupplierName" runat="server" Width="380px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right">
                Manufacturing Location
            </td>
            <td align="left">
                <asp:TextBox ID="txtManufacturingLocation" runat="server" Width="380px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right">
                Ship Location
            </td>
            <td align="left">
                <asp:TextBox ID="txtShipLocation" runat="server" Width="380px"></asp:TextBox>
            </td>
        </tr>
        <tr align="left">
            <td align="right">
                Quoted Currency
            </td>
            <td align="left">
                <asp:TextBox ID="txtQuotedCurrency" runat="server" Width="200px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
            <td align="left">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td align="right">
                Contact Name
            </td>
            <td align="left">
                <asp:TextBox ID="txtContactName" runat="server" Width="380px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right">
                Contact Phone Number
            </td>
            <td align="left">
                <asp:TextBox ID="txtContactPhoneNumber" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right">
                Contact Email
            </td>
            <td align="left">
                <asp:TextBox ID="txtContactEmail" runat="server" Width="300px"></asp:TextBox>
            </td>
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