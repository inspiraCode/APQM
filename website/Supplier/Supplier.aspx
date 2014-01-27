<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Supplier.aspx.cs" Inherits="_Default"
    MasterPageFile="~/_Layouts/MasterP.master" MaintainScrollPositionOnPostback="True" %>

<%@ Register Src="supplierMaster.ascx" TagName="supplierMaster" TagPrefix="uc1" %>
<%@ Register Src="../Menu.ascx" TagName="Menu" TagPrefix="uc2" %>
<%@ Register Src="~/SupplierSurvey/surveyList.ascx" TagName="surveyList" TagPrefix="uc3" %>
<%@ Register Src="~/SupplierSurvey/sendNewSurvey.ascx" TagName="sendNewSurvey" TagPrefix="uc4" %>
<%@ Register Src="../SupplierSurvey/surveyForm.ascx" TagName="surveyForm" TagPrefix="uc5" %>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="PlaceHolderLeft">
    <asp:MultiView ID="Left_Col" runat="server" ActiveViewIndex="0">
        <asp:View ID="Functions" runat="server">
            <uc2:Menu ID="uscMenu" runat="server" />
        </asp:View>
    </asp:MultiView>
    
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="PlaceHolderMain">
    <span class="mainTitle" runat="server" id="lblTitle"></span>
    <div id="Tabs" class="tabDiv">
        <asp:Button ID="tabSupplier" runat="server" Text="Supplier" OnClick="tabSupplier_Click"
            class="tabSelected" />
        <asp:Button ID="tabSurvey" runat="server" Text="Surveys" OnClick="tabSurvey_Click"
            class="tabUnselected" />
    </div>
    <br />
    <asp:MultiView ID="MultiViewMain" runat="server" ActiveViewIndex="0" OnActiveViewChanged="on_activeView_changed">
        <asp:View ID="viewSupplier" runat="server">
        <br />
            <%--Tab update supplier--%>
            <div>
                <div runat="server" id="divSupplier">
                    <uc1:supplierMaster ID="uscSupplierMasterForm" runat="server" OnAfterSave="on_ok_supplier"
                        OnAfterCancel="on_after_cancel_supplier" />
                </div>
            </div>
            <div id="divButtons" align="center" runat="server">
                <asp:Button ID="btnSaveSupplier" runat="server" Text="Save" Width="70px" OnClick="on_save_supplier" />
                <asp:Button ID="btnCancelSupplier" runat="server" Text="Cancel" Width="70px" OnClick="on_cancel_supplier" />
            </div>
            <br />
            <br />
        </asp:View>
    </asp:MultiView>
</asp:Content>
