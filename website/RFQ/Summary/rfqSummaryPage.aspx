<%@ Page Title="" Language="C#" MasterPageFile="~/_Layouts/MasterBaseStatic.master"
    AutoEventWireup="true" CodeFile="rfqSummaryPage.aspx.cs" Inherits="rfqSummaryPage"
    MaintainScrollPositionOnPostback="True" %>

<%@ Register Src="RFQSummaryForm.ascx" TagName="RFQSummaryForm" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderBase" runat="Server">
    <uc1:RFQSummaryForm ID="uscRFQSummaryForm" runat="server" />
</asp:Content>