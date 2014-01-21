<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SIF.aspx.cs" Inherits="_Default"
    MasterPageFile="~/_Layouts/MasterP.master" %>

<%@ Register Src="sifMaster.ascx" TagName="sifMaster" TagPrefix="uc1" %>
<%@ Register Src="../Menu.ascx" TagName="Menu" TagPrefix="uc2" %>
<%@ Register Src="sifList.ascx" TagName="sifList" TagPrefix="uc3" %>
<%@ Register Src="../BOM/bomForm.ascx" TagName="bomForm" TagPrefix="uc4" %>
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
        </asp:Panel>
    </asp:Panel>
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="PlaceHolderMain">
    <div id="Tabs">
        <asp:Button ID="tabSIF" runat="server" Text="SIF" OnClick="tabSIF_Click" Visible="false" />
        <%--<asp:Button ID="tabSurvey" runat="server" Text="Surveys" OnClick="tabSurvey_Click" />--%>
    </div>
    <asp:MultiView ID="MultiViewMain" runat="server" ActiveViewIndex="0">
    
        <asp:View ID="viewSIF" runat="server">
        <span class="mainTitle">SIFs > SIF</span>
            <%--Tab update SIF--%>
            <div>
                <div runat="server" id="divSIF">
                    <uc1:sifMaster ID="uscSIFMasterForm" runat="server" OnOk_Click="on_update_SIF" OnCancel_Click="on_cancel_SIF" />
                </div>
            </div>
            <br />
            <br />
        </asp:View>
        <asp:View ID="viewBOM" runat="server">
        <span class="mainTitle">SIFs > BOM</span>
            <div>
                <div runat="server" id="divBOM">
                    <uc4:bomForm ID="uscBomForm" OnOk_Click="on_save_bom" OnCancel_Click="on_cancel_bom"
                        runat="server" />
                </div>
            </div>
            <br />
            <br />
        </asp:View>
    </asp:MultiView>
</asp:Content>