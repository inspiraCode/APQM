<%@ Page Language="C#" AutoEventWireup="true" CodeFile="BOM.aspx.cs" Inherits="_Default"
    MasterPageFile="~/_Layouts/MasterP.master" MaintainScrollPositionOnPostback="True" %>

<%@ Register src="../Menu.ascx" tagname="Menu" tagprefix="uc2" %>
<%@ Register src="bomForm.ascx" tagname="bomForm" tagprefix="uc1" %>

<%@ Register src="../SIF/SifMaster.ascx" tagname="SifMaster" tagprefix="uc3" %>

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
    <asp:Label ID="lblName" runat="server" Text=""></asp:Label>
    <%--<div id="Tabs">
        <asp:Button ID="tabSupplier" runat="server" Text="Supplier" OnClick="tabSupplier_Click" />
        <asp:Button ID="tabSurvey" runat="server" Text="Surveys" OnClick="tabSurvey_Click" />
    </div>--%>
    
    <asp:MultiView ID="MultiViewMain" runat="server" ActiveViewIndex="0">
        <asp:View ID="viewBOM" runat="server"> <%--Tab update supplier--%>
        <span class="mainTitle">BOMs > BOM</span>
            <div>
                <div runat="server" id="divBOM">                 
                    <uc1:bomForm ID="uscBOMMasterForm" runat="server" OnOk_Click="on_ok_bom" OnCancel_Click="on_cancel_bom" />                   
                </div>
            </div>
        </asp:View> 
        <asp:View ID="viewSIF" runat="server"> 
        <span class="mainTitle">BOMs > SIF</span>
            <div>
                <div runat="server" id="divSIF">
                    <uc3:SifMaster ID="uscSifForm" runat="server" OnOk_Click="on_ok_sif" OnCancel_Click="on_cancel_sif" />
                </div>
            </div>
        </asp:View>
    </asp:MultiView>
    
</asp:Content>