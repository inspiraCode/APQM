<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Supplier.aspx.cs" Inherits="_Default"
    MasterPageFile="~/_Layouts/MasterP.master" MaintainScrollPositionOnPostback="True" %>

<%@ Register src="supplierMaster.ascx" tagname="supplierMaster" tagprefix="uc1" %>
<%@ Register src="../Menu.ascx" tagname="Menu" tagprefix="uc2" %>
<%@ Register src="~/SupplierSurvey/surveyList.ascx" tagname="surveyList" tagprefix="uc3" %>

<%@ Register src="~/SupplierSurvey/sendNewSurvey.ascx" tagname="sendNewSurvey" tagprefix="uc4" %>
<%@ Register src="../SupplierSurvey/surveyForm.ascx" tagname="surveyForm" tagprefix="uc5" %>


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
        <asp:MultiView ID="multiViewPopup" runat="server" ActiveViewIndex="0">
            <asp:View ID="viewPopupSupplier" runat="server">
                <uc4:sendNewSurvey ID="uscSendNewSurvey" runat="server" OnOk_Click="on_send_survey" OnCancel_Click="on_cancel_send_survey" />
            </asp:View>
            <asp:View ID="viewPopupSurvey" runat="server">
                <div>
                    <uc5:surveyForm ID="uscSurveyForm" runat="server" OnOk_Click="on_save_survey" OnCancel_Click="on_cancel_survey"/>
                </div>                
            </asp:View>            
        </asp:MultiView>            
        </asp:Panel>
    </asp:Panel>
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="PlaceHolderMain">
    <asp:Label ID="lblName" runat="server" Text=""></asp:Label>
    <div id="Tabs">
        <asp:Button ID="tabSupplier" runat="server" Text="Supplier" OnClick="tabSupplier_Click" />
        <asp:Button ID="tabSurvey" runat="server" Text="Surveys" OnClick="tabSurvey_Click" />
    </div>
    <br />
    <asp:MultiView ID="MultiViewMain" runat="server" ActiveViewIndex="0">
        <asp:View ID="viewSupplier" runat="server"> <%--Tab update supplier--%>
            <div>
                <div runat="server" id="divSupplier">
                    <uc1:supplierMaster ID="uscSupplierMasterForm" runat="server" OnOk_Click="on_ok_supplier" OnCancel_Click="on_cancel_supplier"  />
                </div>
            </div>
        </asp:View>
        <asp:View ID="viewSurvey" runat="server"> <%--Tab update supplier--%>
            <div>
                <div runat="server" id="divSurvey" class="mainSection">                    
                    <uc3:surveyList ID="uscSurveyList" runat="server" />
                </div>
                <asp:Button ID="btnSendSurvey" runat="server" Text="Send new survey" OnClick="btnSendSurvey_Click" />
            </div>
        </asp:View>
    </asp:MultiView>
</asp:Content>