<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default"
    MasterPageFile="~/_Layouts/MasterP.master" %>

<%@ Register src="supplierMaster.ascx" tagname="supplierMaster" tagprefix="uc1" %>

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
    
    <asp:Panel ID="panelPopupSupplierMaster" runat="server" Visible="false">
        <asp:Panel runat="server" CssClass="Overlay">
        </asp:Panel>
        <asp:Panel ID="popupSupplierMaster" runat="server" CssClass="PopUpPanel">            
            <uc1:supplierMaster ID="supplierMasterForm" runat="server" OnOk_Click="on_ok_supplier" OnCancel_Click="on_cancel_supplier"/>            
        </asp:Panel>
    </asp:Panel>
    
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="PlaceHolderMain">
    <asp:MultiView ID="MultiViewMain" runat="server">
        <asp:View ID="viewHome" runat="server">
            <div>
                HOME</div>
        </asp:View>
        <asp:View ID="viewSIF" runat="server">
            <div>
                SIF</div>
        </asp:View>
        <asp:View ID="viewBOM" runat="server">
            <div>
                BOM</div>
        </asp:View>
        <asp:View ID="viewRFQ" runat="server">
            <div>
                RFQ</div>
        </asp:View>
        <asp:View ID="viewSupplier" runat="server">
            Suppliers
            <div style="height: 300px; overflow: scroll">
                <div runat="server" id="divSupplier">
                </div>
            </div>
        </asp:View>
        <asp:View ID="viewPopup" runat="server">
            <!-- Popup Definition -->
            <%--<input id="Button2" type="submit" value="submit" onclick="javascript:document.getElementById('popup').style.visibility='visible';" />--%>
            <%--<div id="popup" style='visibility: hidden;'>
                <div id="panelOverlay" class="Overlay">
                </div>
                <div id="panelPopUpPanel" class="PopUpPanel">
                    <div id="panelPopUpTitle" style="width: 100%; height: 20px; text-align: right;" />
                    <input id="Button1" type="submit" value="Hola" onclick="javascript:document.getElementById('popup').style.visibility='hidden';" />
                </div></div>--%>
            <%-- <asp:Panel ID="panelPopupBackground" runat="server" CssClass="Overlay"></asp:Panel>
                
            <asp:Panel ID="popup" runat="server" CssClass="PopUpPanel">
                <asp:Panel ID="popupContent" runat="server" />
                <asp:Button ID="btnClosePopup" runat="server" Text="Close Popup" OnClick="btnClosePopup_Click" />
            </asp:Panel>--%>
            <!-- End Popup Definition -->
        </asp:View>
    </asp:MultiView>
</asp:Content>
