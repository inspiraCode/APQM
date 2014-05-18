<%@ Page Title="" Language="C#" MasterPageFile="~/_Layouts/MasterMenu.master" AutoEventWireup="true"
    CodeFile="~/Supplier/Supplier_List.aspx.cs" Inherits="Supplier_Supplier_List" MaintainScrollPositionOnPostback="True" %>

<%@ Register Src="~/Supplier/supplierList.ascx" TagName="supplierList" TagPrefix="uc1" %>
<%@ Register Src="~/Supplier/supplierMaster.ascx" TagName="supplierMaster" TagPrefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PlaceHolderMain" runat="Server">
    <span class="mainTitle">Suppliers</span>
    <asp:Button ID="btnAddSupplier" class="btnInTitle" runat="server" Text="New Supplier"
        OnClick="btnAddSupplier_Click" />
    <div runat="server" id="divSupplier" class="Content">
        <br />
        <uc1:supplierList ID="uscSupplierList" runat="server" />
        <br />
        <br />
    </div>
    <asp:Panel ID="panelPopup" runat="server" Visible="false">
        <uc2:supplierMaster ID="uscSupplierForm" runat="server" OnAfterSave="on_afterAdd_supplier"
            OnAfterCancel="on_afterCancel_supplier" />

        <script type="text/javascript">
            document.getElementById("<%= this.panelPopup.ClientID %>").setAttribute("title", "New Supplier");
            jQuery("#<%= this.panelPopup.ClientID %>").dialog({ autoOpen: true,
                appendTo: jQuery('form:first'),
                width: 1100, modal: false,
                dialogClass: "no-close", closeOnEscape: false
            });                    
        </script>
        <div id="divButtons" align="center" runat="server">
            <asp:Button ID="btnSaveSupplier" runat="server" Text="Save" Width="70px" OnClick="on_save_supplier" />
            <asp:Button ID="btnCancelSupplier" runat="server" Text="Cancel" Width="70px" OnClick="on_cancel_supplier" />
        </div>
    </asp:Panel>
</asp:Content>
