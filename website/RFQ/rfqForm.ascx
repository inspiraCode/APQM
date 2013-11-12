<%@ Control Language="C#" AutoEventWireup="true" CodeFile="rfqForm.ascx.cs" Inherits="rfqForm" %>
<%@ Register Src="rfqDetailList.ascx" TagName="rfqDetailList" TagPrefix="uc1" %>
<%@ Register Src="rfqACR.ascx" TagName="rfqACR" TagPrefix="uc2" %>
<%@ Register src="rfqEAV.ascx" tagname="rfqEAV" tagprefix="uc3" %>
<style type="text/css">
    .style2
    {
        width: 191px;
    }
    .style26
    {
    }
    .style27
    {
        width: 163px;
        
    }
    .style29
    {
        width: 226px;
        
    }
    .style31
    {
        
    }
    .style35
    {
       
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
    .style66
    {
        width: 165px;
    }
    .style68
    {
        width: 214px;
    }
    .style70
    {
        
        width: 157px;
    }
    .style71
    {
        width: 159px;
        
    }
</style>
<div align="center">
    <table cellspacing="0" 
        style="min-width: 995px; max-width: 995px; width: 1053px;">
        <tr>
            <td align="right" class="style66">
                Due Date
            </td>
            <td align="left" class="style27">
                <asp:Label ID="lblDueDate" runat="server" BackColor="Silver" 
                    style="text-align:center" Width="145px" Height="20px"></asp:Label>
            </td>
            <td align="left" class="style70">
            </td>
            <td align="left" class="style29">
            </td>
            <td align="left" class="style71" colspan="2">
                
            </td>
            <td align="left" class="style31">
                </td>
        </tr>
        <tr>
            <td align="right" class="style66">
                RFQ #
            </td>
            <td align="left" class="style27">
                <asp:Label ID="lblRFQNumber" runat="server"  style="text-align:center" 
                    Width="145px" BackColor="Silver" Height="20px"></asp:Label>
            </td>
            <td align="right" class="style70">
                Supplier Name
            </td>
            <td align="left" class="style29">
                <asp:Label ID="lblSupplierName" runat="server" BackColor="Silver" Width="220px" Height="20px"></asp:Label>
            </td>
            <td align="right" class="style71" 
                style="border-top: solid gray;border-left: solid gray;" colspan="2" >
                Total Manufacturing Cost
            </td>
            <td align="left" class="style31"  style="border-top: solid gray;border-right: solid gray;" >
                <asp:Label ID="lblTotalManufacturingCost"  style="text-align:right;"  runat="server" BackColor="Silver" Width="104px" Height="20px">0</asp:Label>
            </td>
        </tr>
        <tr>
            <td align="right" class="style66">
                Part #
            </td>
            <td align="left" class="style27">
                <asp:Label ID="lblPartNumber" style="text-align:center"  runat="server" 
                    BackColor="Silver" Width="145px" Height="20px"></asp:Label>
            </td>
            <td align="right" class="style70">
                Manufacturing Location
            </td>
            <td align="left" class="style29">
                <asp:Label ID="lblManufacturingLocation" runat="server" BackColor="Silver" Width="220px" Height="20px"></asp:Label>
            </td>
            <td align="right" class="style71"  style="border-left: solid gray;" 
                colspan="2" >
                SG&amp;A Profit
            </td>
            <td align="left" class="style31"  style="border-right: solid gray;" >
                <asp:TextBox ID="txtSGAProfit" validate="number" validationid="validatingRFQForm" style="text-align:right"  runat="server" onchange="summarizeTotalPieceCost()" onkeyup="summarizeTotalPieceCost()"
                    Width="100px" TabIndex="2"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right" class="style66">
                Part Name
            </td>
            <td align="left" class="style27">
                <asp:Label ID="lblPartName" style="text-align:center"  runat="server" 
                    BackColor="Silver" Width="145px" Height="20px"></asp:Label>
            </td>
            <td align="right" class="style70">
                Ship From Location
            </td>
            <td align="left" class="style29">
                <asp:Label ID="lblShipFromLocation" runat="server" BackColor="Silver" Width="220px" Height="20px"></asp:Label>
            </td>
            <td align="right" class="style71" style="border-left: solid gray;" colspan="2" >
                Packing Cost/Unit
            </td>
            <td align="left" class="style31"  style="border-right: solid gray;" >
                <asp:TextBox ID="txtPackingCostUnit" validate="number" validationid="validatingRFQForm"  style="text-align:right" onchange="summarizeTotalPieceCost()" onkeyup="summarizeTotalPieceCost()" runat="server"
                    Width="100px" TabIndex="3"></asp:TextBox>
            </td>
        </tr>
        <tr align="left">
            <td align="right" class="style66">
                Drawing Level
            </td>
            <td align="left" class="style27">
                <asp:Label ID="lblDrawingLevel" runat="server"  style="text-align:center" 
                    BackColor="Silver" Width="145px" Height="20px"></asp:Label>
            </td>
            <td align="right" class="style70">
                Prepared By
            </td>
            <td align="left" class="style29">
                <asp:TextBox ID="txtPreparedBy" validate="required" validationid="validatingRFQForm" runat="server" Style="width: 216px" TabIndex="1"></asp:TextBox>
            </td>
            <td align="right" class="style71" style="border-left: solid gray;" colspan="2" >
                Assembly Cost/Unit
            </td>
            <td align="left" class="style31"  style="border-right: solid gray;" >
                <asp:TextBox ID="txtAssemblyCostUnit" validate="number" validationid="validatingRFQForm"  style="text-align:right" onchange="summarizeTotalPieceCost()" onkeyup="summarizeTotalPieceCost()" runat="server"
                    Width="100px" TabIndex="4"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right" class="style66">
                <asp:Label ID="lblBOMDetailID" runat="server" Visible="False"></asp:Label>
            </td>
            <td align="left" class="style27">
                <asp:Label ID="lblMode" runat="server" Visible="False">New</asp:Label>
            </td>
            <td align="right" class="style70">
                <asp:Label ID="lblID" runat="server" Visible="False"></asp:Label>
            </td>
            <td align="right" class="style29">
            </td>
            <td align="right" class="style71" 
                style="border-left: solid gray;border-bottom: solid gray;" colspan="2" >
                Total Piece Cost
            </td>
            <td align="left" class="style31"  style="border-right: solid gray;border-bottom: solid gray;" >
                <asp:Label ID="lblTotalPieceCost" runat="server"  style="text-align:right" BackColor="Silver" Width="104px" Height="20px">123456</asp:Label>
            </td>
        </tr>
        <tr>
            <td align="right" height="25px" colspan="7">
                <div style="border: solid; border-color: silver; border-width: 2px;">
                </div>
            </td>
        </tr>
        <tr>
            <td align="center" class="style26" colspan="3" rowspan="5">
                <%--<div style="border: solid; border-color: gray; border-width: 2px;">
                </div>--%>
                Estimated Annual Volume<br/><uc3:rfqEAV ID="uscRfqEAV" runat="server" />
            </td>
            <td align="right" class="style31" colspan="3">
                Production Lead Time
            </td>
            <td align="left" class="style31">
                <asp:TextBox ID="txtProductionLeadTime" validate="required" validationid="validatingRFQForm" runat="server"  style="text-align:right" Width="100px" TabIndex="5"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right" class="style35" colspan="3">
                Production Tooling Lead Time
            </td>
            <td align="left" class="style35">
                <asp:TextBox ID="txtProductionToolingLeadTime" validate="required" validationid="validatingRFQForm" runat="server"  style="text-align:right" Width="100px" TabIndex="6"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right" class="style31" colspan="3">
                Prototype Tooling Lead Time
            </td>
            <td align="left" class="style31">
                <asp:TextBox ID="txtPrototypeToolingLeadTime" validate="required" validationid="validatingRFQForm" runat="server" style="text-align:right"  Width="100px" TabIndex="7"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right" class="style31" colspan="3">
                Prototype Piece Lead Time
            </td>
            <td align="left" class="style31">
                <asp:TextBox ID="txtPrototypePieceLeadTime" validate="required" validationid="validatingRFQForm" runat="server"  style="text-align:right" Width="100px" TabIndex="8"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="center" colspan="2" class="style68">
                </td>
            <td align="center" colspan="2">
                </td>
        </tr>
    </table><br />
    <uc1:rfqDetailList ID="uscRFQDetailList" runat="server" />
</div>
<div align="center">
    <table cellspacing="0" class="style55">
        <tr align="center">
            <td class="style58" colspan="2">
                Tooling Detail
            </td>
            <td class="style63">
                
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
                <asp:TextBox ID="txtProductionTooling" validate="number" validationid="validatingRFQForm" style="text-align:right"  runat="server" TabIndex="22"></asp:TextBox>
            </td>
            <td class="style63">
                
            </td>
        </tr>
        <tr>
            <td align="right" class="style61">
                Prototype Tooling
            </td>
            <td class="style62" align="right">
                <asp:TextBox ID="txtPrototypeTooling" validate="number" validationid="validatingRFQForm" style="text-align:right"  runat="server" TabIndex="23"></asp:TextBox>
            </td>
            <td class="style63">
                
            </td>
        </tr>
        <tr>
            <td align="right" class="style61">
                Prototype Piece
            </td>
            <td class="style62" align="right">
                <asp:TextBox ID="txtPrototypePiece" validate="number" validationid="validatingRFQForm" style="text-align:right"  runat="server" TabIndex="24"></asp:TextBox>
            </td>
            <td class="style63">
                
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