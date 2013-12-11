<%@ Page Title="" Language="C#" MasterPageFile="~/_Layouts/MasterBaseStatic.master"
    AutoEventWireup="true" CodeFile="RFQ.aspx.cs" Inherits="Vendor_RFQ" MaintainScrollPositionOnPostback="True"
    EnableViewState="True" %>

<%@ Register Src="../RFQ/rfqForm.ascx" TagName="rfqForm" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderBase" runat="Server">
    <br />
    <br />
    <div id="divInfo" runat="server">
        INSTRUCTIONS: Please fill up this RFQ, when completing this, press the "Finalize
        and submit" button. Gray fields are blocked.
    </div>
    <br />
    <div id="divButtonsTop" align="left" runat="server">
        <asp:Button ID="btnToSupplierForm" runat="server" OnClick="btnToSupplierForm_Click"
            Text="Back" Width="132px" />
        <div runat="server" id="divButtonsTopToHide" style="display: inline;">
            <input id="btnSendFilesAndFinalize1" onclick="uploadFiles('finalize');" type="button"
                style="width: 150px;" validationid="validatingRFQForm" value="Finalize and submit" />
            <input id="btnSendFilesAndSave1" onclick="uploadFiles('save');" type="button" validationid="validatingRFQForm"
                style="width: 150px;" value="Save and continue later" />
            <asp:Button ID="btnInstructions" runat="server" Width="132px" Text="Instructions"
                OnClientClick="introJs().start(); return false;" />
        </div>
    </div>
    
    <uc1:rfqForm ID="uscRfqForm" runat="server" OnAfterSave="on_afterSave_rfq" OnAfterFinalize="on_afterFinalize_rfq" />
    <br />
    <div id="divButtons" align="center" runat="server">
        <input id="btnSendFilesAndFinalize" onclick="uploadFiles('finalize');" type="button"
            style="width: 150px;" validationid="validatingRFQForm" value="Finalize and submit" />
        <input id="btnSendFilesAndSave" onclick="uploadFiles('save');" type="button" validationid="validatingRFQForm"
            style="width: 150px;" value="Save and continue later" />
        <asp:Button ID="btnCancel" runat="server" Text="Cancel" Width="70px" OnClick="btnCancel_Click"
            TabIndex="37" />
    </div>
    <br />

    <script type="text/javascript">
        function enableCaller(bEnable) {
            if (bEnable) {
                jQuery("#<%= divButtons.ClientID %>").children().prop("disabled", false);
                jQuery("#<%= divButtonsTop.ClientID %>").children().prop("disabled", false);
            }
            else {
                jQuery("#<%= divButtons.ClientID %>").children().prop("disabled", true);
                jQuery("#<%= divButtonsTop.ClientID %>").children().prop("disabled", true);
            }
        }
    </script>


   
</asp:Content>
