<%@ Control Language="C#" AutoEventWireup="true" CodeFile="bomDetailList.ascx.cs"
    Inherits="bomDetailList" %>
    <style type="text/css">
        .camposSinBordes
        {
            border-top:0px;
            border-bottom:0px;
            border-right:0px;
            border-left:0px;            
        }        
    </style>
    <table border="2" cellspacing="1" width="100%" align="center" class="camposSinBordes">
        <tr>
            <th style="border-color:Gray;" width= "100px">
                Part #
            </th>
            <th style="border-color:Gray;"  width= "200px">
                Description
            </th>
            <th style="border-color:Gray;"  width= "200px">
                Material
            </th>
            <th style="border-color:Gray;"  width= "80px">
                Status
            </th>
            <th style="border-color:Gray;"  width= "100px">
                Quantity
            </th>     
            <%--<th width= "100px">
                Revision
            </th>--%>
            <th style="border-color:Gray;" width= "80px" class="camposSinBordes" >
            </th>
        </tr>
        <tr>
            <th class="camposSinBordes" >
                <asp:TextBox ID="txtPartNumber" runat="server" width= "100px" ></asp:TextBox>
            </th>
            <th class="camposSinBordes" >
                <asp:TextBox ID="txtDescription" runat="server" width= "198px" ></asp:TextBox>
            </th>
            <th class="camposSinBordes" >
                <asp:TextBox ID="txtMaterial" runat="server" width= "198px" ></asp:TextBox>
            </th>
            <th class="camposSinBordes" >
                <asp:TextBox ID="txtStatus" runat="server" width= "96px" ></asp:TextBox>
            </th>
            <th class="camposSinBordes" >
            <asp:TextBox ID="txtQuantity" runat="server" width= "96px" ></asp:TextBox>            
            </th>
            <th class="camposSinBordes" >
                <asp:Button ID="btnAdd" runat="server" Text="Add" OnClick="add_Click" />
            </th>
            <th class="camposSinBordes" >               
            </th>
        </tr>
</table>   
<div class="mainSection" style="min-height:150px;height:150px;" align="center"> 
<asp:Repeater ID="Repeater1" runat="server" OnItemDataBound="R1_ItemDataBound">
    <HeaderTemplate>
        <table border="1" cellspacing="0" width="100%">
    </HeaderTemplate>
    <ItemTemplate>
        <tr height='40px;'>
            <td width= "98px">
                <asp:LinkButton ID="updateByID" runat="server" CommandArgument=""
                OnCommand="updateByID">
                <%# DataBinder.Eval(Container.DataItem, "PartNumber")%>
                </asp:LinkButton>                
            </td>
            <td width= "198px">
                <%# DataBinder.Eval(Container.DataItem, "Description")%>
            </td>
            <td width= "198px">
                <%# DataBinder.Eval(Container.DataItem, "Material")%>
            </td>
            <td width= "95px">
                <%# DataBinder.Eval(Container.DataItem, "Status")%>
            </td>
            <td width= "95px">
                <%# DataBinder.Eval(Container.DataItem, "Qty")%>
            </td>
            <%--<td>
                <%# DataBinder.Eval(Container.DataItem, "Revision")%>
            </td> --%>                     
            <td width= "45px">
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