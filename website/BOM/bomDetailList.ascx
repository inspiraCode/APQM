<%@ Control Language="C#" AutoEventWireup="true" CodeFile="bomDetailList.ascx.cs"
    Inherits="bomDetailList" %>

<table border="0" cellspacing="1" width="100%">
        <tr>
            <th>
                <asp:TextBox ID="txtPartNumber" runat="server" width= "100px" ></asp:TextBox>
            </th>
            <th>
                <asp:TextBox ID="txtDescription" runat="server" width= "198px" ></asp:TextBox>
            </th>
            <th>
                <asp:TextBox ID="txtQuantity" runat="server" width= "96px" ></asp:TextBox>
            </th>
            <th>
                <asp:Button ID="btnAdd" runat="server" Text="Add" OnClick="add_Click" />
            </th>
            <th width="100%">                
            </th>
        </tr>
</table>   
<div class="mainSection" style="min-height:150px;height:150px;" align="center"> 
<asp:Repeater ID="Repeater1" runat="server" OnItemDataBound="R1_ItemDataBound">
    <HeaderTemplate>
        <table border="1" cellspacing="1" width="100%">       
        <tr>
            <th width= "100px">
                Part #
            </th>
            <th width= "200px">
                Description
            </th>
            <th width= "100px">
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