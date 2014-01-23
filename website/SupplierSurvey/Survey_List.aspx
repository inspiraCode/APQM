<%@ Page Title="" Language="C#" MasterPageFile="~/_Layouts/MasterMenu.master" AutoEventWireup="true" CodeFile="Survey_List.aspx.cs" Inherits="SupplierSurvey_Survey_List" %>

<%@ Register src="surveyList.ascx" tagname="surveyList" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PlaceHolderMain" Runat="Server">
    <uc1:surveyList ID="uscSurveyList" runat="server" />
</asp:Content>

