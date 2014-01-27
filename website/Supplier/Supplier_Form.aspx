<%@ Page Title="" Language="C#" MasterPageFile="~/_Layouts/MasterMenu.master" AutoEventWireup="true"
    CodeFile="Supplier_Form.aspx.cs" Inherits="Supplier_Supplier_Form" MaintainScrollPositionOnPostback="True" %>

<%@ Register Src="supplierMaster.ascx" TagName="supplierMaster" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PlaceHolderMain" runat="Server">
    <span class="mainTitle" runat="server" id="lblTitle"></span>
    <div id="Tabs" class="tabDiv">
        <asp:Button ID="tabSupplier" runat="server" Text="Supplier" OnClick="tabSupplier_Click"
            class="tabSelected" />
        <asp:Button ID="tabSurvey" runat="server" Text="Surveys" OnClick="tabSurvey_Click"
            class="tabUnselected" />
    </div>
    <br />
    <br />
    <%--Tab update supplier--%>
    <div>
        <div runat="server" id="divSupplier">
            <uc1:supplierMaster ID="uscSupplierForm" runat="server" OnAfterSave="on_afterSave_supplier"
                OnAfterCancel="on_after_cancel_supplier" />
        </div>
    </div>
    <div id="divButtons" align="center" runat="server">
        <asp:Button ID="btnSaveSupplier" runat="server" Text="Save" Width="70px" OnClick="on_save_supplier" />
        <asp:Button ID="btnCancelSupplier" runat="server" Text="Cancel" Width="70px" OnClick="on_cancel_supplier" />
    </div>
    <br />
    <br />
</asp:Content>