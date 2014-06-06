<%@ Page Title="" Language="C#" MasterPageFile="~/_Layouts/MasterMenu.master" AutoEventWireup="true"
    CodeFile="RFQSummary.aspx.cs" Inherits="RFQSummaryDefault" MaintainScrollPositionOnPostback="True" %>

<%@ Register Src="../Menu.ascx" TagName="Menu" TagPrefix="uc1" %>
<%@ Register Src="Summary/RFQSummaryForm.ascx" TagName="RFQSummaryForm" TagPrefix="uc2" %>
<%@ Register Src="Summary/selectBOMLine.ascx" TagName="selectBOMLine" TagPrefix="uc4" %>

<asp:Content ID="Content2" ContentPlaceHolderID="PlaceHolderMain" runat="Server">
    <span class="mainTitle">RFQ Summary</span>
    <asp:Button ID="btnSelect" runat="server" class="btnInTitle" Style="right: 10px;
        width: 110px;" Text="Open Program" TabIndex="1" OnClick="btnSelect_Click" />
    <asp:HyperLink ID="hlnkOpenPage" runat="server" NavigateUrl="~/RFQ/Summary/rfqSummaryPage.aspx"
        Target="_blank" Visible="False">Open in a separate page</asp:HyperLink>
    <uc2:RFQSummaryForm ID="uscRFQSummaryForm" runat="server" />
    <asp:Panel ID="panelPopup" runat="server" Visible="false">
        <div class="mainSection">
            <uc4:selectBOMLine ID="uscSelectBOM" runat="server" OnRow_Command="on_rowCommand" />
        </div>
        <br />
        <div align="right">
            <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" /></div>
        <script type="text/javascript">
            document.getElementById("<%= this.panelPopup.ClientID %>").setAttribute("title", "Please select a BOM Line");
            jQuery("#<%= this.panelPopup.ClientID %>").dialog({ autoOpen: true,
                appendTo: jQuery('form:first'),
                width: 1150, modal: false,
                dialogClass: "no-close",
                closeOnEscape: false,
                draggable: true
            });
        </script>
    </asp:Panel>
</asp:Content>