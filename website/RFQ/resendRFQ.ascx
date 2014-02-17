<%@ Control Language="C#" AutoEventWireup="true" CodeFile="resendRFQ.ascx.cs"
    Inherits="ResendRFQ" %>
<style type="text/css">
    .style1
    {
        width: 50%;
    }
    .style2
    {
        width: 81px;
    }
    .style3
    {
        width: 278px;
    }
    .style4
    {
        width: 81px;
        height: 48px;
    }
    .style5
    {
        width: 278px;
        height: 48px;
    }
    .style6
    {
        height: 48px;
    }
</style>
<table cellspacing="0" class="style1">
    <tr>
        <td align="right" class="style2">
            Supplier
        </td>
        <td class="style3">
            <asp:Label ID="lblSupplier" runat="server" Text="Label" Width="350px"></asp:Label>
        </td>
        <td>
            &nbsp;
        </td>
    </tr>
    <tr>
        <td align="right" class="style2">
            Email
        </td>
        <td class="style3">
            <asp:TextBox ID="txtEmail" runat="server" Width="350px"></asp:TextBox>
        </td>
        <td>
            &nbsp;
        </td>
    </tr>
    <tr>
        <td class="style4">
        </td>
        <td class="style5">
            <div id="divImgEmail" style="visibility: hidden;">
                <img id="" alt="" src="../Utils/loading.gif" style="display: inline;" />
                <span style="position: relative; top: -10px;">Please wait..</span>
            </div>
        </td>
        <td class="style6">
        </td>
    </tr>
    <tr>
        <td align="center" colspan="3">
            <asp:Button ID="btnResendRFQ" runat="server" OnClick="resend" Style="display:none;"
                Text="Send" Width="80px" />
            <input id="btnResendRFQ_ClientSide" type="button" value="Send" onclick="showScrim();" />
            <asp:Button ID="btnCancel" runat="server" OnClick="btnCancel_Click" Text="Cancel"
                Width="80px" />
        </td>
    </tr>
</table>

<script type="text/javascript">
    function showScrim() {
        
        jQuery("#btnResendRFQ_ClientSide").prop("disabled", true);
        jQuery("#<%= btnCancel.ClientID %>").prop("disabled", true);
        setTimeout(jQuery("#<%= btnResendRFQ.ClientID %>").click(), 5);
        jQuery("#divImgEmail").css("visibility", "visible");
        return true;
    }
</script>
