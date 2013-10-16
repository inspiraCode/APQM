<%@ Control Language="C#" AutoEventWireup="true" CodeFile="bomDetailList.ascx.cs"
    Inherits="bomDetailList" %>
<style type="text/css">
    .camposSinBordes
    {
        border-top: 0px;
        border-bottom: 0px;
        border-right: 0px;
        border-left: 0px;
    }
</style>
<table border="2" cellspacing="1" width="100%" align="center" class="camposSinBordes">
    <tr>
        <th class="camposSinBordes" width="100px">
            Part Number
        </th>
        <th class="camposSinBordes" width="200px">
            Material / Assembly Description
        </th>
        <th class="camposSinBordes" width="200px">
            Description
        </th>        
        <th class="camposSinBordes" width="100px">
            Quantity
        </th>
        <th class="camposSinBordes" width= "100px">
            Cost
        </th>
        <th class="camposSinBordes" width= "100px">
            Sales Status
        </th>
        <th class="camposSinBordes" width="80px">
            Purchasing Status
        </th>
        <th style="border-color: Gray;" width="80px" class="camposSinBordes">
        </th>
    </tr>
    <tr>
        <th class="camposSinBordes">
            <div style="width: 160px;">
                <asp:DropDownList ID="cboPartNumber" Width="100px" runat="server" AutoPostBack="True"
                    OnSelectedIndexChanged="cboPartNumber_SelectedIndexChanged">
                </asp:DropDownList>
                <asp:Button ID="btnNewPartNumber" runat="server" Text="New" />
            </div>
        </th>
        <th class="camposSinBordes">
            <asp:TextBox ID="txtMaterial" runat="server" Width="198px"></asp:TextBox>
        </th>
        <th class="camposSinBordes">
            <asp:TextBox ID="txtDescription" runat="server" Width="198px"></asp:TextBox>
        </th>
        <th class="camposSinBordes">
            <asp:TextBox ID="txtQuantity" runat="server" Width="96px"></asp:TextBox>
        </th>
        <th class="camposSinBordes">
            <asp:TextBox ID="txtCost" runat="server" Width="96px"></asp:TextBox>
        </th>
        <th class="camposSinBordes">
            <asp:TextBox ID="txtStatus" runat="server" Width="96px"></asp:TextBox>
        </th>
        <th class="camposSinBordes">
            Purchasing Status
        </th>
        <th class="camposSinBordes">
            <asp:Button ID="btnAdd" runat="server" Text="Add" OnClick="add_Click" />
        </th>
        <th class="camposSinBordes">
        </th>
    </tr>
</table>
<div class="mainSection" style="min-height: 150px; height: 150px;" align="center">
    <asp:Repeater ID="repeaterBOMDetail" runat="server" OnItemDataBound="R1_ItemDataBound">
        <HeaderTemplate>
            <table border="1" cellspacing="0" width="100%">
        </HeaderTemplate>
        <ItemTemplate>
            <tr height='27px;'>
                <td width="155px">
                    <asp:LinkButton ID="updateByID" runat="server" CommandArgument="" OnCommand="updateByID">
                <%# DataBinder.Eval(Container.DataItem, "PartNumber")%>
                    </asp:LinkButton>
                </td>
                <td width="195px">
                    <%# DataBinder.Eval(Container.DataItem, "Material")%>
                </td>
                <td width="195px">
                    <%# DataBinder.Eval(Container.DataItem, "Description")%>
                </td>
                <td width="95px">
                    <%# DataBinder.Eval(Container.DataItem, "Qty")%>
                </td>
                <td width="95px">
                    <%# DataBinder.Eval(Container.DataItem, "Cost")%>
                </td>
                <td width="95px">
                    <%# DataBinder.Eval(Container.DataItem, "SalesStatus")%>
                </td>
                <td width="95px">
                    Purchasing Status
                </td>
                <%--<td>
                <%# DataBinder.Eval(Container.DataItem, "Revision")%>
            </td> --%>
                <td width="45px">
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
