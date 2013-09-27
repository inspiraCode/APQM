<%@ Control Language="C#" AutoEventWireup="true" CodeFile="RFQSummaryForm.ascx.cs" Inherits="RFQ_Summary_RFQSummaryForm" %>
<%@ Register src="rfqSummaryDetail.ascx" tagname="rfqSummaryDetail" tagprefix="uc1" %>
<style type="text/css">
    .style1
    {
        width: 100%;
    }
</style>
<div style="float:left">
<table cellspacing="0" class="style1">
    <tr>
        <td align="right">
            SIF #</td>
        <td>
            <asp:TextBox ID="txtSIF" runat="server"></asp:TextBox>
        </td>
        <td>
            &nbsp;</td>
        <td>
            &nbsp;</td>
        <td>
            &nbsp;</td>
        <td>
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td align="right">
            Program:</td>
        <td>
            <asp:TextBox ID="txtProgram" runat="server"></asp:TextBox>
        </td>
        <td>
            &nbsp;</td>
        <td>
            &nbsp;</td>
        <td>
            &nbsp;</td>
        <td>
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td align="right">
            Part Number:</td>
        <td>
            <asp:TextBox ID="txtPartNumber" runat="server"></asp:TextBox>
        </td>
        <td>
            &nbsp;</td>
        <td>
            &nbsp;</td>
        <td>
            &nbsp;</td>
        <td>
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td align="right">
            Part Description:</td>
        <td>
            <asp:TextBox ID="txtPartDescription" runat="server"></asp:TextBox>
        </td>
        <td>
            &nbsp;</td>
        <td>
            &nbsp;</td>
        <td>
            &nbsp;</td>
        <td>
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td align="right">
            Estimated Volume:</td>
        <td>
            <asp:TextBox ID="txtEstimatedVolume" runat="server"></asp:TextBox>
        </td>
        <td>
            &nbsp;</td>
        <td>
            &nbsp;</td>
        <td>
            &nbsp;</td>
        <td>
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
    <tr align="center">
        <td colspan="2">
            <asp:Button ID="btnGo" runat="server" Text="Go" Width="70px" />
            <asp:TextBox ID="txtBomDetailID" runat="server" Visible="false"></asp:TextBox>
        </td>
        <td>
            &nbsp;</td>
        <td>
            &nbsp;</td>
        <td>
            &nbsp;</td>
        <td>
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
</table>
</div>
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
    </ItemTemplate>
</asp:FormView>
<div align="center">

    <uc1:rfqSummaryDetail ID="uscRfqSummaryList" runat="server" />

</div>

<asp:SqlDataSource ID="SqlDataSource1" runat="server" OnInit="on_sqldatasource_Init"
    SelectCommand="SELECT SIFHeader.SIFHeaderKey, SIFHeader.InquiryNumber, BOMHeader.BOMHeaderKey, BOMHeader.TopPartNumber, BOMHeader.PartDescription, BOMDetail.BOMDetailKey, BOMDetail.Qty, ItemMaster.PartNumber, ItemMaster.Description, ItemMaster.UM, ItemMaster.Material FROM SIFHeader INNER JOIN BOMHeader ON SIFHeader.SIFHeaderKey = BOMHeader.SIFHeaderKey INNER JOIN BOMDetail ON BOMHeader.BOMHeaderKey = BOMDetail.BOMHeaderKey INNER JOIN ItemMaster ON BOMDetail.ItemMasterKey = ItemMaster.ItemMasterKey WHERE (BOMDetail.BOMDetailKey = @BOMDetailID)">
    <SelectParameters>
        <asp:ControlParameter ControlID="txtBomDetailID" Name="BOMDetailID" 
            PropertyName="Text" />
    </SelectParameters>
</asp:SqlDataSource>
