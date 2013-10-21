<%@ Control Language="C#" AutoEventWireup="true" CodeFile="bomDetailList.ascx.cs"
    Inherits="bomDetailList" %>
<%@ Register Src="../Utils/Validator/Validator.ascx" TagName="Validator" TagPrefix="uc1" %>
<%@ Register Src="bomDetailEdit.ascx" TagName="bomDetailEdit" TagPrefix="uc2" %>
<style type="text/css">
    .camposSinBordes
    {
        border-top: 0px;
        border-bottom: 0px;
        border-right: 0px;
        border-left: 0px;
    }
</style>
<table cellspacing="0" align="left" class="camposSinBordes">
    <tr>
        <th class="camposSinBordes">
            Part Number
        </th>
        <th class="camposSinBordes">
            UM
        </th>
        <th class="camposSinBordes">
            Material / Assembly Description
        </th>
        <th class="camposSinBordes">
            Description
        </th>
        <th class="camposSinBordes">
            Quantity
        </th>
        <th class="camposSinBordes">
            Cost
        </th>
        <th class="camposSinBordes">
            Sales Status
        </th>
        <th class="camposSinBordes">
            Directed Buy
        </th>
        <th class="camposSinBordes">
            Purchasing Status
        </th>
        <th class="camposSinBordes">
            Assigned To
        </th>
        <th style="border-color: Gray;" class="camposSinBordes">
        </th>
    </tr>
    <tr>
        <th class="camposSinBordes" style="vertical-align: top;">
            <div style="width: 155px;">
                <asp:DropDownList ID="cboPartNumber" Width="100px" runat="server" AutoPostBack="True"
                    OnSelectedIndexChanged="cboPartNumber_SelectedIndexChanged">
                </asp:DropDownList>
                <asp:Button ID="btnNewPartNumber" Width="45px" runat="server" Text="New" />
            </div>
        </th>
        <th class="camposSinBordes" style="vertical-align: top;">
            <asp:DropDownList ID="cboUM" runat="server" Width="70px">
                <asp:ListItem Selected="True"></asp:ListItem>
                <asp:ListItem Value="Each">Each</asp:ListItem>
            </asp:DropDownList>
        </th>
        <th class="camposSinBordes">
            <asp:TextBox ID="txtMaterial" runat="server" Width="161px" Height="40px" Rows="2"
                TextMode="MultiLine" Style="overflow-y: auto;"></asp:TextBox>
        </th>
        <th class="camposSinBordes">
            <asp:TextBox ID="txtDescription" runat="server" Width="160px" Height="40px" TextMode="MultiLine"
                Style="overflow-y: auto;"></asp:TextBox>
        </th>
        <th class="camposSinBordes" style="vertical-align: top;">
            <asp:TextBox ID="txtQuantity" validate="number" runat="server" Width="66px" Style="text-align: right">0</asp:TextBox>
        </th>
        <th class="camposSinBordes" style="vertical-align: top;">
            <asp:TextBox ID="txtCost" validate="number" runat="server" Width="60px" Style="text-align: right">0</asp:TextBox>
        </th>
        <th class="camposSinBordes">
            <div style="width: 70px;">
            </div>
        </th>
        <th class="camposSinBordes" style="vertical-align: top;">
            <asp:CheckBox ID="chkDirectedBuy" runat="server" Width="60px" />
        </th>
        <th class="camposSinBordes" style="vertical-align: top;">
            <asp:DropDownList ID="cboPurchasingStatus" runat="server" Width="90px">
                <asp:ListItem Selected="True"></asp:ListItem>
                <asp:ListItem Value="Q">Quote</asp:ListItem>
                <asp:ListItem Value="E">Estimate</asp:ListItem>
                <asp:ListItem Value="P">Pass Thru</asp:ListItem>
                <asp:ListItem Value="M">Manufacture</asp:ListItem>
                <asp:ListItem Value="Firm Requirement"></asp:ListItem>
            </asp:DropDownList>
        </th>
        <th class="camposSinBordes">
            <div style="width: 70px;">
            </div>
        </th>
        <th class="camposSinBordes" style="vertical-align: top;">
            <asp:Button ID="btnAdd" runat="server" Text="Add" OnClick="add_Click" />
        </th>
        <th class="camposSinBordes">
        </th>
    </tr>
</table>
<div align="left">
    <asp:Repeater ID="repeaterBOMDetail" runat="server" OnItemDataBound="R1_ItemDataBound">
        <HeaderTemplate>
            <table border="1" cellspacing="0" align="left">
        </HeaderTemplate>
        <ItemTemplate>
            <tr height='27px;'>
                <td width="154px">
                    <asp:LinkButton ID="updateByID" runat="server" CommandArgument="" OnCommand="updateByID">
                <%# DataBinder.Eval(Container.DataItem, "PartNumber")%>
                    </asp:LinkButton>
                </td>
                <td width="70px" align="center">
                    <%# DataBinder.Eval(Container.DataItem, "Um")%>
                </td>
                <td width="162px">
                    <%# DataBinder.Eval(Container.DataItem, "Material")%>
                </td>
                <td width="163px">
                    <%# DataBinder.Eval(Container.DataItem, "Description")%>
                </td>
                <td width="68px" align="right">
                    <%# DataBinder.Eval(Container.DataItem, "Qty")%>
                </td>
                <td width="62px" align="right">
                    <%# DataBinder.Eval(Container.DataItem, "Cost")%>
                </td>
                <td width="70px" align="center">
                    <%# DataBinder.Eval(Container.DataItem, "SalesStatus")%>
                </td>
                <td width="60px" align="center">
                    <%# DataBinder.Eval(Container.DataItem, "DirectedBuy")%>
                </td>
                <td width="90px" align="center">
                    <%# DataBinder.Eval(Container.DataItem, "PurchasingStatus")%>
                </td>
                <td width="70px" align="center">
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
</div>
<div id="divBOMDetailList" runat="server" align="center">
</div>
<asp:HiddenField ID="txtPrompt" runat="server" OnValueChanged="txtPrompt_ValueChanged" />
<asp:Panel ID="panelPopup" runat="server" Visible="false">
    <uc2:bomDetailEdit ID="uscBomDetailEdit" runat="server" OnOk_Click="on_edit_line"
        OnCancel_Click="on_cancelEdit_line" />

    <script type="text/javascript">
        document.getElementById("<%= this.panelPopup.ClientID %>").setAttribute("title", "BOM Line Edit");
        jQuery("#<%= this.panelPopup.ClientID %>").dialog({ autoOpen: true,
            appendTo: jQuery('form:first'),
            width: 420, modal: true,
            dialogClass: "no-close", closeOnEscape: false
        });
    </script>

</asp:Panel>
<uc1:Validator ID="Validator1" runat="server" />
