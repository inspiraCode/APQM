<%@ Control Language="C#" AutoEventWireup="true" CodeFile="surveyContactsAfterHours.ascx.cs"
    Inherits="SurveyContactsAfterHours" %>
<style type="text/css">
    .style1
    {
        width: 304px;
    }
</style>
<div align="center">
    After Hours Contact<table cellspacing="1" style="width: 372px">
        <tr>
            <td align="right">
                                Name
            </td>
            <td align="left" class="style1">
                <asp:TextBox ID="txtName" runat="server" Width="300px" TabIndex="57"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right">
                Title</td>
            <td align="left" class="style1">
                <asp:TextBox ID="txtTitle" runat="server" Width="300px" TabIndex="58"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right">
                Address</td>
            <td align="left" class="style1">
                <asp:TextBox ID="txtAddress" runat="server" Width="300px" TabIndex="59"></asp:TextBox>
            </td>
        </tr>
        <tr align="left">
            <td align="right">
                Phone</td>
            <td align="left" class="style1">
                <asp:TextBox ID="txtPhone" runat="server" Width="200px" TabIndex="60"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right">
                Cell</td>
            <td align="left" class="style1">
                <asp:TextBox ID="txtCell" runat="server" Width="200px" TabIndex="61"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right">
                Email</td>
            <td align="left" class="style1">
                <asp:TextBox ID="txtEmail" runat="server" Width="300px" TabIndex="62"></asp:TextBox>
            </td>
        </tr>
        </table>
</div>
