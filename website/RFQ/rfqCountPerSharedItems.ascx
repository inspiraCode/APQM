<%@ Control Language="C#" AutoEventWireup="true" CodeFile="rfqCountPerSharedItems.ascx.cs" Inherits="RFQ_rfqCountPerSharedItems" %>
<asp:SqlDataSource ID="SqlDataSource" runat="server" 
    ConnectionString="<%$ ConnectionStrings:APQM_DBConnectionString %>" 
    SelectCommand="SELECT [ItemMasterKey], [PartNumber], [Description], [Material], [Cost], [QtyRequired], [RFQCount] FROM [viewRFQCountBySharedItems]">
</asp:SqlDataSource>
<asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
    AllowSorting="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource">
    <Columns>        
        <asp:BoundField DataField="PartNumber" HeaderText="Part Number" 
            SortExpression="PartNumber" />
        <asp:BoundField DataField="Description" HeaderText="Description" 
            SortExpression="Description" />
        <asp:BoundField DataField="Material" HeaderText="Material" 
            SortExpression="Material" />
        <asp:BoundField DataField="Cost" HeaderText="Cost" SortExpression="Cost" />
        <asp:BoundField DataField="QtyRequired" HeaderText="Quantity Required" 
            SortExpression="QtyRequired" />
        <asp:BoundField DataField="RFQCount" HeaderText="RFQ Sent" 
            SortExpression="RFQCount" />
    </Columns>
</asp:GridView>
