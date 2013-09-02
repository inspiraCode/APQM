<%@ Control Language="C#" AutoEventWireup="true" CodeFile="rfqDetailList.ascx.cs"
    Inherits="rfqDetailList" %>
    <style type="text/css">
        .camposSinBordes
        {
            border-top:0px;
            border-bottom:0px;
            border-right:0px;
            border-left:0px;
        }        
    </style>
    <div style="min-width:1200px;max-width:1200px;" align="center">
    
    <table border="1" cellspacing="0" width="100%" align="center" class="camposSinBordes" >
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
        <th width="180px">
            Item Description
        </th>
        <th width="50px">
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
        <th class="camposSinBordes" >
            <asp:TextBox ID="txtItemDescription" runat="server" width="160px"></asp:TextBox>
        </th>
        <th class="camposSinBordes" >
            <asp:TextBox ID="txtUOM" runat="server" width="45px"></asp:TextBox>
        </th>
        <th class="camposSinBordes" >
            <asp:TextBox ID="txtQuantity" runat="server" width="68px"></asp:TextBox>
        </th>
        <th class="camposSinBordes" >
            <asp:TextBox ID="txtCostUnit" runat="server" width="70px"></asp:TextBox>
        </th>
        <th class="camposSinBordes" >
            <asp:Label ID="Label1" runat="server" width="70px"></asp:Label>
        </th>
        <th class="camposSinBordes" >
            <asp:TextBox ID="txtOutsideServicesQuantity" runat="server" width="70px"></asp:TextBox>
        </th>
        <th class="camposSinBordes" >
            <asp:TextBox ID="txtOutsideServicesCostUnit" runat="server" width="70px"></asp:TextBox>
        </th>
        <th class="camposSinBordes" >
            <asp:Label ID="Label2" runat="server" width="70px"></asp:Label>
        </th>
        <th class="camposSinBordes" >
            <asp:TextBox ID="txtScrapValue" runat="server" width="70px"></asp:TextBox>
        </th>
        <th class="camposSinBordes" >
            <asp:Label ID="Label3" runat="server" width="70px"></asp:Label>
        </th>
        <th class="camposSinBordes" >
            <asp:TextBox ID="txtDirectHrlyLaborRate" runat="server" width="70px"></asp:TextBox>
        </th>
        <th class="camposSinBordes" >
            <asp:TextBox ID="txtStdHrs" runat="server" width="70px"></asp:TextBox>
        </th>
        <th class="camposSinBordes" >
            <asp:Label ID="Label4" runat="server" width="70px"></asp:Label>
        </th>
        <th class="camposSinBordes" >
            <asp:TextBox ID="txtBurden" runat="server" width="70px"></asp:TextBox>
        </th>
        <th class="camposSinBordes" >
            <asp:Label ID="Label5" runat="server" width="70px"></asp:Label>
        </th>
        <th class="camposSinBordes" >
            <asp:Button ID="btnAdd" runat="server" Text="Add" OnClick="add_Click" width="40px" />
        </th>
    </tr>
</table>

<div align="center" style="height: 150px;min-height:150px;max-height:150px; overflow-y: auto;">
    <asp:Repeater ID="Repeater1" runat="server" OnItemDataBound="R1_ItemDataBound">
        <HeaderTemplate>
            <table border="1" cellspacing="1" width="100%">
        </HeaderTemplate>
        <ItemTemplate>
            <tr height='40px;'>
                <td>
                    <asp:LinkButton ID="updateByID" runat="server" CommandArgument="" OnCommand="updateByID">
                    <%# DataBinder.Eval(Container.DataItem, "ItemMasterKey")%>
                    </asp:LinkButton>
                </td>
                <td>
                    <%# DataBinder.Eval(Container.DataItem, "UOM")%>
                </td>
                <td>
                    <%# DataBinder.Eval(Container.DataItem, "Quantity")%>
                </td>
                <td>
                    <%# DataBinder.Eval(Container.DataItem, "CostUnit")%>
                </td>
                <td>
                    <%# DataBinder.Eval(Container.DataItem, "MaterialTotal")%>
                </td>
                <td>
                    <%# DataBinder.Eval(Container.DataItem, "OutsideServicesQuantity")%>
                </td>
                <td>
                    <%# DataBinder.Eval(Container.DataItem, "OutsideServicesCostUnit")%>
                </td>
                <td>
                    <%# DataBinder.Eval(Container.DataItem, "ServiceTotal")%>
                </td>
                <td>
                    <%# DataBinder.Eval(Container.DataItem, "ScrapValue")%>
                </td>
                <td>
                    <%# DataBinder.Eval(Container.DataItem, "ScrapCost")%>
                </td>
                <td>
                    <%# DataBinder.Eval(Container.DataItem, "DirectHrlyLaborRate")%>
                </td>
                <td>
                    <%# DataBinder.Eval(Container.DataItem, "StdHrs")%>
                </td>
                <td>
                    <%# DataBinder.Eval(Container.DataItem, "LabroCost")%>
                </td>
                <td>
                    <%# DataBinder.Eval(Container.DataItem, "Burden")%>
                </td>
                <td>
                    <%# DataBinder.Eval(Container.DataItem, "TotalBurden")%>
                </td>
                <td>
                    <asp:LinkButton ID="deleteByID" runat="server" CommandArgument="" OnCommand="deleteByID"
                        OnClientClick="return  confirm('Do you wish to delete this BOM Line?')">
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
    
    </div>

<div id="divBOMDetailList" runat="server" align="center">
</div>
