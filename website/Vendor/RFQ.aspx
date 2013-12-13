<%@ Page Title="" Language="C#" MasterPageFile="~/_Layouts/MasterBaseStatic.master"
    AutoEventWireup="true" CodeFile="RFQ.aspx.cs" Inherits="Vendor_RFQ" MaintainScrollPositionOnPostback="True"
    EnableViewState="True" %>

<%@ Register Src="../RFQ/rfqForm.ascx" TagName="rfqForm" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderBase" runat="Server">
    <br />
    <br />
    <div id="divInfo" runat="server">
        Please fill in all the non-shaded fields.  The gray fields are locked informational fields and the blue fields are calculated fields based on the information you provide.<br />
        Please click on the Instructions button below for a tutorial on filling out this form.<br />
        Upon completion, please click the Finalize & Submit button.  You will have the opportunity to Save & Continue later should you need to do so.
    </div>
    <br />
    <div id="divButtonsTop" align="left" runat="server">
        <asp:Button ID="btnToSupplierForm" runat="server" OnClick="btnToSupplierForm_Click"
            Text="Back" Width="132px" />
        <div runat="server" id="divButtonsTopToHide" style="display: inline;">
            <input id="btnSendFilesAndFinalize1" onclick="uploadFiles('finalize');" type="button"
                style="width: 150px;" validationid="validatingRFQForm" value="Finalize and submit" />
            <input id="btnSendFilesAndSave1" onclick="uploadFiles('save');" type="button" validationid="validatingRFQForm"
                style="width: 150px;" value="Save & Continue Later" />
            <asp:Button ID="btnInstructions" runat="server" Width="132px" Text="Instructions"
                OnClientClick="return beginTutorial();" />
        </div>
    </div>
    <uc1:rfqForm ID="uscRfqForm" runat="server" OnAfterSave="on_afterSave_rfq" OnAfterFinalize="on_afterFinalize_rfq" />
    <br />
    <div id="divButtons" align="center" runat="server">
        <input id="btnSendFilesAndFinalize" onclick="uploadFiles('finalize');" type="button"
            style="width: 150px;" validationid="validatingRFQForm" value="Finalize and submit" />
        <input id="btnSendFilesAndSave" onclick="uploadFiles('save');" type="button" validationid="validatingRFQForm"
            style="width: 150px;" value="Save & Continue Later" />
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
        function beginTutorial() {
            alertify.alert("This tutorial will guide you so you can complete this RFQ without trouble." +
            "<br /><br />You can use your arrow keys to navigate thru the instructions and press Esc to exit.", function(e, str) {
                if (e) {
                    introJs().setOptions({
                        'exitOnOverlayClick': false,
                        'showStepNumbers': true,
                        'showButtons': true,
                        'showBullets': false
                    }).start();
                }
            });
            return false;
        }
    </script>

</asp:Content>
