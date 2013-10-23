<%@ Control Language="C#" AutoEventWireup="true" CodeFile="rfqDetailList.ascx.cs"
    Inherits="rfqDetailList" %>
<style type="text/css">
    .camposSinBordes
    {
        border-top: 0px;
        border-bottom: 0px;
        border-right: 0px;
        border-left: 0px;
    }
</style>
<div style="min-width: 1220px; max-width: 1200px;" align="center">
    <table border="1" cellspacing="0" width="1220px" align="center" class="camposSinBordes">
        <tr>
            <th colspan="5">
                Raw Material and Purchased Components
            </th>
            <th colspan="3">
                Outside Services
            </th>
            <th colspan="2">
                Scrap
            </th>
            <th colspan="3">
                Labor
            </th>
            <th colspan="2">
                Burden per Unit
            </th>
            <th>
            </th>
        </tr>
        <tr>
            <th width="162px">
                Item Description
            </th>
            <th width="51px">
                UOM
            </th>
            <th width="70px">
                Quantity
            </th>
            <th width="70px">
                Cost/Unit
            </th>
            <th width="70px">
                Material Total
            </th>
            <th width="70px">
                Quantity
            </th>
            <th width="70px">
                Cost/Unit
            </th>
            <th width="70px">
                Service Total
            </th>
            <th width="70px">
                Scrap Value
            </th>
            <th width="70px">
                Scrap Cost
            </th>
            <th width="70px">
                Directly Hrly Labor rate
            </th>
            <th width="70px">
                Std Hrs.
            </th>
            <th width="70px">
                Labor Cost
            </th>
            <th width="70px">
                Burden
            </th>
            <th width="70px">
                Total Burden
            </th>
            <th width="70px">
            </th>
        </tr>
        <tr>
            <th class="camposSinBordes">
                <div style="width: 160px;">
                    <asp:TextBox validate="required" validationid="validatingRFQDetail" ID="txtPartNumber" runat="server" Width="152px"
                        TabIndex="9"></asp:TextBox>
                </div>
            </th>
            <th class="camposSinBordes">
                <asp:TextBox ID="txtUOM" runat="server" Width="45px" TabIndex="11"></asp:TextBox>
            </th>
            <th class="camposSinBordes">
                <asp:TextBox validate="number" validationid="validatingRFQDetail" ID="txtQuantity" Style="text-align: right;" runat="server"
                    Width="68px" TabIndex="12"></asp:TextBox>
            </th>
            <th class="camposSinBordes">
                <asp:TextBox validate="number" validationid="validatingRFQDetail" ID="txtCostUnit" Style="text-align: right;" runat="server"
                    Width="70px" TabIndex="13"></asp:TextBox>
            </th>
            <th class="camposSinBordes">
                <asp:Label ID="Label1" runat="server" Width="70px"></asp:Label>
            </th>
            <th class="camposSinBordes">
                <asp:TextBox validate="number" validationid="validatingRFQDetail" ID="txtOutsideServicesQuantity" Style="text-align: right;"
                    runat="server" Width="70px" TabIndex="14"></asp:TextBox>
            </th>
            <th class="camposSinBordes">
                <asp:TextBox validate="number" validationid="validatingRFQDetail" ID="txtOutsideServicesCostUnit" Style="text-align: right;"
                    runat="server" Width="70px" TabIndex="15"></asp:TextBox>
            </th>
            <th class="camposSinBordes">
                <asp:Label ID="Label2" runat="server" Width="70px"></asp:Label>
            </th>
            <th class="camposSinBordes">
                <asp:TextBox validate="number" validationid="validatingRFQDetail" ID="txtScrapValue" Style="text-align: right;" runat="server"
                    Width="70px" TabIndex="16"></asp:TextBox>
            </th>
            <th class="camposSinBordes">
                <asp:Label ID="Label3" runat="server" Width="70px"></asp:Label>
            </th>
            <th class="camposSinBordes">
                <asp:TextBox validate="number" validationid="validatingRFQDetail" ID="txtDirectHrlyLaborRate" Style="text-align: right;"
                    runat="server" Width="70px" TabIndex="17"></asp:TextBox>
            </th>
            <th class="camposSinBordes">
                <asp:TextBox validate="number" validationid="validatingRFQDetail" ID="txtStdHrs" Style="text-align: right;" runat="server"
                    Width="70px" TabIndex="18"></asp:TextBox>
            </th>
            <th class="camposSinBordes">
                <asp:Label ID="Label4" runat="server" Width="70px"></asp:Label>
            </th>
            <th class="camposSinBordes">
                <asp:TextBox validate="number" validationid="validatingRFQDetail" ID="txtBurden" runat="server" Style="text-align: right;"
                    Width="70px" TabIndex="19"></asp:TextBox>
            </th>
            <th class="camposSinBordes">
                <asp:Label ID="Label5" runat="server" Width="50px"></asp:Label>
            </th>
            <th class="camposSinBordes">
                <asp:Button ID="btnAdd" validationid="validatingRFQDetail" runat="server" Text="Add" OnClick="add_Click" Width="50px"
                    TabIndex="20" OnClientClick="return validate();" />
            </th>
        </tr>
    </table>
    <div align="center">
        <%--<div align="center" style="height: 150px;min-height:150px;max-height:150px; overflow-y: auto;">--%>
        <asp:Repeater ID="repeaterRFQDetail" runat="server" OnItemDataBound="R1_ItemDataBound">
            <HeaderTemplate>
                <table border="1" cellspacing="0" width="100%">
            </HeaderTemplate>
            <ItemTemplate>
                <tr height='27px;'>
                    <td width="162px">
                        <%# DataBinder.Eval(Container.DataItem, "ItemDescription")%>
                    </td>
                    <td width="51px">
                        <%# DataBinder.Eval(Container.DataItem, "Um")%>
                    </td>
                    <td width="74px" style="text-align: right;">
                        <%# DataBinder.Eval(Container.DataItem, "RpcQty")%>
                    </td>
                    <td width="76px" style="text-align: right;">
                        <%# DataBinder.Eval(Container.DataItem, "RpcCostPerUnit")%>
                    </td>
                    <td width="72px" style="text-align: right;">
                        <%# DataBinder.Eval(Container.DataItem, "MaterialTotal")%>
                    </td>
                    <td width="76px" style="text-align: right;">
                        <%# DataBinder.Eval(Container.DataItem, "OSQty")%>
                    </td>
                    <td width="76px" style="text-align: right;">
                        <%# DataBinder.Eval(Container.DataItem, "OSCostPerUnit")%>
                    </td>
                    <td width="72px" style="text-align: right;">
                        <%# DataBinder.Eval(Container.DataItem, "ServiceTotal")%>
                    </td>
                    <td width="76px" style="text-align: right;">
                        <%# DataBinder.Eval(Container.DataItem, "ScrapValue")%>
                    </td>
                    <td width="72px" style="text-align: right;">
                        <%# DataBinder.Eval(Container.DataItem, "ScrapCost")%>
                    </td>
                    <td width="76px" style="text-align: right;">
                        <%# DataBinder.Eval(Container.DataItem, "DirectHrlyLaborRate")%>
                    </td>
                    <td width="76px" style="text-align: right;">
                        <%# DataBinder.Eval(Container.DataItem, "StdHrs")%>
                    </td>
                    <td width="72px" style="text-align: right;">
                        <%# DataBinder.Eval(Container.DataItem, "LaborCost")%>
                    </td>
                    <td width="76px" style="text-align: right;">
                        <%# DataBinder.Eval(Container.DataItem, "Burden")%>
                    </td>
                    <td width="53px" style="text-align: right;">
                        <%# DataBinder.Eval(Container.DataItem, "BurdenTotal")%>
                    </td>
                    <td width="52px">
                        <asp:LinkButton ID="deleteByID" runat="server" CommandArgument="" OnCommand="deleteByID"
                            OnClientClick="return  confirm('Do you wish to delete this RFQ Line?')">
                            Delete
                        </asp:LinkButton>
                    </td>
                </tr>
            </ItemTemplate>
            <FooterTemplate>
                </table>
            </FooterTemplate>
        </asp:Repeater>
        <div style="border: solid; border-color: silver; border-width: 2px; margin-bottom: -2px;">
        </div>
        <table border="1" cellspacing="0" width="1220px" height="20px" align="center" class="camposSinBordes">
            <tr>
                <td class="camposSinBordes" width="365px">
                </td>
                <td class="camposSinBordes">
                    <asp:Label ID="lblTotalMaterial" Style="text-align: right" runat="server" Width="74px"
                        BackColor="Silver">0</asp:Label>
                </td>
                <td class="camposSinBordes" width="150px">
                </td>
                <td class="camposSinBordes">
                    <asp:Label ID="lblTotalService" Style="text-align: right" runat="server" Width="72px"
                        BackColor="Silver">0</asp:Label>
                </td>
                <td class="camposSinBordes" width="70px">
                </td>
                <td class="camposSinBordes">
                    <asp:Label ID="lblTotalScrap" Style="text-align: right" runat="server" Width="77px"
                        BackColor="Silver">0</asp:Label>
                </td>
                <td class="camposSinBordes" width="147px">
                </td>
                <td class="camposSinBordes">
                    <asp:Label ID="lblTotalLabor" Style="text-align: right" runat="server" Width="76px"
                        BackColor="Silver">0</asp:Label>
                </td>
                <td class="camposSinBordes" width="71x">
                </td>
                <td class="camposSinBordes">
                    <asp:Label ID="lblTotalBurden" Style="text-align: right" runat="server" Width="57px"
                        BackColor="Silver">0</asp:Label>
                </td>
                <td class="camposSinBordes" width="52px">
                </td>
            </tr>
        </table>
    </div>
</div>
<br />
