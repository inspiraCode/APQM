<%@ Page Title="" Language="C#" MasterPageFile="~/_Layouts/MasterBase.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login_Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderBase" Runat="Server">
    <asp:Login ID="Login1" runat="server" BackColor="#E3EAEB" BorderColor="#E6E2D8" 
    BorderPadding="4" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" 
    Font-Size="0.8em" ForeColor="#333333" TextLayout="TextOnTop">
    <TextBoxStyle Font-Size="0.8em" />
    <LoginButtonStyle BackColor="White" BorderColor="#C5BBAF" BorderStyle="Solid" 
        BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#1C5E55" />
    <InstructionTextStyle Font-Italic="True" ForeColor="Black" />
    <TitleTextStyle BackColor="#1C5E55" Font-Bold="True" Font-Size="0.9em" 
        ForeColor="White" />
</asp:Login>
</asp:Content>

