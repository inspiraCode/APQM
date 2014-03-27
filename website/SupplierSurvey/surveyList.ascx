<%@ Control Language="C#" AutoEventWireup="true" CodeFile="surveyList.ascx.cs" Inherits="surveyList" %>
<%@ Register Src="surveyForm.ascx" TagName="surveyForm" TagPrefix="uc1" %>
<%@ Register src="../Utils/Notifier/notifier.ascx" tagname="notifier" tagprefix="uc2" %>
<div align="center" style="padding-right: 20px">
    <asp:Repeater ID="Repeater1" runat="server" OnItemDataBound="R1_ItemDataBound">
        <HeaderTemplate>
            <table border="1" id="tableSurvey" class="display" style="display: none;">
                <thead>
                    <th>
                        Last Survey
                    </th>
                    <th>
                        Primary Business
                    </th>
                    <th>
                        Secundary Business
                    </th>
                    <th>
                        Contract Expiration
                    </th>
                    <th>
                        Sent To Vendor
                    </th>
                    <th>
                    </th>
                    </tr>
                </thead>
                <tbody>
        </HeaderTemplate>
        <ItemTemplate>
            <tr height='27px;'>
                <td style="text-align: center;">
                    <asp:LinkButton ID="updateByID" runat="server" CommandArgument="" CommandName="SurveyID"
                        OnCommand="updateByID">
                    <%# DataBinder.Eval(Container.DataItem, "LastSurvey")%>
                    </asp:LinkButton>
                </td>
                <td style="text-align: center;">
                    <%# DataBinder.Eval(Container.DataItem, "PrimaryBusiness")%>
                </td>
                <td style="text-align: center;">
                    <%# DataBinder.Eval(Container.DataItem, "SecundaryBusiness")%>
                </td>
                <td style="text-align: center;">
                    <%# DataBinder.Eval(Container.DataItem, "ContractExpiration")%>
                </td>
                <td style="text-align: center;">
                    <%# DataBinder.Eval(Container.DataItem, "SentToVendor")%>
                </td>
                <td style="text-align: center;">
                    <asp:LinkButton ID="deleteByID" runat="server" CommandArgument="" CommandName="SurveyID"
                        OnCommand="deleteByID" OnClientClick="return  confirm('Do you wish to delete this Survey?')">
                    Delete
                    </asp:LinkButton>
                </td>
            </tr>
        </ItemTemplate>
        <FooterTemplate>
            </tbody></table>
        </FooterTemplate>
    </asp:Repeater>
</div>
<asp:Panel ID="panelPopup" runat="server" Visible="false">
    <div align="center" style="height: 525px; overflow-y: auto;">
        <uc1:surveyForm ID="uscSurveyForm" runat="server" OnOk_Click="on_save_survey" OnCancel_Click="on_cancel_survey" />

        <script type="text/javascript">
            document.getElementById("<%= this.panelPopup.ClientID %>").setAttribute("title", "Supplier Survey");
            jQuery("#<%= this.panelPopup.ClientID %>").dialog({ autoOpen: true,
                appendTo: jQuery('form:first'),
                width: 1090, modal: false,
                dialogClass: "no-close", closeOnEscape: false
            });
        </script>

    </div>
    <div align="center" style="border-top: solid #666666; padding-top: 5px;">
        <asp:Button ID="btnSave" runat="server" Text="Save" Width="70px" OnClick="btnSave_Click"
            TabIndex="64" />
        <asp:Button ID="btnCancel" runat="server" Text="Cancel" Width="70px" OnClick="btnCancel_Click"
            TabIndex="65" /></div>
</asp:Panel>

<uc2:notifier ID="uscNotifier" runat="server" />


<script type="text/javascript">
    jQuery(document).ready(function() {
        jQuery('#tableSurvey').dataTable({ "bStateSave": true }).show();
    });
</script>

