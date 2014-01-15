<%@ Page Title="" Language="C#" MasterPageFile="~/_Layouts/MasterBaseStatic.master"
    AutoEventWireup="true" CodeFile="rfqFormMain.aspx.cs" Inherits="rfqFormMain"
    MaintainScrollPositionOnPostback="True" %>

<%@ Register Src="rfqForm.ascx" TagName="rfqForm" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderBase" runat="Server">
    <uc1:rfqForm ID="uscRfqForm" runat="server" OnAfterSave="on_afterSave_rfq" OnAfterFinalize="on_afterFinalize_rfq" />
    <div id="divButtons" align="center" runat="server">
        <asp:Button ID="btnSave" runat="server" Text="Save" Width="70px" OnClientClick="if(confirm('RFQ Status will change to Complete\nAre you sure you want to edit it?')) {uploadFiles('finalize'); return false;} else return false;"
            validationid="validatingRFQForm" TabIndex="37" />
        <asp:Button ID="btnCancel" runat="server" Text="Cancel" Width="70px" OnClick="btnCancel_Click"
            TabIndex="37" />
    </div>
    <br />
    <br />
    <br />
</asp:Content>