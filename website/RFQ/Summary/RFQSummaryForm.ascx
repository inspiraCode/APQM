﻿<%@ Control Language="C#" AutoEventWireup="true" CodeFile="RFQSummaryForm.ascx.cs"
    Inherits="RFQSummaryForm" %>
<%@ Register Src="rfqSummaryDetail.ascx" TagName="rfqSummaryDetail" TagPrefix="uc1" %>
<%@ Register Src="selectRFQ.ascx" TagName="selectRFQ" TagPrefix="uc2" %>
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
<asp:FormView ID="frmRFQSummaryHeader" runat="server" DataSourceID="SqlDataSource1" style="float:right;margin-top:8px;">
    <ItemTemplate>
        <table cellspacing="0" class="style1">
            <tr>
                <td  align="right" class="style5">
                    InquiryNumber:
                </td>
                <td class="style4" style="background-color: #C0C0C0">
                    <asp:Label ID="InquiryNumberLabel" runat="server" Text='<%# Bind("InquiryNumber") %>' />
                </td>
            </tr>
            <tr>
                <td  align="right" class="style5">
                    Part Description:
                </td>
                <td class="style4" style="background-color: #C0C0C0">
                    <asp:Label ID="PartDescriptionLabel" Width="100%" runat="server" Text='<%# Bind("PartDescription") %>' />
                </td>
            </tr>
            <tr>
                <td  align="right" class="style5">
                    SIF Program:</td>
                <td class="style4" style="background-color: #C0C0C0">
                    <asp:Label ID="TopPartNumberLabel" runat="server" Text='<%# Bind("TopPartNumber") %>' />
                </td>
            </tr>
            <tr>
                <td  align="right" class="style5">
                    &nbsp;
                    Component
                    Part Number:
                </td>
                <td class="style4" style="background-color: #C0C0C0">
                    <asp:Label ID="PartNumberLabel" runat="server" Text='<%# Bind("PartNumber") %>' />
                </td>
            </tr>
            <tr>
                <td  align="right" class="style5">
                    Component
                    Material:
                </td>
                <td class="style4" style="background-color: #C0C0C0">
                    <asp:Label ID="MaterialLabel" runat="server" Text='<%# Bind("Material") %>' />
                </td>
            </tr>
            <tr>
                <td  align="right" class="style5">
                    Component
                    Description:
                </td>
                <td class="style4" style="background-color: #C0C0C0">
                    <asp:Label ID="DescriptionLabel" runat="server" Text='<%# Bind("Description") %>' />
                </td>
            </tr>
            <tr>
                <td  align="right" class="style5">
                    Component
                    No Required:
                </td>
                <td class="style4" style="background-color: #C0C0C0">
                    <asp:Label ID="QtyLabel" runat="server" Text='<%# Bind("Qty") %>' />
                </td>
            </tr>
            <tr>
                <td  align="right" class="style5">
                    Component
                    UM:
                </td>
                <td class="style4" style="background-color: #C0C0C0">
                    <asp:Label ID="UMLabel" runat="server" Text='<%# Bind("UM") %>' />
                </td>
            </tr>
        </table>
    </ItemTemplate>
</asp:FormView>

<div align="center">
    <br />
    <uc1:rfqSummaryDetail ID="uscRfqSummaryList" runat="server" Onselect_RFQ="on_select_rfq" />
</div>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" OnInit="on_sqldatasource_Init"
    SelectCommand="SELECT SIFHeader.SIFHeaderKey, SIFHeader.InquiryNumber, BOMHeader.BOMHeaderKey, BOMHeader.TopPartNumber, BOMHeader.PartDescription, BOMDetail.BOMDetailKey, BOMDetail.Qty, ItemMaster.PartNumber, ItemMaster.Description, ItemMaster.UM, ItemMaster.Material, BOMDetail.Cost FROM SIFHeader INNER JOIN BOMHeader ON SIFHeader.SIFHeaderKey = BOMHeader.SIFHeaderKey INNER JOIN BOMDetail ON BOMHeader.BOMHeaderKey = BOMDetail.BOMHeaderKey INNER JOIN ItemMaster ON BOMDetail.ItemMasterKey = ItemMaster.ItemMasterKey WHERE (BOMDetail.BOMDetailKey = @BOMDetailID)"
    ProviderName="System.Data.SqlClient">
    <SelectParameters>
        <asp:ControlParameter ControlID="txtBomDetailID" Name="BOMDetailID" PropertyName="Text" />
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
