<%@ Page Title="" Language="C#" MasterPageFile="~/_Layouts/MasterBase.master" AutoEventWireup="true"
    CodeFile="ChangePasswordForm.aspx.cs" Inherits="Login_ChangePasswordForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderBase" runat="Server">
    <br />
    <br />
    <br />
    <br />
    <div align="center">
        <asp:ChangePassword ID="ChangePassword1" runat="server" BackColor="#E3EAEB" BorderColor="#E6E2D8"
            BorderPadding="4" BorderStyle="Solid" BorderWidth="1px" Font-Names="Tahoma"
            Font-Size="13px" CancelDestinationPageUrl="~/Default.aspx" 
            ContinueDestinationPageUrl="~/Default.aspx" ForeColor="#333333" 
            Height="200px" Width="300px">
            <CancelButtonStyle BackColor="White" BorderColor="#C5BBAF" BorderStyle="Solid" BorderWidth="1px"
                Font-Names="Verdana" Font-Size="0.8em" ForeColor="#1C5E55" />
            <PasswordHintStyle Font-Italic="True" ForeColor="#1C5E55" />
            <ContinueButtonStyle BackColor="White" BorderColor="#C5BBAF" BorderStyle="Solid"
                BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#1C5E55" />
            <ChangePasswordButtonStyle BackColor="White" BorderColor="#C5BBAF" BorderStyle="Solid"
                BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#1C5E55" />
            <TitleTextStyle BackColor="#424242" Font-Bold="True" Font-Size="0.9em" 
                ForeColor="White" />
            <TextBoxStyle Font-Size="0.8em" />
            <InstructionTextStyle Font-Italic="True" ForeColor="Black" />
        </asp:ChangePassword>
    </div>
</asp:Content>
