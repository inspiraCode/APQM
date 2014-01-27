<%@ Page Title="" Language="C#" MasterPageFile="~/_Layouts/MasterMenu.master" AutoEventWireup="true"
    CodeFile="SIF_List.aspx.cs" Inherits="SIF_SIF_List" MaintainScrollPositionOnPostback="True" %>

<%@ Register Src="sifList.ascx" TagName="sifList" TagPrefix="uc1" %>
<%@ Register src="sifMaster.ascx" tagname="sifMaster" tagprefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PlaceHolderMain" runat="Server">
    <span class="mainTitle">SIFs</span>
    <asp:Button ID="btnAddSIF" class="btnInTitle" runat="server" Text="New SIF" OnClick="btnAddSIF_Click" />
    <div runat="server" id="divSIF" class="Content">
        <br />
        <uc1:sifList ID="uscSIFList" runat="server" />
    </div>
    <br />
    <br />
    <asp:Panel ID="panelPopup" runat="server" Visible="false">
        <uc2:sifMaster ID="uscSIFMaster" runat="server" onok_click="on_add_sif" oncancel_click="on_cancelAdd_sif" />
        <script type="text/javascript">
            jQuery(document).ready(function() {
                document.getElementById("<%= this.panelPopup.ClientID %>").setAttribute("title", "New SIF");
                jQuery("#<%= this.panelPopup.ClientID %>").dialog({ autoOpen: true,
                    appendTo: jQuery('form:first'),
                    width: 950, modal: true,
                    dialogClass: "no-close", closeOnEscape: false
                });
            });
        </script>

    </asp:Panel>
    
</asp:Content>
