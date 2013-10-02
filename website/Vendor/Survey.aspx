<%@ Page Title="" Language="C#" MasterPageFile="~/_Layouts/MasterBaseStatic.master" AutoEventWireup="true"
    CodeFile="Survey.aspx.cs" Inherits="VendorSurvey" MaintainScrollPositionOnPostback="True" %>

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
            <uc2:supplierMaster ID="uscSupplierForm" runat="server" OnOk_Click="on_save_supplier" OnCancel_Click="on_cancel_supplier" />
            <br /><br />
        </asp:View>
        
        <asp:View ID="viewSurvey" runat="server">
        <br /><br />
            Once your survey is ready to be sent, please click "Finalize and send".<br />
            <asp:Button ID="btnToSupplierForm" runat="server" 
                onclick="btnToSupplierForm_Click" Text="Back" Width="85px" />
            <asp:Button ID="btnFinalize" runat="server" Text="Finalize and send" 
                Width="132px" onclick="btnFinalize_Click" />
            <br /><br />            
            <uc3:surveyForm ID="uscSurveyForm" runat="server" OnOk_Click="on_save_survey" OnCancel_Click="on_cancel_survey" />            
            <br /><br />
        </asp:View>
        
        <asp:View ID="viewThankYou" runat="server">
        <br /><br />
        <div style="height:300px;">Thank you. Your information has been sent.</div>            
        </asp:View>   
    </asp:MultiView>
</asp:Content>