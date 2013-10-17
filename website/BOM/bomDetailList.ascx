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
        <th class="camposSinBordes" width="250px">
            Material / Assembly Description
        </th>
        <th class="camposSinBordes" width="250px">
            Description
        </th>        
        <th class="camposSinBordes" width="80px">
            Quantity
        </th>
        <th class="camposSinBordes" width= "80px">
            Cost
        </th>
        <th class="camposSinBordes" width= "90px">
            Sales Status
        </th>
        <th class="camposSinBordes" width= "100px">
            Directed Buy
        </th>
        <th class="camposSinBordes" width="80px">
            Purchasing Status
        </th>
        <th class="camposSinBordes" width="50px">
            Assigned To
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
            <asp:TextBox ID="txtMaterial" runat="server" Width="248px"></asp:TextBox>
        </th>
        <th class="camposSinBordes">
            <asp:TextBox ID="txtDescription" runat="server" Width="248px"></asp:TextBox>
        </th>
        <th class="camposSinBordes">
            <asp:TextBox ID="txtQuantity" runat="server" Width="78px"></asp:TextBox>
        </th>
        <th class="camposSinBordes">
            <asp:TextBox ID="txtCost" runat="server" Width="78px"></asp:TextBox>
        </th>
        <th class="camposSinBordes">
            <asp:Label ID="lblSalesStatus" runat="server" Width="88px" Text=""></asp:Label>            
        </th>
        <th class="camposSinBordes">
            <asp:CheckBox ID="chkDirectedBuy" runat="server" Width="100px" />
        </th>
         <th class="camposSinBordes">
             <asp:DropDownList ID="cboPurchasingStatus" runat="server" Width="80px">
             </asp:DropDownList>
        </th>
        <th class="camposSinBordes">
            <asp:LinkButton ID="linkAssignedTo" runat="server" Width="50px"></asp:LinkButton>
        </th>
        <th class="camposSinBordes">
            <asp:Button ID="btnAdd" runat="server" Text="Add" OnClick="add_Click" />
        </th>
        <th class="camposSinBordes">
        </th>
    </tr>
</table>
<div align="center">
    <asp:Repeater ID="repeaterBOMDetail" runat="server" OnItemDataBound="R1_ItemDataBound">
        <HeaderTemplate>
            <table border="1" cellspacing="0" width="100%">
        </HeaderTemplate>
        <ItemTemplate>
            <tr height='27px;'>
                <td width="160px">
                    <asp:LinkButton ID="updateByID" runat="server" CommandArgument="" OnCommand="updateByID">
                <%# DataBinder.Eval(Container.DataItem, "PartNumber")%>
                    </asp:LinkButton>
                </td>
                <td width="248px">
                    <%# DataBinder.Eval(Container.DataItem, "Material")%>
                </td>
                <td width="248px">
                    <%# DataBinder.Eval(Container.DataItem, "Description")%>
                </td>
                <td width="78px">
                    <%# DataBinder.Eval(Container.DataItem, "Qty")%>
                </td>
                <td width="78px">
                    <%# DataBinder.Eval(Container.DataItem, "Cost")%>
                </td>
                <td width="88px">
                    <%# DataBinder.Eval(Container.DataItem, "SalesStatus")%>
                </td>
                <td width="100px">
                    <asp:CheckBox ID="chkDirectedBuyLine" runat="server" />
                </td>
                <td width="80px">
                    <asp:DropDownList ID="cboPurchasingStatusLine" runat="server">
                    </asp:DropDownList>
                </td>
                <td width="50px">
                    <asp:LinkButton ID="linkAssignedToLine" runat="server" CommandArgument="" OnCommand="takeBOMLine">
                        Take
                    </asp:LinkButton>
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
