<%@ Control Language="C#" AutoEventWireup="true" CodeFile="bomList.ascx.cs" Inherits="bomList" %>
<div align="center" >
    <asp:Repeater ID="Repeater1" runat="server" OnItemDataBound="R1_ItemDataBound">
        <HeaderTemplate>
            <table border="1" id="tableBOM" class="display">
             <thead>
                <th>
                    Top Part Number
                </th>
                <th>
                    SIF
                </th>
                <th>
                    Part Description
                </th>
                <th>
                    Revision
                </th>
                <th>
                </th>
            </tr>
            </thead>
            <tbody>
        </HeaderTemplate>
        <ItemTemplate>
            <tr height='27px;'>
                <td>
                    <asp:LinkButton ID="updateByID" runat="server" CommandArgument="" CommandName="bomID"
                        OnCommand="updateByID">                    
                    <%# DataBinder.Eval(Container.DataItem, "TopPartNumber")%>
                    </asp:LinkButton>
                </td>
                <td>
                    <asp:LinkButton ID="updateSIF" runat="server" CommandArgument="" CommandName="sifID"
                        OnCommand="updateBySIFID">                    
                        None
                    </asp:LinkButton>
                </td>
                <td>
                    <%# DataBinder.Eval(Container.DataItem, "PartDescription")%>
                </td>
                <td>
                    <%# DataBinder.Eval(Container.DataItem, "Revision")%>
                </td>
                <td>
                    <asp:LinkButton ID="deleteByID" runat="server" CommandArgument="" CommandName="bomID"
                        OnCommand="deleteByID" OnClientClick="return  confirm('Do you wish to delete this BOM?')">
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
        jQuery('#tableBOM').dataTable();
    });
</script>