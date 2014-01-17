<%@ Control Language="C#" AutoEventWireup="true" CodeFile="rfqACR.ascx.cs" Inherits="rfqACRForm" %>
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
                <asp:TextBox ID="txtYear" runat="server" Style="text-align: right" Width="40px" 
                    TabIndex="27"></asp:TextBox>
                Cost %
                <asp:TextBox ID="txtCost" runat="server" Style="text-align: right" Width="40px" 
                    TabIndex="28"></asp:TextBox>
                <asp:Button ID="btnAdd" runat="server" Text="Add" Width="35px" TabIndex="29" OnClick="btnAdd_Click"
                    Style="padding: 0; height: 21px;" />
                <asp:Button ID="btnRemove" runat="server" Text="Remove" Width="55px" TabIndex="31"
                    OnClick="btnRemove_Click" Style="padding: 0; height: 21px;" />
            </div>
        </td>
    </tr>
    <tr>
        <td align="center">
            <asp:ListBox ID="lstItems" runat="server" Height="100px" Width="290px" TabIndex="30">
            </asp:ListBox>
        </td>
    </tr>
</table>
