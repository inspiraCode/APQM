<%@ Page Title="" Language="C#" MasterPageFile="~/_Layouts/MasterMenu.master" AutoEventWireup="true" CodeFile="SIF_Form.aspx.cs" Inherits="SIF_SIF_Form" MaintainScrollPositionOnPostback="True" %>

<%@ Register src="sifMaster.ascx" tagname="sifMaster" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PlaceHolderMain" Runat="Server">
    <span class="mainTitle">SIFs > SIF</span>
    <uc1:sifMaster ID="uscSIFMaster" runat="server" OnOk_Click="on_after_SIF_save" OnCancel_Click="on_after_SIF_cancel" />
    <br />
    <br />
</asp:Content>