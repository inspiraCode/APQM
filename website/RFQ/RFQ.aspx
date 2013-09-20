<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RFQ.aspx.cs" Inherits="_Default"
    MasterPageFile="~/_Layouts/MasterP.master" %>

<%@ Register Src="../Menu.ascx" TagName="Menu" TagPrefix="uc2" %>
<%@ Register Src="../Supplier/supplierMaster.ascx" TagName="supplierMaster" TagPrefix="uc1" %>
<%@ Register Src="rfqListByBom.ascx" TagName="rfqListByBom" TagPrefix="uc3" %>
<%@ Register Src="rfqCountPerBomLines.ascx" TagName="rfqCountPerBomLines" TagPrefix="uc4" %>
<%@ Register src="sendNewRFQ.ascx" tagname="sendNewRFQ" tagprefix="uc5" %>
<%@ Register src="rfqCountPerSharedItems.ascx" tagname="rfqCountPerSharedItems" tagprefix="uc6" %>
<%@ Register src="rfqList.ascx" tagname="rfqList" tagprefix="uc7" %>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="PlaceHolderLeft">
    <asp:MultiView ID="Left_Col" runat="server" ActiveViewIndex="0">
        <asp:View ID="Functions" runat="server">
            <uc2:Menu ID="uscMenu" runat="server" />
        </asp:View>
    </asp:MultiView>    
    <asp:Panel ID="panelPopup" runat="server" Visible="false">
        <asp:Panel runat="server" CssClass="Overlay">
            
        </asp:Panel>
        <asp:Panel ID="popupContainer" runat="server" CssClass="PopUpPanel">
            <asp:MultiView ID="multiViewPopup" runat="server" ActiveViewIndex="0">
                <asp:View ID="viewRFQListByBom" runat="server">
                    <uc3:rfqListByBom ID="uscRfqListByBom" runat="server" />                    
                    <div align="right"><asp:Button ID="btnClosePopup" runat="server" Text="Close" OnClick="btnClosePopup_Click"/></div>
                </asp:View>
                <asp:View ID="viewSendNewRFQ" runat="server">                    
                    <uc5:sendNewRFQ ID="uscSendNewRFQ" runat="server" OnCancel_Click="on_cancel_sendRFQ" OnOk_Click="on_ok_sendRFQ" />
                </asp:View>
            </asp:MultiView>            
        </asp:Panel>
    </asp:Panel>
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="PlaceHolderMain">
    <link href="../Tab.css" rel="stylesheet" type="text/css" />
    <div id="Tabs" class="tabDiv">
        <asp:Button ID="tabRFQ" runat="server" Text="RFQ" OnClick="tabRFQ_Click" class="tabSelected" />
        <asp:Button ID="tabRFQCountPerBOMDetail" runat="server" class="tabUnselected" OnClick="tabRFQPerBOMDetail_Click" Text="RFQs per BOM Lines" />
        <asp:Button ID="tabRFQCountPerSharedItems" runat="server" class="tabUnselected" OnClick="tabRFQPerSharedItems_Click" Text="RFQs per Shared Items" />
    </div>
    <br />
    <asp:MultiView ID="MultiViewMain" runat="server" ActiveViewIndex="0" OnActiveViewChanged="on_activeView_changed">
        <asp:View ID="viewRFQList" runat="server">
            <%--Tab update SIF--%>
            <div>
                <div runat="server" id="divRFQ">
                    <%--<uc1:sifMaster ID="uscSIFMasterForm" runat="server" />--%>
                    <%--<uc1:supplierMaster ID="uscSupplierMaster" runat="server" 
                        />--%>
                    <uc7:rfqList ID="uscRfqList" OnOk_Click="on_update_RFQ"  OnCancel_Click="on_cancel_RFQ" runat="server" />
                </div>
            </div>
        </asp:View>
        <asp:View ID="viewRFQCountPerBOMDetail" runat="server">
            <div>
                <div runat="server" id="divRFQCountPerBOMDetail">
                    <uc4:rfqCountPerBomLines ID="uscRfqCountPerBomLines" OnRow_Command="on_row_command"
                        runat="server" />
                </div>
            </div>
        </asp:View>
        <asp:View ID="viewRFQCountPerSharedItems" runat="server">
            <div>
                <div runat="server" id="divRFQCountPerSharedItems">
                    <uc6:rfqCountPerSharedItems ID="uscRfqCountPerSharedItems" runat="server" />
                </div>
            </div>
        </asp:View>
    </asp:MultiView>    
</asp:Content>
