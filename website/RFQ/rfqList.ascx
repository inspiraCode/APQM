<%@ Control Language="C#" AutoEventWireup="true" CodeFile="rfqList.ascx.cs" Inherits="rfqList"
    ClassName="RFQList" %>
<%@ Register Src="../Utils/Notifier/notifier.ascx" TagName="notifier" TagPrefix="uc1" %>
<%@ Register Src="resendRFQ.ascx" TagName="resendRFQ" TagPrefix="uc2" %>
<br />
<div id="divFilterByUser" runat="server">
    <table cellspacing="0" align="left">
        <tr>
            <td align="right">
                Filter Created By:
            </td>
            <td>
                <asp:DropDownList ID="cboFilterByUser" runat="server" Width="180px" AutoPostBack="True"
                    DataSourceID="SqlDataSourceUsers" DataTextField="CreatedBy" DataValueField="CreatedBy"
                    OnSelectedIndexChanged="cboFilterByUser_SelectedIndexChanged">
                </asp:DropDownList>
            </td>
        </tr>
    </table>
    <br />
    <br />
</div>
<asp:SqlDataSource ID="SqlDataSourceUsers" runat="server" OnInit="on_sqldatasource_Init"
    ProviderName="System.Data.SqlClient" SelectCommand="SELECT 'All' AS CreatedBy, 0 AS orderNumber UNION SELECT DISTINCT CreatedBy, 2 AS orderNumber FROM [viewRFQHeader_ReadAll] ORDER BY orderNumber">
</asp:SqlDataSource>
<div id="clientID_GridRFQList" align="center">
    <asp:GridView ID="gridRFQList" convertToDataTable="true" runat="server" AutoGenerateColumns="False"
        class="display dataTable" Style="display: none;" DataSourceID="SqlDataSource"
        DataKeyNames="RFQHeaderKey" OnPreRender="preRenderGridView" RowStyle-Height="27px"
        OnRowCommand="gridView_RowCommand" OnRowDataBound="gridRFQList_RowDataBound">
        <RowStyle Height="27px"></RowStyle>
        <Columns>
            <asp:BoundField DataField="CreatedBy" HeaderText="Created By" SortExpression="CreatedBy"
                ItemStyle-HorizontalAlign="Center" />
            <asp:BoundField DataField="RfqGenerated" HeaderText="RFQ Number" SortExpression="RFQGenerated"
                ItemStyle-HorizontalAlign="Center" />
            <asp:BoundField DataField="PartNumber" HeaderText="Component Part Number" SortExpression="PartNumber"
                ItemStyle-HorizontalAlign="Center" />
            <asp:BoundField DataField="SupplierName" HeaderText="Vendor" SortExpression="SupplierName"
                ItemStyle-HorizontalAlign="Center" />
            <asp:TemplateField HeaderText="Status" SortExpression="Status" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <a target="_blank" href='<%# ResolveUrl("~/RFQ/rfqFormMain.aspx") + "?rfq=" + Eval("RFQHeaderKey")%>'>
                        <%# Eval("Status")%></a>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField ShowHeader="False" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <asp:LinkButton ID="linkSetAward" runat="server" CausesValidation="false" OnClientClick="return false;"
                        CommandName="setAwarded" Text="Set Awarded"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField ShowHeader="False" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <asp:LinkButton ID="resendRFQByID" runat="server" CausesValidation="false" CommandName="resendRFQ"
                        Text="Re-send">
                    </asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="SentToVendor" HeaderText="Last Sent To Vendor" SortExpression="SentToVendor"
                ItemStyle-HorizontalAlign="Center" DataFormatString="{0:g}" />
            <asp:BoundField DataField="DueDate" HeaderText="Due Date" SortExpression="DueDate"
                ItemStyle-HorizontalAlign="Center" DataFormatString="{0:d}" />
            <asp:TemplateField ShowHeader="False" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                <asp:ImageButton ImageUrl="~/pics/delete-icon.png" Height="20px" ID="linkDeleteByID"
                            CommandName="deleteRFQ" runat="server" Text="Delete" OnClientClick="return false;" />
                <asp:ImageButton ImageUrl="~/pics/edit-icon.png" Height="20px" ID="linkUpdateBuyerSide"  class="EditRFQButton"
                            CommandName="updateBuyerSide" runat="server" Text="Edit" OnClientClick="return false;" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource" runat="server" OnInit="on_sqldatasource_Init"
        SelectCommand="SELECT * FROM [viewRFQHeader_ReadAll]"></asp:SqlDataSource>
</div>
<br />
<uc1:notifier ID="uscNotifier" runat="server" />
<asp:Panel ID="panelPopup" runat="server" Visible="false">
    <uc2:resendRFQ ID="uscResendRFQ" runat="server" OnOk_Click="on_resendRFQ" OnCancel_Click="on_cancel_resendRFQ" />

    <script type="text/javascript">
        document.getElementById("<%= this.panelPopup.ClientID %>").setAttribute("title", "Re-send RFQ");
        jQuery("#<%= this.panelPopup.ClientID %>").dialog({ autoOpen: true,
            appendTo: jQuery('form:first'),
            width: 440, modal: true,
            dialogClass: "no-close", closeOnEscape: false
        });
    </script>

</asp:Panel>

<asp:HiddenField ID="HiddenFieldResendRFQ" runat="server" />
<asp:Button ID="btnAfterDeleteRFQ" runat="server" Text="After Delete RFQ" OnClick="btnAfterDeleteRFQ_Click"
        Style="display: none;" />
<asp:Button ID="btnResendRFQ" runat="server" Text="ResendRFQ"  style="display:none;"
    onclick="btnResendRFQ_Click" />
<asp:Button ID="btnAfterAward" runat="server" Text="After Award" 
    onclick="btnAfterAward_Click" style="display:none;" />
<script type="text/javascript">
    function deleteRFQByID(sRFQ_ID) {
        if (confirm('Every information related to this RFQ will be deleted as well.')) {
            jQuery.ajax({
                type: "POST",
                url: '<%= ResolveUrl("~/RFQ/RFQList.aspx/deleteByID") %>',
                data: "{sRFQHeaderKey:'" + sRFQ_ID + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function(msg) {
                    // Replace the div's content with the page method's return.
                    //$("#Result").text(msg.d);
                    if (msg.d != "")
                        jQuery("#<%= btnAfterDeleteRFQ.ClientID %>").click();
                    else
                        alert("An error has occurred.");
                },
                error: function(a, b, c) {
                    alert("An error has occurred.");
                }
            });
        }
        return false;
    }
    function setAwardByRFQ_ID(sRFQ_ID) {
        if (confirm('Are you sure you want to set its status to Award?')) {
            jQuery.ajax({
                type: "POST",
                url: '<%= ResolveUrl("~/RFQ/RFQList.aspx/awardByRFQID") %>',
                data: "{sRFQHeaderKey:'" + sRFQ_ID + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function(msg) {
                    // Replace the div's content with the page method's return.
                    //$("#Result").text(msg.d);
                    if (msg.d != "")
                        jQuery("#<%= btnAfterAward.ClientID %>").click();
                    else
                        alert("An error has occurred.");
                },
                error: function(a, b, c) {
                    alert("An error has occurred.");
                }
            });
        }
        return false;
    }
    function resendRFQbyID(sRFQ_ID) {
        jQuery("#<%= HiddenFieldResendRFQ.ClientID %>").val(sRFQ_ID);
        jQuery("#<%= btnResendRFQ.ClientID %>").click();
        return false;
    }
</script>

