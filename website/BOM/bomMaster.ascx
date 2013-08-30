<%@ Control Language="C#" AutoEventWireup="true" CodeFile="bomMaster.ascx.cs"
    Inherits="bomMaster" %>
<%@ Register src="bomDetailList.ascx" tagname="bomDetailList" tagprefix="uc1" %>
<div align="center">
    <table cellspacing="1" style="width: 590px">
        <tr>
            <td align="right">
                Mode:
            </td>
            <td align="left">
                <asp:Label ID="lblMode" runat="server" Text="New"></asp:Label>
            </td>
        </tr>
        <tr>
            <td align="right">
                ID:
            </td>
            <td align="left">
                <asp:Label ID="lblID" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td align="right">
                SIF ID:</td>
            <td align="left">
                <asp:Label ID="lblSifID" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td align="right">
                Part #</td>
            <td align="left">
                <asp:TextBox ID="txtPartNumber" runat="server" Width="380px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right">
                Description</td>
            <td align="left">
                <asp:TextBox ID="txtDescription" runat="server" Width="380px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right">
                Revision</td>
            <td align="left">
                <asp:TextBox ID="txtRevision" runat="server" Width="380px"></asp:TextBox>
            </td>
        </tr>
        <tr align="left">
            <td align="right" height="25px" colspan="2">
                <div style="border: solid;border-color: gray;border-width: 2px;"></div>
            </td> 
        </tr>
        <tr>
            <td colspan="2">
                <div id="divDetail" runat="server">
                    <uc1:bomDetailList ID="bomDetailList" runat="server" />
                </div></td>
        </tr>
        <tr>
            <td align="right">
                &nbsp;
            </td>
            <td align="left">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td align="center" colspan="2">
                <asp:Button ID="btnSave" runat="server" Text="Save" Width="70px" OnClick="btnSave_Click" />
                <asp:Button ID="btnCancel" runat="server" Text="Cancel" Width="70px" OnClick="btnCancel_Click" />
            </td>
        </tr>
    </table>
</div>
