<%@ Page Title="" Language="C#" MasterPageFile="~/_Layouts/MasterBaseStatic.master"
    AutoEventWireup="true" CodeFile="Supplier.aspx.cs" Inherits="Vendor_Supplier"
    MaintainScrollPositionOnPostback="True" EnableViewState="True" %>

<%@ Register Src="../Supplier/supplierMaster.ascx" TagName="supplierMaster" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderBase" runat="Server">
    <br />
    <br />
    <div id="divInfo" runat="server">
        INSTRUCTIONS: If your information is correct click next, otherwise please update
        it.<br />
    </div>
    <br />
    <asp:Button ID="btnToRFQ" runat="server" Text="Next" Width="132px" OnClick="btnToRFQForm_Click"
        validationid="validatingSupplierForm" OnClientClick="return validate(event);" />
    <br />
    <br />
    <br />
    <uc1:supplierMaster ID="uscSupplierForm" runat="server" OnAfterSave="on_save_supplier"
        OnAfterCancel="on_cancel_supplier" />
    <br />
    * Fields required.
    <div id="divButtons" align="center" runat="server" style="clear: both;">
        <asp:Button ID="btnSave" runat="server" Text="Save" Width="70px" OnClientClick="return validate(event);"
            validationid="validatingSupplierForm" OnClick="btnSave_Click" />
        <asp:Button ID="btnCancel" runat="server" Text="Cancel" Width="70px" OnClick="btnCancel_Click" />
    </div>
    <br />
    <br />

    <script type="text/javascript">
        jQuery(document).ready(function() {
            try {
                jQuery('#tableSupplierMaster').css("float", "none");
            } catch (e) { }
        });
    </script>

</asp:Content>
