<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Commodity.ascx.cs" Inherits="CommodityControl" %>
<%@ Register Src="../Utils/Notifier/notifier.ascx" TagName="notifier" TagPrefix="uc1" %>
<style type="text/css">
    .style2
    {
        width: 390px;
    }
</style>
<table cellspacing="0" class="style2">
    <tr>
        <td align="left">
            <div style="display:inline; width: 390px;" align="right">
                <asp:DropDownList ID="cboCommodities" chosen="true" runat="server" Style="margin-left: 0px"
                    Width="250px" TabIndex="23" DataSourceID="SqlDataSource1" DataTextField="Commodity"
                    DataValueField="CommodityKey" Height="16px">
                </asp:DropDownList>
                <!-- ondatabound="cboCommodities_DataBound" onselectedindexchanged="cboCommodities_SelectedIndexChanged" -->
                <asp:Button ID="btnNewCommodity" runat="server" Text="New" Width="35px" TabIndex="28"
                    Style="padding: 0; height: 21px;" />
                <asp:Button ID="btnAdd" runat="server" Text="Add" Width="35px" TabIndex="28" OnClick="btnAdd_Click"
                    Style="padding: 0; height: 21px;" />
                <asp:Button ID="btnRemove" runat="server" Text="Remove" Width="55px" TabIndex="29"
                    OnClick="btnRemove_Click" Style="padding: 0; height: 21px;" />
            </div>
        </td>
    </tr>
    <tr>
        <td align="center">
            <asp:ListBox ID="lstItems" runat="server" Height="100px" Width="390px" TabIndex="30">
            </asp:ListBox>
        </td>
    </tr>
</table>
<uc1:notifier ID="uscNotifier" runat="server" OnPrompt="on_prompt" />
<asp:SqlDataSource ID="SqlDataSource1" runat="server" OnInit="on_sqldatasource_Init"
    SelectCommand="SELECT CommodityKey, CommodityCode, Commodity FROM CommodityMaster ORDER BY Commodity">
</asp:SqlDataSource>
