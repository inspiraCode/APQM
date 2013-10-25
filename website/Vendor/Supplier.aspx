<%@ Page Title="" Language="C#" MasterPageFile="~/_Layouts/MasterBaseStatic.master"
    AutoEventWireup="true" CodeFile="Supplier.aspx.cs" Inherits="Vendor_Supplier" MaintainScrollPositionOnPostback="True" EnableViewState="True" %>

<%@ Register Src="../Supplier/supplierMaster.ascx" TagName="supplierMaster" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderBase" runat="Server">
    <br />
    <br />
    If your information is correct click next, otherwise please update it.<br />
    <asp:Button ID="btnToRFQ" runat="server" Text="Next" Width="132px" OnClick="btnToRFQForm_Click" />
    <br />
    <br />
    <uc1:supplierMaster ID="uscSupplierForm" runat="server" OnOk_Click="on_save_supplier" OnCancel_Click="on_cancel_supplier" />
    <br />
    <br />
</asp:Content>
