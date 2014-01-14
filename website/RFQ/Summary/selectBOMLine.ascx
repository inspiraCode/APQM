<%@ Control Language="C#" AutoEventWireup="true" CodeFile="selectBOMLine.ascx.cs"
    Inherits="RFQ_Summary_selectBOMLine" %>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ProviderName="System.Data.SqlClient"
    OnInit="on_sqldatasource_Init" SelectCommand="SELECT * FROM [viewRFQCompleted]">
</asp:SqlDataSource>
<div>
</div>
<br />
<asp:GridView ID="gridViewBOM" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1"
    OnRowCommand="gridView_RowCommand" OnPreRender="preRenderGridView" class="display" style="display:none;"
    RowStyle-Height="27px" DataKeyNames="BOMDetailKey">
    <RowStyle Height="27px"></RowStyle>
    <Columns>
        <asp:BoundField DataField="InquiryNumber" HeaderText="Inquiry Number" 
            SortExpression="InquiryNumber" ItemStyle-HorizontalAlign="Center" />
        <asp:BoundField DataField="Revision" HeaderText="Revision" 
            SortExpression="Revision" ItemStyle-HorizontalAlign="Center" />
        <asp:BoundField DataField="PartDescription" HeaderText="Finished Good Description" 
            SortExpression="PartDescription" ItemStyle-HorizontalAlign="Center" />
        <asp:BoundField DataField="BOMDetailKey" HeaderText="BOMDetailKey" 
            SortExpression="BOMDetailKey" ItemStyle-HorizontalAlign="Center" />
        <asp:BoundField DataField="PartNumber" HeaderText="Component Part Number" 
            SortExpression="PartNumber" ItemStyle-HorizontalAlign="Center" />
        <asp:BoundField DataField="Material" HeaderText="Component Part Description" 
            SortExpression="Material" ItemStyle-HorizontalAlign="Center" />
        <asp:BoundField DataField="Qty" HeaderText="Qty Required" SortExpression="Qty" ItemStyle-HorizontalAlign="Center" />
        <asp:BoundField DataField="RFQ COMPLETED" HeaderText="RFQ COMPLETED" 
            ReadOnly="True" SortExpression="RFQ COMPLETED" ItemStyle-HorizontalAlign="Center" />
        <asp:BoundField DataField="RFQ Sent" HeaderText="RFQ Sent" 
            SortExpression="RFQ Sent" ItemStyle-HorizontalAlign="Center" />
        <asp:ButtonField CommandName="selectBOM" Text="Select" ItemStyle-HorizontalAlign="Center" />
    </Columns>
</asp:GridView>

<script type="text/javascript">
    jQuery(document).ready(function() {
        jQuery('#<%= this.gridViewBOM.ClientID %>').dataTable({"bStateSave":true}).show();
    });
</script>

