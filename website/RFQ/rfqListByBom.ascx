<%@ Control Language="C#" AutoEventWireup="true" CodeFile="rfqListByBom.ascx.cs" Inherits="rfqListByBom" %>
<style type="text/css">
    .style1
    {
        width: 70%;
    }
    .style2
    {
        width: 141px;
    }
</style>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" OnInit="on_sqldatasource_Init"    
    SelectCommand="SELECT [RFQHeaderKey], [RFQNumber], [PartNumber], [SupplierName], [DueDate], [SentToVendor], [Status] FROM [viewRFQHeader_ReadAll] WHERE ([BOMDetailKey] = @BOMDetailKey)">
    <SelectParameters>
        <asp:ControlParameter ControlID="lblBomDetailID" DefaultValue="-1" 
            Name="BOMDetailKey" PropertyName="Text" Type="Decimal" />
    </SelectParameters>
</asp:SqlDataSource>
<asp:Label ID="lblBomDetailID" runat="server" Text="" Visible="false"></asp:Label>

<div align="center">

    <asp:FormView ID="frmBOMLine" runat="server" 
        DataSourceID="SqlDataSourceRFQCountPerBOMDetail" Width="480px">
        <EditItemTemplate>
            <div width="100px" >InquiryNumber:</div>
            <asp:TextBox ID="InquiryNumberTextBox" runat="server" 
                Text='<%# Bind("InquiryNumber") %>' />
            <br />
            TopPartNumber:
            <asp:TextBox ID="TopPartNumberTextBox" runat="server" 
                Text='<%# Bind("TopPartNumber") %>' />
            <br />
            PartDescription:
            <asp:TextBox ID="PartDescriptionTextBox" runat="server" 
                Text='<%# Bind("PartDescription") %>' />
            <br />
            PartNumber:
            <asp:TextBox ID="PartNumberTextBox" runat="server" 
                Text='<%# Bind("PartNumber") %>' />
            <br />
            Description:
            <asp:TextBox ID="DescriptionTextBox" runat="server" 
                Text='<%# Bind("Description") %>' />
            <br />
            Qty:
            <asp:TextBox ID="QtyTextBox" runat="server" Text='<%# Bind("Qty") %>' />
            <br />
            Cost:
            <asp:TextBox ID="CostTextBox" runat="server" Text='<%# Bind("Cost") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <InsertItemTemplate>
            InquiryNumber:
            <asp:TextBox ID="InquiryNumberTextBox" runat="server" 
                Text='<%# Bind("InquiryNumber") %>' />
            <br />
            TopPartNumber:
            <asp:TextBox ID="TopPartNumberTextBox" runat="server" 
                Text='<%# Bind("TopPartNumber") %>' />
            <br />
            PartDescription:
            <asp:TextBox ID="PartDescriptionTextBox" runat="server" 
                Text='<%# Bind("PartDescription") %>' />
            <br />
            PartNumber:
            <asp:TextBox ID="PartNumberTextBox" runat="server" 
                Text='<%# Bind("PartNumber") %>' />
            <br />
            Description:
            <asp:TextBox ID="DescriptionTextBox" runat="server" 
                Text='<%# Bind("Description") %>' />
            <br />
            Qty:
            <asp:TextBox ID="QtyTextBox" runat="server" Text='<%# Bind("Qty") %>' />
            <br />
            Cost:
            <asp:TextBox ID="CostTextBox" runat="server" Text='<%# Bind("Cost") %>' />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
            InquiryNumber:
            <asp:Label ID="InquiryNumberLabel" runat="server" 
                Text='<%# Bind("InquiryNumber") %>' />
            <br />
            TopPartNumber:
            <asp:Label ID="TopPartNumberLabel" runat="server" 
                Text='<%# Bind("TopPartNumber") %>' />
            <br />
            PartDescription:
            <asp:Label ID="PartDescriptionLabel" runat="server" 
                Text='<%# Bind("PartDescription") %>' />
            <br />
            PartNumber:
            <asp:Label ID="PartNumberLabel" runat="server" 
                Text='<%# Bind("PartNumber") %>' />
            <br />
            Description:
            <asp:Label ID="DescriptionLabel" runat="server" 
                Text='<%# Bind("Description") %>' />
            <br />
            Qty:
            <asp:Label ID="QtyLabel" runat="server" Text='<%# Bind("Qty") %>' />
            <br />
            Cost:
            <asp:Label ID="CostLabel" runat="server" Text='<%# Bind("Cost") %>' />
            <br />
        </ItemTemplate>
    </asp:FormView>

<br />
<div style="height:160px;">
<asp:GridView ID="gridRFQbyBOMLine" runat="server" AllowPaging="True" 
    AllowSorting="True" AutoGenerateColumns="False" 
    DataSourceID="SqlDataSource1" PageSize="5" RowStyle-Height="27px">
    <Columns>
        <asp:BoundField DataField="RFQHeaderKey" HeaderText="RFQHeaderKey" 
            SortExpression="RFQHeaderKey" Visible="False" />
        <asp:BoundField DataField="RFQNumber" HeaderText="RFQNumber" 
            SortExpression="RFQNumber" />
        <asp:BoundField DataField="PartNumber" HeaderText="PartNumber" 
            SortExpression="PartNumber" />
        <asp:BoundField DataField="SupplierName" HeaderText="SupplierName" 
            SortExpression="SupplierName" />
        <asp:BoundField DataField="DueDate" DataFormatString="{0:d}" 
            HeaderText="DueDate" SortExpression="DueDate" />
        <asp:BoundField DataField="SentToVendor" DataFormatString="{0:d}" 
            HeaderText="SentToVendor" SortExpression="SentToVendor" />
         <asp:TemplateField HeaderText="Status" SortExpression="Status">
            <ItemTemplate>
                <a target="_blank" href='<%# "rfqFormMain.aspx?rfq=" + Eval("RFQHeaderKey")%>' ><%# Eval("Status")%></a>
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>
</div>

</div>
<asp:SqlDataSource ID="SqlDataSourceRFQCountPerBOMDetail" runat="server" OnInit="on_sqldatasource_Init"
    SelectCommand="SELECT [InquiryNumber], [TopPartNumber], [PartDescription], [PartNumber], [Description], [Qty], [Cost] FROM [viewRFQCountPerBOMDetail] WHERE ([BOMDetailKey] = @BOMDetailKey)">
    <SelectParameters>
        <asp:ControlParameter ControlID="lblBomDetailID" DefaultValue="-1" 
            Name="BOMDetailKey" PropertyName="Text" Type="Decimal" />
    </SelectParameters>
</asp:SqlDataSource>

