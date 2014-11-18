<%@ Page Title="" Language="C#" MasterPageFile="~/_Layouts/MasterBaseStatic.master"
    AutoEventWireup="true" CodeFile="rfqFormMain.aspx.cs" Inherits="rfqFormMain" %>

<%@ Register Src="rfqForm.ascx" TagName="rfqForm" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderBase" runat="Server">
    <uc1:rfqForm ID="uscRfqForm" runat="server" />
    <div id="divButtons" align="center" runat="server">
        <input type="button" id="btnFinalize" value="Finalize" style="width:70px;"
    onclick="if(confirm('RFQ Status will change to Complete\nAre you sure you want to Finalize this RFQ?')) {save(event, 'finalize', onFinalizeSuccess, onFinalizeFail);}"
            validationid="validatingRFQForm" tabindex="37" />
        <input id="btnSave" onclick="save(event, 'update', onUpdateSuccess, onUpdateFail);" type="button" validationid="validatingRFQForm"
            style="width: 70px;" value="Save" tabindex="38" />
        <input type="button" id="btnCancel" value="Cancel" style="width:70px;" onclick="load();"
            tabindex="39" />

            <input type="button" id="btnRFQPrint" value="Print" style="width:70px;" />
    </div>
    <br />
    <br />
    <br />
    <script type="text/javascript">
        jQuery(document).ready(function () {
            load();
        });

        function load() {
            jQuery("#divImgEmail").css("display", "block");
            var params = urlParamsToObject();
            if (params.hasOwnProperty('rfq')) {
                getRFQ(params.rfq);
                jQuery("#btnRFQPrint").click(function () {
                    window.open("RFQ_Report.htm?rfq=" + params.rfq);
                });
            }
        }


        function onFinalizeSuccess() {
            alertify.success("Information saved successfully.");
        }

        function onFinalizeFail() {
            alert("An error has occurried.");
        }

        function onUpdateSuccess() {
            alertify.success("Information saved successfully.");
        }

        function onUpdateFail() {
            alert("An error has occurried.");
        }
    </script>
</asp:Content>
