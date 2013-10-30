<%@ Page Title="" Language="C#" MasterPageFile="~/_Layouts/MasterBaseStatic.master" AutoEventWireup="true" CodeFile="rfqSummaryPage.aspx.cs" Inherits="rfqSummaryPage" %>

<%@ Register src="RFQSummaryForm.ascx" tagname="RFQSummaryForm" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderBase" Runat="Server">
    <uc1:RFQSummaryForm ID="uscRFQSummaryForm" runat="server" />
   <script type="text/javascript">
        jQuery('')
    </script>
</asp:Content>