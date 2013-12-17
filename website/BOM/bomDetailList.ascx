<%@ Control Language="C#" AutoEventWireup="true" CodeFile="bomDetailList.ascx.cs"
    Inherits="bomDetailList" %>
<%@ Register Src="../Utils/Validator/Validator.ascx" TagName="Validator" TagPrefix="uc1" %>
<%@ Register Src="bomDetailEdit.ascx" TagName="bomDetailEdit" TagPrefix="uc2" %>
<%@ Register Src="../Utils/Notifier/notifier.ascx" TagName="notifier" TagPrefix="uc3" %>
<style type="text/css">
    .camposSinBordes
    {
        border-top: 0px;
        border-bottom: 0px;
        border-right: 0px;
        border-left: 0px;
    }
    .itemFields
    {
        background-color: #D3D3D3;
        border: solid #D3D3D3 2px;
    }
</style>
<table cellspacing="0" align="left">
    <tr>
        <th class="camposSinBordes" style="width: 60px; max-width: 60px;">
            Status
        </th>
        <th class="camposSinBordes" style="width: 30px; max-width: 30px;">
            #
        </th>
        <th class="camposSinBordes itemFields" style="width: 120px; max-width: 120px;">
            Part Number / Code ID
        </th>
        <th class="camposSinBordes itemFields" style="width: 97px; max-width: 97px;">
            Capsonic PN
        </th>
        <th class="camposSinBordes itemFields" style="width: 97px; max-width: 97px;">
            Customer PN
        </th>
        <th class="camposSinBordes itemFields" style="width: 97px; max-width: 97px;">
            Manufacture PN
        </th>
        <th class="camposSinBordes itemFields" style="width: 97px; max-width: 97px;">
            Supplier PN
        </th>
        <th class="camposSinBordes itemFields" style="width: 97px; max-width: 97px;">
            Comm Code
        </th>
        <th class="camposSinBordes itemFields" style="width: 145px; max-width: 145px;">
            Material / Assembly Description
        </th>
        <th class="camposSinBordes itemFields" style="width: 68px; max-width: 68px;">
            UM
        </th>
        <th class="camposSinBordes itemFields" style="width: 52px; max-width: 52px;">
            Cost
        </th>
        <th class="camposSinBordes" style="width: 70px; max-width: 70px;">
            Vendor Quote Est
        </th>
        <th class="camposSinBordes" style="width: 60px; max-width: 60px;">
            Qty Required
        </th>
        <th class="camposSinBordes" style="width: 70px; max-width: 70px;">
            EAU
        </th>
        <th class="camposSinBordes" style="width: 50px; max-width: 50px;">
            Cap Com Assm
        </th>
        <th class="camposSinBordes" style="width: 80px; max-width: 80px;">
            Purchasing Comments
        </th>
        <th class="camposSinBordes" style="width: 70px; max-width: 70px;">
            Sales Status
        </th>
        <th class="camposSinBordes" style="width: 50px; max-width: 50px;">
            Directed Buy
        </th>
        <th class="camposSinBordes" style="width: 120px; max-width: 120px;">
            Purchasing Status
        </th>
        <th class="camposSinBordes" style="width: 73px; max-width: 73px;">
            Assigned To
        </th>
        <th style="border-color: Gray;" class="camposSinBordes">
        </th>
    </tr>
    <tr>
        <th class="camposSinBordes" style="vertical-align: top;">            
        </th>
        <th class="camposSinBordes" style="vertical-align: top;">            
        </th>
        <th class="camposSinBordes itemFields" style="vertical-align: top;">
            <div style="width: 125px;">
                <asp:DropDownList ID="cboPartNumber" chosen="true" Width="120px" runat="server" AutoPostBack="True"
                    OnSelectedIndexChanged="cboPartNumber_SelectedIndexChanged">
                </asp:DropDownList>
                <br />
                <asp:Button ID="btnNewPartNumber" Width="120px" runat="server" Style="margin-top: 4px;"
                    Text="New Part Number" />
            </div>
        </th>
        <th class="camposSinBordes itemFields" style="vertical-align: top;">
            <asp:TextBox ID="txtCapsonicPN" runat="server" Width="60px"></asp:TextBox>
        </th>
        <th class="camposSinBordes itemFields" style="vertical-align: top;">
            <asp:TextBox ID="txtCustomerPN" runat="server" Width="60px"></asp:TextBox>
        </th>
        <th class="camposSinBordes itemFields" style="vertical-align: top;">
            <asp:TextBox ID="txtManufacturePN" runat="server" Width="60px"></asp:TextBox>
        </th>
        <th class="camposSinBordes itemFields" style="vertical-align: top;">
            <asp:TextBox ID="txtSupplierPN" runat="server" Width="60px"></asp:TextBox>
        </th>
        <th class="camposSinBordes itemFields" style="vertical-align: top;">
            <asp:TextBox ID="txtCommCode" runat="server" Width="60px"></asp:TextBox>
        </th>
        <th class="camposSinBordes itemFields" style="vertical-align: top;">
            <asp:TextBox ID="txtMaterial" runat="server" Width="140px" Height="40px" Rows="2"
                TextMode="MultiLine" Style="overflow-y: auto; font-family: Tahoma;"></asp:TextBox>
        </th>
        <th class="camposSinBordes itemFields" style="vertical-align: top;">
            <asp:DropDownList ID="cboUM" runat="server" Width="70px">
                    <asp:ListItem Value="Each">Each</asp:ListItem>
                    <asp:ListItem Value="in">in</asp:ListItem>
                    <asp:ListItem Value="ft">ft</asp:ListItem>
                    <asp:ListItem Value="yd">yd</asp:ListItem>
                    <asp:ListItem Value="mm">mm</asp:ListItem>
                    <asp:ListItem Value="cm">cm</asp:ListItem>
                    <asp:ListItem Value="m">m</asp:ListItem>
                    <asp:ListItem Value="g">g</asp:ListItem>
                    <asp:ListItem Value="kg">kg</asp:ListItem>
                    <asp:ListItem Value="lb">lb</asp:ListItem>
                    <asp:ListItem Value="oz">oz</asp:ListItem>
                    <asp:ListItem Value="lt">lt</asp:ListItem>
            </asp:DropDownList>
        </th>
        <th class="camposSinBordes itemFields" style="vertical-align: top;">
            <asp:TextBox ID="txtCost" validate="number" validationid="validatingBOMDetail" runat="server"
                Width="50px" Style="text-align: right">0</asp:TextBox>
        </th>
        <th class="camposSinBordes">
            <!-- Vendor Quote Est -->
            <div style="width: 70px;">
            </div>
        </th>
        <th class="camposSinBordes" style="vertical-align: top;">
            <asp:TextBox ID="txtQuantity" validate="number" validationid="validatingBOMDetail"
                runat="server" Width="56px" Style="text-align: right">0</asp:TextBox>
        </th>
        <th class="camposSinBordes" style="vertical-align: top;">
            <asp:TextBox ID="txtEAU" runat="server"
                Width="60px" Style="text-align: right">0</asp:TextBox>
        </th>
        <th class="camposSinBordes" style="vertical-align: top;">
            <asp:TextBox ID="txtCapComAssm" validationid="validatingBOMDetail" runat="server"
                Width="60px"></asp:TextBox>
        </th>
        <th class="camposSinBordes" style="vertical-align: top;">
            <asp:TextBox ID="txtPurchasingComments" runat="server" Width="136px" Height="40px"
                TextMode="MultiLine" Style="overflow-y: auto; font-family: Tahoma"></asp:TextBox>
        </th>
        <th class="camposSinBordes">
            <!-- Sales Status -->
            <div style="width: 70px;">
            </div>
        </th>
        <th class="camposSinBordes" style="vertical-align: top;">
            <asp:CheckBox ID="chkDirectedBuy" runat="server" Width="60px" />
        </th>
        <th class="camposSinBordes" style="vertical-align: top;">
            <asp:DropDownList ID="cboPurchasingStatus" runat="server" Width="120px">
                <asp:ListItem Selected="True"></asp:ListItem>
                <asp:ListItem Value="Q">Quote</asp:ListItem>
                <asp:ListItem Value="E">Estimate</asp:ListItem>
                <asp:ListItem Value="P">Pass Thru</asp:ListItem>
                <asp:ListItem Value="M">Manufacture</asp:ListItem>
                <asp:ListItem Value="Firm Requirement">Firm Requirement</asp:ListItem>
            </asp:DropDownList>
        </th>
        <th class="camposSinBordes">
            <!-- Assigned To -->
            <div style="width: 70px;">
            </div>
        </th>
        <th class="camposSinBordes" style="vertical-align: top;">
            <asp:Button ID="btnAdd" validationid="validatingBOMDetail" runat="server" Text="Add"
                OnClick="add_Click" />
        </th>
        <th class="camposSinBordes">
        </th>
    </tr>
    <asp:Repeater ID="repeaterBOMDetail" runat="server" OnItemDataBound="R1_ItemDataBound">
        <ItemTemplate>
            <tr height='27px;'>
                <td align="center" style="overflow: hidden; border: solid 1px;">
                    <asp:Label ID="lblStatus" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Status")%>'></asp:Label>    
                </td>
                <td align="center" style="overflow: hidden; border: solid 1px;border-left: 0px;">
                    <%# DataBinder.Eval(Container.DataItem, "LinePosition")%>
                </td>
                <td style="overflow: hidden; border: solid 1px;border-left: 0px;">
                    <asp:LinkButton ID="updateByID" runat="server" CommandArgument="" OnCommand="updateByID">
                <%# DataBinder.Eval(Container.DataItem, "PartNumber")%>
                    </asp:LinkButton>
                </td>
                <td align="center" style="overflow: hidden; border: solid 1px; border-left: 0px">
                    <%# DataBinder.Eval(Container.DataItem, "CapsonicPN")%>
                </td>
                <td align="center" style="overflow: hidden; border: solid 1px; border-left: 0px">
                    <%# DataBinder.Eval(Container.DataItem, "CustomerPN")%>
                </td>
                <td align="center" style="overflow: hidden; border: solid 1px; border-left: 0px">
                    <%# DataBinder.Eval(Container.DataItem, "ManufacturePN")%>
                </td>
                <td align="center" style="overflow: hidden; border: solid 1px; border-left: 0px">
                    <%# DataBinder.Eval(Container.DataItem, "SupplierPN")%>
                </td>
                <td align="center" style="overflow: hidden; border: solid 1px; border-left: 0px">
                    <%# DataBinder.Eval(Container.DataItem, "CommCode")%>
                </td>
                <td style="overflow: hidden; border: solid 1px; border-left: 0px">
                    <%# DataBinder.Eval(Container.DataItem, "Material")%>
                </td>
                <td align="center" style="overflow: hidden; border: solid 1px; border-left: 0px">
                    <%# DataBinder.Eval(Container.DataItem, "Um")%>
                </td>
                <td align="right" style="overflow: hidden; border: solid 1px; border-left: 0px">
                    <%# DataBinder.Eval(Container.DataItem, "Cost")%>
                </td>
                <td align="center" style="overflow: hidden; border: solid 1px; border-left: 0px">
                    <%# DataBinder.Eval(Container.DataItem, "VendorQuoteEst")%>
                </td>
                <td align="right" style="overflow: hidden; border: solid 1px; border-left: 0px">
                    <%# DataBinder.Eval(Container.DataItem, "Qty")%>
                </td>
                <td align="center" style="overflow: hidden; border: solid 1px; border-left: 0px">
                    <%# DataBinder.Eval(Container.DataItem, "EAU")%>
                </td>
                <td align="center" style="overflow: hidden; border: solid 1px; border-left: 0px">
                    <%# DataBinder.Eval(Container.DataItem, "CapComAssm")%>
                </td>
                <td align="center" style="overflow: hidden; border: solid 1px; border-left: 0px">
                    <%# DataBinder.Eval(Container.DataItem, "PurchasingComments")%>
                </td>
                <td align="center" style="overflow: hidden; border: solid 1px; border-left: 0px">
                    <%# DataBinder.Eval(Container.DataItem, "SalesStatus")%>
                </td>
                <td align="center" style="overflow: hidden; border: solid 1px; border-left: 0px">
                    <%# DataBinder.Eval(Container.DataItem, "DirectedBuy")%>
                </td>
                <td align="center" style="overflow: hidden; border: solid 1px; border-left: 0px">
                    <%# DataBinder.Eval(Container.DataItem, "PurchasingStatus")%>
                </td>
                <td align="center" style="overflow: hidden; border: solid 1px; border-left: 0px;
                    border-left: 0px">
                    <asp:LinkButton ID="linkAssignedToLine" runat="server" CommandArgument="" OnCommand="takeBOMLine">
                        Take
                    </asp:LinkButton>
                </td>
                <td align="center">
                    <asp:LinkButton ID="deleteByID" runat="server" CommandArgument="" OnCommand="deleteByID">
                    Delete
                    </asp:LinkButton>
                </td>
            </tr>
        </ItemTemplate>
        <FooterTemplate>
            </table>
        </FooterTemplate>
    </asp:Repeater>
    <div id="divBOMDetailList" style="clear: both;" runat="server" align="center">
    </div>
    <asp:Panel ID="panelPopup" runat="server" Visible="false">
        <uc2:bomDetailEdit ID="uscBomDetailEdit" runat="server" OnOk_Click="on_edit_line"
            OnCancel_Click="on_cancelEdit_line" />

        <script type="text/javascript">
            document.getElementById("<%= this.panelPopup.ClientID %>").setAttribute("title", "BOM Line Edit");
            jQuery("#<%= this.panelPopup.ClientID %>").dialog({ autoOpen: true,
                appendTo: jQuery('form:first'),
                width: 560, modal: false,
                dialogClass: "no-close", closeOnEscape: false
            });
        </script>

    </asp:Panel>
</table>
<uc3:notifier ID="uscNotifier" OnPrompt="on_prompt_partNumber" runat="server" />