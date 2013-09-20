<%@ Control Language="C#" AutoEventWireup="true" CodeFile="rfqList.ascx.cs" Inherits="rfqList" %>
<div align="center">
<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
    DataSourceID="SqlDataSource" AllowPaging="True" AllowSorting="True">
    <Columns>
        <asp:BoundField DataField="RFQHeaderKey" HeaderText="RFQHeaderKey" 
            SortExpression="RFQHeaderKey" />
        <asp:BoundField DataField="RFQNumber" HeaderText="RFQ Number" 
            SortExpression="RFQNumber" />
        <asp:BoundField DataField="PartNumber" HeaderText="Part Number" 
            SortExpression="PartNumber" />
        <asp:BoundField DataField="SupplierName" HeaderText="Vendor" 
            SortExpression="SupplierName" />
        <asp:BoundField DataField="DueDate" HeaderText="Due Date"
            SortExpression="DueDate" />
        <asp:BoundField DataField="Status" HeaderText="Status" 
            SortExpression="Status" />
    </Columns>
</asp:GridView>
<asp:SqlDataSource ID="SqlDataSource" runat="server" 
    ConnectionString="<%$ ConnectionStrings:APQM_DBConnectionString %>" 
    SelectCommand="SELECT * FROM [viewRFQHeader_ReadAll]"></asp:SqlDataSource>
</div>