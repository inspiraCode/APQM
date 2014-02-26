<%@ Control Language="C#" AutoEventWireup="true" CodeFile="rfqDetailList.ascx.cs"
    Inherits="rfqDetailList" %>
<%@ Register Src="rfqDetailEdit.ascx" TagName="rfqDetailEdit" TagPrefix="uc1" %>
<style type="text/css">
    .camposSinBordes
    {
        border-top: 0px;
        border-bottom: 0px;
        border-right: 0px;
        border-left: 0px;
    }
</style>
<div align="right">
    <table border="1" cellspacing="0" width="1220px" align="center" class="camposSinBordes">
        <tr style="background-color: #D3D3D3">
            <th colspan="5">
                Raw Material And Purchased Components
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
                Burden Per Unit
            </th>
            <th colspan="2">
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
                Scrap Value %
            </th>
            <th width="70px">
                Scrap Cost
            </th>
            <th width="70px">
                Directly Hrly Labor Rate
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
            <th width="80px" colspan='2'>
            </th>
        </tr>
        <tr style="background-color: #DADADA">
            <th class="camposSinBordes" data-step='18' data-intro='Please indicate.'>
                <div style="width: 160px;">
                    <asp:TextBox validate="required" validationid="validatingRFQDetail" ID="txtPartNumber"
                        runat="server" Width="152px" TabIndex="9"></asp:TextBox>
                </div>
            </th>
            <th class="camposSinBordes" data-step='19' data-intro='Please indicate the unit of measure.'>
                <asp:DropDownList ID="cboUM" runat="server" chosen="true" Width="100px" 
                    TabIndex="10">
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
            <th class="camposSinBordes" data-step='20' data-intro='Quantity of material used.'>
                <asp:TextBox validate="number" validationid="validatingRFQDetail" 
                    ID="txtQuantity" onchange="calculateMaterialCost()" onkeyup="calculateMaterialCost()"
                    Style="text-align: right;" runat="server" Width="68px" TabIndex="11"></asp:TextBox>
            </th>
            <th class="camposSinBordes" data-step='21' data-intro='Material cost per unit of measure'>
                <asp:TextBox validate="number" validationid="validatingRFQDetail" 
                    ID="txtCostUnit" onchange="calculateMaterialCost()" onkeyup="calculateMaterialCost()"
                    Style="text-align: right;" runat="server" Width="70px" TabIndex="12"></asp:TextBox>
            </th>
            <th class="camposSinBordes calculatedField" data-step='22' data-intro='This is the material cost total (formulated cell not to be completed by Supplier).<br/>Formula:<br/>Quantity x Cost/Unit'>
                <asp:Label ID="lblMaterialTotal" runat="server" Width="70px">0.000</asp:Label>
            </th>
            <th class="camposSinBordes" data-step='23' data-intro='Outside services needed.'>
                <asp:TextBox validate="number" validationid="validatingRFQDetail" 
                    ID="txtOutsideServicesQuantity" onchange="calculateServiceTotal()" onkeyup="calculateServiceTotal()"
                    Style="text-align: right;" runat="server" Width="70px" TabIndex="13"></asp:TextBox>
            </th>
            <th class="camposSinBordes" data-step='24' data-intro='Cost of the outside service.'>
                <asp:TextBox validate="number" validationid="validatingRFQDetail" 
                    ID="txtOutsideServicesCostUnit" onchange="calculateServiceTotal()" onkeyup="calculateServiceTotal()"
                    Style="text-align: right;" runat="server" Width="70px" TabIndex="14"></asp:TextBox>
            </th>
            <th class="camposSinBordes calculatedField" data-step='25' data-intro='This is the outside service cost total (formulated cell not to be completed by Supplier).<br/>Formula:<br/>Quantity x Cost/Unit'>
                <asp:Label ID="lblServiceTotal" runat="server" Width="70px">0.000</asp:Label>
            </th>
            <th class="camposSinBordes" data-step='26' data-intro='Percentage of scrap.'>
                <asp:TextBox validate="number" validationid="validatingRFQDetail" 
                    ID="txtScrapValue" onchange="calculateScrap()" onkeyup="calculateScrap()"
                    Style="text-align: right;" runat="server" Width="70px" TabIndex="15"></asp:TextBox>
            </th>
            <th class="camposSinBordes calculatedField" data-step='27' data-intro='This is the scrap cost total (formulated cell not to be completed by Supplier).<br/>Formula:<br/>(Material Total + Service Total) x Scrap Value'>
                <asp:Label ID="lblScrapCost" runat="server" Width="70px">0.000</asp:Label>
            </th>
            <th class="camposSinBordes" data-step='28' data-intro='Enter directly labor rate.'>
                <asp:TextBox validate="number" validationid="validatingRFQDetail" 
                    ID="txtDirectHrlyLaborRate" onchange="calculateLaborCost()" onkeyup="calculateLaborCost()"
                    Style="text-align: right;" runat="server" Width="70px" TabIndex="16"></asp:TextBox>
            </th>
            <th class="camposSinBordes" data-step='29' data-intro='Enter the number of standards hours required per part.'>
                <asp:TextBox validate="number" validationid="validatingRFQDetail" 
                    ID="txtStdHrs" onchange="calculateLaborCost()" onkeyup="calculateLaborCost()"
                    Style="text-align: right;" runat="server" Width="70px" TabIndex="17"></asp:TextBox>
            </th>
            <th class="camposSinBordes calculatedField" data-step='30' data-intro='This is the labor cost total (formulated cell not to be completed by Supplier).<br/>Formula:<br/>Directly Hrly Labor Rate x Std Hrs.'
                data-position='left'>
                <asp:Label ID="lblLaborCost" runat="server" Width="70px">0.000</asp:Label>
            </th>
            <th class="camposSinBordes" data-step='31' data-intro='Enter your total burden cost per unit.'
                data-position='left'>
                <asp:TextBox validate="number" validationid="validatingRFQDetail" 
                    ID="txtBurden" onchange="calculateBurdenTotal()" onkeyup="calculateBurdenTotal()"
                    runat="server" Style="text-align: right;" Width="70px" TabIndex="18"></asp:TextBox>
            </th>
            <th class="camposSinBordes calculatedField" data-step='32' data-intro='This is the burden cost total (formulated cell not to be completed  by Supplier).<br/>Formula:<br/>=Burden'
                data-position='left'>
                <asp:Label ID="lblBurdenTotal" runat="server" Width="50px">0.000</asp:Label>
            </th>
            <th class="camposSinBordes" colspan='2'
                data-position='left'>
                <asp:Button style="position:absolute;left:5px;top:828px;padding:1px;" ID="btnAdd" validationid="validatingRFQDetail" runat="server" Text="Add"  data-step='17' data-intro='If your information in this line is correct, press this button to add it to the list.'
                    OnClick="add_Click" Width="35px" TabIndex="19" 
                    OnClientClick="return validate();" />
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
                        <td width="72px" style="text-align: right;" >
                            <%# DataBinder.Eval(Container.DataItem, "ServiceTotal")%>
                        </td>
                        <td width="76px" style="text-align: right;">
                            <%# DataBinder.Eval(Container.DataItem, "ScrapValue")%>
                        </td>
                        <td width="72px" style="text-align: right;" >
                            <%# DataBinder.Eval(Container.DataItem, "ScrapCost")%>
                        </td>
                        <td width="76px" style="text-align: right;">
                            <%# DataBinder.Eval(Container.DataItem, "DirectHrlyLaborRate")%>
                        </td>
                        <td width="76px" style="text-align: right;">
                            <%# DataBinder.Eval(Container.DataItem, "StdHrs")%>
                        </td>
                        <td width="72px" style="text-align: right;" >
                            <%# DataBinder.Eval(Container.DataItem, "LaborCost")%>
                        </td>
                        <td width="76px" style="text-align: right;">
                            <%# DataBinder.Eval(Container.DataItem, "Burden")%>
                        </td>
                        <td width="53px" style="text-align: right;" >
                            <%# DataBinder.Eval(Container.DataItem, "BurdenTotal")%>
                        </td>
                        <td width="52px">
                            <asp:LinkButton ID="updateByID" runat="server" CommandArgument="" OnCommand="updateByID"
                                OnClientClick="return setSrcElementForEditForm();">
                            Edit
                            </asp:LinkButton>
                        </td>
                        <td width="52px">
                            <asp:LinkButton ID="deleteByID" runat="server" CommandArgument="" OnCommand="deleteByID"
                                OnClientClick="return  confirm('Do you wish to delete this line item of RFQ?')">
                            Delete
                            </asp:LinkButton>
                        </td>
                    </tr>
                </ItemTemplate>
            </asp:Repeater>
            <tr>
                <td colspan="17" class="camposSinBordes">
                    <div style="border: solid; border-color: #4682B4; border-width: 2px; margin-bottom: -2px;">
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
                <td class="camposSinBordes calculatedField" style="text-align: right;">
                    <asp:Label ID="lblTotalMaterial" runat="server">0</asp:Label>
                </td>
                <td class="camposSinBordes">
                </td>
                <td class="camposSinBordes">
                </td>
                <td class="camposSinBordes calculatedField" style="text-align: right;">
                    <asp:Label ID="lblTotalService" runat="server">0</asp:Label>
                </td>
                <td class="camposSinBordes">
                </td>
                <td class="camposSinBordes calculatedField" style="text-align: right;">
                    <asp:Label ID="lblTotalScrap" runat="server">0</asp:Label>
                </td>
                <td class="camposSinBordes">
                </td>
                <td class="camposSinBordes">
                </td>
                <td class="camposSinBordes calculatedField" style="text-align: right;">
                    <asp:Label ID="lblTotalLabor" runat="server">0</asp:Label>
                </td>
                <td class="camposSinBordes">
                </td>
                <td class="camposSinBordes calculatedField" style="text-align: right;">
                    <asp:Label ID="lblTotalBurden" runat="server">0</asp:Label>
                </td>
                <td class="camposSinBordes" colspan="2">
                </td>
            </tr>
    </table>
</div>
<br />
<asp:HiddenField ID="hiddenEditFormTopPosition" runat="server" />
<asp:HiddenField ID="hiddenEditFormLeftPosition" runat="server" />

<script type="text/javascript">
    function setSrcElementForEditForm() {
        var src = event.srcElement;
        jQuery("#<%= hiddenEditFormTopPosition.ClientID %>").val(src.id);
        return true;
    }    
    function calculateMaterialCost() {
        var qty = Number(jQuery("#<%= txtQuantity.ClientID %>").val());
        var costUnit = Number(jQuery("#<%= txtCostUnit.ClientID %>").val());
        jQuery("#<%= lblMaterialTotal.ClientID %>").text((qty * costUnit).toFixed(3));
        calculateScrap();
    }
    function calculateServiceTotal() {
        var qty = Number(jQuery("#<%= txtOutsideServicesQuantity.ClientID %>").val());
        var costUnit = Number(jQuery("#<%= txtOutsideServicesCostUnit.ClientID %>").val());
        jQuery("#<%= lblServiceTotal.ClientID %>").text((qty * costUnit).toFixed(3));
        calculateScrap();
    }
    function calculateScrap() {
        var materialTotal = Number(jQuery("#<%= lblMaterialTotal.ClientID %>").text()); 
        var serviceTotal = Number(jQuery("#<%= lblServiceTotal.ClientID %>").text()); 
        var scrap = Number(jQuery("#<%= txtScrapValue.ClientID %>").val());
        jQuery("#<%= lblScrapCost.ClientID %>").text((((materialTotal + serviceTotal) * scrap / 100)).toFixed(3));
    }
    function calculateLaborCost() {
        var directlyHrlyLaborRate = Number(jQuery("#<%= txtDirectHrlyLaborRate.ClientID %>").val());
        var stdHrs = Number(jQuery("#<%= txtStdHrs.ClientID %>").val());
        jQuery("#<%= lblLaborCost.ClientID %>").text((directlyHrlyLaborRate * stdHrs).toFixed(3));
    }
    function calculateBurdenTotal() {
        var burden = Number(jQuery("#<%= txtBurden.ClientID %>").val());
        jQuery("#<%= lblBurdenTotal.ClientID %>").text(burden.toFixed(3));
    }
</script>

<asp:Panel ID="panelPopup" runat="server" Visible="false" Style="padding: 1px; overflow: hidden;">
    <uc1:rfqDetailEdit ID="uscRfqDetailEdit" runat="server" OnOk_Click="on_edit_line"
        OnCancel_Click="on_cancelEdit_line" />

    <script type="text/javascript">
        jQuery(document).ready(function() {
            document.getElementById("<%= this.panelPopup.ClientID %>").setAttribute("title", "RFQ Line Edit");
            jQuery("#<%= this.panelPopup.ClientID %>").dialog({ autoOpen: true,
                appendTo: jQuery('form:first'),
                width: 1280, height: 60, modal: true,
                dialogClass: "no-close", closeOnEscape: false
            });

            jQuery(".ui-dialog-titlebar").hide();
            jQuery("[role = dialog]").css('overflow', 'hidden').hide();
            setTimeout("setEditFormPosition()", 50);

        });


        function setEditFormPosition() {
            var id = jQuery("#<%= hiddenEditFormTopPosition.ClientID %>").val();
            var src = jQuery("#" + id);
            var top = src.parent().parent().position().top;
            var left = src.parent().parent().position().left - 2;
            jQuery("[role = dialog]").css("top", top).css("left", left).show();
            
        }

        jQuery(window).resize(function() {
            setEditFormPosition();
        });
    </script>

</asp:Panel>
