<%@ Control Language="C#" AutoEventWireup="true" CodeFile="rfqForm.ascx.cs" Inherits="rfqForm" %>
<%@ Register Src="rfqDetailList.ascx" TagName="rfqDetailList" TagPrefix="uc1" %>
<%@ Register Src="rfqACR.ascx" TagName="rfqACR" TagPrefix="uc2" %>
<style type="text/css">
    .style2
    {
        width: 191px;
    }
    .style26
    {
        width: 257px;
        height: 24px;
    }
    .style27
    {
        width: 142px;
        height: 24px;
    }
    .style28
    {
        width: 201px;
        height: 24px;
    }
    .style29
    {
        width: 247px;
        height: 24px;
    }
    .style30
    {
        width: 219px;
        height: 24px;
    }
    .style31
    {
        height: 24px;
    }
    .style32
    {
        width: 257px;
        height: 23px;
    }
    .style33
    {
        width: 142px;
        height: 23px;
    }
    .style34
    {
        width: 201px;
        height: 23px;
    }
    .style35
    {
        height: 23px;
    }
    .style55
    {
        width: 147px;
    }
    .style56
    {
    }
    .style58
    {
    }
    .style61
    {
        width: 151px;
    }
    .style62
    {
        width: 147px;
    }
    .style63
    {
        width: 116px;
    }
</style>
<div align="center">
    <table cellspacing="0" style="min-width: 995px; max-width: 995px; width: 1180px;">
        <tr>
            <td align="right" class="style26">
                Due Date
            </td>
            <td align="left" class="style27">
                <asp:Label ID="lblDueDate" runat="server" BackColor="Silver" 
                    style="text-align:center" Width="120px"></asp:Label>
            </td>
            <td align="left" class="style28">
            </td>
            <td align="left" class="style29">
            </td>
            <td align="left" class="style30">
                &nbsp;
            </td>
            <td align="left" class="style31">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td align="right" class="style26">
                RFQ #
            </td>
            <td align="left" class="style27">
                <asp:Label ID="lblRFQNumber" runat="server"  style="text-align:center" Width="120px" BackColor="Silver"></asp:Label>
            </td>
            <td align="right" class="style28">
                Supplier Name
            </td>
            <td align="left" class="style29">
                <asp:Label ID="lblSupplierName" runat="server" BackColor="Silver" Width="220px"></asp:Label>
            </td>
            <td align="right" class="style30" style="border-top: solid gray;border-left: solid gray;" >
                Total Manufacturing Cost
            </td>
            <td align="left" class="style31"  style="border-top: solid gray;border-right: solid gray;" >
                <asp:Label ID="lblTotalManufacturingCost"  style="text-align:right;"  runat="server" BackColor="Silver" Width="104px">0</asp:Label>
            </td>
        </tr>
        <tr>
            <td align="right" class="style26">
                Part #
            </td>
            <td align="left" class="style27">
                <asp:Label ID="lblPartNumber" style="text-align:center"  runat="server" BackColor="Silver" Width="120px"></asp:Label>
            </td>
            <td align="right" class="style28">
                Manufacturing Location
            </td>
            <td align="left" class="style29">
                <asp:Label ID="lblManufacturingLocation" runat="server" BackColor="Silver" Width="220px"></asp:Label>
            </td>
            <td align="right" class="style30"  style="border-left: solid gray;" >
                SG&amp;A Profit
            </td>
            <td align="left" class="style31"  style="border-right: solid gray;" >
                <asp:TextBox ID="txtSGAProfit" validate="required" validationid="validatingRFQForm" style="text-align:right"  runat="server" onchange="summarizeTotalPieceCost()" onkeyup="summarizeTotalPieceCost()"
                    Width="100px" TabIndex="2"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right" class="style26">
                Part Name
            </td>
            <td align="left" class="style27">
                <asp:Label ID="lblPartName" style="text-align:center"  runat="server" BackColor="Silver" Width="120px"></asp:Label>
            </td>
            <td align="right" class="style28">
                Ship From Location
            </td>
            <td align="left" class="style29">
                <asp:Label ID="lblShipFromLocation" runat="server" BackColor="Silver" Width="220px"></asp:Label>
            </td>
            <td align="right" class="style30" style="border-left: solid gray;" >
                Packing Cost/Unit
            </td>
            <td align="left" class="style31"  style="border-right: solid gray;" >
                <asp:TextBox ID="txtPackingCostUnit" validate="required" validationid="validatingRFQForm"  style="text-align:right" onchange="summarizeTotalPieceCost()" onkeyup="summarizeTotalPieceCost()" runat="server"
                    Width="100px" TabIndex="3"></asp:TextBox>
            </td>
        </tr>
        <tr align="left">
            <td align="right" class="style26">
                Drawing Level
            </td>
            <td align="left" class="style27">
                <asp:Label ID="lblDrawingLevel" runat="server"  style="text-align:center" BackColor="Silver" Width="120px"></asp:Label>
            </td>
            <td align="right" class="style28">
                Prepared By
            </td>
            <td align="left" class="style29">
                <asp:TextBox ID="txtPreparedBy" validate="required" validationid="validatingRFQForm" runat="server" Style="width: 216px" TabIndex="1"></asp:TextBox>
            </td>
            <td align="right" class="style30" style="border-left: solid gray;" >
                Assembly Cost/Unit
            </td>
            <td align="left" class="style31"  style="border-right: solid gray;" >
                <asp:TextBox ID="txtAssemblyCostUnit" validate="required" validationid="validatingRFQForm"  style="text-align:right" onchange="summarizeTotalPieceCost()" onkeyup="summarizeTotalPieceCost()" runat="server"
                    Width="100px" TabIndex="4"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right" class="style26">
                Estimated Annual Volume
            </td>
            <td align="left" class="style27">
                <asp:Label ID="lblEstimatedAnnualVolume" style="text-align:center"  runat="server" BackColor="Silver" Width="120px">0</asp:Label>
            </td>
            <td align="right" class="style28">
            </td>
            <td align="right" class="style29">
            </td>
            <td align="right" class="style30" style="border-left: solid gray;border-bottom: solid gray;" >
                Total Piece Cost
            </td>
            <td align="left" class="style31"  style="border-right: solid gray;border-bottom: solid gray;" >
                <asp:Label ID="lblTotalPieceCost" runat="server"  style="text-align:right" BackColor="Silver" Width="104px">123456</asp:Label>
            </td>
        </tr>
        <tr>
            <td align="right" height="25px" colspan="6">
                <div style="border: solid; border-color: silver; border-width: 2px;">
                </div>
            </td>
        </tr>
        <tr>
            <td align="right" class="style26">
            </td>
            <td align="left" class="style27">
                <asp:Label ID="lblMode" runat="server" Visible="False">New</asp:Label>
            </td>
            <td align="right" class="style28">
            </td>
            <td align="right" class="style31" colspan="2">
                Production Lead Time
            </td>
            <td align="left" class="style31">
                <asp:TextBox ID="txtProductionLeadTime" validate="required" validationid="validatingRFQForm" runat="server"  style="text-align:right" Width="100px" TabIndex="5"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right" class="style32">
            </td>
            <td align="left" class="style33">
                <asp:Label ID="lblBOMDetailID" runat="server" Visible="False"></asp:Label>
            </td>
            <td align="right" class="style34">
                <asp:Label ID="lblID" runat="server" Visible="False"></asp:Label>
            </td>
            <td align="right" class="style35" colspan="2">
                Production Tooling Lead Time
            </td>
            <td align="left" class="style35">
                <asp:TextBox ID="txtProductionToolingLeadTime" validate="required" validationid="validatingRFQForm" runat="server"  style="text-align:right" Width="100px" TabIndex="6"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right" class="style26">
            </td>
            <td align="left" class="style27">
            </td>
            <td align="left" class="style28">
            </td>
            <td align="right" class="style31" colspan="2">
                Prototype Tooling Lead Time
            </td>
            <td align="left" class="style31">
                <asp:TextBox ID="txtPrototypeToolingLeadTime" validate="required" validationid="validatingRFQForm" runat="server" style="text-align:right"  Width="100px" TabIndex="7"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right" class="style26">
            </td>
            <td align="left" class="style27">
            </td>
            <td align="right" class="style28">
            </td>
            <td align="right" class="style31" colspan="2">
                Prototype Piece Lead Time
            </td>
            <td align="left" class="style31">
                <asp:TextBox ID="txtPrototypePieceLeadTime" validate="required" validationid="validatingRFQForm" runat="server"  style="text-align:right" Width="100px" TabIndex="8"></asp:TextBox>
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
</div>
<div align="center">
    <table cellspacing="0" class="style55">
        <tr align="center">
            <td class="style58" colspan="2">
                Tooling Detail
            </td>
            <td class="style63">
                &nbsp;
            </td>
            <td>
                Annual Cost Reduction Commitment
            </td>
        </tr>
        <tr>
            <td class="style56" colspan="2" align="right">
                <asp:TextBox ID="txtToolingDetail" validate="required" validationid="validatingRFQForm" runat="server" Width="300px" Height="40px" TabIndex="21"
                    TextMode="MultiLine"></asp:TextBox>
            </td>
            <td class="style63">
                &nbsp;
            </td>
            <td align="center" rowspan="4">
                <uc2:rfqACR ID="uscRfqACR" runat="server" />
            </td>
        </tr>
        <tr>
            <td align="right" class="style61">
                Production Tooling
            </td>
            <td class="style62" align="right">
                <asp:TextBox ID="txtProductionTooling" validate="required" validationid="validatingRFQForm" style="text-align:right"  runat="server" TabIndex="22"></asp:TextBox>
            </td>
            <td class="style63">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td align="right" class="style61">
                Prototype Tooling
            </td>
            <td class="style62" align="right">
                <asp:TextBox ID="txtPrototypeTooling" validate="required" validationid="validatingRFQForm" style="text-align:right"  runat="server" TabIndex="23"></asp:TextBox>
            </td>
            <td class="style63">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td align="right" class="style61">
                Prototype Piece
            </td>
            <td class="style62" align="right">
                <asp:TextBox ID="txtPrototypePiece" validate="required" validationid="validatingRFQForm" style="text-align:right"  runat="server" TabIndex="24"></asp:TextBox>
            </td>
            <td class="style63">
                &nbsp;
            </td>
        </tr>
    </table>
</div>
<br />
<br />
<asp:HiddenField ID="hiddenSupplierID" runat="server" />
<br />
<br />
<script type="text/javascript">
    window.onload = summarizeTotalPieceCost();
    function summarizeTotalPieceCost() {

        var txtSGAProfit = document.getElementById("<%= txtSGAProfit.ClientID %>");
        if (txtSGAProfit && txtSGAProfit.value.trim() != "") {
            txtSGAProfit = Number(txtSGAProfit.value);
        }
        else {
            txtSGAProfit = 0;
        }

        var lblTotalManufacturingCost = document.getElementById("<%= lblTotalManufacturingCost.ClientID %>");
        if (lblTotalManufacturingCost && lblTotalManufacturingCost.textContent.trim() != "") {
            lblTotalManufacturingCost = Number(lblTotalManufacturingCost.textContent);
        }
        else {
            lblTotalManufacturingCost.textContent = 0;
        }

        var txtPackingCostUnit = document.getElementById("<%= txtPackingCostUnit.ClientID %>");
        if (txtPackingCostUnit && txtPackingCostUnit.value.trim() != "") {
            txtPackingCostUnit = Number(txtPackingCostUnit.value);
        }
        else {
            txtPackingCostUnit = 0;
        }

        var txtAssemblyCostUnit = document.getElementById("<%= txtAssemblyCostUnit.ClientID %>");
        if (txtAssemblyCostUnit && txtAssemblyCostUnit.value.trim() != "") {
            txtAssemblyCostUnit = Number(txtAssemblyCostUnit.value);
        }
        else {
            txtAssemblyCostUnit = 0;
        }

        var lblTotalPieceCost = document.getElementById("<%= lblTotalPieceCost.ClientID %>");

        lblTotalPieceCost.textContent = txtSGAProfit + lblTotalManufacturingCost + txtPackingCostUnit + txtAssemblyCostUnit;
    }
</script>

