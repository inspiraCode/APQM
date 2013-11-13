<%@ Control Language="C#" AutoEventWireup="true" CodeFile="rfqCountPerBomLines.ascx.cs"
    Inherits="rfqCountPerBomLines" %>
<asp:SqlDataSource ID="SqlDataSourceRFQCountPerBOMDetail" OnInit="on_sqldatasource_Init"
    runat="server" SelectCommand="SELECT * FROM [viewRFQCountPerBOMDetail] ORDER BY [InquiryNumber], [TopPartNumber], [PartNumber]">
</asp:SqlDataSource>
<div align="center">
    <asp:GridView ID="GridViewRFQCountPerBOMDetail" runat="server"
        OnPreRender="preRenderGridView" class="display"  AutoGenerateColumns="False"
        DataSourceID="SqlDataSourceRFQCountPerBOMDetail" OnRowCommand="gridView_RowCommand"
        DataKeyNames="BOMDetailKey,SIFHeaderKey"  Style="display: none;"
        PagerSettings-PageButtonCount="10" RowStyle-Height="27px">
<RowStyle Height="27px"></RowStyle>
        <Columns>
            <asp:BoundField DataField="BOMDetailKey" HeaderText="BOMDetailKey" Visible="False" />
            <asp:BoundField DataField="InquiryNumber" HeaderText="Inquiry Number" />
            <asp:BoundField DataField="Revision" HeaderText="Revision" />
            <asp:BoundField DataField="TopPartNumber" HeaderText="Top Part Number" />
            <asp:BoundField DataField="PartDescription" HeaderText="Product" />
            <asp:BoundField DataField="AnnualVolume" HeaderText="Annual Volume" />
            <asp:BoundField DataField="AutoAero" HeaderText="Auto / Aero" />
            <asp:BoundField DataField="PartNumber" HeaderText="Line Part Number" />
            <asp:BoundField DataField="CapsonicPN" HeaderText="Capsonic PN" />
            <asp:BoundField DataField="ManufacturePN" HeaderText="Manufacture PN" />
            <asp:BoundField DataField="SupplierPN" HeaderText="Supplier PN" />
            <asp:BoundField DataField="CommCode" HeaderText="Comm Code" />
            <asp:BoundField DataField="VendorQuoteEst" HeaderText="Vendor Quote Est" />
            <asp:BoundField DataField="Qty" HeaderText="No Required"  />            
            <asp:BoundField DataField="CapComAssm" HeaderText="Cap Com Assm" />
            <asp:BoundField DataField="DirectedBuy" HeaderText="Directed Buy" />
            <asp:BoundField DataField="PurchasingStatus" HeaderText="Purchasing Status"  />
            <asp:BoundField DataField="PurchasingComments" HeaderText="Purchasing Comments" />
            <asp:BoundField DataField="SalesComments" HeaderText="Sales Comments" />
            
            <asp:TemplateField HeaderText="RFQ Sent" ShowHeader="true">
                <ItemTemplate>
                <asp:LinkButton runat="server" Text='<%# Eval("RFQCount") %>' CommandArgument='<%# Eval("RFQCount") %>' CommandName="seeRFQ" OnClientClick='<%# "return (" + Eval("RFQCount") + "> 0);" %>' />
                </ItemTemplate>
            </asp:TemplateField>
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

