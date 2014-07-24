<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RFQ.aspx.cs" Inherits="RFQDefault" Async="true"
    MasterPageFile="~/_Layouts/MasterP.master" %>

<%@ Register Src="../Menu.ascx" TagName="Menu" TagPrefix="uc2" %>
<%@ Register Src="../Supplier/supplierMaster.ascx" TagName="supplierMaster" TagPrefix="uc1" %>
<%@ Register Src="rfqCountPerBomLines.ascx" TagName="rfqCountPerBomLines" TagPrefix="uc4" %>
<%@ Register Src="rfqCountPerSharedItems.ascx" TagName="rfqCountPerSharedItems" TagPrefix="uc6" %>
<%@ Register Src="rfqList.ascx" TagName="rfqList" TagPrefix="uc7" %>
<%@ Register Src="rfqStatusInfo.ascx" TagName="rfqStatusInfo" TagPrefix="uc8" %>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="PlaceHolderLeft">
<style type="text/css">
    .EditRFQButton
    {
        display:none;
    }
</style>
    <asp:MultiView ID="Left_Col" runat="server" ActiveViewIndex="0">
        <asp:View ID="Functions" runat="server">
            <uc2:Menu ID="uscMenu" runat="server" />
        </asp:View>
    </asp:MultiView>
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="PlaceHolderMain">
    <span class="mainTitle">RFQs</span>
    <div id="Tabs" class="tabDiv" class="Content" style="min-width: 600px;">
        <asp:Button ID="tabRFQ" runat="server" Text="RFQ" OnClick="tabRFQ_Click" class="tabSelected" />
        <asp:Button ID="tabRFQCountPerBOMDetail" runat="server" class="tabUnselected" OnClick="tabRFQPerBOMDetail_Click"
            Text="RFQs per BOM Lines" />
        <asp:Button ID="tabRFQCountPerSharedItems" runat="server" class="tabUnselected" OnClick="tabRFQPerSharedItems_Click"
            Text="RFQs per Shared Items" />
    </div>
    <asp:MultiView ID="MultiViewMain" runat="server" ActiveViewIndex="0" OnActiveViewChanged="on_activeView_changed">
        <asp:View ID="viewRFQList" runat="server">
        <br />
            <div style="border-left: solid 1px; padding: 0px 10px 0 10px; width: 97%; min-width: 450px;">
                <div align="right" style="top: 20px; float:right;">
                <br />
                    <uc8:rfqStatusInfo ID="uscRfqStatusInfo" runat="server" />
                    <br />
                </div>
                <div style="position: relative;">
                    <uc7:rfqList ID="uscRfqList" runat="server" />
                </div>
            </div>
            <br />
            <br />
            <script type="text/javascript">
                jQuery(document).ready(function() {
                    jQuery('.dataTable').dataTable({
                        "bStateSave": true,
                        "bFilter": true,
                        "bLengthChange": true,
                        "bInfo": true,
                        "bPaginate": true
                    }).show();
                });
            </script>
        </asp:View>
        <asp:View ID="viewRFQCountPerBOMDetail" runat="server">
        <br />
            <div style="border-left: solid 1px; padding: 50px 10px 0 10px; position: relative;">
                <div runat="server" id="divRFQCountPerBOMDetail">
                    <uc4:rfqCountPerBomLines ID="uscRfqCountPerBomLines" OnRow_Command="on_rfqCountPerBomLines_rowCommand"
                        runat="server" />
                </div>
            </div>
            <br />
            <br />
        </asp:View>
        <asp:View ID="viewRFQCountPerSharedItems" runat="server">
        <br />
            <div style="border-left: solid 1px; padding: 50px 10px 0 10px; position: relative;">
                <div runat="server" id="divRFQCountPerSharedItems">
                    <uc6:rfqCountPerSharedItems ID="uscRfqCountPerSharedItems" runat="server" />
                </div>
            </div>
            <br />
            <br />
        </asp:View>
    </asp:MultiView>
</asp:Content>