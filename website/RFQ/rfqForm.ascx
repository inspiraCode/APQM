<%@ Control Language="C#" AutoEventWireup="true" CodeFile="rfqForm.ascx.cs" Inherits="rfqForm" %>
<%@ Register Src="rfqDetailList.ascx" TagName="rfqDetailList" TagPrefix="uc1" %>
<%@ Register Src="rfqACR.ascx" TagName="rfqACR" TagPrefix="uc2" %>
<%@ Register Src="rfqEAV.ascx" TagName="rfqEAV" TagPrefix="uc3" %>
<style type="text/css">
    .style2
    {
        width: 191px;
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
    .style70
    {
        width: 157px;
    }
    .style71
    {
        width: 159px;
    }
    .style72
    {
        width: 57px;
    }
    .style73
    {
        width: 300px;
    }
</style>
<div>
    <asp:RadioButton ID="optQuote" runat="server" GroupName="Quote" Text="Quote" Checked="True" onchange="on_change_option_quote()" />
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:RadioButton ID="optNoQuote" runat="server" GroupName="Quote" Text="No Quote" onchange="on_change_option_quote()" />
</div>
<div id="quoteSection">
    <div align="center">
        <table cellspacing="0" style="min-width: 995px; max-width: 995px; width: 1053px;">
            <tr>
                <td align="right" class="style66">
                    Due Date
                </td>
                <td align="left" class="style27">
                    <asp:Label ID="lblDueDate" runat="server" BackColor="Silver" Style="text-align: center"
                        Width="145px" Height="20px"></asp:Label>
                </td>
                <td align="left" class="style70">
                    <asp:Label ID="lblID" runat="server" Visible="False"></asp:Label>
                </td>
                <td align="left" class="style29">
                    <asp:Label ID="lblMode" runat="server" Visible="False">New</asp:Label>
                </td>
                <td align="left" class="style71" colspan="2">
                    <asp:Label ID="lblBOMDetailID" runat="server" Visible="False"></asp:Label>
                </td>
            </tr>
            <tr>
                <td align="right" class="style66">
                    RFQ #
                </td>
                <td align="left" class="style27">
                    <asp:Label ID="lblRFQNumber" runat="server" Style="text-align: center" Width="145px"
                        BackColor="Silver" Height="20px"></asp:Label>
                </td>
                <td align="right" class="style70">
                    Supplier Name
                </td>
                <td align="left" class="style29">
                    <asp:Label ID="lblSupplierName" runat="server" BackColor="Silver" Width="220px" Height="20px"></asp:Label>
                </td>
                <td align="right" class="style71" style="border-top: solid gray; border-left: solid gray;">
                    Total Manufacturing Cost
                </td>
                <td align="left" class="style31" style="border-top: solid gray; border-right: solid gray;">
                    <asp:Label ID="lblTotalManufacturingCost" Style="text-align: right;" runat="server"
                        BackColor="Silver" Width="104px" Height="20px">0</asp:Label>
                </td>
            </tr>
            <tr>
                <td align="right" class="style66">
                    Part #
                </td>
                <td align="left" class="style27">
                    <asp:Label ID="lblPartNumber" Style="text-align: center" runat="server" BackColor="Silver"
                        Width="145px" Height="20px"></asp:Label>
                </td>
                <td align="right" class="style70">
                    Manufacturing Location
                </td>
                <td align="left" class="style29">
                    <asp:Label ID="lblManufacturingLocation" runat="server" BackColor="Silver" Width="220px"
                        Height="20px"></asp:Label>
                </td>
                <td align="right" class="style71" style="border-left: solid gray;">
                    SG&amp;A Profit
                </td>
                <td align="left" class="style31" style="border-right: solid gray;">
                    <asp:TextBox ID="txtSGAProfit" validate="number" validationid="validatingRFQForm"
                        Style="text-align: right" runat="server" onchange="summarizeTotalPieceCost()"
                        onkeyup="summarizeTotalPieceCost()" Width="100px" TabIndex="2"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td align="right" class="style66">
                    Part Name
                </td>
                <td align="left" class="style27">
                    <asp:Label ID="lblPartName" Style="text-align: center" runat="server" BackColor="Silver"
                        Width="145px" Height="20px"></asp:Label>
                </td>
                <td align="right" class="style70">
                    Ship From Location
                </td>
                <td align="left" class="style29">
                    <asp:Label ID="lblShipFromLocation" runat="server" BackColor="Silver" Width="220px"
                        Height="20px"></asp:Label>
                </td>
                <td align="right" class="style71" style="border-left: solid gray;">
                    Packing Cost/Unit
                </td>
                <td align="left" class="style31" style="border-right: solid gray;">
                    <asp:TextBox ID="txtPackingCostUnit" validate="number" validationid="validatingRFQForm"
                        Style="text-align: right" onchange="summarizeTotalPieceCost()" onkeyup="summarizeTotalPieceCost()"
                        runat="server" Width="100px" TabIndex="3"></asp:TextBox>
                </td>
            </tr>
            <tr align="left">
                <td align="right" class="style66">
                    Drawing Level
                </td>
                <td align="left" class="style27">
                    <asp:Label ID="lblDrawingLevel" runat="server" Style="text-align: center" BackColor="Silver"
                        Width="145px" Height="20px"></asp:Label>
                </td>
                <td align="right" class="style70">
                    Prepared By
                </td>
                <td align="left" class="style29">
                    <asp:TextBox ID="txtPreparedBy" validate="required" validationid="validatingRFQForm"
                        runat="server" Style="width: 216px" TabIndex="1"></asp:TextBox>
                </td>
                <td align="right" class="style71" style="border-left: solid gray;">
                    Assembly Cost/Unit
                </td>
                <td align="left" class="style31" style="border-right: solid gray;">
                    <asp:TextBox ID="txtAssemblyCostUnit" validate="number" validationid="validatingRFQForm"
                        Style="text-align: right" onchange="summarizeTotalPieceCost()" onkeyup="summarizeTotalPieceCost()"
                        runat="server" Width="100px" TabIndex="4"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td align="right" class="style66">
                    Market Sector
                </td>
                <td align="left" class="style27">
                    <asp:Label ID="lblMarketSector" runat="server" Style="text-align: center" BackColor="Silver"
                        Width="145px" Height="20px"></asp:Label>
                </td>
                <td align="right" class="style70">
                </td>
                <td align="left" class="style29">
                </td>
                <td align="right" class="style71" style="border-left: solid gray; border-bottom: solid gray;">
                    Total Piece Cost
                </td>
                <td align="left" class="style31" style="border-right: solid gray; border-bottom: solid gray;">
                    <asp:Label ID="lblTotalPieceCost" runat="server" Style="text-align: right" BackColor="Silver"
                        Width="104px" Height="20px">123456</asp:Label>
                </td>
            </tr>
            <tr>
                <td align="right" class="style66">
                    Target Price
                </td>
                <td align="left" class="style27">
                    <asp:Label ID="lblTargetPrice" runat="server" Style="text-align: right" BackColor="Silver"
                        Width="145px" Height="20px">123456</asp:Label>
                </td>
                <td align="right" class="style70">
                </td>
                <td align="left" class="style29">
                </td>
                <td align="right" class="style71">
                </td>
                <td align="left" class="style72">
                </td>
            </tr>
        </table>
        <br />
        <table>
            <tr>
                <td align="center">
                    Estimated Annual Volume<br />
                    <uc3:rfqEAV ID="uscRfqEAV" runat="server" />
                </td>
                <td align="center">
                    <table>
                        <tr>
                            <td align="right">
                                Production Lead Time
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtProductionLeadTime" validate="required" validationid="validatingRFQForm"
                                    runat="server" Style="text-align: right" Width="240px" TabIndex="5"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                Production Tooling Lead Time
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtProductionToolingLeadTime" validate="required" validationid="validatingRFQForm"
                                    runat="server" Style="text-align: right" Width="240px" TabIndex="6"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                Prototype Tooling Lead Time
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtPrototypeToolingLeadTime" validate="required" validationid="validatingRFQForm"
                                    runat="server" Style="text-align: right" Width="240px" TabIndex="7"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                Prototype Piece Lead Time
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtPrototypePieceLeadTime" validate="required" validationid="validatingRFQForm"
                                    runat="server" Style="text-align: right" Width="240px" TabIndex="8"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <div style="border: solid; height: 25px; border-color: silver; border-width: 2px;">
        </div>
        <br />
        <uc1:rfqDetailList ID="uscRFQDetailList" runat="server" />
    </div>
    <div align="center">
        <table cellspacing="0" class="style55">
            <tr align="center">
                <td class="style58" colspan="2">
                    Tooling Detail
                </td>
                <td class="style63" rowspan="5">
                </td>
                <td>
                    Annual Cost Reduction Commitment
                </td>
                <td rowspan="5" class="style63">
                </td>
                <td rowspan="5">
                    <table>
                        <tr>
                            <td align="right">
                                Weight
                                <asp:TextBox ID="txtWeight" validate="required" validationid="validatingRFQForm"
                                    runat="server" Style="text-align: right" Width="130px" TabIndex="5"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                MOQ
                                <asp:TextBox ID="txtMOQ" validate="required" validationid="validatingRFQForm"
                                    runat="server" Style="text-align: right" Width="130px" TabIndex="5"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                Make
                                <asp:TextBox ID="txtMake" validate="required" validationid="validatingRFQForm"
                                    runat="server" Style="text-align: right" Width="130px" TabIndex="5"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align="left">
                                Comments
                            </td>
                        </tr>
                        <tr>
                            <td align="left">
                                <asp:TextBox ID="txtComments" validate="required" validationid="validatingRFQForm"
                                    runat="server" Style="text-align: right" Width="300px" TabIndex="5" Height="47px"
                                    TextMode="MultiLine"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td class="style56" colspan="2" align="right">
                    <asp:TextBox ID="txtToolingDetail" validate="required" validationid="validatingRFQForm"
                        runat="server" Width="300px" Height="40px" TabIndex="21" TextMode="MultiLine"></asp:TextBox>
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
                    <asp:TextBox ID="txtProductionTooling" validate="number" validationid="validatingRFQForm"
                        Style="text-align: right" runat="server" TabIndex="22"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td align="right" class="style61">
                    Prototype Tooling
                </td>
                <td class="style62" align="right">
                    <asp:TextBox ID="txtPrototypeTooling" validate="number" validationid="validatingRFQForm"
                        Style="text-align: right" runat="server" TabIndex="23"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td align="right" class="style61">
                    Prototype Piece
                </td>
                <td class="style62" align="right">
                    <asp:TextBox ID="txtPrototypePiece" validate="number" validationid="validatingRFQForm"
                        Style="text-align: right" runat="server" TabIndex="24"></asp:TextBox>
                </td>
            </tr>
        </table>
        <div align="center">
        <br />
            <asp:CheckBox ID="chkIAgree" runat="server" Text="I Agree" />
        </div>
    </div>
</div>
<div id="noQuoteSection" style="vertical-align: top;">
    Reason
    <asp:TextBox ID="txtReasonNoQuote" runat="server" Height="60px" TextMode="MultiLine"
        Width="220px"></asp:TextBox>
</div>
<br />
<br />
<asp:HiddenField ID="hiddenSupplierID" runat="server" />
<br />
<br />

<script type="text/javascript">
    jQuery(document).ready(function() {
        on_change_option_quote();
    });

    function on_change_option_quote() {
        var optQuote = jQuery("#<%= optQuote.ClientID %>");
        if (optQuote.is(':checked')) {
            jQuery("#quoteSection").show();
            jQuery("#noQuoteSection").hide();
        } else {
            jQuery("#quoteSection").hide();
            jQuery("#noQuoteSection").show();
        }
    }
    
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
    window.onload = summarizeTotalPieceCost();
</script>