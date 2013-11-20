<%@ Page Title="" Language="C#" MasterPageFile="~/_Layouts/MasterBaseStatic.master"
    AutoEventWireup="true" CodeFile="Supplier.aspx.cs" Inherits="Vendor_Supplier"
    MaintainScrollPositionOnPostback="True" EnableViewState="True" %>

<%@ Register Src="../Supplier/supplierMaster.ascx" TagName="supplierMaster" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderBase" runat="Server">
    
    <br />
    <br />
    <div id="divInfo" runat="server">
        If your information is correct click next, otherwise please update it.<br />        
    </div>
    

    
    
    <asp:Button ID="btnToRFQ" runat="server" Text="Next" Width="132px" OnClick="btnToRFQForm_Click" 
    validationid="validatingSupplierForm" />    
    <br />
    <br />
    <br />
    <uc1:supplierMaster ID="uscSupplierForm" runat="server" OnAfterSave="on_save_supplier"
        OnAfterCancel="on_cancel_supplier" />
    <div id="divButtons" align="center" runat="server">
        <asp:Button ID="btnSave" runat="server" Text="Save" Width="70px" OnClientClick="return validate();" validationid="validatingSupplierForm" OnClick="btnSave_Click" />
        <asp:Button ID="btnCancel" runat="server" Text="Cancel" Width="70px" OnClick="btnCancel_Click" />
    </div>
    <br />
    <br />    
</asp:Content>
