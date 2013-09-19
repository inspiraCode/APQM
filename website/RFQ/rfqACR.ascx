<%@ Control Language="C#" AutoEventWireup="true" CodeFile="rfqACR.ascx.cs" Inherits="rfqACRForm" %>
<style type="text/css">
    .style2
    {
        width: 28%;
    }
</style>
<table cellspacing="0" class="style2">
    <tr>
        <td align="right">
            Year
        </td>
        <td align="left">
            <asp:TextBox ID="txtYear" runat="server" Width="53px" TabIndex="25"></asp:TextBox>
        </td>
        <td align="right">
            Cost
        </td>
        <td align="left">
            <asp:TextBox ID="txtCost" runat="server" Width="61px" TabIndex="26"></asp:TextBox>
        </td>
        <td align="left">
            <div style="width: 90px">
                <asp:Button ID="btnAdd" runat="server" Text="+" Width="35px" TabIndex="27" 
                    OnClick="btnAdd_Click" />
                <asp:Button ID="btnRemove" runat="server" Text="-" Width="35px" TabIndex="28" 
                    OnClick="btnRemove_Click" />
            </div>
        </td>
    </tr>
    <tr>
        <td colspan="5" align="center">
            <asp:ListBox ID="lstItems" runat="server" Height="100px" Width="248px" 
                TabIndex="29">
            </asp:ListBox>
        </td>
    </tr>
</table>
