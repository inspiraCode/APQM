<%@ Page Title="" Language="C#" MasterPageFile="~/_Layouts/MasterBase.master" AutoEventWireup="true"
    CodeFile="RFQ.aspx.cs" Inherits="RFQ_RFQ" %>

<%@ Register Src="~/RFQ/rfqForm.ascx" TagName="rfqForm" TagPrefix="uc1" %>
<%@ Register Src="~/Supplier/supplierMaster.ascx" TagName="supplierMaster" TagPrefix="uc2" %>
<%@ Register src="../SupplierSurvey/surveyForm.ascx" tagname="surveyForm" tagprefix="uc3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderBase" runat="Server">
    <asp:MultiView ID="multiView" runat="server" ActiveViewIndex="0">
        <asp:View ID="viewSupplier" runat="server">
        <br /><br />
            If your information is correct click next, otherwise please update it.<br />
            <asp:Button ID="btnToSurvey" runat="server" Text="Next" Width="85px" 
                onclick="btnToSurvey_Click"  />
                <br /><br />
            <uc2:supplierMaster ID="uscSupplierForm" runat="server" />
            <br /><br />
        </asp:View>
        <asp:View ID="viewSurvey" runat="server">
        <br /><br />
            If your information is correct click next, otherwise please update it.<br />
            <asp:Button ID="btnToSupplierForm" runat="server" 
                onclick="btnToSupplierForm_Click" Text="Back" Width="85px" />
            <asp:Button  ID="btnToRFQForm" runat="server" Text="Next" Width="85px" 
                onclick="btnToRFQForm_Click" />
            <br /><br />            
            <uc3:surveyForm ID="uscSurveyForm" runat="server" />            
            <br /><br />
        </asp:View>
        <asp:View ID="viewRFQ" runat="server">
        <br /><br />
            Click finalize when your RFQ is ready to be sent.<br />
            <asp:Button ID="btnToSurveyForm" runat="server" Text="Back" Width="85px" 
                onclick="btnToSurveyForm_Click" />
            <asp:Button ID="btnFinalize" runat="server" Text="Finalize and send" 
                Width="132px" />
                <br /><br />
            <uc1:rfqForm ID="uscRFQForm" runat="server" />
            <br /><br />
        </asp:View>
    </asp:MultiView>
</asp:Content>