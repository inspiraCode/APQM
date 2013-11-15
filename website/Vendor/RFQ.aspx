<%@ Page Title="" Language="C#" MasterPageFile="~/_Layouts/MasterBaseStatic.master"
    AutoEventWireup="true" CodeFile="RFQ.aspx.cs" Inherits="Vendor_RFQ" MaintainScrollPositionOnPostback="True"
    EnableViewState="True" %>

<%@ Register Src="../RFQ/rfqForm.ascx" TagName="rfqForm" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderBase" runat="Server">
    <br />
    <br />
    <div id="divInfo" runat="server">
        Please fill this RFQ, when you finish press the "Finalize and send" button.<br />
        Also, you can click the "Save" button at the bottom if you want to continue filling
        up later.
    </div>
    <br />
    <asp:Button ID="btnToSupplierForm" runat="server" OnClick="btnToSupplierForm_Click"
        Text="Back" Width="85px" />
    <asp:Button ID="btnFinalize" validationid="validatingRFQForm" OnClientClick="return validate();"
        runat="server" Text="Finalize and submit" Width="132px" OnClick="btnFinalize_Click" />
    <uc1:rfqForm ID="uscRfqForm" runat="server" OnAfterSave="on_save_rfq" OnAfterCancel="on_cancel_rfq" />
    <div id="divButtons" align="center" runat="server">
        <asp:Button ID="btnFinalizeBottom" validationid="validatingRFQForm" OnClientClick="return validate();"
        runat="server" Text="Finalize and submit" Width="132px" OnClick="btnFinalize_Click" />
        <asp:Button ID="btnSave" runat="server" Text="Save and continue later" Width="70px" OnClick="btnSave_Click"
            validationid="validatingRFQForm" OnClientClick="return validate();" 
            TabIndex="36" />
        <asp:Button ID="btnCancel" runat="server" Text="Cancel" Width="70px" 
            OnClick="btnCancel_Click" TabIndex="37" />
    </div>
    <br />
    <br />
</asp:Content>