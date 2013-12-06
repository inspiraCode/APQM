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
<div align="center">
    <table border="1" cellspacing="0" width="1220px" align="center" class="camposSinBordes">
        <tr style="background-color:#D3D3D3">
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
                                Service Total</th>
            <th width="70px">
                Scrap Value
                %</th>
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
        <tr style="background-color:#DADADA">
            <th class="camposSinBordes" data-step='27' data-intro='Please indicate the type of material.'>
                <div style="width: 160px;">
                    <asp:TextBox validate="required" validationid="validatingRFQDetail" ID="txtPartNumber"
                        runat="server" Width="152px" TabIndex="10"></asp:TextBox>
                </div>
            </th>
            <th class="camposSinBordes" data-step='28' data-intro='Please indicate the unit of measure.'>
                <asp:DropDownList ID="cboUM" runat="server" chosen="true" Width="100px" 
                    TabIndex="11">
                    <asp:ListItem Value="Each">Each</asp:ListItem>
                    <asp:ListItem Value="Kg">Kg</asp:ListItem>
                    <asp:ListItem Value="Lb">Lb</asp:ListItem>
                </asp:DropDownList>
            </th>
            <th class="camposSinBordes" data-step='29' data-intro='Quantity of material used.'>
                <asp:TextBox validate="number" validationid="validatingRFQDetail" ID="txtQuantity"
                    Style="text-align: right;" runat="server" Width="68px" TabIndex="12"></asp:TextBox>
            </th>
            <th class="camposSinBordes" data-step='30' data-intro='Material cost per unit of measure'>
                <asp:TextBox validate="number" validationid="validatingRFQDetail" ID="txtCostUnit"
                    Style="text-align: right;" runat="server" Width="70px" TabIndex="13"></asp:TextBox>
            </th>
            <th class="camposSinBordes" data-step='31' data-intro='This is the material cost total (formulated cell not to be completed by Supplier).<br/>Formula:<br/>Quantity x Cost/Unit'>
                <asp:Label ID="Label1" runat="server" Width="70px"></asp:Label>
            </th>
            <th class="camposSinBordes" data-step='32' data-intro='Enter the quantity of outside service.'>
                <asp:TextBox validate="number" validationid="validatingRFQDetail" ID="txtOutsideServicesQuantity"
                    Style="text-align: right;" runat="server" Width="70px" TabIndex="14"></asp:TextBox>
            </th>
            <th class="camposSinBordes" data-step='33' data-intro='Cost of the outside service.'>
                <asp:TextBox validate="number" validationid="validatingRFQDetail" ID="txtOutsideServicesCostUnit"
                    Style="text-align: right;" runat="server" Width="70px" TabIndex="15"></asp:TextBox>
            </th>
            <th class="camposSinBordes" data-step='34' data-intro='This is the outside service cost total (formulated cell not to be completed by Supplier).<br/>Formula:<br/>Quantity x Cost/Unit'>
                <asp:Label ID="Label2" runat="server" Width="70px"></asp:Label>
            </th>
            <th class="camposSinBordes" data-step='35' data-intro='Percentage of scrap. i.e. if it is 12%, enter .12'>
                <asp:TextBox validate="number" validationid="validatingRFQDetail" ID="txtScrapValue"
                    Style="text-align: right;" runat="server" Width="70px" TabIndex="16"></asp:TextBox>
            </th>
            <th class="camposSinBordes" data-step='36' data-intro='This is the scrap cost total (formulated cell not to be completed by Supplier).<br/>Formula:<br/>(Material Total + Service Total) x Scrap Value'>
                <asp:Label ID="Label3" runat="server" Width="70px"></asp:Label>
            </th>
            <th class="camposSinBordes" data-step='37' data-intro='Enter directly labor rate.'>
                <asp:TextBox validate="number" validationid="validatingRFQDetail" ID="txtDirectHrlyLaborRate"
                    Style="text-align: right;" runat="server" Width="70px" TabIndex="17"></asp:TextBox>
            </th>
            <th class="camposSinBordes" data-step='38' data-intro='Enter the number of standards hours required per part.'>
                <asp:TextBox validate="number" validationid="validatingRFQDetail" ID="txtStdHrs"
                    Style="text-align: right;" runat="server" Width="70px" TabIndex="18"></asp:TextBox>
            </th>
            <th class="camposSinBordes" data-step='39' data-intro='This is the labor cost total (formulated cell not to be completed by Supplier).<br/>Formula:<br/>Directly Hrly Labor Rate x Std Hrs.' data-position='left'>
                <asp:Label ID="Label4" runat="server" Width="70px"></asp:Label>
            </th>
            <th class="camposSinBordes" data-step='40' data-intro='Enter your total burden cost per unit.' data-position='left'>
                <asp:TextBox validate="number" validationid="validatingRFQDetail" ID="txtBurden"
                    runat="server" Style="text-align: right;" Width="70px" TabIndex="19"></asp:TextBox>
            </th>
            <th class="camposSinBordes" data-step='41' data-intro='This is the burden cost total (formulated cell not to be completed  by Supplier).<br/>Formula:<br/>=Burden' data-position='left'>
                <asp:Label ID="Label5" runat="server" Width="50px"></asp:Label>
            </th>
            <th class="camposSinBordes" data-step='42' data-intro='If your information in this line is correct, press this button to add it to the list.' data-position='left'>
                <asp:Button ID="btnAdd" validationid="validatingRFQDetail" runat="server" Text="Add"
                    OnClick="add_Click" Width="50px" TabIndex="20" OnClientClick="return validate();" />
            </th>
        </tr>
        <div align="center">
            <%--<div align="center" style="height: 150px;min-height:150px;max-height:150px; overflow-y: auto;">--%>
            <asp:Repeater ID="repeaterRFQDetail" runat="server" OnItemDataBound="R1_ItemDataBound">
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
            </asp:Repeater>
            <tr>
                <td colspan="16" class="camposSinBordes">
                    <div style="border: solid; border-color: silver; border-width: 2px; margin-bottom: -2px;">
                    </div>
                </td>
            </tr>
            <tr>
                <td class="camposSinBordes">
                </td>
                <td class="camposSinBordes">
                </td>
                <td class="camposSinBordes">
                </td>
                <td class="camposSinBordes">
                </td>
                <td class="camposSinBordes" style="background-color: Silver;text-align: right;">
                    <asp:Label ID="lblTotalMaterial" runat="server">0</asp:Label>
                </td>
                <td class="camposSinBordes">
                </td>
                <td class="camposSinBordes">
                </td>
                <td class="camposSinBordes" style="background-color: Silver;text-align: right;">
                    <asp:Label ID="lblTotalService" runat="server">0</asp:Label>
                </td>
                <td class="camposSinBordes">
                </td>
                <td class="camposSinBordes" style="background-color: Silver;text-align: right;">
                    <asp:Label ID="lblTotalScrap" runat="server">0</asp:Label>
                </td>
                <td class="camposSinBordes">
                </td>
                <td class="camposSinBordes">
                </td>
                <td class="camposSinBordes" style="background-color: Silver;text-align: right;">
                    <asp:Label ID="lblTotalLabor" runat="server">0</asp:Label>
                </td>
                <td class="camposSinBordes">
                </td>
                <td class="camposSinBordes" style="background-color: Silver;text-align: right;">
                    <asp:Label ID="lblTotalBurden" runat="server">0</asp:Label>
                </td>
                <td class="camposSinBordes">
                </td>
            </tr>
    </table>
</div>
<br />
