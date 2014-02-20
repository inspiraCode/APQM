<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SendNewRFQDetail.ascx.cs"
    Inherits="BOM_SendNewRFQDetail" %>
<asp:Repeater ID="repeaterNewRFQDetail" runat="server" OnItemDataBound="R1_ItemDataBound">
    <HeaderTemplate>
        <table id="tableNewRFQDetail" border="1" class="display" style="display: none;font-size:10px;">
            <thead>
                <tr>
                    <th>
                        Part Number
                    </th>
                    <th>
                        Materia/Description
                    </th>
                    <th>
                        Qty. Required
                    </th>
                    <th>
                    </th>
                </tr>
            </thead>
            <tbody>
    </HeaderTemplate>
    <ItemTemplate>
        <tr height='20px;'>
            <td>
                <%# DataBinder.Eval(Container.DataItem, "PartNumber")%>
            </td>
            <td>
                <%# DataBinder.Eval(Container.DataItem, "Material")%>
            </td>
            <td>
                <%# DataBinder.Eval(Container.DataItem, "Qty")%>
            </td>
            <td>
                <asp:LinkButton ID="deleteByID" runat="server" CommandArgument="" CommandName="partID" OnCommand="deleteByID"
                     OnClientClick="return  confirm('Do you wish to delete this line?')">
                    Delete
                </asp:LinkButton>
            </td>
        </tr>
    </ItemTemplate>
    <FooterTemplate>
        </tbody></table>
    </FooterTemplate>
</asp:Repeater>

<script type="text/javascript">
    jQuery(document).ready(function() {
        var table = jQuery('#tableNewRFQDetail').dataTable({
            "bFilter": false,
            "bLengthChange": false,
            "bInfo": false,
            "bPaginate": false
        }).show();
    });
</script>