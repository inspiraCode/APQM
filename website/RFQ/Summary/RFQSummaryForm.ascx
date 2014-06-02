<%@ Control Language="C#" AutoEventWireup="true" CodeFile="RFQSummaryForm.ascx.cs"
    Inherits="RFQSummaryForm" %>
<%@ Register Src="rfqSummaryDetail.ascx" TagName="rfqSummaryDetail" TagPrefix="uc1" %>
<%@ Register Src="../../Utils/Validator/Validator.ascx" TagName="Validator" TagPrefix="uc2" %>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" OnInit="on_sqldatasource_Init"
    SelectCommand="SELECT SIFHeader.SIFHeaderKey, SIFHeader.InquiryNumber, BOMHeader.BOMHeaderKey, BOMDetail.BOMDetailKey, ItemMaster.PartNumber, SIFHeader.Application,
                BOMDetail.Material, BOMDetail.Description, SIFHeader.Product 
                FROM SIFHeader INNER JOIN BOMHeader ON SIFHeader.SIFHeaderKey = BOMHeader.SIFHeaderKey INNER JOIN 
                BOMDetail ON BOMHeader.BOMHeaderKey = BOMDetail.BOMHeaderKey INNER JOIN ItemMaster ON BOMDetail.ItemMasterKey = ItemMaster.ItemMasterKey 
                WHERE (BOMDetail.BOMDetailKey = @BOMDetailID)" ProviderName="System.Data.SqlClient">
    <SelectParameters>
        <asp:ControlParameter ControlID="txtBomDetailID" Name="BOMDetailID" PropertyName="Value" />
    </SelectParameters>
</asp:SqlDataSource>
<div style="width: 100%; height: 120px;">
    <asp:FormView ID="frmRFQSummaryHeader" runat="server" DataSourceID="SqlDataSource1"
        Style="margin-top: 8px;" align="right">
        <ItemTemplate>
            <table cellspacing="0" class="style1">
                <tr>
                    <td align="right" class="style5">
                        InquiryNumber:
                    </td>
                    <td class="style4" style="background-color: #C0C0C0; width: 300px;">
                        <asp:Label ID="InquiryNumberLabel" runat="server" Text='<%# Bind("InquiryNumber") %>' />
                    </td>
                </tr>
                <tr>
                    <td align="right" class="style5">
                        Finished Good Description:
                    </td>
                    <td class="style4" style="background-color: #C0C0C0">
                        <asp:Label ID="PartDescriptionLabel" Width="100%" runat="server" Text='<%# Bind("Product") %>' />
                    </td>
                </tr>
                <tr>
                    <td align="right" class="style5">
                        SIF Program:
                    </td>
                    <td class="style4" style="background-color: #C0C0C0">
                        <asp:Label ID="TopPartNumberLabel" runat="server" Text='<%# Bind("Application") %>' />
                    </td>
                </tr>
                <tr>
                    <td align="right" class="style5">
                        Component Part Number:
                    </td>
                    <td class="style4" style="background-color: #C0C0C0">
                        <asp:Label ID="PartNumberLabel" runat="server" Text='<%# Bind("PartNumber") %>' />
                    </td>
                </tr>
                <tr>
                    <td align="right" class="style5">
                        Component Material:
                    </td>
                    <td class="style4" style="background-color: #C0C0C0">
                        <asp:Label ID="MaterialLabel" runat="server" Text='<%# Bind("Material") %>' />
                    </td>
                </tr>
                <%--<tr>
                <td align="right" class="style5">
                    Component Description:
                </td>
                <td class="style4" style="background-color: #C0C0C0">
                    <asp:Label ID="DescriptionLabel" runat="server" Text='<%# Bind("Description") %>' />
                </td>
            </tr>--%>
                <tr>
                    <td align="right" class="style5">
                        EAU:
                    </td>
                    <td class="style4" style="background-color: #C0C0C0">
                        <asp:TextBox ID="txtEAV" Width="100px" runat="server" mainEAV="" onchange="setEAVValues()"
                            onkeyup="setEAVValues()" Style="text-align: right;"></asp:TextBox>
                    </td>
                </tr>
            </table>
        </ItemTemplate>
    </asp:FormView>
    <div id="divEAV">
    </div>
</div>
<div align="center">
    <br />
    <div id="divSummaryDetail"></div>
    
    <uc1:rfqSummaryDetail ID="uscRfqSummaryList" runat="server" />
</div>
<div id="divRFQSummaryHeader" align="left" style="clear: both; height: 500px;" runat="server"
    visible="false">
    <table align="left">
        <tr>
            <td>
                PPAP Date:
            </td>
            <td>
                <asp:TextBox ID="txtPPAPDate" datepicker="true" runat="server"></asp:TextBox>
            </td>
            <td style="width: 100px;">
            </td>
            <td>
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td>
                Initial Release Quantity:
            </td>
            <td>
                <asp:TextBox ID="txtInitialReleaseQty" runat="server"></asp:TextBox>
            </td>
            <td>
            </td>
            <td>
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td>
                Initial Release Date:
            </td>
            <td>
                <asp:TextBox ID="txtInitialReleaseDate" datepicker="true" runat="server"></asp:TextBox>
            </td>
            <td>
            </td>
            <td>
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td>
                Pre-Build Quanity:
            </td>
            <td>
                <asp:TextBox ID="txtPreBuildQty" runat="server"></asp:TextBox>
            </td>
            <td>
            </td>
            <td>
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td>
                Pre-Build Date
            </td>
            <td>
                <asp:TextBox ID="txtPreBuildDate" datepicker="true" runat="server"></asp:TextBox>
            </td>
            <td>
            </td>
            <td>
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td>
                Recommended Supplier
            </td>
            <td>
                <asp:Label ID="lblRecommendedSupplier" runat="server" Text='' Style="width: 300px;
                    background-color: #d3d3d3; height: 20px; display: block;"></asp:Label>
            </td>
            <td>
            </td>
            <td>
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td>
            </td>
            <td>
            </td>
            <td>
            </td>
            <td>
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td>
            </td>
            <td>
                &nbsp;
            </td>
            <td style="font-weight: bold">
                Purchasing
            </td>
            <td>
                All Recommendations
            </td>
            <td>
                <asp:TextBox ID="txtPurchasingAllRecommendations" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
            </td>
            <td>
            </td>
            <td style="font-weight: bold">
                Engineering
            </td>
            <td>
                All Concurrences
            </td>
            <td>
                <asp:TextBox ID="txtEnginneringAllConcurrences" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
            </td>
            <td>
            </td>
            <td style="font-weight: bold">
                Manufacturing
            </td>
            <td>
                All Concurrences
            </td>
            <td>
                <asp:TextBox ID="txtManfufacturingAllConcurrences" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
            </td>
            <td>
            </td>
            <td style="font-weight: bold">
                Quality
            </td>
            <td>
                All Concurrences
            </td>
            <td>
                <asp:TextBox ID="txtQualityAllConcurrences" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
            </td>
            <td>
            </td>
            <td style="font-weight: bold">
                Sales
            </td>
            <td>
                All Concurrences
            </td>
            <td>
                <asp:TextBox ID="txtSalesAllConcurrences" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
            </td>
            <td>
            </td>
            <td>
            </td>
            <td>
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td align="right">
                Notes:
            </td>
            <td colspan="4" rowspan="3">
                <asp:TextBox ID="txtNotes" runat="server" Height="100px" Width="100%"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
            </td>
        </tr>
        <tr>
            <td>
            </td>
        </tr>
    </table>
</div>
<asp:HiddenField ID="txtBomDetailID" runat="server" />
<asp:Button ID="btnSave" runat="server" Text="Save" class="btnInTitle dontprint"
    Style="right: 125px; width: 110px;" OnClick="btnSave_Click" />
<uc2:Validator ID="uscValidator" runat="server" />
<script type="text/javascript">
    var bomDetailID;
    jQuery(document).ready(function () {
        bomDetailID = jQuery('#<%= txtBomDetailID.ClientID %>').val();
        if (bomDetailID != "")
            getRFQSummary(bomDetailID);

    });

    var RFQSummary;
    function load() {

    }
    function getRFQSummary(id) {
        jQuery.getJSON('<%= ResolveUrl("~/WebService/RFQSummary.aspx") %>?cmd=read&id=' + id, function (result) {
            RFQSummary = result;
            refreshForm();
            //jQuery("#divImgEmail").css("display", "none");
        });
        return true;
    }
    function resetForm() {

        //        jQuery("[bindTo]").each(function () {
        //            setValueForControl(this, jQuery(this), '');
        //        });

        jQuery("#divEAV").empty();
    }
    function loadEAUs() {
        var strTable = '<table id="tableEAUs" cellspacing="0" border="0">';
//        strTable += '<tr><td><input type="radio" name="optEAU" checked="checked"></td><td>Manual</ td><td></ td></ tr>';
        //        strTable += '<tr><td><input type="radio" name="optEAU"></td><td>Equal to:</ td><td><input type="text" value="" id="txtEqualEAU" style="width:100px;"></ td></ tr>';
        strTable += '<tr><td></td><td style="text-align: right;">EAV</ td><td style="text-align: right;">Calendar Years</ td></ tr>';
        var eauGroupped = getEAUGroupped();
        for (current in eauGroupped) {
            if (eauGroupped.hasOwnProperty(current)) {
                strTable += '<tr><td><input optEAU_ID="' + current + '" type="radio" name="optEAU" onclick="onFilterEAU(event);"></td><td style="width: 70px;text-align: right;">' + current + '</ td><td style="width: 130px;text-align: right;">2013, 2014</ td></ tr>';
            }
        }
        strTable += '</ table>';
        jQuery("#divEAV").append(strTable);
        jQuery(":radio").eq(0).attr("checked", true);
        filterColumnsByEAU(jQuery(":radio").eq(0).parent().siblings().eq(0).text());
    }
    function getEAUGroupped() {
        var result = {};
        if (RFQSummary.RfqSummaryList != null) {
            for (var i = 0; i < RFQSummary.RfqSummaryList.length; i++) {
                var current = RFQSummary.RfqSummaryList[i];
                if (!(current.EstimatedAnnualVolume in result)) {
                    result[current.EstimatedAnnualVolume] = current.EstimatedAnnualVolume;
                }
            }
        }
        return result;
    }
    function onFilterEAU(e) {
        if (!e) e = window.event;
        var target = e.target || e.srcElement;
        var eau = jQuery(target).parent().siblings().eq(0).text();
        filterColumnsByEAU(eau);
    }
    function filterColumnsByEAU(eau) {
        jQuery('#opt' + eau).attr("checked", true);
        jQuery('[eav_volume]').hide();
        jQuery('[eav_volume="' + eau + '"]').show();
        makeShapeshift();
    }

    function refreshForm() {
        var scrollPosition = jQuery("body").scrollTop();
        resetForm();
        //bindParentFields();
        loadEAUs();
        //onFilterEAU(jQuery(":radio").eq(0));
        jQuery("body").scrollTop(scrollPosition);
        
    }

    var mainEAV = jQuery('[mainEAV]');
    function setEAVValues() {
        jQuery('[fieldName=txtEAV]').each(function () { jQuery(this).val(mainEAV.val()) });
        jQuery('[item]').each(function () { summarizeColumn(jQuery(this).attr("item")) });
    }
</script>
