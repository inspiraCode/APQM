<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Error.aspx.cs" Inherits="Error"
    MasterPageFile="~/_Layouts/MasterBaseStatic.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderBase" runat="Server">
    <br />
    Error:
    <br />
    <div align="left" style="min-height: 200px;">
        <asp:Label ID="lblErrorMessage" runat="server" Text="An error has occurred."></asp:Label>
    </div>
</asp:Content>