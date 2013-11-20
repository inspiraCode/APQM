<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Menu.ascx.cs" Inherits="Menu" %>
<table align="center" style="width: 13%">
                <tr>
                    <td align="center" style="width: 100%">
                        <fieldset>
                            <legend>Loged User</legend>
                            <table align="center" style="width: 120px">
                                <tr>
                                    <td align="center">
                                        <asp:LoginName ID="uscLoginName" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center">
                                        <asp:LinkButton runat="server" onclick="btnLogout_Click" >Logout</asp:LinkButton>
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
                                        <asp:Button ID="btnSIF" runat="server" OnClick="btnSIF_Click" Style="height: 26px;"
                                            Text="SIF" Width="110px" />
                                    </td>
                                </tr>
                                 <tr>
                                    <td>
                                        <asp:Button ID="btnBOM" runat="server" OnClick="btnBOM_Click" Style="height: 26px;"
                                            Text="BOM" Width="110px" />
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
                                        <asp:Button ID="btnSuppliers" runat="server" OnClick="btnSuppliers_Click" Style="height: 26px;"
                                            Text="Suppliers" Width="110px" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Button ID="btnRFQSummary" runat="server" OnClick="btnRFQSummary_Click" Style="height: 26px;"
                                            Text="RFQ Summary" Width="110px" />
                                    </td>
                                </tr>
                            </table>
                        </fieldset>
                    </td>
                </tr>
            </table>