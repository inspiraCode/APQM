<%@ Control Language="C#" AutoEventWireup="true" CodeFile="RFQSummaryForm.ascx.cs" Inherits="RFQSummaryForm" %>
<%@ Register src="rfqSummaryDetail.ascx" tagname="rfqSummaryDetail" tagprefix="uc1" %>
<%@ Register src="selectRFQ.ascx" tagname="selectRFQ" tagprefix="uc2" %>
<style type="text/css">
    .style1
    {
        width: 100%;
    }
</style>
<asp:FormView ID="frmRFQSummaryHeader" runat="server" 
    DataSourceID="SqlDataSource1">
    <EditItemTemplate>
        SIFHeaderKey:
        <asp:Label ID="SIFHeaderKeyLabel1" runat="server" 
            Text='<%# Eval("SIFHeaderKey") %>' />
        <br />
        InquiryNumber:
        <asp:TextBox ID="InquiryNumberTextBox" runat="server" 
            Text='<%# Bind("InquiryNumber") %>' />
        <br />
        BOMHeaderKey:
        <asp:Label ID="BOMHeaderKeyLabel1" runat="server" 
            Text='<%# Eval("BOMHeaderKey") %>' />
        <br />
        TopPartNumber:
        <asp:TextBox ID="TopPartNumberTextBox" runat="server" 
            Text='<%# Bind("TopPartNumber") %>' />
        <br />
        PartDescription:
        <asp:TextBox ID="PartDescriptionTextBox" runat="server" 
            Text='<%# Bind("PartDescription") %>' />
        <br />
        BOMDetailKey:
        <asp:Label ID="BOMDetailKeyLabel1" runat="server" 
            Text='<%# Eval("BOMDetailKey") %>' />
        <br />
        Qty:
        <asp:TextBox ID="QtyTextBox" runat="server" Text='<%# Bind("Qty") %>' />
        <br />
        PartNumber:
        <asp:TextBox ID="PartNumberTextBox" runat="server" 
            Text='<%# Bind("PartNumber") %>' />
        <br />
        Description:
        <asp:TextBox ID="DescriptionTextBox" runat="server" 
            Text='<%# Bind("Description") %>' />
        <br />
        UM:
        <asp:TextBox ID="UMTextBox" runat="server" Text='<%# Bind("UM") %>' />
        <br />
        Material:
        <asp:TextBox ID="MaterialTextBox" runat="server" 
            Text='<%# Bind("Material") %>' />
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
        Qty:
        <asp:TextBox ID="QtyTextBox" runat="server" Text='<%# Bind("Qty") %>' />
        <br />
        PartNumber:
        <asp:TextBox ID="PartNumberTextBox" runat="server" 
            Text='<%# Bind("PartNumber") %>' />
        <br />
        Description:
        <asp:TextBox ID="DescriptionTextBox" runat="server" 
            Text='<%# Bind("Description") %>' />
        <br />
        UM:
        <asp:TextBox ID="UMTextBox" runat="server" Text='<%# Bind("UM") %>' />
        <br />
        Material:
        <asp:TextBox ID="MaterialTextBox" runat="server" 
            Text='<%# Bind("Material") %>' />
        <br />
        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
            CommandName="Insert" Text="Insert" />
        &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
            CausesValidation="False" CommandName="Cancel" Text="Cancel" />
    </InsertItemTemplate>
    <ItemTemplate>
        SIFHeaderKey:
        <asp:Label ID="SIFHeaderKeyLabel" runat="server" 
            Text='<%# Eval("SIFHeaderKey") %>' />
        <br />
        InquiryNumber:
        <asp:Label ID="InquiryNumberLabel" runat="server" 
            Text='<%# Bind("InquiryNumber") %>' />
        <br />
        BOMHeaderKey:
        <asp:Label ID="BOMHeaderKeyLabel" runat="server" 
            Text='<%# Eval("BOMHeaderKey") %>' />
        <br />
        TopPartNumber:
        <asp:Label ID="TopPartNumberLabel" runat="server" 
            Text='<%# Bind("TopPartNumber") %>' />
        <br />
        PartDescription:
        <asp:Label ID="PartDescriptionLabel" runat="server" 
            Text='<%# Bind("PartDescription") %>' />
        <br />
        BOMDetailKey:
        <asp:Label ID="BOMDetailKeyLabel" runat="server" 
            Text='<%# Eval("BOMDetailKey") %>' />
        <br />
        Qty:
        <asp:Label ID="QtyLabel" runat="server" Text='<%# Bind("Qty") %>' />
        <br />
        PartNumber:
        <asp:Label ID="PartNumberLabel" runat="server" 
            Text='<%# Bind("PartNumber") %>' />
        <br />
        Description:
        <asp:Label ID="DescriptionLabel" runat="server" 
            Text='<%# Bind("Description") %>' />
        <br />
        UM:
        <asp:Label ID="UMLabel" runat="server" Text='<%# Bind("UM") %>' />
        <br />
        Material:
        <asp:Label ID="MaterialLabel" runat="server" Text='<%# Bind("Material") %>' />
        <br />
        Cost:
        <asp:Label ID="CostLabel" runat="server" Text='<%# Bind("Cost") %>' />
        <br />
    </ItemTemplate>
</asp:FormView>
<div align="center">
    <br />
    <uc1:rfqSummaryDetail ID="uscRfqSummaryList" runat="server" onSelect_RFQ="on_select_rfq" />

</div>

<asp:SqlDataSource ID="SqlDataSource1" runat="server" OnInit="on_sqldatasource_Init"
    SelectCommand="SELECT SIFHeader.SIFHeaderKey, SIFHeader.InquiryNumber, BOMHeader.BOMHeaderKey, BOMHeader.TopPartNumber, BOMHeader.PartDescription, BOMDetail.BOMDetailKey, BOMDetail.Qty, ItemMaster.PartNumber, ItemMaster.Description, ItemMaster.UM, ItemMaster.Material, BOMDetail.Cost FROM SIFHeader INNER JOIN BOMHeader ON SIFHeader.SIFHeaderKey = BOMHeader.SIFHeaderKey INNER JOIN BOMDetail ON BOMHeader.BOMHeaderKey = BOMDetail.BOMHeaderKey INNER JOIN ItemMaster ON BOMDetail.ItemMasterKey = ItemMaster.ItemMasterKey WHERE (BOMDetail.BOMDetailKey = @BOMDetailID)" 
    ProviderName="System.Data.SqlClient">
    <SelectParameters>
        <asp:ControlParameter ControlID="txtBomDetailID" Name="BOMDetailID" 
            PropertyName="Text" />
    </SelectParameters>
</asp:SqlDataSource>
<asp:TextBox ID="txtBomDetailID" runat="server" Visible="False"></asp:TextBox>

<asp:Panel ID="panelPopup" runat="server" Visible="false" title="RFQ Selection">
    <uc2:selectRFQ ID="uscSelectRFQ" runat="server" OnOk_click="on_confirm_rfq" OnCancel_click="on_cancel_rfq" />
    <script type="text/javascript">
                    jQuery("#<%= this.panelPopup.ClientID %>").dialog({ autoOpen: true,
                        appendTo: jQuery('form:first'),
                        width: 430, 
                        modal: true,
                        height: 320,
                        dialogClass: "no-close",
                        closeOnEscape: false,
                        draggable: true
                    });
                </script>
</asp:Panel>
