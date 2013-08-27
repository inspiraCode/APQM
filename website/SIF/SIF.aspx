<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SIF.aspx.cs" Inherits="_Default"
    MasterPageFile="~/_Layouts/MasterP.master" %>

<%@ Register src="sifMaster.ascx" tagname="supplierMaster" tagprefix="uc1" %>
<%@ Register src="../Menu.ascx" tagname="Menu" tagprefix="uc2" %>
<%@ Register src="sifList.ascx" tagname="sifList" tagprefix="uc3" %>


<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="PlaceHolderLeft">
    <asp:MultiView ID="Left_Col" runat="server" ActiveViewIndex="0">        
        <asp:View ID="Functions" runat="server">            
            <uc2:Menu ID="Menu1" runat="server" />            
        </asp:View>
    </asp:MultiView>
    
    <asp:Panel ID="panelPopup" runat="server" Visible="false">
        <asp:Panel runat="server" CssClass="Overlay">            
        </asp:Panel>
        <asp:Panel ID="popupContainer" runat="server" CssClass="PopUpPanel">            
        </asp:Panel>
    </asp:Panel>    
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="PlaceHolderMain">
    <div id="Tabs">
        <asp:Button ID="tabSupplier" runat="server" Text="Supplier" OnClick="tabSupplier_Click" />
        <asp:Button ID="tabSurvey" runat="server" Text="Surveys" OnClick="tabSurvey_Click" />
    </div>
    <asp:MultiView ID="MultiViewMain" runat="server" ActiveViewIndex="0">        
        <asp:View ID="viewSupplier" runat="server"> <%--Tab update supplier--%>            
            <div style="height: 300px; overflow-y: auto; margin-bottom:5px;">
                <div runat="server" id="divSupplier">
                    <uc1:supplierMaster ID="supplierMasterForm" runat="server" OnOk_Click="on_ok_supplier" OnCancel_Click="on_cancel_supplier"/>
                </div>
            </div>
        </asp:View> 
        <asp:View ID="viewSurvey" runat="server"> <%--Tab update supplier--%>            
            <div style="height: 300px; overflow-y: auto; margin-bottom:5px;">
                <div runat="server" id="divSurvey">                   
                    <uc3:sifList ID="sifList1" runat="server" />                   
                </div>
            </div>
        </asp:View>        
    </asp:MultiView>
</asp:Content>