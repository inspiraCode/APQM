<%@ Control Language="C#" AutoEventWireup="true" CodeFile="rfqForm.ascx.cs" Inherits="rfqForm" %>
<%@ Register Src="rfqDetailList.ascx" TagName="rfqDetailList" TagPrefix="uc1" %>
<%@ Register src="rfqACR.ascx" tagname="rfqACR" tagprefix="uc2" %>
<style type="text/css">
    .style1
    {
        width: 138px;
    }
    .style2
    {
        width: 191px;
    }
    .style4
    {
    }
    .style7
    {
        width: 213px;
    }
    .style9
    {
        width: 224px;
    }
    .style10
    {
        width: 245px;
    }
    .style11
    {
        width: 226px;
    }
</style>
<div align="center">
    <table cellspacing="0" 
        style="min-width: 995px; max-width: 995px; width: 1150px;">
        <tr>
            <td align="right" class="style11">
                Due Date
            </td>
            <td align="left" class="style1">
                <asp:Label ID="lblDueDate" runat="server"></asp:Label>
            </td>
            <td align="left" class="style7">
            </td>
            <td align="left" class="style9">
            </td>
            <td align="left" class="style10">
                &nbsp;
            </td>
            <td align="left">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td align="right" class="style11">
                RFQ #
            </td>
            <td align="left" class="style1">
                <asp:Label ID="lblRFQNumber" runat="server"></asp:Label>
            </td>
            <td align="right" class="style7">
                Supplier Name
            </td>
            <td align="left" class="style9">
                <asp:Label ID="lblSupplierName" runat="server"></asp:Label>
            </td>
            <td align="right" class="style10">
                Total Manufacturing Cost
            </td>
            <td align="left">
                <asp:Label ID="lblTotalManufacturingCost" runat="server">123456</asp:Label>
            </td>
        </tr>
        <tr>
            <td align="right" class="style11">
                Part #
            </td>
            <td align="left" class="style1">
                <asp:Label ID="lblPartNumber" runat="server"></asp:Label>
            </td>
            <td align="right" class="style7">
                Manufacturing Location
            </td>
            <td align="left" class="style9">
                <asp:Label ID="lblManufacturingLocation" runat="server"></asp:Label>
            </td>
            <td align="right" class="style10">
                SG&amp;A Profit
            </td>
            <td align="left">
                <asp:TextBox ID="txtSGAProfit" runat="server" Width="100px" TabIndex="2"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right" class="style11">
                Part Name
            </td>
            <td align="left" class="style1">
                <asp:Label ID="lblPartName" runat="server"></asp:Label>
            </td>
            <td align="right" class="style7">
                Ship From Location
            </td>
            <td align="left" class="style9">
                <asp:Label ID="lblShipFromLocation" runat="server"></asp:Label>
            </td>
            <td align="right" class="style10">
                Packing Cost/Unit
            </td>
            <td align="left">
                <asp:TextBox ID="txtPackingCostUnit" runat="server" Width="100px" TabIndex="3"></asp:TextBox>
            </td>
        </tr>
        <tr align="left">
            <td align="right" class="style11">
                Drawing Level
            </td>
            <td align="left" class="style1">
                <asp:Label ID="lblDrawingLevel" runat="server"></asp:Label>
            </td>
            <td align="right" class="style7">
                Prepared By
            </td>
            <td align="left" class="style9">
                <asp:TextBox ID="txtPreparedBy" runat="server" Width="215px" TabIndex="1"></asp:TextBox>
            </td>
            <td align="right" class="style10">
                Assembly Cost/Unit
            </td>
            <td align="left">
                <asp:TextBox ID="txtAssemblyCostUnit" runat="server" Width="100px" TabIndex="4"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right" class="style11">
                Estimated Annual Volume
            </td>
            <td align="left" class="style1">
                <asp:Label ID="lblEstimatedAnnualVolume" runat="server">0</asp:Label>
            </td>
            <td align="right" class="style7">
                &nbsp;</td>
            <td align="right" class="style9">
                <asp:HiddenField ID="hiddenSupplierID" runat="server" />
            </td>
            <td align="right" class="style10">
                Total Piece Cost
            </td>
            <td align="left">
                <asp:Label ID="lblTotalPieceCost" runat="server">123456</asp:Label>
            </td>
        </tr>
        <tr>
            <td align="right" height="25px" colspan="6">
                <div style="border: solid; border-color: gray; border-width: 2px;">
                </div>
            </td>
        </tr>
        <tr>
            <td align="right" class="style11">
            </td>
            <td align="left" class="style1">
                <asp:Label ID="lblMode" runat="server" Visible="False">New</asp:Label>
            </td>
            <td align="right" class="style7">
            </td>
            <td align="left" class="style9">
            </td>
            <td align="right" class="style10">
                Production Lead Time
            </td>
            <td align="left">
                <asp:TextBox ID="txtProductionLeadTime" runat="server" Width="100px" 
                    TabIndex="5"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right" class="style11">
            </td>
            <td align="left" class="style1">
                <asp:Label ID="lblBOMDetailID" runat="server" Visible="False"></asp:Label>
            </td>
            <td align="right" class="style7">
                <asp:Label ID="lblID" runat="server" Visible="False"></asp:Label>
            </td>
            <td align="left" class="style9">
            </td>
            <td align="right" class="style10">
                Production Tooling Lead Time
            </td>
            <td align="left">
                <asp:TextBox ID="txtProductionToolingLeadTime" runat="server" Width="100px" 
                    TabIndex="6"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right" class="style11">
            </td>
            <td align="left" class="style1">
            </td>
            <td align="left" class="style7">
            </td>
            <td align="left" class="style9">
            </td>
            <td align="right" class="style10">
                Prototype Tooling Lead Time             </td>
            <td align="left">
                <asp:TextBox ID="txtPrototypeToolingLeadTime" runat="server" Width="100px" 
                    TabIndex="7"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right" class="style11">
            </td>
            <td align="left" class="style1">
            </td>
            <td align="right" class="style7">
            </td>
            <td align="left" class="style9">
            </td>
            <td align="right" class="style10">
                Prototype Piece Lead Time
            </td>
            <td align="left">
                <asp:TextBox ID="txtPrototypePieceLeadTime" runat="server" Width="100px" 
                    TabIndex="8"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="center" height="25px" colspan="6">
                <%--<div style="border: solid; border-color: gray; border-width: 2px;">
                </div>--%>
            </td>
        </tr>
    </table>
    <uc1:rfqDetailList ID="uscRFQDetailList" runat="server" />
    <div align ="center">
    <table cellspacing="0" style="width: 754px">    
        <tr>
            <td align="center" height="25px" colspan="3">
                <div style="border: solid; border-color: gray; border-width: 2px;">
                </div>
            </td>
        </tr>
        <tr>
            <td align="center" class="style4" colspan="2">
                Tooling Detail</td>
            <td align="center">
                Annual Cost Reduction Commitment</td>
        </tr>
        <tr>
            <td align="left" colspan="2">
                <asp:TextBox ID="txtToolingDetail" runat="server" Width="300px" Height="40px" 
                    TabIndex="21" TextMode="MultiLine"></asp:TextBox>
            </td>
            <td align="center" rowspan="5">
                <uc2:rfqACR ID="uscRfqACR" runat="server" />
            </td>
        </tr>
        <tr>
            <td align="right" class="style4">
                Production Tooling
            </td>
            <td align="left">
                <asp:TextBox ID="txtProductionTooling" runat="server" Width="145px" 
                    TabIndex="22"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right" class="style4">
                Prototype Tooling
            </td>
            <td align="left">
                <asp:TextBox ID="txtPrototypeTooling" runat="server" Width="145px" 
                    TabIndex="23"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right" class="style4">
                PPrototype Piece
            </td>
            <td align="left">
                <asp:TextBox ID="txtPrototypePiece" runat="server" Width="145px" TabIndex="24"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right" class="style4">
            </td>
            <td align="right">
            </td>
        </tr>
    </table>
    </div>
    
</div>
<br /><br />
<div align="center">
    <asp:Button ID="btnSave" runat="server" Text="Save" Width="70px" 
        OnClick="btnSave_Click" TabIndex="30" />
    <asp:Button ID="btnCancel" runat="server" Text="Cancel" Width="70px" 
        OnClick="btnCancel_Click" TabIndex="31" />
</div>
<br /><br />