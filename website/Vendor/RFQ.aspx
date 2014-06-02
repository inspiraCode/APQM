<%@ Page Title="" Language="C#" MasterPageFile="~/_Layouts/MasterBaseStatic.master"
    AutoEventWireup="true" CodeFile="RFQ.aspx.cs" Inherits="Vendor_RFQ" MaintainScrollPositionOnPostback="True"
    EnableViewState="True" %>

<%@ Register Src="../RFQ/rfqForm.ascx" TagName="rfqForm" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderBase" runat="Server">
    <br />
    <br />
    <div id="divInfo" runat="server">
        Please fill in all the non-shaded fields. The gray fields are locked informational
        fields and the blue fields are calculated fields based on the information you provide.<br />
        Please click on the Instructions button below for a tutorial on filling out this
        form.<br />
        Upon completion, please click the Finalize & Submit button. You will have the opportunity
        to Save & Continue later should you need to do so.
    </div>
    <br />
    <div id="divButtonsTop" align="left" runat="server">
        <asp:Button ID="btnToSupplierForm" runat="server" OnClick="btnToSupplierForm_Click"
            Text="Back" Width="132px" TabIndex="1" />
        <div runat="server" id="divButtonsTopToHide" style="display: inline;">
            <input id="btnSendFilesAndFinalize1" onclick="uploadFiles(event, 'finalize');" type="button"
                style="width: 150px;" validationid="validatingRFQForm" value="Finalize and submit"
                tabindex="1" />
            <input id="btnSendFilesAndSave1" onclick="uploadFiles(event, 'update');" type="button"
                validationid="validatingRFQForm" style="width: 150px;" value="Save & Continue Later"
                tabindex="1" />
            <input type="button" id="btnInstructions" style="width: 132px;" value="Instructions"
                onclick="beginTutorial();" tabindex="1" />
            <asp:Button ID="btnGoToThankyouPage" runat="server" Style="display: none;" Text="Button"
                OnClick="btnGoToThankyouPage_Click" />
        </div>
    </div>
    <uc1:rfqForm ID="uscRfqForm" runat="server" />
    <br />
    <div id="divButtons" align="center" runat="server">
        <input id="btnSendFilesAndFinalize" onclick="save(event, 'finalize', onFinalizeSuccess, onFinalizeFail);"
            type="button" style="width: 150px;" validationid="validatingRFQForm" value="Finalize and submit"
            tabindex="37" />
        <input id="btnSendFilesAndSave" onclick="save(event, 'update', onUpdateSuccess, onUpdateFail);"
            type="button" validationid="validatingRFQForm" style="width: 150px;" value="Save & Continue Later"
            tabindex="38" />
        <input type="button" id="btnCancel" value="Cancel" style="width: 70px;" onclick="load();"
            tabindex="39" />
    </div>
    <br />
    <asp:HiddenField ID="hiddenRFQ_ID" runat="server" />
    <script type="text/javascript">
        jQuery(document).ready(function () {
            load();
            
        });

        function blockIfCompleted() {
            jQuery(".ajax-upload-dragdrop").remove();
            jQuery(".deleteAttachmentToBuyer").hide();
        }
        function load() {
            jQuery("#divImgEmail").css("display", "block");
            getRFQ(jQuery('#<%= hiddenRFQ_ID.ClientID %>').val());
        }
        function beginTutorial() {
            alertify.alert("This tutorial will guide you so you can complete this RFQ without trouble." +
            "<br /><br />You can use your arrow keys to navigate thru the instructions and press Esc to exit.", function (e, str) {
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

        function onFinalizeSuccess() {
            jQuery('#<%= btnGoToThankyouPage.ClientID %>').click();
        }

        function onFinalizeFail() {
        }

        function onUpdateSuccess() {
            alertify.success("Information saved successfully.");
        }

        function onUpdateFail() {
        }

        

    </script>
</asp:Content>
