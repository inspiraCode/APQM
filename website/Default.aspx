<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default"
    MasterPageFile="~/_Layouts/MasterP.master" MaintainScrollPositionOnPostback="True" %>

<%@ Register Src="~/Supplier/supplierMaster.ascx" TagName="supplierMaster" TagPrefix="uc1" %>
<%@ Register Src="Menu.ascx" TagName="Menu" TagPrefix="uc2" %>
<%@ Register Src="Supplier/supplierList.ascx" TagName="supplierList" TagPrefix="uc3" %>
<%@ Register Src="SIF/sifList.ascx" TagName="sifList" TagPrefix="uc4" %>
<%@ Register Src="SIF/SifMaster.ascx" TagName="SifMaster" TagPrefix="uc5" %>
<%@ Register Src="RFQ/rfqList.ascx" TagName="rfqList" TagPrefix="uc6" %>
<%@ Register Src="RFQ/rfqForm.ascx" TagName="rfqForm" TagPrefix="uc7" %>
<%@ Register Src="BOM/bomList.ascx" TagName="bomList" TagPrefix="uc8" %>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="PlaceHolderLeft">
    <asp:MultiView ID="Left_Col" runat="server" ActiveViewIndex="1">
        <asp:View ID="Login" runat="server">
            <table width="100%">
                <tr>
                    <td align="center">
                        <fieldset style="width: 90%">
                            <table width="100%">
                                <tr>
                                    <td align="center">
                                        <table id="login_table" runat="server" style="width: 266px;">
                                            <tr>
                                                <td rowspan="3">
                                                    <img alt="" src="pics/lock.png" style="height: 86px; width: 86px" />
                                                </td>
                                                <td align="left">
                                                    User:
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="TextBox1" runat="server" Width="90px"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="left">
                                                    Password:
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="TextBox2" runat="server" TextMode="Password" Width="90px"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2" align="right">
                                                    <asp:Button ID="btnLogin" runat="server" Text="GO" Width="50px" OnClick="btnLogin_Click" />
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </fieldset>
                    </td>
                </tr>
            </table>
        </asp:View>
        <asp:View ID="Functions" runat="server">
            <uc2:Menu ID="uscMenu" runat="server" />
        </asp:View>
    </asp:MultiView>
    <%--<asp:Panel ID="panelPopup" runat="server" Visible="false">
        <asp:Panel runat="server" CssClass="Overlay">
        </asp:Panel>
        <asp:Panel ID="popupContainer" runat="server" CssClass="PopUpPanel" HorizontalAlign="Center">
            <asp:MultiView ID="multiViewPopup" runat="server" ActiveViewIndex="0">
                <asp:View ID="viewPopupSupplier" runat="server">
                    <uc1:supplierMaster ID="uscSupplierForm" runat="server" OnOk_Click="on_add_supplier"
                        OnCancel_Click="on_cancelAdd_supplier" />
                </asp:View>
                <asp:View ID="viewPopupSIF" runat="server">
                    <uc5:SifMaster ID="uscSIFForm" runat="server" OnOk_Click="on_add_sif" OnCancel_Click="on_cancelAdd_sif" />
                </asp:View>
                <asp:View ID="viewPopupRFQ" runat="server">
                    <uc7:rfqForm ID="uscRFQForm" runat="server" OnOk_Click="on_add_rfq" OnCancel_Click="on_cancelAdd_rfq" />
                </asp:View>
            </asp:MultiView>
        </asp:Panel>
    </asp:Panel>--%>
    <asp:Panel ID="panelPopup" runat="server" Visible="false">
        <asp:MultiView ID="multiViewPopup" runat="server" ActiveViewIndex="0">
            <asp:View ID="viewPopupSupplier" runat="server">
                <uc1:supplierMaster ID="uscSupplierForm" runat="server" OnAfterSave="on_add_supplier"
                    OnAfterCancel="on_cancelAdd_supplier" />
                
                <script type="text/javascript">
                    document.getElementById("<%= this.panelPopup.ClientID %>").setAttribute("title", "New Supplier");
                    jQuery("#<%= this.panelPopup.ClientID %>").dialog({ autoOpen: true,
                        appendTo: jQuery('form:first'),
                        width: 630, modal: true,
                        dialogClass: "no-close", closeOnEscape:false
                    });
                </script>
                <div id="divButtons" align="center" runat="server">
                    <asp:Button ID="btnSaveSupplier" runat="server" Text="Save" Width="70px" OnClick="on_save_supplier" />
                    <asp:Button ID="btnCancelSupplier" runat="server" Text="Cancel" Width="70px" OnClick="on_cancel_supplier" />
                </div>
            </asp:View>
            <asp:View ID="viewPopupSIF" runat="server">
                <uc5:SifMaster ID="uscSIFForm" runat="server" OnOk_Click="on_add_sif" OnCancel_Click="on_cancelAdd_sif" />

                <script type="text/javascript">
                    document.getElementById("<%= this.panelPopup.ClientID %>").setAttribute("title", "New SIF");
                    jQuery("#<%= this.panelPopup.ClientID %>").dialog({ autoOpen: true,
                        appendTo: jQuery('form:first'),
                        width: 950, modal: true,
                        dialogClass: "no-close", closeOnEscape:false
                    });                    
                </script>

            </asp:View>
            <asp:View ID="viewPopupRFQ" runat="server">
                <uc7:rfqForm ID="uscRFQForm" runat="server" OnOk_Click="on_add_rfq" OnCancel_Click="on_cancelAdd_rfq" />

                <script type="text/javascript">
                    jQuery("#<%= this.panelPopup.ClientID %>").dialog({ autoOpen: true,
                        appendTo: jQuery('form:first'),
                        width: 950, modal: true,
                        dialogClass: "no-close", closeOnEscape:false
                    });                    
                </script>

            </asp:View>
        </asp:MultiView>
    </asp:Panel>
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="PlaceHolderMain">
    <asp:MultiView ID="MultiViewMain" runat="server">
        <asp:View ID="viewHome" runat="server">
            <div class="Content">
                HOME
            </div>
        </asp:View>
        <asp:View ID="viewSIF" runat="server">
            <div runat="server" id="divSIF" class="Content">
                SIFs
                <br />                
                <%--<asp:Button ID="btnAddSIF" Style="margin-bottom: 10px;" runat="server" Text="New SIF"
                    OnClick="btnAddSIF_Click" />--%>
                <br />
                <uc4:sifList ID="uscSIFList" runat="server" />
            </div>
        </asp:View>
        <asp:View ID="viewBOM" runat="server">
            <div runat="server" id="divBOM" class="Content">
                BOM
                <br />
                <br />
                <uc8:bomList ID="uscBOMList" runat="server" />
            </div>
        </asp:View>
        <asp:View ID="viewRFQ" runat="server">
            <div class="Content">
                RFQ
                <asp:Button ID="btnAddRFQ" runat="server" Text="New RFQ" OnClick="btnAddRFQ_Click" />
                <uc6:rfqList ID="uscRFQList" runat="server" />
            </div>
        </asp:View>
        <asp:View ID="viewSupplier" runat="server">
            <div runat="server" id="divSupplier" class="Content">
                Suppliers
                <br />
                <br />
                <asp:Button ID="btnAddSupplier" Style="margin-bottom: 10px;" runat="server" Text="New Supplier"
                    OnClick="btnAddSupplier_Click" />
                <br />
                <uc3:supplierList ID="uscSupplierList" runat="server" />
            </div>
        </asp:View>
        <asp:View ID="viewPopup" runat="server">
        </asp:View>
    </asp:MultiView>
</asp:Content>
