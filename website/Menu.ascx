<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Menu.ascx.cs" Inherits="Menu" %>
<table align="center" style="width: 13%">
    <tr>
        <td align="center" style="width: 100%">
            <fieldset>
                <legend>Logged User</legend>
                <table align="center" style="width: 120px">
                    <tr>
                        <td align="center">
                            <asp:LoginName ID="uscLoginName" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                            <asp:LinkButton ID="linkLogout" runat="server" OnClick="btnLogout_Click">Logout</asp:LinkButton>
                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                            <asp:LinkButton ID="linkChangePassword" runat="server" PostBackUrl="~/Login/ChangePasswordForm.aspx">Change Password</asp:LinkButton>
                        </td>
                    </tr>
                </table>
            </fieldset>
        </td>
    </tr>
    <tr>
        <td align="center">
            <br />
            <fieldset>
                <table style="width: 120px">
                    <tr>
                        <td>
                            <asp:Button ID="btnSIF" runat="server" Style="height: 26px;" Text="SIF" Width="110px"
                                OnClick="btnSIF_Click" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Button ID="btnRFQ" runat="server" OnClick="btnRFQ_Click" Style="height: 26px;"
                                Text="RFQ" Width="110px" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Button ID="btnSuppliers" runat="server" Style="height: 26px;" PostBackUrl="~/Supplier/Supplier_List.aspx"
                                Text="Suppliers" Width="110px" />
                        </td>
                    </tr>
                </table>
            </fieldset>
        </td>
    </tr>
</table>
<br />
<div style="text-align:center;width:100%;">
<a href="<%= ResolveUrl("~/APQMUsersManual.pdf") %>" target="_blank" >APQM User&#39;s Manual</a>
</div>
