﻿<%@ Page Title="" Language="C#" MasterPageFile="~/_Layouts/MasterBaseStatic.master"
    AutoEventWireup="true" CodeFile="SalesReport.aspx.cs" Inherits="HTMLReports_SalesReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderBase" runat="Server">
    <style>
        .HeaderTable
        {
            font-weight: bold;
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
                        <td align="right" class="HeaderTable">
                            Total Material Cost:
                        </td>
                        <td align="left">
                            <asp:Label ID="lblTotalMaterialCost" runat="server" Text='' />
                        </td>
                    </tr>
                    <tr>
                        <td align="right" class="HeaderTable">
                            Revision:
                        </td>
                        <td align="left">
                            <asp:Label ID="RevisionLabel" runat="server" Text='<%# Bind("Revision") %>' />
                        </td>
                        <td align="right" class="HeaderTable">
                            Total Cost Reduction:
                        </td>
                        <td align="left">
                            <asp:Label ID="lblTotalCostReduction" runat="server" Text='' />
                        </td>
                    </tr>
                    <tr>
                        <td align="right" class="HeaderTable">
                            Sales Person:
                        </td>
                        <td align="left">
                            <asp:Label ID="SalesPersonLabel" runat="server" Text='<%# Bind("SalesPerson") %>' />
                        </td>
                        <td align="left">
                            &nbsp;
                        </td>
                        <td align="left">
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td align="right" class="HeaderTable">
                            Customer Name:
                        </td>
                        <td align="left">
                            <asp:Label ID="CustomerNameLabel" runat="server" Text='<%# Bind("CustomerName") %>' />
                        </td>
                        <td align="left">
                            &nbsp;
                        </td>
                        <td align="left">
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td align="right" class="HeaderTable">
                            Finished Good PN:
                        </td>
                        <td align="left">
                            <asp:Label ID="TopPartNumberLabel" runat="server" Text='<%# Bind("TopPartNumber") %>' />
                        </td>
                        <td align="left">
                            &nbsp;
                        </td>
                        <td align="left">
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td align="right" class="HeaderTable">
                            Annual Volume:
                        </td>
                        <td align="left">
                            <asp:Label ID="AnnualVolumeLabel" runat="server" Text='<%# Bind("AnnualVolume") %>' />
                        </td>
                        <td align="left">
                            &nbsp;
                        </td>
                        <td align="left">
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td align="right" class="HeaderTable">
                            Market Sector:
                        </td>
                        <td align="left">
                            <asp:Label ID="MarketSectorLabel" runat="server" Text='<%# Bind("MarketSector") %>' />
                        </td>
                        <td align="left">
                            &nbsp;
                        </td>
                        <td align="left">
                            &nbsp;
                        </td>
                    </tr>
                </table>
            </ItemTemplate>
        </asp:FormView>
        <br />
        <br />
        <asp:GridView ID="gridSalesReport" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="RFQStatus" ItemStyle-HorizontalAlign="Center" 
                    HeaderText="RFQ Status" SortExpression="RFQStatus" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="LinePosition" ItemStyle-HorizontalAlign="Center" 
                    HeaderText="Material Position" SortExpression="LinePosition" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="PartNumber" ItemStyle-HorizontalAlign="Center" 
                    HeaderText="Part Number" SortExpression="PartNumber" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="CapsonicPN" ItemStyle-HorizontalAlign="Center" 
                    HeaderText="Capsonic PN" SortExpression="CapsonicPN" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="CustomerPN" ItemStyle-HorizontalAlign="Center" 
                    HeaderText="Customer PN" SortExpression="CustomerPN" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="ManufacturePN" ItemStyle-HorizontalAlign="Center" 
                    HeaderText="Manufacture PN" SortExpression="ManufacturePN" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="SupplierPN" ItemStyle-HorizontalAlign="Center" 
                    HeaderText="Supplier PN" SortExpression="SupplierPN" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="CommCode" ItemStyle-HorizontalAlign="Center" 
                    HeaderText="Comm Code" SortExpression="CommCode" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="Material" HeaderText="Material" SortExpression="Material" />
                <asp:BoundField DataField="VendorQuoteEst" ItemStyle-HorizontalAlign="Center" 
                    HeaderText="Vendor Quote Est" SortExpression="VendorQuoteEst" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="Qty" ItemStyle-HorizontalAlign="Right" 
                    HeaderText="Qty Required" SortExpression="Qty" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="EAU" ItemStyle-HorizontalAlign="Right" 
                    HeaderText="EAU" SortExpression="EAU" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="MOQ" HeaderText="MOQ" SortExpression="MOQ" />
                <asp:BoundField DataField="TotalACost" ItemStyle-HorizontalAlign="Right" 
                    HeaderText="Part Cost" SortExpression="TotalACost" DataFormatString="{0:C}" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="SupplierName" ItemStyle-HorizontalAlign="Center" 
                    HeaderText="Supplier Name" SortExpression="SupplierName" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="CapComAssm" ItemStyle-HorizontalAlign="Center" 
                    HeaderText="Cap Com Assm" SortExpression="CapComAssm" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="PurchasingComments" HeaderText="Purchasing Comments" SortExpression="PurchasingComments" />
                <asp:BoundField DataField="ToolingDetail" HeaderText="Tooling Detail" SortExpression="ToolingDetail" />
                <asp:BoundField DataField="ProductionToolingLeadTime" HeaderText="Production Tooling Lead Time"
                    SortExpression="ProductionToolingLeadTime" />
                <asp:BoundField DataField="ProductionLeadTime" HeaderText="Production Lead Time"
                    SortExpression="ProductionLeadTime" />
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