<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default"
    MasterPageFile="~/_Layouts/MasterP.master" %>

<asp:Content ID="Foot" ContentPlaceHolderID="PlaceHolderFoot" runat="server">
    <table width="100%">
        <tr>
            <td align="center">
                Capsonic Automotive &amp; Aerospace, Inc. 2012<br />
                WebMasters: Aaron Corrales <a href="mailto:acorrales@capsonic.com">acorrales@capsonic.com</a>,
                Alfredo Pacheco <a href="mailto:(apacheco@capsonic.com">apacheco@capsonic.com</a><br />
                LMD: 08/13/2013
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="head" runat="server" ContentPlaceHolderID="PlaceHolderHeader">
    <table style="width: 100%;">
        <tr>
            <td align="left" colspan="2">
                <div style="min-height: 20px; text-align: right;">
                    <asp:LinkButton ID="logout" runat="server" OnClick="logout_Click" Visible="False">Logout</asp:LinkButton></div>
            </td>
        </tr>
        <tr>
            <td align="right" style="text-align: left">
                <asp:LinkButton ID="btnHome" runat="server" Style="text-align: left">Home</asp:LinkButton>
            </td>
            <td align="right">
                <asp:Label ID="lblDate" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="PlaceHolderLeft">
    <asp:MultiView ID="Left_Col" runat="server" ActiveViewIndex="0">
        <asp:View ID="Login" runat="server">
            <table width="100%">
                <tr>
                    <td align="center">
                        <fieldset style="width: 90%">
                            <table width="100%">
                                <tr>
                                    <td align="center">
                                        <table id="login_table" runat="server" style="width: 266px;">
                                            <tr>
                                                <td rowspan="3">
                                                    <img alt="" src="pics/lock.png" style="height: 86px; width: 86px" />
                                                </td>
                                                <td align="left">
                                                    User:
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="TextBox1" runat="server" Width="90px"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="left">
                                                    Password:
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="TextBox2" runat="server" TextMode="Password" Width="90px"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2" align="right">
                                                    <asp:Button ID="btnLogin" runat="server" Text="GO" Width="50px" OnClick="btnLogin_Click" />
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </fieldset>
                    </td>
                </tr>
            </table>
        </asp:View>
        <asp:View ID="Functions" runat="server">
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
        </asp:View>
    </asp:MultiView>
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="PlaceHolderMain">
    <asp:MultiView ID="MultiViewMain" runat="server">
        <asp:View ID="viewSIF" runat="server">
            VistaSIF
        </asp:View>
        <asp:View ID="viewBOM" runat="server">
            Vista BOM
        </asp:View>
        <asp:View ID="viewRFQ" runat="server">
            Vista RFQ
        </asp:View>
        <asp:View ID="viewSupplier" runat="server">
            Vista Supplier
        </asp:View>
    </asp:MultiView>
</asp:Content>
