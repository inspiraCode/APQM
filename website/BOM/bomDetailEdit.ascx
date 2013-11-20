<%@ Control Language="C#" AutoEventWireup="true" CodeFile="bomDetailEdit.ascx.cs"
    Inherits="BOM_bomDetailEdit" %>
<%@ Register src="../Utils/Notifier/notifier.ascx" tagname="notifier" tagprefix="uc1" %>
<style type="text/css">
    .style1
    {
        width: 544px;
    }
    .style2
    {
        height: 28px;
        width: 1327px;
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
    .style6
    {
        width: 1327px;
    }
</style>
<table cellspacing="0" class="style1">
    <tr class="itemFields">
        <td class="style6" align="right">
            Part Number
        </td>
        <td class="style3">
            <div style="width: 368px;">
                <asp:DropDownList ID="cboPartNumberEdit" chosen = "true" runat="server" AutoPostBack="True" OnSelectedIndexChanged="cboPartNumberEdit_SelectedIndexChanged"
                    Width="300px">
                </asp:DropDownList>
                <asp:Button ID="btnNewPartNumber" runat="server" Text="New" Width="45px" />
            </div>
        </td>
    </tr>
    <tr class="itemFields">
        <td class="style6" align="right">
            Capsonic PN
        </td>
        <td class="style3">
            <asp:TextBox ID="txtCapsonicPN" runat="server" Style="text-align: right" Width="150px"></asp:TextBox>
        </td>
    </tr>
    <tr class="itemFields">
        <td class="style6" align="right">
            Customer PN
        </td>
        <td class="style3">
            <asp:TextBox ID="txtCustomerPN" runat="server" Style="text-align: right" Width="150px"></asp:TextBox>
        </td>
    </tr>
    <tr class="itemFields">
        <td class="style6" align="right">
            Manufacture PN
        </td>
        <td class="style3">
            <asp:TextBox ID="txtManufacturePN" runat="server" Style="text-align: right" Width="150px"></asp:TextBox>
        </td>
    </tr>
    <tr class="itemFields">
        <td class="style6" align="right">
            Supplier PN
        </td>
        <td class="style3">
            <asp:TextBox ID="txtSupplierPN" runat="server" Style="text-align: right" Width="150px"></asp:TextBox>
        </td>
    </tr>
    <tr class="itemFields">
        <td class="style6" align="right">
            Comm Code
        </td>
        <td class="style3">
            <asp:TextBox ID="txtCommCode" runat="server" Style="text-align: right" Width="150px"></asp:TextBox>
        </td>
    </tr>
    <tr class="itemFields">
        <td class="style6" align="right">
            Material / Assembly Description
        </td>
        <td class="style3">
            <asp:TextBox ID="txtMaterial" runat="server" Height="40px" Rows="2" Style="overflow-y: auto;"
                TextMode="MultiLine" Width="340px"></asp:TextBox>
        </td>
    </tr>
    <tr class="itemFields">
        <td class="style6" align="right">
            Unit of Measure
        </td>
        <td class="style3">
            <asp:DropDownList ID="cboUM" chosen = "true" runat="server" Width="130px">
                <asp:ListItem Selected="True"></asp:ListItem>
                <asp:ListItem Value="Each">Each</asp:ListItem>
                <asp:ListItem Value="Kg">Kg</asp:ListItem>
                <asp:ListItem Value="Lb">Lb</asp:ListItem>      
            </asp:DropDownList>
        </td>
    </tr>
    <tr class="itemFields">
        <td class="style6" align="right">
            Vendor Quote Est
        </td>
        <td class="style3">
            <asp:Label ID="lblVendorQuoteEst" runat="server" Text=""></asp:Label>
        </td>
    </tr>
    <tr class="itemFields">
        <td class="style6" align="right">
                        EAU
        </td>
        <td class="style3">
            <asp:TextBox ID="txtEAU" runat="server" Style="text-align: right"  validate="number" validationid="bomlineedit" 
                Width="150px">0</asp:TextBox>
        </td>
    </tr>
    <tr class="itemFields">
        <td class="style6" align="right">
            Cost
        </td>
        <td class="style3">
            <asp:TextBox ID="txtCost" validate="number" validationid="bomlineedit" runat="server"
                Style="text-align: right" Width="70px">0</asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="style2" align="right">
            Cap Com Assm
        </td>
        <td class="style4">
            <asp:TextBox ID="txtCapComAssm" runat="server" Style="text-align: right" Width="100px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="style6" align="right">
            Qty Required
        </td>
        <td class="style3">
            <asp:TextBox ID="txtQuantity" runat="server" Style="text-align: right" validate="number"
                validationid="bomlineedit" Width="70px">0</asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="style6" align="right">
            Purchasing Comments
        </td>
        <td class="style3">
            <asp:TextBox ID="txtPurchasingComments" runat="server" Rows="2" TextMode="MultiLine"
                Width="340px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="style6" align="right">
            Sales Status
        </td>
        <td class="style3">
            <asp:Label ID="lblSalesStatus" runat="server"></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="style6" align="right">
            Directed Buy
        </td>
        <td class="style3">
            <asp:CheckBox ID="chkDirectedBuy" runat="server" Width="60px" />
        </td>
    </tr>
    <tr>
        <td class="style6" align="right">
            Purchasing Status
        </td>
        <td class="style3">
            <asp:DropDownList ID="cboPurchasingStatus" chosen = "true" runat="server" Width="200px">
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
        <td class="style6" align="right">
            Assigned To
        </td>
        <td class="style3">
            <asp:Label ID="lblAssignedTo" runat="server"></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="style5" colspan="2">
        </td>
    </tr>
    <tr>
        <td class="style5" colspan="2">
            <div align="center">
                <asp:Button ID="btnSave" runat="server" OnClick="btnSave_Click" Text="Save" Width="70px"
                    OnClientClick="return validate();" validationid="bomlineedit" />
                <asp:Button ID="btnCancel" runat="server" OnClick="btnCancel_Click" Text="Cancel"
                    Width="70px" />
            </div>
        </td>
    </tr>
</table>
<uc1:notifier ID="uscNotifier" OnPrompt="on_prompt" runat="server" />