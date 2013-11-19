<%@ Page Title="" Language="C#" MasterPageFile="~/_Layouts/MasterBaseStatic.master"
    AutoEventWireup="true" CodeFile="SalesReport.aspx.cs" Inherits="HTMLReports_SalesReport" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderBase" runat="Server">
<style>
    .HeaderTable
    {
        font-weight:bold;
    }
</style>
<br />
    <asp:Label ID="lblBOMHeader" runat="server" Text="" Visible="False"></asp:Label>
    <asp:Panel ID="panelContent" runat="server">
        <asp:FormView ID="FormView1" runat="server" DataSourceID="SqlDataSourceForm">
            <ItemTemplate>
                <table cellspacing="0" style="width: 100%">
                    <tr>
                        <td align="right" class="HeaderTable">
                            Inquiry Number:
                        </td>
                        <td align="left">
                            <asp:Label ID="InquiryNumberLabel" runat="server" Text='<%# Bind("InquiryNumber") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td align="right" class="HeaderTable">
                            Revision:
                        </td>
                        <td align="left">
                            <asp:Label ID="RevisionLabel" runat="server" Text='<%# Bind("Revision") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td align="right" class="HeaderTable">
                            Sales Person:
                        </td>
                        <td align="left">
                            <asp:Label ID="SalesPersonLabel" runat="server" Text='<%# Bind("SalesPerson") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td align="right" class="HeaderTable">
                            Customer Name:
                        </td>
                        <td align="left">
                            <asp:Label ID="CustomerNameLabel" runat="server" Text='<%# Bind("CustomerName") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td align="right" class="HeaderTable">
                            Finished Good PN:
                        </td>
                        <td align="left">
                            <asp:Label ID="TopPartNumberLabel" runat="server" Text='<%# Bind("TopPartNumber") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td align="right" class="HeaderTable">
                            Annual Volume:
                        </td>
                        <td align="left">
                            <asp:Label ID="AnnualVolumeLabel" runat="server" Text='<%# Bind("AnnualVolume") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td align="right" class="HeaderTable">
                            Market Sector:
                        </td>
                        <td align="left">
                            <asp:Label ID="MarketSectorLabel" runat="server" Text='<%# Bind("MarketSector") %>' />
                        </td>
                    </tr>
                </table>
            </ItemTemplate>
        </asp:FormView>
        <br />
        <br />
        <asp:GridView ID="gridSalesReport" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="PartNumber" HeaderText="Part Number" SortExpression="PartNumber" />
                <asp:BoundField DataField="CapsonicPN" HeaderText="Capsonic PN" SortExpression="CapsonicPN" />
                <asp:BoundField DataField="CustomerPN" HeaderText="Customer PN" SortExpression="CustomerPN" />
                <asp:BoundField DataField="ManufacturePN" HeaderText="Manufacture PN" SortExpression="ManufacturePN" />
                <asp:BoundField DataField="SupplierPN" HeaderText="Supplier PN" SortExpression="SupplierPN" />
                <asp:BoundField DataField="CommCode" HeaderText="Comm Code" SortExpression="CommCode" />
                <asp:BoundField DataField="Material" HeaderText="Material" SortExpression="Material" />
                <asp:BoundField DataField="VendorQuoteEst" HeaderText="Vendor Quote Est" SortExpression="VendorQuoteEst" />
                <asp:BoundField DataField="Qty" HeaderText="No Required" SortExpression="Qty" />
                <asp:BoundField DataField="EAU" HeaderText="EAU" SortExpression="EAU" />
                <asp:BoundField DataField="MOQ" HeaderText="MOQ" SortExpression="MOQ" />
                <asp:BoundField DataField="SupplierName" HeaderText="Supplier Name" SortExpression="SupplierName" />
                <asp:BoundField DataField="CapComAssm" HeaderText="Cap ComA ssm" SortExpression="CapComAssm" />
                <asp:BoundField DataField="PurchasingComments" HeaderText="Purchasing Comments" SortExpression="PurchasingComments" />
                <asp:BoundField DataField="ToolingDetail" HeaderText="Tooling Detail" SortExpression="ToolingDetail" />
                <asp:BoundField DataField="ProductionToolingLeadTime" HeaderText="Production Tooling Lead Time"
                    SortExpression="ProductionToolingLeadTime" />
                <asp:BoundField DataField="ProductionLeadTime" HeaderText="Production Lead Time" SortExpression="ProductionLeadTime" />
            </Columns>
        </asp:GridView>
    </asp:Panel>
    <br />
    <br />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" OnInit="on_sqldatasource_Init"
        ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [viewSalesReportDetail] WHERE ([BOMHeaderKey] = @BOMHeaderKey) ORDER BY [PartNumber]">
        <SelectParameters>
            <asp:ControlParameter ControlID="lblBOMHeader" Name="BOMHeaderKey" PropertyName="Text"
                Type="Decimal" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:Button ID="btnExportToExcel" runat="server" OnClick="btnExportToExcel_Click"
        Text="Export" />
        <br />
        <br />
    <asp:SqlDataSource ID="SqlDataSourceForm" runat="server" OnInit="on_sqldatasource_Init"
        ProviderName="System.Data.SqlClient" SelectCommand="SELECT SIFHeader.InquiryNumber, SIFHeader.Revision, SIFHeader.SalesPerson, CustomerMaster.CustomerName, BOMHeader.TopPartNumber, BOMHeader.AnnualVolume, MarketSector.Name AS MarketSector FROM SIFHeader INNER JOIN BOMHeader ON SIFHeader.SIFHeaderKey = BOMHeader.SIFHeaderKey INNER JOIN CustomerMaster ON SIFHeader.CustomerKey = CustomerMaster.CustomerKey INNER JOIN MarketSector ON SIFHeader.MarketSector = MarketSector.MarketSectorID WHERE (BOMHeader.BOMHeaderKey = @BOMHeaderKey)">
        <SelectParameters>
            <asp:ControlParameter ControlID="lblBOMHeader" Name="BOMHeaderKey" PropertyName="Text" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
