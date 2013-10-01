﻿<%@ Page Title="" Language="C#" MasterPageFile="~/_Layouts/MasterP.master" AutoEventWireup="true"
    CodeFile="RFQSummary.aspx.cs" Inherits="RFQSummary" %>

<%@ Register Src="../Menu.ascx" TagName="Menu" TagPrefix="uc1" %>
<%@ Register Src="Summary/RFQSummaryForm.ascx" TagName="RFQSummaryForm" TagPrefix="uc2" %>
<%@ Register Src="Summary/selectSIF.ascx" TagName="selectSIF" TagPrefix="uc3" %>
<%@ Register Src="Summary/selectBOMLine.ascx" TagName="selectBOMLine" TagPrefix="uc4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PlaceHolderLeft" runat="Server">
    <asp:MultiView ID="Left_Col" runat="server" ActiveViewIndex="0">
        <asp:View ID="Functions" runat="server">
            <uc1:Menu ID="uscMenu" runat="server" />
        </asp:View>
    </asp:MultiView>
    <asp:Panel ID="panelPopup" runat="server" Visible="false">
        <asp:MultiView ID="multiViewPopup" runat="server" ActiveViewIndex="0">
            <asp:View ID="viewSIF" runat="server">
                <div class="mainSection">
                    <uc3:selectSIF ID="uscSelectSIF" runat="server" OnRow_Command="on_rowCommand" />
                    <br />
                    <br />
                </div>
                <div align="right">
                    <asp:Button ID="Button1" runat="server" Text="Cancel" OnClick="btnCancel_Click" /></div>

                <script type="text/javascript">
                    jQuery("#<%= this.panelPopup.ClientID %>").dialog({ autoOpen: true,
                        appendTo: jQuery('form:first'),
                        width: 900, modal: true,
                        height: 460,
                        dialogClass: "no-close",
                        closeOnEscape: false,
                        draggable: false
                    });
                </script>

            </asp:View>
            <asp:View ID="viewBOM" runat="server">
                <div class="mainSection">
                    <uc4:selectBOMLine ID="uscSelectBOM" runat="server" OnRow_Command="on_rowCommand" />
                    <br />
                    <br />
                </div>
                <div align="right">
                    <asp:Button ID="btnBackToSIFList" runat="server" Text="Back" OnClick="btnBackToSIF_Click" />
                    <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" /></div>

                <script type="text/javascript">
                    jQuery("#<%= this.panelPopup.ClientID %>").dialog({ autoOpen: true,
                        appendTo: jQuery('form:first'),
                        width: 900, modal: true,
                        height: 460,
                        dialogClass: "no-close",
                        closeOnEscape: false,
                        draggable: false
                    });
                </script>

            </asp:View>
        </asp:MultiView>
    </asp:Panel>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PlaceHolderMain" runat="Server">
    <br />
    <asp:Button ID="btnSelect" runat="server" Text="Select Program" TabIndex="1" OnClick="btnSelect_Click" />
    <br />
    <br />
    <div align="left">
        <asp:HyperLink ID="hlnkOpenPage" runat="server" NavigateUrl="~/RFQ/Summary/rfqSummaryPage.aspx"
            Target="_blank" Visible="False">Open in a separate page</asp:HyperLink>
    </div>
    <br />
    <uc2:RFQSummaryForm ID="uscRFQSummaryForm" runat="server" />
</asp:Content>
