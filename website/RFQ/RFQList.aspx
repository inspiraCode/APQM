<%@ Page Title="" Language="C#" MasterPageFile="~/_Layouts/MasterMenu.master" AutoEventWireup="true" CodeFile="RFQList.aspx.cs" Inherits="RFQ_RFQList" %>

<%@ Register src="rfqList.ascx" tagname="rfqList" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PlaceHolderMain" Runat="Server">
    
    <uc1:rfqList ID="uscRFQList" runat="server" />
    
</asp:Content>

