<%@ Control Language="C#" AutoEventWireup="true" CodeFile="supplierList.ascx.cs" Inherits="supplierList" %>
<style type="text/css">
    .style1
    {
        width: 228px;
    }
    .style2
    {
        width: 121px;
    }
</style>
<div align="center">
<table cellspacing="0" style="width: 900px" border="1">
    <tr>
        <td class="style2">
            Supplier Name</td>
        <td class="style1">
            Manufacturing Location</td>
        <td>
            Ship Location</td>
        <td>
            Quoted Currency</td>
        <td>
            Contact Name</td>
        <td>
            Contact Phone</td>
        <td>
            Contact Email</td>
    </tr>
    <tr>
        <td class="style2">
            <asp:LinkButton ID="linkSupplier1" runat="server" onclick="linkSupplier1_Click">LinkButton</asp:LinkButton>
        </td>
        <td class="style1">
            Una manufacturing location</td>
        <td>
            ship1</td>
        <td>
            quotesd</td>
        <td>
            contcat</td>
        <td>
            632103210</td>
        <td>
            unEmail@email.com</td>
    </tr>
    <tr>
        <td class="style2">
            <asp:LinkButton ID="linkSupplier2" runat="server" onclick="linkSupplier2_Click">Otro supplier</asp:LinkButton>
        </td>
        <td class="style1">
            otra</td>
        <td>
            shiop 321</td>
        <td>
            tads</td>
        <td>
            contact</td>
        <td>
            63210321</td>
        <td>
            otroEmail@gmail.com</td>
    </tr>
    <tr>
        <td class="style2">
            <asp:LinkButton ID="linkSupplier3" runat="server" onclick="linkSupplier3_Click">Supplier sup</asp:LinkButton>
        </td>
        <td class="style1">
            manufacturin</td>
        <td>
            asdf</td>
        <td>
            quo</td>
        <td>
            name</td>
        <td>
            63210354</td>
        <td>
            yahoo@yahoo.com</td>
    </tr>
    <tr>
        <td class="style2">
            <asp:LinkButton ID="linkSupplier4" runat="server" onclick="linkSupplier4_Click">Supplier Sample</asp:LinkButton>
        </td>
        <td class="style1">
            location</td>
        <td>
            sad</td>
        <td>
            ted</td>
        <td>
            nmam,e</td>
        <td>
            68465465</td>
        <td>
            gmail@gmail.com</td>
    </tr>
    </table>
</div>