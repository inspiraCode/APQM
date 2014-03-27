<%@ Page Title="" Language="C#" MasterPageFile="~/_Layouts/MasterMenu.master" AutoEventWireup="true"
    CodeFile="Survey_List.aspx.cs" Inherits="SupplierSurvey_Survey_List" MaintainScrollPositionOnPostback="True" %>

<%@ Register Src="surveyList.ascx" TagName="surveyList" TagPrefix="uc1" %>
<%@ Register Src="sendNewSurvey.ascx" TagName="sendNewSurvey" TagPrefix="uc2" %>
<%@ Register Src="surveyForm.ascx" TagName="surveyForm" TagPrefix="uc3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PlaceHolderMain" runat="Server">
    <span class="mainTitle" id="lblTitle" runat="server">Surveys</span>
    <asp:Button ID="btnSendSurvey" class="btnInTitle" runat="server" Text="Send new survey"
        OnClick="btnSendSurvey_Click" />
    <div id="Tabs" class="tabDiv">
        <asp:Button ID="tabSupplier" runat="server" Text="Supplier" OnClick="tabSupplier_Click"
            class="tabSelected" />
        <asp:Button ID="tabSurvey" runat="server" Text="Surveys" OnClick="tabSurvey_Click"
            class="tabUnselected" />
    </div>
    <br />
    <br />
    <%--Tab surveys by supplier--%>
    <div runat="server" id="divSurvey" class="Content">
        <br />
        <uc1:surveyList ID="uscSurveyList" runat="server" />
        <br />
        <br />
    </div>
    <asp:Panel ID="panelPopup" runat="server" Visible="false">
        <uc2:sendNewSurvey ID="uscSendNewSurvey" runat="server" OnOk_Click="on_send_survey"
            OnCancel_Click="on_cancel_send_survey" />

        <script type="text/javascript">
            document.getElementById("<%= this.panelPopup.ClientID %>").setAttribute("title", "Send New Survey");
            jQuery("#<%= this.panelPopup.ClientID %>").dialog({ autoOpen: true,
                appendTo: jQuery('form:first'),
                width: 440, modal: false,
                dialogClass: "no-close", closeOnEscape: false
            });
        </script>
    </asp:Panel>
</asp:Content>
