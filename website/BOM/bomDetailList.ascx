<%@ Control Language="C#" AutoEventWireup="true" CodeFile="bomDetailList.ascx.cs"
    Inherits="bomDetailList" %>

<table border="1" width="100%">
        <tr style="border-width:0; border: transparent;">
            <th>
                <asp:TextBox ID="txtPartNumber" runat="server"></asp:TextBox>
            </th>
            <th>
                <asp:TextBox ID="txtDescription" runat="server"></asp:TextBox>
            </th>
            <th>
                <asp:TextBox ID="txtQuantity" runat="server"></asp:TextBox>
            </th>
            <th>
                <asp:TextBox ID="txtStatus" runat="server"></asp:TextBox>
            </th>            
            <th>
                <asp:Button ID="btnAdd" runat="server" Text="Add" OnClick="add_Click" />
            </th>
        </tr>
</table>   
<div class="mainSection" style="min-height:150px;height:150px;" align="center"> 
<asp:Repeater ID="Repeater1" runat="server" OnItemDataBound="R1_ItemDataBound">
    <HeaderTemplate>
        <table border="1" width="100%">       
        <tr>
            <th>
                Part #
            </th>
            <th>
                Description
            </th>
            <th>
                Quantity
            </th>
            <th>
                Status
            </th>            
            <th>
            </th>
        </tr>
    </HeaderTemplate>
    <ItemTemplate>
        <tr height='40px;'>
            <td>
                <asp:LinkButton ID="updateByID" runat="server" CommandArgument=""
                OnCommand="updateByID">
                    <%# DataBinder.Eval(Container.DataItem, "ItemMasterKey")%>
                </asp:LinkButton>                
            </td>
            <td>
                <%# DataBinder.Eval(Container.DataItem, "Description")%>
            </td>
            <td>
                <%# DataBinder.Eval(Container.DataItem, "Qty")%>
            </td>
            <td>
                <%# DataBinder.Eval(Container.DataItem, "Status")%>
            </td>            
            <td>
                <asp:LinkButton ID="deleteByID" runat="server" 
                    CommandArgument="" OnCommand="deleteByID" 
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
<div id="divBOMDetailList" runat="server" align="center">
</div>