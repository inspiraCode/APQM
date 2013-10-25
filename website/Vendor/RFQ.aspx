<%@ Page Title="" Language="C#" MasterPageFile="~/_Layouts/MasterBaseStatic.master"
    AutoEventWireup="true"  CodeFile="RFQ.aspx.cs" Inherits="Vendor_RFQ" MaintainScrollPositionOnPostback="True" EnableViewState="True" %>

<%@ Register Src="../RFQ/rfqForm.ascx" TagName="rfqForm" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderBase" runat="Server">
    <br />
    <br />
    <asp:Button ID="btnToSupplierForm" runat="server" OnClick="btnToSupplierForm_Click"
        Text="Back" Width="85px" />
    <asp:Button ID="btnFinalize" validationid="validatingRFQForm" OnClientClick="return validate();" runat="server" Text="Finalize and send" Width="132px"
        OnClick="btnFinalize_Click" />
    <uc1:rfqForm ID="uscRfqForm" runat="server" OnOk_Click="on_save_rfq" OnCancel_Click="on_cancel_rfq" />
</asp:Content>
