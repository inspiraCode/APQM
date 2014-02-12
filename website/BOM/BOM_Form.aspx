<%@ Page Title="" Language="C#" MasterPageFile="~/_Layouts/MasterBaseStatic.master"
    AutoEventWireup="true" CodeFile="BOM_Form.aspx.cs" Inherits="BOM_BOM_Form" %>

<%@ Register Src="bomForm.ascx" TagName="bomForm" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderBase" runat="Server">
    <uc1:bomForm ID="uscBOMForm" runat="server" OnOk_Click="on_after_BOM_save" OnCancel_Click="on_after_BOM_cancel" />
    <br />
    <br />
    <br />
</asp:Content>