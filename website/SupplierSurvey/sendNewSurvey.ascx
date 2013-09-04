<%@ Control Language="C#" AutoEventWireup="true" CodeFile="sendNewSurvey.ascx.cs" Inherits="SupplierSurvey_sendNewSurvey" %>
<style type="text/css">
    .style1
    {
        width: 50%;
    }
    .style2
    {
        width: 81px;
    }
    .style3
    {
        width: 278px;
    }
</style>
<table cellspacing="0" class="style1">
    <tr>
        <td align="right" class="style2">
            Supplier</td>
        <td class="style3">
            <asp:TextBox ID="txtSupplier" runat="server" Width="350px"></asp:TextBox>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td align="right" class="style2">
            Email</td>
        <td class="style3">
            <asp:TextBox ID="txtEmail" runat="server" Width="350px"></asp:TextBox>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style2">
            &nbsp;</td>
        <td class="style3">
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td align="center" colspan="3">
            <asp:Button ID="btnSendSurvey" runat="server" OnClick="btnSendSurvey_Click" 
                Text="Send new survey" Width="136px" />
&nbsp;<asp:Button ID="btnCancel" runat="server" OnClick="btnCancel_Click" Text="Cancel" 
                Width="70px" />
        </td>
    </tr>
</table>
