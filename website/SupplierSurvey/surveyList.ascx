<%@ Control Language="C#" AutoEventWireup="true" CodeFile="surveyList.ascx.cs"
    Inherits="surveyList" %>
<asp:Repeater ID="Repeater1" runat="server" OnItemDataBound="R1_ItemDataBound">
    <HeaderTemplate>
        <table border="1">
            <th>
                Last Survey
            </th>
            <th>
                Primary Business
            </th>          
            <th>
                Contact Name
            </th>
            <th>
                Contact Phone
            </th>
            <th>
                Contact Cell
            </th>
            <th>
                Contact Email
            </th>            
            <th>
            </th>
        </tr>
    </HeaderTemplate>
    <ItemTemplate>
        <tr height='40px;'>
            <td>
                <asp:LinkButton ID="updateByID" runat="server" CommandArgument="" CommandName="SurveyID" 
                OnCommand="updateByID">
                    <%# DataBinder.Eval(Container.DataItem, "LastSurvey")%>
                </asp:LinkButton>                
            </td>
            <td>
                <%# DataBinder.Eval(Container.DataItem, "PrimaryBusiness")%>
            </td>
            <td>
                <%# DataBinder.Eval(Container.DataItem, "Name")%>
            </td>
            <td>
                <%# DataBinder.Eval(Container.DataItem, "Phone")%>
            </td>
            <td>
                <%# DataBinder.Eval(Container.DataItem, "Cell")%>
            </td>
            <td>
                <%# DataBinder.Eval(Container.DataItem, "Email")%>
            </td>            
            <td>
                <asp:LinkButton ID="deleteByID" runat="server" 
                    CommandArgument="" CommandName="SurveyID" OnCommand="deleteByID" 
                    OnClientClick="return  confirm('Do you wish to delete this Survey?')">
                    Delete
                </asp:LinkButton>
            </td>
        </tr>
    </ItemTemplate>
    <FooterTemplate>
        </table>
    </FooterTemplate>
</asp:Repeater>
<%--</form>--%>
<div id="divSurveyList" runat="server" align="center">
</div>
