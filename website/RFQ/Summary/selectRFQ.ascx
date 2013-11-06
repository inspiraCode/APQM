<%@ Control Language="C#" AutoEventWireup="true" CodeFile="selectRFQ.ascx.cs" Inherits="RFQ_Summary_selectRFQ" %>
<p>
            <asp:Label ID="lblRFQHeaderKey" runat="server" Width="200px" 
        Visible="False"></asp:Label>
        </p>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
    OnInit="on_sqldatasource_Init"
    ProviderName="System.Data.SqlClient" 
    
    SelectCommand="SELECT RFQHeader.RFQHeaderKey, SIFHeader.InquiryNumber, BOMHeader.TopPartNumber, ItemMaster.PartNumber, viewRFQNumber.RFQGenerated, SupplierMaster.SupplierName, BOMDetail.Cost FROM SIFHeader INNER JOIN BOMHeader ON SIFHeader.SIFHeaderKey = BOMHeader.SIFHeaderKey INNER JOIN BOMDetail ON BOMHeader.BOMHeaderKey = BOMDetail.BOMHeaderKey INNER JOIN ItemMaster ON BOMDetail.ItemMasterKey = ItemMaster.ItemMasterKey INNER JOIN RFQHeader ON BOMDetail.BOMDetailKey = RFQHeader.BOMDetailKey INNER JOIN SupplierMaster ON RFQHeader.SupplierMasterKey = SupplierMaster.SupplierMasterKey INNER JOIN viewRFQNumber ON RFQHeader.RFQNumberKey = viewRFQNumber.RFQNumberKey WHERE (RFQHeader.RFQHeaderKey = @key )" 
    ConnectionString="Data Source=CAPSP;Initial Catalog=APQM_DB;Integrated Security=True">
    <SelectParameters>
        <asp:ControlParameter ControlID="lblRFQHeaderKey" Name="key" 
            PropertyName="Text" />
    </SelectParameters>
</asp:SqlDataSource>
        <asp:FormView ID="frmSelectRFQ" runat="server" 
    DataSourceID="SqlDataSource1">           
            <ItemTemplate>
                RFQ Header Key:
                <asp:Label ID="RFQHeaderKeyLabel" runat="server" 
                    Text='<%# Eval("RFQHeaderKey") %>' />
                <br />
                Inquiry Number:
                <asp:Label ID="InquiryNumberLabel" runat="server" 
                    Text='<%# Bind("InquiryNumber") %>' />
                <br />
                Top Part Number:
                <asp:Label ID="TopPartNumberLabel" runat="server" 
                    Text='<%# Bind("TopPartNumber") %>' />
                <br />
                Part Number:
                <asp:Label ID="PartNumberLabel" runat="server" 
                    Text='<%# Bind("PartNumber") %>' />
                <br />
                RFQ Number:
                <asp:Label ID="RFQNumberLabel" runat="server" Text='<%# Bind("RFQGenerated") %>' />
                <br />
                Supplier Name:
                <asp:Label ID="SupplierNameLabel" runat="server" 
                    Text='<%# Bind("SupplierName") %>' />
                <br />
                Current Cost:
                <asp:Label ID="CostLabel" runat="server" Text='<%# Bind("Cost") %>' />
                <br />
            </ItemTemplate>
</asp:FormView>

<p>
    New Cost:
    <asp:Label ID="lblNewCost" runat="server" Text=""></asp:Label>
    <br />
            <asp:CheckBox ID="chkUpdateBOMLineCost" runat="server" Text="Update Cost for this BOM Line" />
        </p>
            <div align="center">
                <asp:Button ID="btnSave" runat="server" Text="Save" Width="90px" 
                    onclick="btnSave_Click" />
                <asp:Button ID="btnCancel" runat="server" Text="Cancel" Width="90px" 
                    onclick="btnCancel_Click" />
            </div>
        

