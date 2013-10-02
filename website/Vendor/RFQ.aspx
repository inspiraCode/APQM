<%@ Page Title="" Language="C#" MasterPageFile="~/_Layouts/MasterBaseStatic.master" AutoEventWireup="true"
    CodeFile="RFQ.aspx.cs" Inherits="VendorRFQ" MaintainScrollPositionOnPostback="True" %>

<%@ Register Src="~/Supplier/supplierMaster.ascx" TagName="supplierMaster" TagPrefix="uc2" %>
<%@ Register Src="../SupplierSurvey/surveyForm.ascx" TagName="surveyForm" TagPrefix="uc3" %>
<%@ Register Src="../RFQ/rfqForm.ascx" TagName="rfqForm" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderBase" runat="Server">
    <asp:MultiView ID="multiView" runat="server" ActiveViewIndex="0">
        <asp:View ID="viewSupplier" runat="server">
            <br />
            <br />
            If your information is correct click next, otherwise please update it.<br />
            <asp:Button ID="btnToRFQ" runat="server" Text="Next" Width="132px"
                OnClick="btnToRFQForm_Click" />
            <br />
            <br />
            <uc2:supplierMaster ID="uscSupplierForm" runat="server" OnOk_Click="on_save_supplier"
                OnCancel_Click="on_cancel_supplier" />
            <br />
            <br />
        </asp:View>        
         <asp:View ID="viewRFQ" runat="server">
            <br />
            <br />
            <asp:Button ID="btnToSupplierForm" runat="server" OnClick="btnToSupplierForm_Click"
                Text="Back" Width="85px" />
            <asp:Button ID="btnFinalize" runat="server" Text="Finalize and send" Width="132px"
                OnClick="btnFinalize_Click" />
            <uc1:rfqForm ID="uscRfqForm" runat="server" OnOk_Click="on_save_rfq"
                OnCancel_Click="on_cancel_rfq" />
        </asp:View>
        <asp:View ID="viewThankYou" runat="server">
            <br />
            <br />
            <div style="height: 300px;">
                Thank you. Your information has been sent.</div>
        </asp:View>       
    </asp:MultiView>
</asp:Content>
