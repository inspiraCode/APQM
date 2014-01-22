<%@ Control Language="C#" AutoEventWireup="true" CodeFile="notifier.ascx.cs" Inherits="Utils_Alertify_notifier" %>
<asp:Panel ID="alertify" runat="server" Visible="false">
    <asp:TextBox ID="txtAlertify" runat="server" Visible="false" Text=""></asp:TextBox>

    <script type="text/javascript">
        jQuery(document).ready(function() {
            alertify.alert("<%= txtAlertify.Text %>");
        });
    </script>

</asp:Panel>
<asp:Panel ID="panelLog" runat="server" Visible="false">
    <asp:TextBox ID="txtLog" runat="server" Visible="false" Text=""></asp:TextBox>

    <script type="text/javascript">
        jQuery(document).ready(function() {
        alertify.log("<%= txtLog.Text %>");
        });
    </script>

</asp:Panel>
<asp:Panel ID="panelSuccess" runat="server" Visible="false">
    <asp:TextBox ID="txtSuccess" runat="server" Visible="false" Text=""></asp:TextBox>

    <script type="text/javascript">
        jQuery(document).ready(function() {
        alertify.success("<%= txtSuccess.Text %>");
        });
    </script>

</asp:Panel>
<asp:Panel ID="panelError" runat="server" Visible="false">
    <asp:TextBox ID="txtError" runat="server" Visible="false" Text=""></asp:TextBox>

    <script type="text/javascript">
        jQuery(document).ready(function() {
        alertify.error("<%= txtError.Text %>");
        });
    </script>

</asp:Panel>


<asp:HiddenField ID="txtPrompt" runat="server" 
    onvaluechanged="txtPrompt_ValueChanged"  />
<asp:TextBox ID="txtPromptMessage" runat="server" Visible="false" Text=""></asp:TextBox>

<script type="text/javascript">
    function promptUser(strPrompt, prefix, targetID) {
        strResult = "";
        alertify.prompt(strPrompt, function(e, str) {
        if (e) {
                targetID.value = "" + prefix + str;
                document.forms[0].submit();
            }
        });
        return false;
    }
</script>