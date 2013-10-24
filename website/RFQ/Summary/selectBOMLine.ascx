<%@ Control Language="C#" AutoEventWireup="true" CodeFile="selectBOMLine.ascx.cs" Inherits="RFQ_Summary_selectBOMLine" %>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
    ProviderName="System.Data.SqlClient" OnInit="on_sqldatasource_Init"
    SelectCommand="SELECT [BOMDetailKey], [BOMHeaderKey], [ItemMasterKey], [Qty], [Cost], [Status], [Description], [PartNumber], [UM], [Material] FROM [viewBOMDetail_ReadAll] WHERE ([BOMHeaderKey] = @BOMHeaderKey)">
    <SelectParameters>
        <asp:ControlParameter ControlID="lblBOMHeaderKey" Name="BOMHeaderKey" 
            PropertyName="Text" Type="Decimal" />
    </SelectParameters>
</asp:SqlDataSource>
<asp:Label ID="lblBOMHeaderKey" runat="server" Text="Label" Visible="False"></asp:Label>
<div>
    <asp:FormView ID="FormView1" runat="server" DataSourceID="SqlDataSourceForm">
        <EditItemTemplate>
            InquiryNumber:
            <asp:TextBox ID="InquiryNumberTextBox" runat="server" 
                Text='<%# Bind("InquiryNumber") %>' />
            <br />
            Priority:
            <asp:TextBox ID="PriorityTextBox" runat="server" 
                Text='<%# Bind("Priority") %>' />
            <br />
            SalesPerson:
            <asp:TextBox ID="SalesPersonTextBox" runat="server" 
                Text='<%# Bind("SalesPerson") %>' />
            <br />
            TopPartNumber:
            <asp:TextBox ID="TopPartNumberTextBox" runat="server" 
                Text='<%# Bind("TopPartNumber") %>' />
            <br />
            PartDescription:
            <asp:TextBox ID="PartDescriptionTextBox" runat="server" 
                Text='<%# Bind("PartDescription") %>' />
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
            Priority:
            <asp:TextBox ID="PriorityTextBox" runat="server" 
                Text='<%# Bind("Priority") %>' />
            <br />
            SalesPerson:
            <asp:TextBox ID="SalesPersonTextBox" runat="server" 
                Text='<%# Bind("SalesPerson") %>' />
            <br />
            TopPartNumber:
            <asp:TextBox ID="TopPartNumberTextBox" runat="server" 
                Text='<%# Bind("TopPartNumber") %>' />
            <br />
            PartDescription:
            <asp:TextBox ID="PartDescriptionTextBox" runat="server" 
                Text='<%# Bind("PartDescription") %>' />
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
            Priority:
            <asp:Label ID="PriorityLabel" runat="server" Text='<%# Bind("Priority") %>' />
            <br />
            SalesPerson:
            <asp:Label ID="SalesPersonLabel" runat="server" 
                Text='<%# Bind("SalesPerson") %>' />
            <br />
            TopPartNumber:
            <asp:Label ID="TopPartNumberLabel" runat="server" 
                Text='<%# Bind("TopPartNumber") %>' />
            <br />
            PartDescription:
            <asp:Label ID="PartDescriptionLabel" runat="server" 
                Text='<%# Bind("PartDescription") %>' />
            <br />
        </ItemTemplate>
    </asp:FormView>
    
</div><br />
<asp:GridView ID="gridViewBOM" runat="server" AutoGenerateColumns="False" 
    DataSourceID="SqlDataSource1" OnRowCommand="gridView_RowCommand" DataKeyNames="BOMDetailKey"
    OnPreRender="preRenderGridView" class="display" style="display:none;"
    RowStyle-Height="27px">
    <Columns>
        <asp:ButtonField DataTextField="PartNumber" HeaderText="Part Number" 
            SortExpression="PartNumber" CommandName="selectBOM" />
        <asp:BoundField DataField="Description" HeaderText="Description" 
            SortExpression="Description" />
        <asp:BoundField DataField="Material" HeaderText="Material" 
            SortExpression="Material" />
        <asp:BoundField DataField="Qty" HeaderText="Quantity" SortExpression="Qty" />
        <asp:BoundField DataField="UM" HeaderText="UM" SortExpression="UM" />
        <asp:BoundField DataField="Cost" HeaderText="Cost" SortExpression="Cost" />
        <asp:BoundField DataField="Status" HeaderText="Status" 
            SortExpression="Status" />
    </Columns>
</asp:GridView>
<asp:SqlDataSource ID="SqlDataSourceForm" runat="server"     
    ProviderName="System.Data.SqlClient"  OnInit="on_sqldatasource_Init"
    SelectCommand="SELECT SIFHeader.InquiryNumber, SIFHeader.Priority, SIFHeader.SalesPerson, BOMHeader.TopPartNumber, BOMHeader.PartDescription FROM BOMHeader INNER JOIN SIFHeader ON BOMHeader.SIFHeaderKey = SIFHeader.SIFHeaderKey WHERE (BOMHeader.BOMHeaderKey = @key )">
    <SelectParameters>
        <asp:ControlParameter ControlID="lblBOMHeaderKey" Name="key" 
            PropertyName="Text" />
    </SelectParameters>
</asp:SqlDataSource>

<script type="text/javascript">
    jQuery(document).ready(function() {
    jQuery('#<%= this.gridViewBOM.ClientID %>').dataTable().show();
    });
</script>
