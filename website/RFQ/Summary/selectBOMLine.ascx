<%@ Control Language="C#" AutoEventWireup="true" CodeFile="selectBOMLine.ascx.cs"
    Inherits="RFQ_Summary_selectBOMLine" %>
<style type="text/css">
    .StaticWidth
    {
        text-overflow: ellipsis;
        overflow: hidden;
        white-space: nowrap;
        max-width: 50px;
        min-width: 50px;
    }
</style>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ProviderName="System.Data.SqlClient"
    OnInit="on_sqldatasource_Init" SelectCommand="SELECT * FROM [viewRFQCompleted]">
</asp:SqlDataSource>
<div>
</div>
<br />
<asp:GridView ID="gridViewBOM" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1"
    OnRowCommand="gridView_RowCommand" OnPreRender="preRenderGridView" class="display"
    Style="display: none;" RowStyle-Height="27px" DataKeyNames="BOMDetailKey, ONE_SELECTED"
    OnRowCreated="gridViewBOM_RowCreated">
    <RowStyle Height="27px"></RowStyle>
    <Columns>
        <asp:ButtonField  CommandName="selectBOM" Text="Select" ItemStyle-HorizontalAlign="Center" ItemStyle-CssClass="StaticWidth"  />
        <asp:BoundField ItemStyle-CssClass="StaticWidth" DataField="InquiryNumber" HeaderText="Inquiry Number" SortExpression="InquiryNumber"
            ItemStyle-HorizontalAlign="Center" />
        <asp:BoundField ItemStyle-CssClass="StaticWidth" DataField="Revision" HeaderText="Revision" SortExpression="Revision"
            ItemStyle-HorizontalAlign="Center" />
        <asp:BoundField ItemStyle-CssClass="StaticWidth" DataField="PartDescription" HeaderText="Finished Good Description"
            SortExpression="PartDescription" ItemStyle-HorizontalAlign="Center" />
        <asp:BoundField ItemStyle-CssClass="StaticWidth" DataField="PartNumber" HeaderText="Component Part Number" SortExpression="PartNumber"
            ItemStyle-HorizontalAlign="Center" />
        <asp:BoundField ItemStyle-CssClass="StaticWidth" DataField="Material" HeaderText="Component Part Description" SortExpression="Material"
            ItemStyle-HorizontalAlign="Center" />
        <asp:BoundField ItemStyle-CssClass="StaticWidth" DataField="Qty" HeaderText="Qty Required" SortExpression="Qty" ItemStyle-HorizontalAlign="Center" />
        <asp:BoundField ItemStyle-CssClass="StaticWidth" DataField="RFQ COMPLETED" HeaderText="RFQ COMPLETED" ReadOnly="True"
            SortExpression="RFQ COMPLETED" ItemStyle-HorizontalAlign="Center" />
        <asp:BoundField ItemStyle-CssClass="StaticWidth" DataField="RFQ Sent" HeaderText="RFQ Sent" SortExpression="RFQ Sent"
            ItemStyle-HorizontalAlign="Center" />
    </Columns>
</asp:GridView>
<div style="display: inline-block;position: absolute;width: 590px;top: 370px;left: 14px;">
<br />
    <div style="background-color: #FFD700;width: 30px;height: 21px;display: inline-block;margin-right: 8px;"></div>At least one RFQ is selected/awarded.
</div>

<script type="text/javascript">
    jQuery(document).ready(function () {
        jQuery('#<%= this.gridViewBOM.ClientID %>').dataTable({ "bStateSave": true }).show();
    });
</script>
