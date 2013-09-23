<%@ Control Language="C#" AutoEventWireup="true" CodeFile="rfqList.ascx.cs" Inherits="rfqList" %>
<div align="center">
<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnRowCommand="gridView_RowCommand"
    DataSourceID="SqlDataSource" AllowPaging="True" AllowSorting="True" DataKeyNames="RFQHeaderKey">
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
        <asp:ButtonField CommandName="seeRFQ" DataTextField="Status" 
            HeaderText="Status" Text="Button" />
        <asp:TemplateField HeaderText="Status">
            <ItemTemplate>
                <a target="_blank" href='<%# "rfqFormMain.aspx?rfq=" + Eval("RFQHeaderKey")%>' ><%# Eval("Status")%></a>
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>
<asp:SqlDataSource ID="SqlDataSource" runat="server" OnInit="on_sqldatasource_Init"   
    SelectCommand="SELECT * FROM [viewRFQHeader_ReadAll]"></asp:SqlDataSource>
</div>