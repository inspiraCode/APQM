<%@ Page Title="" Language="C#" MasterPageFile="~/_Layouts/MasterBase.master" AutoEventWireup="true"
    CodeFile="Login.aspx.cs" Inherits="Login_Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderBase" runat="Server">
    <br />
    <br />
    <br />
    <br />
    <div align="center" style="width: 100%;">
        <asp:Login ID="uscLogin" runat="server" BackColor="#E3EAEB" BorderColor="#E6E2D8"
            BorderPadding="4" BorderStyle="Solid" BorderWidth="1px" Font-Names="Tahoma" Font-Size="13px"
            ForeColor="#333333" TextLayout="TextOnTop" Height="200px" Width="300px">
            <TextBoxStyle Font-Size="0.8em" />
            <LoginButtonStyle BackColor="White" BorderColor="#C5BBAF" BorderStyle="Solid" BorderWidth="1px"
                Font-Names="Verdana" Font-Size="0.8em" ForeColor="#1C5E55" />
            <InstructionTextStyle Font-Italic="True" ForeColor="Black" />
            <TitleTextStyle BackColor="#424242" Font-Bold="True" Font-Size="0.9em" ForeColor="White" />
        </asp:Login>
    </div>
</asp:Content>