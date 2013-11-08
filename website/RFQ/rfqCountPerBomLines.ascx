<%@ Control Language="C#" AutoEventWireup="true" CodeFile="rfqCountPerBomLines.ascx.cs"
    Inherits="rfqCountPerBomLines" %>
<asp:SqlDataSource ID="SqlDataSourceRFQCountPerBOMDetail" OnInit="on_sqldatasource_Init"
    runat="server" SelectCommand="SELECT * FROM [viewRFQCountPerBOMDetail] ORDER BY [InquiryNumber], [TopPartNumber], [PartNumber]">
</asp:SqlDataSource>
<div align="center">
    <asp:GridView ID="GridViewRFQCountPerBOMDetail" runat="server" AllowPaging="False"
        OnPreRender="preRenderGridView" class="display" Style="display: none;" AutoGenerateColumns="False"
        DataSourceID="SqlDataSourceRFQCountPerBOMDetail" OnRowCommand="gridView_RowCommand"
        DataKeyNames="BOMDetailKey, SIFHeaderKey" PagerSettings-PageButtonCount="10"
        AllowSorting="False" RowStyle-Height="27px">
        <Columns>
            <asp:BoundField DataField="BOMDetailKey" HeaderText="BOMDetailKey" SortExpression="BOMDetailKey"
                Visible="False" />
            <asp:BoundField DataField="InquiryNumber" HeaderText="Inquiry Number" SortExpression="InquiryNumber" />
            <asp:BoundField DataField="TopPartNumber" HeaderText="Top Part Number" SortExpression="TopPartNumber" />
            <asp:BoundField DataField="PartDescription" HeaderText="Top Description" SortExpression="PartDescription" />
            <asp:BoundField DataField="PartNumber" HeaderText="Line Part Number" SortExpression="PartNumber" />
            <asp:BoundField DataField="Description" HeaderText="Line Description" SortExpression="Description" />
            <asp:BoundField DataField="Qty" HeaderText="Line Quantity" SortExpression="Qty" />
            <asp:BoundField DataField="Cost" HeaderText="Line Cost" SortExpression="Cost" />
            <asp:ButtonField CommandName="seeRFQ" DataTextField="RFQCount" SortExpression="RFQCount"
                Text="See RFQs" HeaderText="RFQ Sent" />
            <asp:ButtonField CommandName="sendNewRFQ" Text="New" />
            <asp:ButtonField CommandName="rfqSummary" Text="Summary" />
        </Columns>
    </asp:GridView>
</div>

<script type="text/javascript">
    jQuery(document).ready(function() {
        jQuery('#<%= this.GridViewRFQCountPerBOMDetail.ClientID %>').dataTable().show();
    });
</script>

