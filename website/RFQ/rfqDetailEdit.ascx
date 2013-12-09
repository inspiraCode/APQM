<%@ Control Language="C#" AutoEventWireup="true" CodeFile="rfqDetailEdit.ascx.cs"
    Inherits="rfqDetailEdit" %>
<%@ Register Src="../Utils/Notifier/notifier.ascx" TagName="notifier" TagPrefix="uc1" %>
<table cellspacing="0">
    <tr style="background-color: #DADADA; height: 25px;">
        <td class="camposSinBordes">
            <div style="width: 160px;">
                <asp:TextBox validate="required" validationid="validatingRFQDetail" ID="txtPartNumberEdit"
                    runat="server" Width="152px" TabIndex="37"></asp:TextBox>
            </div>
        </td>
        <td class="camposSinBordes">
            <asp:DropDownList ID="cboUMEdit" runat="server" chosen="true" Width="100px" 
                TabIndex="38">
                <asp:ListItem Value="Each">Each</asp:ListItem>
                <asp:ListItem Value="Kg">Kg</asp:ListItem>
                <asp:ListItem Value="Lb">Lb</asp:ListItem>
            </asp:DropDownList>
        </td>
        <td class="camposSinBordes">
            <asp:TextBox validate="number" validationid="validatingRFQDetail" ID="txtQuantityEdit"
                Style="text-align: right;" runat="server" Width="68px" TabIndex="39"></asp:TextBox>
        </td>
        <td class="camposSinBordes">
            <asp:TextBox validate="number" validationid="validatingRFQDetail" ID="txtCostUnitEdit"
                Style="text-align: right;" runat="server" Width="70px" TabIndex="40"></asp:TextBox>
        </td>
        <td class="camposSinBordes">
            <asp:Label ID="Label1Edit" runat="server" Width="70px"></asp:Label>
        </td>
        <td class="camposSinBordes">
            <asp:TextBox validate="number" validationid="validatingRFQDetail" ID="txtOutsideServicesQuantityEdit"
                Style="text-align: right;" runat="server" Width="70px" TabIndex="41"></asp:TextBox>
        </td>
        <td class="camposSinBordes">
            <asp:TextBox validate="number" validationid="validatingRFQDetail" ID="txtOutsideServicesCostUnitEdit"
                Style="text-align: right;" runat="server" Width="70px" TabIndex="42"></asp:TextBox>
        </td>
        <td class="camposSinBordes">
            <asp:Label ID="Label2Edit" runat="server" Width="70px"></asp:Label>
        </td>
        <td class="camposSinBordes">
            <asp:TextBox validate="number" validationid="validatingRFQDetail" ID="txtScrapValueEdit"
                Style="text-align: right;" runat="server" Width="70px" TabIndex="43"></asp:TextBox>
        </td>
        <td class="camposSinBordes">
            <asp:Label ID="Label3Edit" runat="server" Width="70px"></asp:Label>
        </td>
        <td class="camposSinBordes">
            <asp:TextBox validate="number" validationid="validatingRFQDetail" ID="txtDirectHrlyLaborRateEdit"
                Style="text-align: right;" runat="server" Width="70px" TabIndex="44"></asp:TextBox>
        </td>
        <td class="camposSinBordes">
            <asp:TextBox validate="number" validationid="validatingRFQDetail" ID="txtStdHrsEdit"
                Style="text-align: right;" runat="server" Width="70px" TabIndex="45"></asp:TextBox>
        </td>
        <td class="camposSinBordes">
            <asp:Label ID="Label4Edit" runat="server" Width="70px"></asp:Label>
        </td>
        <td class="camposSinBordes">
            <asp:TextBox validate="number" validationid="validatingRFQDetail" ID="txtBurdenEdit"
                runat="server" Style="text-align: right;" Width="70px" TabIndex="46"></asp:TextBox>
        </td>
        <td class="camposSinBordes">
            <asp:Label ID="Label5Edit" runat="server" Width="50px"></asp:Label>
        </td>
        <td>
            <div style="display: inline;">
                <asp:LinkButton ID="lnkOK" OnClick="btnSave_Click" runat="server" OnClientClick="return validate();"
                    validationid="bomlineedit" TabIndex="47">OK</asp:LinkButton>
                <asp:LinkButton ID="lnkCancel" OnClick="btnCancel_Click" runat="server" 
                    TabIndex="48">Cancel</asp:LinkButton>
            </div>
        </td>
    </tr>
</table>
