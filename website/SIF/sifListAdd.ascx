﻿<%@ Control Language="C#" AutoEventWireup="true" CodeFile="sifListAdd.ascx.cs" Inherits="SIF_sifListAdd" %>
<style type="text/css">
    .camposSinBordes
    {
        border-top: 0px;
        border-bottom: 0px;
        border-right: 0px;
        border-left: 0px;
    }
</style>
<asp:HiddenField ID="hiddenSIFHeaderKey" runat="server" />
<div align="center">
    
    <table border="1" cellspacing="0" align="center" class="camposSinBordes" style="width: 651px">
        <tr>
            <th width="162px" align="center">
                Program Year
            </th>
            <th width="51px" align="center">
                Proyected Annual Volume
            </th>
            <th width="70px" align="center">
                % of Volume per Award
            </th>
            <th width="70px" align="center">
                Proyected / Target Price
            </th>
            <th width="70px" align="center">
                Annual Revenue
            </th>
            <th width="80px">
            </th>
        </tr>
        <tr style="background-color: #DADADA">
            <th class="camposSinBordes">
                <div style="width: 160px;">
                    <asp:TextBox validate="required" validationid="validatingSIFDetail" ID="txtProgramYear" style="text-align: center;"
                        runat="server" Width="90px" ></asp:TextBox>
                </div>
            </th>
            <th class="camposSinBordes">
                <asp:TextBox validate="number" validationid="validatingSIFDetail" ID="txtProjectedAnnualVolume" style="text-align: right;"
                    runat="server" Width="90px"></asp:TextBox>
            </th>
            <th class="camposSinBordes">
                <asp:TextBox validate="number" validationid="validatingSIFDetail" ID="txtPorcentageVolumePerAward" style="text-align: right;"
                    runat="server" Width="90px" ></asp:TextBox>
            </th>
            <th class="camposSinBordes">
                <asp:TextBox validate="number" validationid="validatingSIFDetail" ID="txtProjectedTargetPrice" style="text-align: right;"
                    runat="server" Width="90px" ></asp:TextBox>
            </th>
            <th class="camposSinBordes">
                <asp:TextBox validate="number" validationid="validatingSIFDetail" ID="txtAnnualRevenue" style="text-align: right;"
                    runat="server" Width="90px" ></asp:TextBox>
            </th>
            <th class="camposSinBordes">
                <asp:Button ID="btnAdd" validationid="validatingSIFDetail" runat="server" Text="Add" style="text-align: right;"
                    OnClick="add_Click" Width="50px"  />
            </th>
        </tr>
        <%--OnClientClick="return validate();"--%>
        <asp:Repeater ID="repeaterSIFDetail" runat="server" OnItemDataBound="R1_ItemDataBound">
            <ItemTemplate>
                <tr height='27px;'>
                    <td width="162px" style="text-align:center">
                        <%# DataBinder.Eval(Container.DataItem, "ProgramYear")%>
                    </td>
                    <td width="51px" style="text-align:right;">
                        <%# DataBinder.Eval(Container.DataItem, "ProjectedAnnualVolume")%>
                    </td>
                    <td width="74px" style="text-align: right;">
                        <%# DataBinder.Eval(Container.DataItem, "PercentVolumePerAward")%>
                    </td>
                    <td width="76px" style="text-align: right;">
                        <%# DataBinder.Eval(Container.DataItem, "ProjectedTargetPrice")%>
                    </td>
                    <td width="72px" style="text-align: right;">
                        <%# DataBinder.Eval(Container.DataItem, "AnnualRevenue")%>
                    </td>
                    <td width="52px" style="text-align:center">
                        <asp:LinkButton ID="deleteByID" runat="server" CommandArgument="" OnCommand="deleteByID"
                            OnClientClick="return  confirm('Do you wish to delete this line item of SIF?')">
                            Delete
                        </asp:LinkButton>
                    </td>
                </tr>
            </ItemTemplate>
        </asp:Repeater>
    </table>
</div>