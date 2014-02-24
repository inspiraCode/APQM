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
            <asp:BoundField DataField="InquiryNumber" HeaderText="Inquiry Number" ItemStyle-HorizontalAlign="Center" />
            <asp:BoundField DataField="Revision" HeaderText="Revision" ItemStyle-HorizontalAlign="Center" />
            <asp:BoundField DataField="TopPartNumber" HeaderText="Finished Good Part Number" ItemStyle-HorizontalAlign="Center" />
            <asp:BoundField DataField="PartDescription" HeaderText="Product" ItemStyle-HorizontalAlign="Center" />
            <asp:BoundField DataField="AnnualVolume" HeaderText="Annual Volume" ItemStyle-HorizontalAlign="Center" />
            <asp:BoundField DataField="MarketSector" HeaderText="Market Sector" ItemStyle-HorizontalAlign="Center" />
            <asp:BoundField DataField="PartNumber" HeaderText="Component Part Number" ItemStyle-HorizontalAlign="Center" />
            <asp:BoundField DataField="Material" HeaderText="Part Name" ItemStyle-HorizontalAlign="Center" />
            <asp:BoundField DataField="CapsonicPN" HeaderText="Capsonic PN" ItemStyle-HorizontalAlign="Center" Visible="false"/>
            <asp:BoundField DataField="ManufacturePN" HeaderText="Manufacture PN" ItemStyle-HorizontalAlign="Center" />
            <asp:BoundField DataField="SupplierPN" HeaderText="Supplier PN" ItemStyle-HorizontalAlign="Center"  Visible="false"/>
            <asp:BoundField DataField="CommCode" HeaderText="Comm Code" ItemStyle-HorizontalAlign="Center" />
            <asp:BoundField DataField="VendorQuoteEst" HeaderText="Vendor Quote Est" ItemStyle-HorizontalAlign="Center" />
            <asp:BoundField DataField="Qty" HeaderText="Qty Required" ItemStyle-HorizontalAlign="Center"  />            
            <asp:BoundField DataField="CapComAssm" HeaderText="Cap Com Assm" ItemStyle-HorizontalAlign="Center" />
            <asp:BoundField DataField="DirectedBuy" HeaderText="Directed Buy" ItemStyle-HorizontalAlign="Center" />
            <asp:BoundField DataField="PurchasingStatus" HeaderText="Purchasing Status" ItemStyle-HorizontalAlign="Center"  />
            <asp:BoundField DataField="PurchasingComments" HeaderText="Purchasing Comments" ItemStyle-HorizontalAlign="Center" />
            <asp:BoundField DataField="SalesComments" HeaderText="Sales Comments" ItemStyle-HorizontalAlign="Center" />
            
            <asp:TemplateField HeaderText="RFQ Sent" ShowHeader="true" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                <asp:LinkButton runat="server" Text='<%# Eval("RFQCount") %>' CommandArgument='<%# Eval("RFQCount") %>' CommandName="seeRFQ" OnClientClick='<%# "return (" + Eval("RFQCount") + "> 0);" %>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:ButtonField CommandName="sendNewRFQ" Text="New" ItemStyle-HorizontalAlign="Center" />
            <asp:TemplateField HeaderText="" ShowHeader="true" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                <asp:LinkButton runat="server" Text='Summary' CommandName="rfqSummary" OnClientClick='<%# "return (" + Eval("RFQCount") + "> 0);" %>' />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
</div>

<script type="text/javascript">
    jQuery(document).ready(function() {
        jQuery('#<%= this.GridViewRFQCountPerBOMDetail.ClientID %>').dataTable({"bStateSave":true}).show();
    });
</script>

