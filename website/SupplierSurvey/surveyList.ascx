<%@ Control Language="C#" AutoEventWireup="true" CodeFile="surveyList.ascx.cs" Inherits="surveyList" %>
<div align="center" style="padding-right: 20px">
    <asp:Repeater ID="Repeater1" runat="server" OnItemDataBound="R1_ItemDataBound">
        <HeaderTemplate>
            <table border="1" id="tableSurvey" class="display" style="display:none;">
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
                <td style="text-align:center;">
                    <asp:LinkButton ID="updateByID" runat="server" CommandArgument="" CommandName="SurveyID"
                        OnCommand="updateByID">
                    <%# DataBinder.Eval(Container.DataItem, "LastSurvey")%>
                    </asp:LinkButton>
                </td>
                <td style="text-align:center;">
                    <%# DataBinder.Eval(Container.DataItem, "PrimaryBusiness")%>
                </td>
                <td style="text-align:center;">
                    <%# DataBinder.Eval(Container.DataItem, "SecundaryBusiness")%>
                </td>
                <td style="text-align:center;">
                    <%# DataBinder.Eval(Container.DataItem, "ContractExpiration")%>
                </td>
                <td style="text-align:center;">
                    <%# DataBinder.Eval(Container.DataItem, "SentToVendor")%>
                </td>
                <td style="text-align:center;">
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

<script type="text/javascript">
    jQuery(document).ready(function() {
        jQuery('#tableSurvey').dataTable({"bStateSave":true}).show();
    });
</script>

