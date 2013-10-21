<%@ Control Language="C#" AutoEventWireup="true" CodeFile="bomDetailEdit.ascx.cs" Inherits="BOM_bomDetailEdit" %>
<style type="text/css">
    .style1
    {
        width: 400px;
    }
    .style2
    {
        height: 28px;
        width: 1722px;
    }
    .style3
    {
        width: 534px;
    }
    .style4
    {
        height: 28px;
        width: 534px;
    }
    .style5
    {
    }
</style>
<table cellspacing="0" class="style1">
    <tr>
        <td class="style5" align="right">
            Part Number</td>
        <td class="style3">
            <div style="width: 225px;">
                <asp:DropDownList ID="cboPartNumber" runat="server" AutoPostBack="True" 
                    OnSelectedIndexChanged="cboPartNumber_SelectedIndexChanged" Width="130px">
                </asp:DropDownList>
                <asp:Button ID="btnNewPartNumber" runat="server" Text="New" Width="45px" />
            </div>
        </td>
    </tr>
    <tr>
        <td class="style5" align="right">
            Unit of Measure</td>
        <td class="style3">
            <asp:DropDownList ID="cboUM" runat="server" Width="130px">
                <asp:ListItem Selected="True"></asp:ListItem>
                <asp:ListItem Value="Each">Each</asp:ListItem>
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td class="style5" align="right">
            Material</td>
        <td class="style3">
            <asp:TextBox ID="txtMaterial" runat="server" Height="40px" Rows="2" 
                Style="overflow-y: auto;" TextMode="MultiLine" Width="250px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="style5" align="right">
            Description</td>
        <td class="style3">
            <asp:TextBox ID="txtDescription" runat="server" Height="40px" 
                Style="overflow-y: auto;" TextMode="MultiLine" Width="250px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="style5" align="right">
            Quantity</td>
        <td class="style3">
            <asp:TextBox ID="txtQuantity" runat="server" Style="text-align: right" 
                validate="number" Width="70px">0</asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="style2" align="right">
            Cost</td>
        <td class="style4">
            <asp:TextBox ID="txtCost" runat="server" Style="text-align: right" 
                validate="number" Width="70px">0</asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="style5" align="right">
            Directed&nbsp; Buy</td>
        <td class="style3">
            <asp:CheckBox ID="chkDirectedBuy" runat="server" Width="60px" />
        </td>
    </tr>
    <tr>
        <td class="style5" align="right">
            Purchasing Status</td>
        <td class="style3">
            <asp:DropDownList ID="cboPurchasingStatus" runat="server" Width="150px" 
                Height="17px">
                <asp:ListItem Selected="True"></asp:ListItem>
                <asp:ListItem Value="Q">Quote</asp:ListItem>
                <asp:ListItem Value="E">Estimate</asp:ListItem>
                <asp:ListItem Value="P">Pass Thru</asp:ListItem>
                <asp:ListItem Value="M">Manufacture</asp:ListItem>
                <asp:ListItem Value="Firm Requirement"></asp:ListItem>
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td class="style5">
            &nbsp;</td>
        <td class="style3">
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style5" colspan="2">
            <div align="center">
                <asp:Button ID="btnSave" runat="server" OnClick="btnSave_Click" Text="Save" 
                    Width="70px" />
                <asp:Button ID="btnCancel" runat="server" OnClick="btnCancel_Click" 
                    Text="Cancel" Width="70px" />
            </div>
        </td>
    </tr>
</table>
<asp:HiddenField ID="txtPrompt" runat="server" OnValueChanged="txtPrompt_ValueChanged" />

