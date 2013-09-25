<%@ Page Title="" Language="C#" MasterPageFile="~/_Layouts/MasterP.master" AutoEventWireup="true" CodeFile="RFQSummary.aspx.cs" Inherits="RFQSummary" %>

<%@ Register src="../Menu.ascx" tagname="Menu" tagprefix="uc1" %>

<%@ Register src="Summary/RFQSummaryForm.ascx" tagname="RFQSummaryForm" tagprefix="uc2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PlaceHolderLeft" Runat="Server">
<asp:MultiView ID="Left_Col" runat="server" ActiveViewIndex="0">
        <asp:View ID="Functions" runat="server">
            <uc1:Menu ID="uscMenu" runat="server" />
        </asp:View>
    </asp:MultiView>    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PlaceHolderMain" Runat="Server">

    <uc2:RFQSummaryForm ID="uscRFQSummaryForm" runat="server" />

</asp:Content>

