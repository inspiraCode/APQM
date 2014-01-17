<%@ Control Language="C#" AutoEventWireup="true" CodeFile="selectRFQ.ascx.cs" Inherits="RFQ_Summary_selectRFQ" %>
<style type="text/css">
    .styleRFQSelectionTable
    {
        width: 350px;
        border-color: lightgray;
        height: 140px;
    }
    .columnInfo
    {
        width: 200px;
    }
</style>
<p>
    <asp:Label ID="lblRFQHeaderKey" runat="server" Width="200px" Visible="False"></asp:Label>
    Do you wish to select this RFQ as a winner?
</p>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" OnInit="on_sqldatasource_Init"
    ProviderName="System.Data.SqlClient" SelectCommand="SELECT RFQHeader.RFQHeaderKey, SIFHeader.InquiryNumber, BOMHeader.TopPartNumber, ItemMaster.PartNumber, viewRFQNumber.RFQGenerated, SupplierMaster.SupplierName, BOMDetail.Cost FROM SIFHeader INNER JOIN BOMHeader ON SIFHeader.SIFHeaderKey = BOMHeader.SIFHeaderKey INNER JOIN BOMDetail ON BOMHeader.BOMHeaderKey = BOMDetail.BOMHeaderKey INNER JOIN ItemMaster ON BOMDetail.ItemMasterKey = ItemMaster.ItemMasterKey INNER JOIN RFQHeader ON BOMDetail.BOMDetailKey = RFQHeader.BOMDetailKey INNER JOIN SupplierMaster ON RFQHeader.SupplierMasterKey = SupplierMaster.SupplierMasterKey INNER JOIN viewRFQNumber ON RFQHeader.RFQNumberKey = viewRFQNumber.RFQNumberKey WHERE (RFQHeader.RFQHeaderKey = @key )">
    <SelectParameters>
        <asp:ControlParameter ControlID="lblRFQHeaderKey" Name="key" PropertyName="Text" />
    </SelectParameters>
</asp:SqlDataSource>
<asp:FormView ID="frmSelectRFQ" runat="server" DataSourceID="SqlDataSource1" Width="100%">
    <ItemTemplate>
        <table cellspacing="0" class="styleRFQSelectionTable" align="center" border="1px"
            style="width: 405px;">
            <tr>
                <td align="right" class="columnInfo">
                    RFQ Number:
                </td>
                <td>
                    <asp:Label ID="RFQNumberLabel" runat="server" Text='<%# Bind("RFQGenerated") %>' />
                </td>
            </tr>
            <tr>
                <td align="right" class="columnInfo">
                    Supplier Name:
                </td>
                <td>
                    <asp:Label ID="SupplierNameLabel" runat="server" Text='<%# Bind("SupplierName") %>' />
                </td>
            </tr>
            <tr>
                <td align="right" class="columnInfo">
                    Inquiry Number:
                </td>
                <td>
                    <asp:Label ID="InquiryNumberLabel" runat="server" Text='<%# Bind("InquiryNumber") %>' />
                </td>
            </tr>
            <tr>
                <td align="right" class="columnInfo">
                    Component Part Number:
                </td>
                <td>
                    <asp:Label ID="PartNumberLabel" runat="server" Text='<%# Bind("PartNumber") %>' />
                </td>
            </tr>
            <tr>
                <td align="right" class="columnInfo">
                    Component Current Cost:
                </td>
                <td>
                    <asp:Label ID="CostLabel" runat="server" Text='<%# string.Format("{0:C}", Eval("Cost")) %>' />
                </td>
            </tr>
        </table>
    </ItemTemplate>
</asp:FormView>
<br />
<div style="border: solid 1px gray; background-color: #DADADA;">
    New Cost from RFQ:
    <asp:Label ID="lblNewCost" runat="server" Text=""></asp:Label>
    <br />
    <asp:CheckBox ID="chkUpdateBOMLineCost" runat="server" Text="Update Cost for this BOM Component" />
</div>
<br />
<div align="center">
    <asp:Button ID="btnSave" runat="server" Text="Select" Width="90px" OnClick="btnSave_Click" />
    <asp:Button ID="btnCancel" runat="server" Text="Cancel" Width="90px" OnClick="btnCancel_Click" />
</div>
