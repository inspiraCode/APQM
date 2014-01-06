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
        <asp:BoundField DataField="InquiryNumber" HeaderText="InquiryNumber" 
            SortExpression="InquiryNumber" />
        <asp:BoundField DataField="Revision" HeaderText="Revision" 
            SortExpression="Revision" />
        <asp:BoundField DataField="PartDescription" HeaderText="PartDescription" 
            SortExpression="PartDescription" />
        <asp:BoundField DataField="BOMDetailKey" HeaderText="BOMDetailKey" 
            SortExpression="BOMDetailKey" />
        <asp:BoundField DataField="PartNumber" HeaderText="PartNumber" 
            SortExpression="PartNumber" />
        <asp:BoundField DataField="Material" HeaderText="Material" 
            SortExpression="Material" />
        <asp:BoundField DataField="Qty" HeaderText="Qty" SortExpression="Qty" />
        <asp:BoundField DataField="RFQ COMPLETED" HeaderText="RFQ COMPLETED" 
            ReadOnly="True" SortExpression="RFQ COMPLETED" />
        <asp:BoundField DataField="RFQ Sent" HeaderText="RFQ Sent" 
            SortExpression="RFQ Sent" />
        <asp:ButtonField CommandName="selectBOM" Text="Select" />
    </Columns>
</asp:GridView>

<script type="text/javascript">
    jQuery(document).ready(function() {
        jQuery('#<%= this.gridViewBOM.ClientID %>').dataTable({"bStateSave":true}).show();
    });
</script>

