<%@ Control Language="C#" AutoEventWireup="true" CodeFile="rfqEAV.ascx.cs" Inherits="rfqEAVForm" %>
<style type="text/css">
    .style2
    {
        width: 28%;
    }
</style>
<table cellspacing="0" class="style2">
    <tr>
        <td align="left">
            <div style="width: 290px" align="right">
            Year
            <asp:TextBox ID="txtYear" runat="server"  style="text-align:right"  Width="53px" TabIndex="25"></asp:TextBox>
            Volume
            <asp:TextBox ID="txtVolume" runat="server"  style="text-align:right" Width="53px" TabIndex="26"></asp:TextBox>
                <asp:Button ID="btnAdd" runat="server" Text="+" Width="35px" TabIndex="27" 
                    OnClick="btnAdd_Click" />
                <asp:Button ID="btnRemove" runat="server" Text="-" Width="35px" TabIndex="28" 
                    OnClick="btnRemove_Click" />
            </div>
        </td>
    </tr>
    <tr>
        <td align="center">
            <asp:ListBox ID="lstItems" runat="server" Height="100px" Width="290px" 
                TabIndex="29">
            </asp:ListBox>
        </td>
    </tr>
</table>
