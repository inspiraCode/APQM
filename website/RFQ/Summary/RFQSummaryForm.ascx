<%@ Control Language="C#" AutoEventWireup="true" CodeFile="RFQSummaryForm.ascx.cs"
    Inherits="RFQSummaryForm" %>
<%@ Register Src="rfqSummaryDetail.ascx" TagName="rfqSummaryDetail" TagPrefix="uc1" %>
<%@ Register src="../../Utils/Validator/Validator.ascx" tagname="Validator" tagprefix="uc2" %>
<style type="text/css">
    .style1
    {
        width: 410px;
    }
    .style4
    {
        max-width: 350px;
    }
    .style5
    {
        width: 150px;
    }
</style>
   
<asp:FormView ID="frmRFQSummaryHeader" runat="server" DataSourceID="SqlDataSource1"
    Style="float: right; margin-top: 8px;">
    <ItemTemplate>
        <table cellspacing="0" class="style1">
            <tr>
                <td align="right" class="style5">
                    InquiryNumber:
                </td>
                <td class="style4" style="background-color: #C0C0C0">
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
                    EAU
                </td>
                <td class="style4" style="background-color: #C0C0C0">
                    <asp:TextBox ID="txtEAV" Width="100px" runat="server" mainEAV="" onchange="setEAVValues()"
                        onkeyup="setEAVValues()" Style="text-align: right;"></asp:TextBox>
                </td>
            </tr>
        </table>
    </ItemTemplate>
</asp:FormView>
<div align="center">
    <br />
    <uc1:rfqSummaryDetail ID="uscRfqSummaryList" runat="server" />
</div> 
<asp:SqlDataSource ID="SqlDataSource1" runat="server" OnInit="on_sqldatasource_Init"
    SelectCommand="SELECT SIFHeader.SIFHeaderKey, SIFHeader.InquiryNumber, BOMHeader.BOMHeaderKey, BOMDetail.BOMDetailKey, ItemMaster.PartNumber, SIFHeader.Application,
                    BOMDetail.Material, BOMDetail.Description, SIFHeader.Product 
                    FROM SIFHeader INNER JOIN BOMHeader ON SIFHeader.SIFHeaderKey = BOMHeader.SIFHeaderKey INNER JOIN 
                    BOMDetail ON BOMHeader.BOMHeaderKey = BOMDetail.BOMHeaderKey INNER JOIN ItemMaster ON BOMDetail.ItemMasterKey = ItemMaster.ItemMasterKey 
                    WHERE (BOMDetail.BOMDetailKey = @BOMDetailID)" ProviderName="System.Data.SqlClient">
    <SelectParameters>
        <asp:ControlParameter ControlID="txtBomDetailID" Name="BOMDetailID" PropertyName="Text" />
    </SelectParameters>
</asp:SqlDataSource>
<asp:TextBox ID="txtBomDetailID" runat="server" Visible="False"></asp:TextBox>

<uc2:Validator ID="uscValidator" runat="server" />


<script type="text/javascript">
    var mainEAV = jQuery('[mainEAV]');
    function setEAVValues() {
        jQuery('[fieldName=txtEAV]').each(function() { jQuery(this).val(mainEAV.val()) });
        jQuery('[item]').each(function() { summarizeColumn(jQuery(this).attr("item")) });
    }
</script>

