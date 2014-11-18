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
            introJs().setOptions({
                'exitOnOverlayClick': false,
                'showStepNumbers': true,
                'showButtons': true,
                'showBullets': false,
                steps: [
                          {
                              intro: "This tutorial will guide you so you can complete this RFQ without trouble." +
            "<br /><br />You can use your arrow keys to navigate thru the instructions and press Esc to exit."
                          },
                          {
                              element: '#step1',
                              intro: 'Select "Quote" if you are able to quote this piece. Otherwise select "No Quote" and please specify your reason.'
                          },
                          {
                              element: document.querySelector('#step2'),
                              intro: 'Sometimes you can receive some comments from our purchasing department that can be helpful for you to quote the piece.'
                          },
                          {
                              element: '#step3',
                              intro: 'Sometimes you can receive attachments from our purchasing department that can be helpful for you to quote the piece.'
                          },
                          {
                              element: '#step4',
                              intro: 'Please complete this RFQ before this date.',
                              position: 'bottom'
                          },
                          {
                              element: '#step5',
                              intro: 'This is our RFQ number.'
                          },
                          {
                              element: '#step6',
                              intro: 'Market Sector of this piece.'
                          },
                          {
                              element: '#step7',
                              intro: 'This is the Part Number to quote.'
                          },
                          {
                              element: '#step8',
                              intro: 'Please quote with this Unit of Measure.'
                          },
                          {
                              element: '#step9',
                              intro: 'This is the material or name of the piece to quote.'
                          },
                          {
                              element: '#step10',
                              intro: 'Drawing Level.'
                          },
                          {
                              element: '#step11',
                              intro: 'Target Price. If specified by Purchasing Department.'
                          },
                          {
                              element: '#step12',
                              intro: 'If this is incorrect, please click Save & Continue Later button. Once saved, you can go back to initial supplier page to make the change to the information.'
                          },
                          {
                              element: '#step13',
                              intro: 'Your Manufacturing Location for the Part to quote.'
                          },
                          {
                              element: '#step14',
                              intro: 'Your Ship Location for the Part to quote.'
                          },
                          {
                              element: '#step15',
                              intro: 'Please enter your name.'
                          },
                          {
                              element: '#step16',
                              intro: 'Please complete these fields as applicable.'
                          },
                          {
                              element: '#step17',
                              intro: 'Please quote for these EAU and Calendar Years'
                          },
                          {
                              element: '[data-step="step18"]',
                              intro: 'Please indicate.'
                          },
                          {
                              element: '[data-step="step19"]',
                              intro: 'Please indicate the unit of measure.'
                          },
                          {
                              element: '[data-step="step20"]',
                              intro: 'Quantity of material used.'
                          },
                          {
                              element: '[data-step="step21"]',
                              intro: 'Material cost per unit.'
                          },
                          {
                              element: '[data-step="step22"]',
                              intro: 'This is the material cost total (formulated cell not to be completed by Supplier).<br/>Formula:<br/>Quantity x Cost/Unit'
                          },
                          {
                              element: '[data-step="step23"]',
                              intro: 'Outside services needed.'
                          },
                          {
                              element: '[data-step="step24"]',
                              intro: 'Cost of the outside service.'
                          },
                          {
                              element: '[data-step="step25"]',
                              intro: 'This is the outside service cost total (formulated cell not to be completed by Supplier).<br/>Formula:<br/>Quantity x Cost/Unit'
                          },
                          {
                              element: '[data-step="step26"]',
                              intro: 'Percentage of scrap.'
                          },
                          {
                              element: '[data-step="step27"]',
                              intro: 'This is the scrap cost total (formulated cell not to be completed by Supplier).<br/>Formula:<br/>(Material Total + Service Total) x Scrap Value'
                          },
                          {
                              element: '[data-step="step28"]',
                              intro: 'Enter directly labor rate.'
                          },
                          {
                              element: '[data-step="step29"]',
                              intro: 'Enter the number of standards hours required per part.'
                          },
                          {
                              element: '[data-step="step30"]',
                              intro: 'This is the labor cost total (formulated cell not to be completed by Supplier).<br/>Formula:<br/>Directly Hrly Labor Rate x Std Hrs.',
                              position:'left'
                          },
                          {
                              element: '[data-step="step31"]',
                              intro: 'Enter your total burden cost per unit.',
                              position:'left'
                          },
                          {
                              element: '[data-step="step32"]',
                              intro: 'This is the burden cost total (formulated cell not to be completed  by Supplier).<br/>Formula:<br/>=Burden',
                              position:'left'
                          },
                          {
                              element: '[data-step="step33"]',
                              intro: 'Total Manufacturing Cost (formulated cell not to be completed by Supplier).',
                              position: 'left'
                          },
                          {
                              element: '[data-step="step34"]',
                              intro: 'Enter cost for SG&A/Profit',
                              position:'left'
                          },
                          {
                              element: '[data-step="step35"]',
                              intro: 'Enter packaging cost per unit.',
                              position:'left'
                          },
                          {
                              element: '[data-step="step36"]',
                              intro: 'Enter cost for assembly, if applicable.',
                              position:'left'
                          },
                          {
                              element: '[data-step="step37"]',
                              intro: 'Total Piece Cost (formulated cell not to be completed by the Supplier).',
                              position: 'left'
                          },
                          {
                              element: '[data-step="step38"]',
                              intro: 'Piece Cost must be related with this UOM',
                              position: 'left'
                          },
                          {
                              element: '[data-step="step39"]',
                              intro: 'Please specify MOQ for each EAU.'
                          },
                          {
                              element: '#step40',
                              intro: 'Please provide tooling information.'
                          },
                          {
                              element: '#step41',
                              intro: 'Enter Production Tooling Cost.'
                          },
                          {
                              element: '#step42',
                              intro: 'Enter Prototype Tooling Cost.'
                          },
                          {
                              element: '#step43',
                              intro: 'Enter Prototype Piece Cost.'
                          },
                          {
                              element: '#step44',
                              intro: 'Outline your annual cost reduction commitment.'
                          },
                          {
                              element: '#step45',
                              intro: 'Please enter the weight of the part to be shipped.'
                          },
                          {
                              element: '#step46',
                              intro: 'Enter the Brand if applicable.'
                          },
                          {
                              element: '#step47',
                              intro: 'Enter the number of Cavitation if applicable.'
                          },
                          {
                              element: '#step48',
                              intro: 'Enter the Material if applicable.'
                          },
                          {
                              element: '#step49',
                              intro: 'Here are the attachments that you sent to Purchasing Department.'
                          },
                          {
                              element: '#step50',
                              intro: 'Please enter here any exception you have out of the print.',
                              position:'top'
                          },
                          {
                              element: '#step51',
                              intro: 'If you have any comments to share with us, please use this field.'
                          }
                        ]
            }).start();

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
