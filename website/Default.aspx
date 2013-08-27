<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default"
    MasterPageFile="~/_Layouts/MasterP.master" %>

<%@ Register src="~/Supplier/supplierMaster.ascx" tagname="supplierMaster" tagprefix="uc1" %>

<%@ Register src="Menu.ascx" tagname="Menu" tagprefix="uc2" %>

<%@ Register src="Supplier/supplierList.ascx" tagname="supplierList" tagprefix="uc3" %>

<%@ Register src="SIF/sifList.ascx" tagname="sifList" tagprefix="uc4" %>

<%@ Register src="SIF/SifMaster.ascx" tagname="SifMaster" tagprefix="uc5" %>

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
            <uc2:Menu ID="Menu1" runat="server" />            
        </asp:View>
    </asp:MultiView>
    
    <asp:Panel ID="panelPopup" runat="server" Visible="false">
        <asp:Panel runat="server" CssClass="Overlay">            
        </asp:Panel>
        <asp:Panel ID="popupContainer" runat="server" CssClass="PopUpPanel" HorizontalAlign="Center">
        <asp:MultiView ID="multiViewPopup" runat="server" ActiveViewIndex="0">
            <asp:View ID="viewPopupSupplier" runat="server">
                <uc1:supplierMaster ID="supplierMasterForm" runat="server" OnOk_Click="on_ok_supplier" OnCancel_Click="on_cancel_supplier"/>
            </asp:View>
            <asp:View ID="viewPopupSIF" runat="server">
                <uc5:SifMaster ID="SifMaster1" runat="server" OnOk_Click="on_ok_sif"  OnCancel_Click="on_cancel_sif" />
            </asp:View>
        </asp:MultiView>
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
            SIFs
            <div style="height: 300px; overflow-y: auto; margin-bottom:5px;">
                <div runat="server" id="divSIF">
                    <uc4:sifList ID="sifList1" runat="server" />
                </div>
            </div>            
            <asp:Button ID="btnAddSIF" runat="server" Text="Add SIF" 
                onclick="btnAddSIF_Click" />
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
            <div style="height: 300px; overflow-y: auto; margin-bottom:5px;">
                <div runat="server" id="divSupplier">
                    <uc3:supplierList ID="supplierList1" runat="server" />
                </div>
            </div>            
            <asp:Button ID="btnAddSupplier" runat="server" Text="Add Supplier" 
                onclick="btnAddSupplier_Click" />
        </asp:View>
        <asp:View ID="viewPopup" runat="server">
        </asp:View>
    </asp:MultiView>
</asp:Content>