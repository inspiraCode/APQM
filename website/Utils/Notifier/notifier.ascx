<%@ Control Language="C#" AutoEventWireup="true" CodeFile="notifier.ascx.cs" Inherits="Utils_Alertify_notifier" %>
<asp:Panel ID="alertify" runat="server" Visible="false">
    <asp:TextBox ID="txtAlertify" runat="server" Visible="false" Text="Ejemplo"></asp:TextBox>

    <script type="text/javascript">
            jQuery(document).ready(function() {
                alertify.alert("<%= txtAlertify.Text %>");
            });
    </script>

</asp:Panel>