<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Supplier.aspx.cs" Inherits="_Default"
    MasterPageFile="~/_Layouts/MasterP.master" MaintainScrollPositionOnPostback="True" %>

<%@ Register src="supplierMaster.ascx" tagname="supplierMaster" tagprefix="uc1" %>
<%@ Register src="../Menu.ascx" tagname="Menu" tagprefix="uc2" %>
<%@ Register src="~/SupplierSurvey/surveyList.ascx" tagname="surveyList" tagprefix="uc3" %>

<%@ Register src="~/SupplierSurvey/sendNewSurvey.ascx" tagname="sendNewSurvey" tagprefix="uc4" %>
<%@ Register src="../SupplierSurvey/surveyForm.ascx" tagname="surveyForm" tagprefix="uc5" %>


<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="PlaceHolderLeft">
    <asp:MultiView ID="Left_Col" runat="server" ActiveViewIndex="0">
        <asp:View ID="Functions" runat="server">
            <uc2:Menu ID="uscMenu" runat="server" />
        </asp:View>
    </asp:MultiView>
    
    <asp:Panel ID="panelPopup" runat="server" Visible="false">
         <asp:MultiView ID="multiViewPopup" runat="server" ActiveViewIndex="0">
            <asp:View ID="viewPopupSupplier" runat="server">
                <uc4:sendNewSurvey ID="uscSendNewSurvey" runat="server" OnOk_Click="on_send_survey" OnCancel_Click="on_cancel_send_survey" />
                <script type="text/javascript">
                    jQuery("#<%= this.panelPopup.ClientID %>").dialog({ autoOpen: true,
                        appendTo: jQuery('form:first'),
                        width: 440, modal: true,
                        dialogClass: "no-close", closeOnEscape:false     
                    });
                </script>
            </asp:View>
            <asp:View ID="viewPopupSurvey" runat="server">
                <div align="center" style="height:525px; overflow-y: auto;">
                    <uc5:surveyForm ID="uscSurveyForm" runat="server" OnOk_Click="on_save_survey" OnCancel_Click="on_cancel_survey"/>
                    <script type="text/javascript">
                        jQuery("#<%= this.panelPopup.ClientID %>").dialog({ autoOpen: true,
                            appendTo: jQuery('form:first'),
                            width: 1090, modal: true,
                            dialogClass: "no-close", closeOnEscape:false     
                        });
                </script>
                </div>                
            </asp:View>            
        </asp:MultiView>                    
    </asp:Panel>
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="PlaceHolderMain">
    <div style="background-color: #A4A4A4;height: 30px;">
    <asp:Label ID="lblName" runat="server" Text="" style="top: 10px;position: relative;"></asp:Label>
    </div>    
    <div id="Tabs" class="tabDiv">
        <asp:Button ID="tabSupplier" runat="server" Text="Supplier" OnClick="tabSupplier_Click"  class="tabSelected" />
        <asp:Button ID="tabSurvey" runat="server" Text="Surveys" OnClick="tabSurvey_Click" class="tabUnselected" />
    </div>
    <br />
    <asp:MultiView ID="MultiViewMain" runat="server" ActiveViewIndex="0" OnActiveViewChanged="on_activeView_changed">
        <asp:View ID="viewSupplier" runat="server"> <%--Tab update supplier--%>
            <div>
                <div runat="server" id="divSupplier">
                    <uc1:supplierMaster ID="uscSupplierMasterForm" runat="server" OnOk_Click="on_ok_supplier" OnCancel_Click="on_cancel_supplier"  />
                </div>
            </div>
        </asp:View>
        <asp:View ID="viewSurvey" runat="server"> <%--Tab update supplier--%>
            <div><br />
            <asp:Button ID="btnSendSurvey" style="margin-bottom:10px;" runat="server" Text="Send new survey" OnClick="btnSendSurvey_Click" />            
                <div runat="server" id="divSurvey">                    
                    <uc3:surveyList ID="uscSurveyList" runat="server" />
                </div>                
            </div>
        </asp:View>
    </asp:MultiView>
</asp:Content>