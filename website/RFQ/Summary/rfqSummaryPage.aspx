<%@ Page Title="" Language="C#" MasterPageFile="~/_Layouts/MasterBaseStatic.master"
    AutoEventWireup="true" CodeFile="rfqSummaryPage.aspx.cs" Inherits="rfqSummaryPage"
    MaintainScrollPositionOnPostback="True" %>

<%@ Register Src="RFQSummaryForm.ascx" TagName="RFQSummaryForm" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderBase" runat="Server">
    <asp:Button ID="btnPrint" runat="server" Text="Print" class="btnInTitle dontprint"
        Style="right: 240px; width: 110px;" OnClientClick="window.print();return false;" />
    <div align="center" style="font-size: 20px;">
        ADVANCE PURCHASING RECOMMENDATION</div>
    <uc1:RFQSummaryForm ID="uscRFQSummaryForm" runat="server" />
</asp:Content>
