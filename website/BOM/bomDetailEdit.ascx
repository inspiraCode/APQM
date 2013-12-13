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
        <td class="style6" align="right" style="font-weight: bold">
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
        <td class="style6" align="right" style="font-weight: bold">
            Capsonic PN
        </td>
        <td class="style3">
            <asp:TextBox ID="txtCapsonicPN" runat="server" Style="text-align: right" Width="150px"></asp:TextBox>
        </td>
    </tr>
    <tr class="itemFields">
        <td class="style6" align="right" style="font-weight: bold">
            Customer PN
        </td>
        <td class="style3">
            <asp:TextBox ID="txtCustomerPN" runat="server" Style="text-align: right" Width="150px"></asp:TextBox>
        </td>
    </tr>
    <tr class="itemFields">
        <td class="style6" align="right" style="font-weight: bold">
            Manufacture PN
        </td>
        <td class="style3">
            <asp:TextBox ID="txtManufacturePN" runat="server" Style="text-align: right" Width="150px"></asp:TextBox>
        </td>
    </tr>
    <tr class="itemFields">
        <td class="style6" align="right" style="font-weight: bold">
            Supplier PN
        </td>
        <td class="style3">
            <asp:TextBox ID="txtSupplierPN" runat="server" Style="text-align: right" Width="150px"></asp:TextBox>
        </td>
    </tr>
    <tr class="itemFields">
        <td class="style6" align="right" style="font-weight: bold">
            Comm Code
        </td>
        <td class="style3">
            <asp:TextBox ID="txtCommCode" runat="server" Style="text-align: right" Width="150px"></asp:TextBox>
        </td>
    </tr>
    <tr class="itemFields">
        <td class="style6" align="right" style="font-weight: bold">
            Material / Assembly Description
        </td>
        <td class="style3">
            <asp:TextBox ID="txtMaterial" runat="server" Height="40px" Rows="2" Style="overflow-y: auto;"
                TextMode="MultiLine" Width="340px"></asp:TextBox>
        </td>
    </tr>
    <tr class="itemFields">
        <td class="style6" align="right" style="font-weight: bold">
            Unit of Measure
        </td>
        <td class="style3">
            <asp:DropDownList ID="cboUM" runat="server" Width="130px">
                <asp:ListItem Selected="True"></asp:ListItem>
                <asp:ListItem Value="Each">Each</asp:ListItem>
                <asp:ListItem Value="Kg">Kg</asp:ListItem>
                <asp:ListItem Value="Lb">Lb</asp:ListItem>      
            </asp:DropDownList>
        </td>
    </tr>
    <tr class="itemFields">
        <td class="style6" align="right" style="font-weight: bold">
            Vendor Quote Est
        </td>
        <td class="style3">
            <asp:Label ID="lblVendorQuoteEst" runat="server" Text=""></asp:Label>
        </td>
    </tr>
    <tr class="itemFields">
        <td class="style6" align="right" style="font-weight: bold">
                        EAU
        </td>
        <td class="style3">
            <asp:TextBox ID="txtEAU" runat="server" Style="text-align: right"  validate="number" validationid="bomlineedit" 
                Width="150px">0</asp:TextBox>
        </td>
    </tr>
    <tr class="itemFields">
        <td class="style6" align="right" style="font-weight: bold">
            Cost
        </td>
        <td class="style3">
            <asp:TextBox ID="txtCost" validate="number" validationid="bomlineedit" runat="server"
                Style="text-align: right" Width="70px">0</asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="style2" align="right" style="font-weight: bold">
            Cap Com Assm
        </td>
        <td class="style4">
            <asp:TextBox ID="txtCapComAssm" runat="server" Style="text-align: right" Width="100px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="style6" align="right" style="font-weight: bold">
            Qty Required
        </td>
        <td class="style3">
            <asp:TextBox ID="txtQuantity" runat="server" Style="text-align: right" validate="number"
                validationid="bomlineedit" Width="70px">0</asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="style6" align="right" style="font-weight: bold">
            Purchasing Comments
        </td>
        <td class="style3">
            <asp:TextBox ID="txtPurchasingComments" runat="server" Rows="2" TextMode="MultiLine"
                Width="340px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="style6" align="right" style="font-weight: bold">
            Sales Status
        </td>
        <td class="style3">
            <asp:Label ID="lblSalesStatus" runat="server"></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="style6" align="right" style="font-weight: bold">
            Directed Buy
        </td>
        <td class="style3">
            <asp:CheckBox ID="chkDirectedBuy" runat="server" Width="60px" />
        </td>
    </tr>
    <tr>
        <td class="style6" align="right" style="font-weight: bold">
            Purchasing Status
        </td>
        <td class="style3">
            <asp:DropDownList ID="cboPurchasingStatus" runat="server" Width="200px">
                <asp:ListItem Selected="True"></asp:ListItem>
                <asp:ListItem Value="Q">Quote</asp:ListItem>
                <asp:ListItem Value="E">Estimate</asp:ListItem>
                <asp:ListItem Value="P">Pass Thru</asp:ListItem>
                <asp:ListItem Value="M">Manufacture</asp:ListItem>
                <asp:ListItem Value="Firm Requirement"></asp:ListItem>
            </asp:DropDownList>
        </td>
    </tr>
    <tr style="height: 25px">
        <td class="style6" align="right" style="font-weight: bold">
            Assigned To
        </td>
        <td class="style3">
            <asp:Label ID="lblAssignedTo" runat="server"></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="style6" align="right" style="font-weight: bold">
            System Status</td>
        <td class="style3">
            <asp:DropDownList ID="cboSystemStatus" runat="server" 
                Width="140px">
                <asp:ListItem></asp:ListItem>
                <asp:ListItem>For Add</asp:ListItem>
                <asp:ListItem>For Edit</asp:ListItem>
                <asp:ListItem>Created</asp:ListItem>
                <asp:ListItem>In Progress</asp:ListItem>
                <asp:ListItem>Processed</asp:ListItem>
                <asp:ListItem>No Quote</asp:ListItem>
                <asp:ListItem>Imported From Sales DB</asp:ListItem>
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td class="style5" colspan="2">
        </td>
    </tr>
    <tr>
        <td class="style5" colspan="2">
            <div align="center">
                <asp:Button ID="btnSave" runat="server" OnClick="btnSave_Click" Text="OK" Width="70px"
                    OnClientClick="return validate();" validationid="bomlineedit" />
                <asp:Button ID="btnCancel" runat="server" OnClick="btnCancel_Click" Text="Cancel"
                    Width="70px" />
            </div>
        </td>
    </tr>
</table>
<uc1:notifier ID="uscNotifier" OnPrompt="on_prompt" runat="server" />