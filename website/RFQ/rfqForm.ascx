<%@ Control Language="C#" AutoEventWireup="true" CodeFile="rfqForm.ascx.cs" Inherits="rfqForm" %>
<%@ Register Src="rfqDetailList.ascx" TagName="rfqDetailList" TagPrefix="uc1" %>
<div align="center">
    <table cellspacing="1" style="min-width: 995px; max-width: 995px;">
        <tr>
            <td align="right">
                Due Date
            </td>
            <td align="left">
                <asp:Label ID="lblDueDate" runat="server"></asp:Label>
            </td>
            <td align="left">
            </td>
            <td align="left">
            </td>
            <td align="left">
                &nbsp;
            </td>
            <td align="left">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td align="right">
                RFQ #
            </td>
            <td align="left">
                <asp:Label ID="lblRFQNumber" runat="server"></asp:Label>
            </td>
            <td align="right">
                Supplier Name
            </td>
            <td align="left">
                <asp:Label ID="lblSupplierName" runat="server"></asp:Label>
            </td>
            <td align="right">
                Total Manufacturing Cost
            </td>
            <td align="left">
                <asp:Label ID="lblTotalManufacturingCost" runat="server">123456</asp:Label>
            </td>
        </tr>
        <tr>
            <td align="right">
                Part #
            </td>
            <td align="left">
                <asp:Label ID="lblPartNumber" runat="server"></asp:Label>
            </td>
            <td align="right">
                Manufacturing Location
            </td>
            <td align="left">
                <asp:Label ID="lblManufacturingLocation" runat="server"></asp:Label>
            </td>
            <td align="right">
                SG&amp;A Profit
            </td>
            <td align="left">
                <asp:TextBox ID="txtSGAProfit" runat="server" Width="100px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right">
                Part Name
            </td>
            <td align="left">
                <asp:Label ID="lblPartName" runat="server"></asp:Label>
            </td>
            <td align="right">
                Ship From Location
            </td>
            <td align="left">
                <asp:Label ID="lblShipFromLocation" runat="server"></asp:Label>
            </td>
            <td align="right">
                Packing Cost/Unit
            </td>
            <td align="left">
                <asp:TextBox ID="txtPackingCostUnit" runat="server" Width="100px"></asp:TextBox>
            </td>
        </tr>
        <tr align="left">
            <td align="right">
                Drawing Level
            </td>
            <td align="left">
                <asp:Label ID="lblDrawingLevel" runat="server"></asp:Label>
            </td>
            <td align="right">
                Prepared By
            </td>
            <td align="left">
                <asp:TextBox ID="txtPreparedBy" runat="server" Width="215px"></asp:TextBox>
            </td>
            <td align="right">
                Assembly Cost/Unit
            </td>
            <td align="left">
                <asp:TextBox ID="txtAssemblyCostUnit" runat="server" Width="100px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right">
                Estimated Annual Volume
            </td>
            <td align="left">
                <asp:Label ID="lblEstimatedAnnualVolume" runat="server">0</asp:Label>
            </td>
            <td align="right">
                &nbsp;
            </td>
            <td align="right">
            </td>
            <td align="right">
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
            <td align="right">
            </td>
            <td align="left">
                <asp:Label ID="lblMode" runat="server" Visible="False">New</asp:Label>
            </td>
            <td align="right">
            </td>
            <td align="left">
            </td>
            <td align="left">
                Production Lead Time
            </td>
            <td align="left">
                <asp:TextBox ID="txtProductionLeadTime" runat="server" Width="100px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right">
            </td>
            <td align="left">
                <asp:Label ID="lblBOMID" runat="server" Visible="False"></asp:Label>
            </td>
            <td align="right">
            </td>
            <td align="left">
            </td>
            <td align="left">
                Production Tooling Lead Time
            </td>
            <td align="left">
                <asp:TextBox ID="txtProductionToolingLeadTime" runat="server" Width="100px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right">
            </td>
            <td align="left">
                <asp:Label ID="lblID" runat="server" Visible="False"></asp:Label>
            </td>
            <td align="right">
            </td>
            <td align="left">
            </td>
            <td align="left">
                &nbsp;
            </td>
            <td align="left">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td align="right">
            </td>
            <td align="left">
            </td>
            <td align="left">
            </td>
            <td align="left">
            </td>
            <td align="left">
                Prototype Tooling lead Time
            </td>
            <td align="left">
                <asp:TextBox ID="txtPrototypeToolingLeadTime" runat="server" Width="100px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right">
            </td>
            <td align="left">
            </td>
            <td align="right">
            </td>
            <td align="left">
            </td>
            <td align="left">
                Prototype Piece Lead Time
            </td>
            <td align="left">
                <asp:TextBox ID="txtPrototypePieceLeadTime" runat="server" Width="100px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="center" height="25px" colspan="6">
                <%--<div style="border: solid; border-color: gray; border-width: 2px;">
                </div>--%>
            </td>
        </tr>
    </table>
    <uc1:rfqDetailList ID="rfqDetailList1" runat="server" />
    <table cellspacing="1" style="min-width: 995px; max-width: 995px;">    
        <tr>
            <td align="center" height="25px" colspan="4">
                <div style="border: solid; border-color: gray; border-width: 2px;">
                </div>
            </td>
        </tr>
        <tr>
            <td align="center">
                Tooling Detail
            </td>
            <td align="right">
            </td>
            <td align="center" colspan="2">
                Annual Cost Reduction Commitment
            </td>
        </tr>
        <tr>
            <td align="left" colspan="2" rowspan="2">
                <asp:TextBox ID="txtToolingDetail" runat="server" Width="291px" Height="40px"></asp:TextBox>
            </td>
            <td align="right">
                Year 1
            </td>
            <td align="left">
                <asp:TextBox ID="txtYear1" runat="server" Width="170px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right">
                Year 2
            </td>
            <td align="left">
                <asp:TextBox ID="txtYear2" runat="server" Width="170px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right">
                Production Tooling
            </td>
            <td align="left">
                <asp:TextBox ID="txtProductionTooling" runat="server" Width="118px"></asp:TextBox>
            </td>
            <td align="right">
                Year 3
            </td>
            <td align="left">
                <asp:TextBox ID="txtYear3" runat="server" Width="170px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right">
                Prototype Tooling
            </td>
            <td align="left">
                <asp:TextBox ID="txtPrototypeTooling" runat="server" Width="118px"></asp:TextBox>
            </td>
            <td align="right">
                Year 4
            </td>
            <td align="left">
                <asp:TextBox ID="txtYear4" runat="server" Width="170px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right">
                Prototype Piece
            </td>
            <td align="left">
                <asp:TextBox ID="txtPrototypePiece" runat="server" Width="118px"></asp:TextBox>
            </td>
            <td align="left">
                &nbsp;
            </td>
            <td align="left">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td align="right">
                &nbsp;
            </td>
            <td align="right">
                &nbsp;
            </td>
            <td align="left">
                &nbsp;
            </td>
            <td align="left">
                &nbsp;
            </td>
        </tr>
    </table>
</div>
<div align="center">
    <asp:Button ID="btnSave" runat="server" Text="Save" Width="70px" OnClick="btnSave_Click" />
    <asp:Button ID="btnCancel" runat="server" Text="Cancel" Width="70px" OnClick="btnCancel_Click" />
</div>
