<%@ Control Language="C#" AutoEventWireup="true" CodeFile="selectSIF.ascx.cs" Inherits="RFQ_Summary_selectSIF" %>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ProviderName="System.Data.SqlClient" OnInit="on_sqldatasource_Init"
    SelectCommand="SELECT [SIFHeaderKey], [BOMHeaderKey], [InquiryNumber], [Priority], [Revision], [SalesPerson], [CostModelLoc], [TopPartNumber], [CustomerName] FROM [viewSIF_ReadAll]">
</asp:SqlDataSource>
<div align="center">
    <asp:GridView ID="GridViewSif" runat="server" AutoGenerateColumns="False" OnPreRender="preRenderGridView"
        class="display"  DataSourceID="SqlDataSource1" OnRowCommand="gridView_RowCommand"
        DataKeyNames="BOMHeaderKey" RowStyle-Height="27px">
        <Columns>
            <asp:ButtonField CommandName="selectSIF" DataTextField="InquiryNumber" HeaderText="Inquiry Number"
                ShowHeader="True" SortExpression="InquiryNumber" />
            <asp:BoundField DataField="Priority" HeaderText="Priority" SortExpression="Priority" />
            <asp:BoundField DataField="Revision" HeaderText="Revision" SortExpression="Revision" />
            <asp:BoundField DataField="SalesPerson" HeaderText="Sales Person" SortExpression="SalesPerson" />
            <asp:BoundField DataField="CostModelLoc" HeaderText="Cost Model Location" SortExpression="CostModelLoc" />
            <asp:ButtonField CommandName="selectSIF" DataTextField="TopPartNumber" HeaderText="Top Part Number"
                SortExpression="TopPartNumber" />
            <asp:BoundField DataField="CustomerName" HeaderText="Customer Name" SortExpression="CustomerName" />
        </Columns>
    </asp:GridView>
</div>

<script type="text/javascript">
    jQuery(document).ready(function() {
        jQuery('#<%= this.GridViewSif.ClientID %>').dataTable({"bStateSave":true}).show();
    });
</script>

