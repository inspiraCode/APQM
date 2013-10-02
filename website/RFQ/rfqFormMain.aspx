<%@ Page  Title="" Language="C#" MasterPageFile="~/_Layouts/MasterBaseStatic.master" AutoEventWireup="true" CodeFile="rfqFormMain.aspx.cs" Inherits="rfqFormMain" MaintainScrollPositionOnPostback="True" %>

<%@ Register src="rfqForm.ascx" tagname="rfqForm" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderBase" Runat="Server">
    
    <uc1:rfqForm ID="uscRfqForm" runat="server" OnCancel_Click="on_cancel_rfqForm" OnOk_Click="on_save_rfqForm"/>
    
</asp:Content>

