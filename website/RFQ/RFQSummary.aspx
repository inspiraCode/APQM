<%@ Page Title="" Language="C#" MasterPageFile="~/_Layouts/MasterP.master" AutoEventWireup="true" CodeFile="RFQSummary.aspx.cs" Inherits="RFQSummary" %>

<%@ Register src="../Menu.ascx" tagname="Menu" tagprefix="uc1" %>

<%@ Register src="Summary/RFQSummaryForm.ascx" tagname="RFQSummaryForm" tagprefix="uc2" %>

<%@ Register src="Summary/selectSIF.ascx" tagname="selectSIF" tagprefix="uc3" %>

<%@ Register src="Summary/selectBOMLine.ascx" tagname="selectBOMLine" tagprefix="uc4" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PlaceHolderLeft" Runat="Server">
<asp:MultiView ID="Left_Col" runat="server" ActiveViewIndex="0">
        <asp:View ID="Functions" runat="server">            
            <uc1:Menu ID="uscMenu" runat="server" />
        </asp:View>
    </asp:MultiView>    
    <asp:Panel ID="panelPopup" runat="server" Visible="false">
    <div class="mainSection">
    <asp:MultiView ID="multiViewPopup" runat="server" ActiveViewIndex="0">
            <asp:View ID="viewSIF" runat="server">
            
                <uc3:selectSIF ID="uscSelectSIF" runat="server" OnRow_Command="on_rowCommand" />

                <script type="text/javascript">
                    jQuery("#<%= this.panelPopup.ClientID %>").dialog({ autoOpen: true,
                        appendTo: jQuery('form:first'),
                        width: 900, modal: true,
                        height: 460,
                        dialogClass: "no-close",
                        closeOnEscape:false,
                        draggable:false               
                    });
                </script>

            </asp:View>
            <asp:View ID="viewBOM" runat="server">
            
               <uc4:selectBOMLine ID="uscSelectBOM" runat="server" OnRow_Command="on_rowCommand"  />

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
    </div>
        
        <div align="right">       
        <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" /></div>
    </asp:Panel>
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PlaceHolderMain" Runat="Server">
    <br />
    <asp:Button ID="btnSelect" runat="server" Text="Select Program" TabIndex="1"
        onclick="btnSelect_Click" />
    <br />    
    <br />
    <div align="left">
        <asp:HyperLink ID="hlnkOpenPage" runat="server" NavigateUrl="~/RFQ/Summary/rfqSummaryPage.aspx"
            Target="_blank" Visible="False">Open in a separate page</asp:HyperLink>
    </div>
    <br />
    <uc2:RFQSummaryForm ID="uscRFQSummaryForm" runat="server" />

</asp:Content>