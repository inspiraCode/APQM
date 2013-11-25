<%@ Control Language="C#" AutoEventWireup="true" CodeFile="rfqCountPerSharedItems.ascx.cs" Inherits="rfqCountPerSharedItems" %>
<div align="center" >
    <asp:GridView ID="gridRFQCountPerSharedItems" runat="server" AllowPaging="False" class="display" style="display:none;" OnPreRender="preRenderGridView"
        AllowSorting="False" AutoGenerateColumns="False" DataSourceID="SqlDataSource" RowStyle-Height="27px">
        <Columns>
            <asp:BoundField DataField="ItemMasterKey" HeaderText="ItemMasterKey" 
                SortExpression="ItemMasterKey" Visible="false"/>
            <asp:BoundField DataField="PartNumber" HeaderText="Part Number" 
                SortExpression="PartNumber" />
            <asp:BoundField DataField="Material" HeaderText="Material" 
                SortExpression="Material" />
            <asp:BoundField DataField="Cost" HeaderText="Cost" SortExpression="Cost" />
            <asp:BoundField DataField="QtyRequired" HeaderText="Quantity Required" 
                SortExpression="QtyRequired" />
            <asp:BoundField DataField="RFQSent" HeaderText="RFQ Sent" 
                SortExpression="RFQSent" />
        </Columns>
    </asp:GridView>
</div>
<div id="divRfqList" runat="server" align="center">
</div>
<asp:SqlDataSource ID="SqlDataSource" runat="server"   OnInit="on_sqldatasource_Init"
    
    SelectCommand="SELECT [ItemMasterKey], [PartNumber], [Description], [Material], [Cost], [QtyRequired], [RFQSent] FROM [viewRFQCountBySharedItems]">
</asp:SqlDataSource>
<script type="text/javascript">
    jQuery(document).ready(function() {
    jQuery('#<%= this.gridRFQCountPerSharedItems.ClientID %>').dataTable().show();
    });
</script>