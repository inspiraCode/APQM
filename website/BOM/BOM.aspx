<%@ Page Language="C#" AutoEventWireup="true" CodeFile="BOM.aspx.cs" Inherits="_Default"
    MasterPageFile="~/_Layouts/MasterP.master" %>

<%@ Register src="../Menu.ascx" tagname="Menu" tagprefix="uc2" %>
<%@ Register src="bomMaster.ascx" tagname="bomMaster" tagprefix="uc1" %>

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
            <div>
                <div runat="server" id="divBOM">
                    <uc1:bomMaster ID="uscBOMMasterForm" runat="server" OnOk_Click="on_ok_bom" OnCancel_Click="on_cancel_bom" />
                    <%--< />--%>
                </div>
            </div>
        </asp:View> 
        <%--<asp:View ID="viewSurvey" runat="server"> 
            <div>
                <div runat="server" id="divSurvey">
                    <uc3:surveyList ID="uscSurveyList" runat="server" />
                </div>
            </div>
        </asp:View>--%>
    </asp:MultiView>
</asp:Content>