<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RFQmain.aspx.cs" Inherits="_Default"
    MasterPageFile="~/_Layouts/MasterP.master" %>

<%@ Register src="../Menu.ascx" tagname="Menu" tagprefix="uc2" %>

<%@ Register src="../Supplier/supplierMaster.ascx" tagname="supplierMaster" tagprefix="uc1" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="PlaceHolderLeft">
    <asp:MultiView ID="Left_Col" runat="server" ActiveViewIndex="0">        
        <asp:View ID="Functions" runat="server">
            <uc2:Menu ID="uscMenu" runat="server" />
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
        <asp:Button ID="tabRFC" runat="server" Text="RFC" OnClick="tabRFC_Click" />
        <%--<asp:Button ID="tabSurvey" runat="server" Text="Surveys" OnClick="tabSurvey_Click" />--%>
    </div>
    <asp:MultiView ID="MultiViewMain" runat="server" ActiveViewIndex="0">        
        <asp:View ID="viewRFC" runat="server"> <%--Tab update SIF--%>            
            <div >
                <div runat="server" id="divRFC">
                    <%--<uc1:sifMaster ID="uscSIFMasterForm" runat="server" />--%>
                    <uc1:supplierMaster ID="uscSupplierMaster" runat="server" OnOk_Click="on_update_RFC" OnCancel_Click="on_cancel_RFC" />
                </div>
            </div>
        </asp:View> 
        <%--<asp:View ID="viewSurvey" runat="server">            
            <div>
                <div runat="server" id="divSurvey">                   
                    <uc3:sifList ID="uscSIFList" runat="server" />                   
                </div>
            </div>
        </asp:View>--%>        
    </asp:MultiView>
</asp:Content>