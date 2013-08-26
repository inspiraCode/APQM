<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Menu.ascx.cs" Inherits="Menu" %>
<table width="100%">
                <tr>
                    <td align="center" style="width: 100%">
                        <fieldset style="width: 90%">
                            <legend>Loged User</legend>
                            <table width="100%">
                                <tr>
                                    <td align="left" style="width: 90">
                                        <b>ID: </b>
                                        <asp:Label ID="Label1" runat="server" Text="id"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left">
                                        <b>Name: </b>
                                        <asp:Label ID="Label2" runat="server" Text="name"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left">
                                        <b>Last Visit: </b>
                                        <asp:Label ID="Label3" runat="server" Text="name"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </fieldset>
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        <fieldset style="width: 90%">
                            <legend>Functions</legend>
                            <table>
                                <tr>
                                    <td>
                                        <asp:Button ID="btnSIF" runat="server" OnClick="btnSIF_Click" Style="height: 26px;"
                                            Text="SIF" Width="200px" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Button ID="btnBOM" runat="server" OnClick="btnBOM_Click" Style="height: 26px;"
                                            Text="BOM" Width="200px" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Button ID="btnRFQ" runat="server" OnClick="btnRFQ_Click" Style="height: 26px;"
                                            Text="RFQ" Width="200px" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Button ID="btnSuppliers" runat="server" OnClick="btnSuppliers_Click" Style="height: 26px;"
                                            Text="Suppliers" Width="200px" />
                                    </td>
                                </tr>
                            </table>
                        </fieldset>
                    </td>
                </tr>
            </table>