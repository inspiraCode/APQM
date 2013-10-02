<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RFQ.aspx.cs" Inherits="RFQDefault"
    MasterPageFile="~/_Layouts/MasterP.master" %>

<%@ Register Src="../Menu.ascx" TagName="Menu" TagPrefix="uc2" %>
<%@ Register Src="../Supplier/supplierMaster.ascx" TagName="supplierMaster" TagPrefix="uc1" %>
<%@ Register Src="rfqListByBom.ascx" TagName="rfqListByBom" TagPrefix="uc3" %>
<%@ Register Src="rfqCountPerBomLines.ascx" TagName="rfqCountPerBomLines" TagPrefix="uc4" %>
<%@ Register Src="sendNewRFQ.ascx" TagName="sendNewRFQ" TagPrefix="uc5" %>
<%@ Register Src="rfqCountPerSharedItems.ascx" TagName="rfqCountPerSharedItems" TagPrefix="uc6" %>
<%@ Register Src="rfqList.ascx" TagName="rfqList" TagPrefix="uc7" %>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="PlaceHolderLeft">
    <asp:MultiView ID="Left_Col" runat="server" ActiveViewIndex="0">
        <asp:View ID="Functions" runat="server">
            <uc2:Menu ID="uscMenu" runat="server" />
        </asp:View>
    </asp:MultiView>
    <asp:Panel ID="panelPopup" runat="server" Visible="false">
        <asp:MultiView ID="multiViewPopup" runat="server" ActiveViewIndex="0">
            <asp:View ID="viewRFQListByBom" runat="server">
                <uc3:rfqListByBom ID="uscRfqListByBom" runat="server" />
                <div align="right">
                    <asp:Button ID="btnClosePopup" runat="server" Text="Close" OnClick="btnClosePopup_Click" /></div>

                <script type="text/javascript">
                    document.getElementById("<%= this.panelPopup.ClientID %>").setAttribute("title", "RFQ By BOM Line");
                    jQuery("#<%= this.panelPopup.ClientID %>").dialog({ autoOpen: true,
                        appendTo: jQuery('form:first'),
                        width: 800, modal: true,
                        dialogClass: "no-close", closeOnEscape:false     
                    });
                </script>

            </asp:View>
            <asp:View ID="viewSendNewRFQ" runat="server">
                <uc5:sendNewRFQ ID="uscSendNewRFQ" runat="server" OnCancel_Click="on_cancel_sendRFQ"
                    OnOk_Click="on_ok_sendRFQ" />

                <script type="text/javascript">
                    document.getElementById("<%= this.panelPopup.ClientID %>").setAttribute("title", "Send New RFQ");
                    jQuery("#<%= this.panelPopup.ClientID %>").dialog({ autoOpen: true,
                        appendTo: jQuery('form:first'),
                        width: 530, modal: true,
                        dialogClass: "no-close", closeOnEscape:false     
                    });
                </script>

            </asp:View>
        </asp:MultiView>
    </asp:Panel>
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="PlaceHolderMain">
    <div id="Tabs" class="tabDiv" class="Content">
        <asp:Button ID="tabRFQ" runat="server" Text="RFQ" OnClick="tabRFQ_Click" class="tabSelected" />
        <asp:Button ID="tabRFQCountPerBOMDetail" runat="server" class="tabUnselected" OnClick="tabRFQPerBOMDetail_Click"
            Text="RFQs per BOM Lines" />
        <asp:Button ID="tabRFQCountPerSharedItems" runat="server" class="tabUnselected" OnClick="tabRFQPerSharedItems_Click"
            Text="RFQs per Shared Items" />
    </div>
    <asp:MultiView ID="MultiViewMain" runat="server" ActiveViewIndex="0" OnActiveViewChanged="on_activeView_changed">
        <asp:View ID="viewRFQList" runat="server">
            <div style="border-left: solid 1px; padding: 50px 10px 0 10px; position: relative;">
                <div runat="server" id="divRFQ">
                    <uc7:rfqList ID="uscRfqList" runat="server" />
                </div>
            </div>
        </asp:View>
        <asp:View ID="viewRFQCountPerBOMDetail" runat="server">
            <div style="border-left: solid 1px; padding: 50px 10px 0 10px; position: relative;">
                <div runat="server" id="divRFQCountPerBOMDetail">
                    <uc4:rfqCountPerBomLines ID="uscRfqCountPerBomLines" OnRow_Command="on_rfqCountPerBomLines_rowCommand"
                        runat="server" />
                </div>
            </div>
        </asp:View>
        <asp:View ID="viewRFQCountPerSharedItems" runat="server">
            <div style="border-left: solid 1px; padding: 50px 10px 0 10px; position: relative;">
                <div runat="server" id="divRFQCountPerSharedItems">
                    <uc6:rfqCountPerSharedItems ID="uscRfqCountPerSharedItems" runat="server" />
                </div>
            </div>
        </asp:View>
    </asp:MultiView>
</asp:Content>
