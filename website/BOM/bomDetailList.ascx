<%@ Control Language="C#" AutoEventWireup="true" CodeFile="bomDetailList.ascx.cs"
    Inherits="bomDetailList" %>
<%@ Register Src="bomDetailEdit.ascx" TagName="bomDetailEdit" TagPrefix="uc2" %>
<%@ Register Src="../Utils/Notifier/notifier.ascx" TagName="notifier" TagPrefix="uc3" %>
<%@ Register Src="../Utils/Validator/Validator.ascx" TagName="Validator" TagPrefix="uc1" %>
<%@ Register Src="../RFQ/resendRFQ.ascx" TagName="resendRFQ" TagPrefix="uc4" %>
<%@ Register src="../RFQ/sendNewRFQEdit.ascx" tagname="sendNewRFQEdit" tagprefix="uc5" %>
<style type="text/css">
    .camposSinBordes
    {
        border-top: 0px;
        border-bottom: 0px;
        border-right: 0px;
        border-left: 0px;
    }
    .itemFields
    {
        background-color: #D3D3D3;
        border: solid #D3D3D3 2px;
    }
    .tableCell
    {
        overflow: hidden; /*border: solid 1px;
        border-left: 0px;*/
        font-size: 10px;
    }
    .BOMLine
    {
        left: 140px;
        position: relative;
        border-radius: 4px;
        border: solid 1px dimgray;
        color: black;
        background-color: darkgray;
    }
    #accordion .ui-accordion-content
    {
        width: 100%;
        background-color: #f3f3f3;
        color: #777;
        font-size: 10pt;
        line-height: 16pt;
    }
</style>
<asp:Panel ID="panelPopup" runat="server" Visible="false">
    <uc2:bomDetailEdit ID="uscBomDetailEdit" runat="server" OnOk_Click="on_edit_line"
        OnCancel_Click="on_cancelEdit_line" />

    <script type="text/javascript">
        document.getElementById("<%= this.panelPopup.ClientID %>").setAttribute("title", "BOM Line Edit");
        jQuery("#<%= this.panelPopup.ClientID %>").dialog({ autoOpen: true,
            appendTo: jQuery('form:first'),
            width: 560, modal: true,
            dialogClass: "no-close", closeOnEscape: false
        });
    </script>

</asp:Panel>
<table cellspacing="0" align="left" style="margin-left: 80px;">
    <tr>
        <th class="camposSinBordes" style="width: 73px; min-width: 73px; max-width: 73px;">
            Assigned To
        </th>
        <th class="camposSinBordes" style="width: 55px; min-width: 55px; max-width: 55px;">
            Status
        </th>
        <th class="camposSinBordes" style="width: 30px; min-width: 30px; max-width: 30px;">
            #
        </th>
        <th class="camposSinBordes itemFields" style="width: 120px; min-width: 120px; max-width: 120px;">
            Component Part Number
        </th>
        <th class="camposSinBordes itemFields" style="width: 80px; min-width: 80px; max-width: 80px;">
            Capsonic PN
        </th>
        <th class="camposSinBordes itemFields" style="width: 80px; min-width: 80px; max-width: 80px;">
            Customer PN
        </th>
        <th class="camposSinBordes itemFields" style="width: 90px; min-width: 90px; max-width: 90px;">
            Manufacture PN
        </th>
        <th class="camposSinBordes itemFields" style="width: 80px; min-width: 80px; max-width: 80px;">
            Supplier PN
        </th>
        <th class="camposSinBordes itemFields" style="width: 80px; min-width: 80px; max-width: 80px;">
            Comm Code
        </th>
        <th class="camposSinBordes itemFields" style="width: 145px; min-width: 145px; max-width: 145px;">
            Component Part Description/Material
        </th>
        <th class="camposSinBordes itemFields" style="width: 68px; min-width: 68px; max-width: 68px;">
            UM
        </th>
        <th class="camposSinBordes itemFields" style="width: 52px; min-width: 52px; max-width: 52px;">
            Cost
        </th>
        <th class="camposSinBordes" style="width: 70px; min-width: 70px; max-width: 70px;">
            Vendor Quote Est
        </th>
        <th class="camposSinBordes" style="width: 60px; min-width: 60px; max-width: 60px;">
            Qty Required
        </th>
        <th class="camposSinBordes" style="width: 70px; min-width: 70px; max-width: 70px;">
            EAU
        </th>
        <th class="camposSinBordes" style="width: 50px; min-width: 50px; max-width: 50px;">
            Cap Com Assm
        </th>
        <th class="camposSinBordes" style="width: 80px; min-width: 80px; max-width: 80px;">
            Purchasing Comments
        </th>
        <th class="camposSinBordes" style="width: 70px; min-width: 70px; max-width: 70px;">
            Sales Status
        </th>
        <th class="camposSinBordes" style="width: 70px; min-width: 70px; max-width: 70px;">
            Sales Comments
        </th>
        <th class="camposSinBordes" style="width: 50px; min-width: 50px; max-width: 50px;">
            Directed Buy
        </th>
        <th class="camposSinBordes" style="width: 110px; min-width: 110px; max-width: 110px;">
            Purchasing Status
        </th>
        <th style="border-color: Gray;" class="camposSinBordes">
        </th>
    </tr>
    <tr>
        <th class="camposSinBordes">
            <!-- Assigned To -->
            <div style="width: 70px;">
            </div>
        </th>
        <th class="camposSinBordes" style="vertical-align: top;">
        </th>
        <th class="camposSinBordes" style="vertical-align: top;">
        </th>
        <th class="camposSinBordes itemFields" style="vertical-align: top;">
            <div style="width: 125px;">
                <asp:DropDownList ID="cboPartNumber" chosen="true" Width="120px" runat="server" AutoPostBack="True"
                    OnSelectedIndexChanged="cboPartNumber_SelectedIndexChanged">
                </asp:DropDownList>
                <br />
                <asp:Button ID="btnNewPartNumber" Width="120px" runat="server" Style="margin-top: 4px;"
                    Text="New Part Number" />
            </div>
        </th>
        <th class="camposSinBordes itemFields" style="vertical-align: top;">
            <asp:TextBox ID="txtCapsonicPN" Style="text-align: center;" runat="server" Width="60px"></asp:TextBox>
        </th>
        <th class="camposSinBordes itemFields" style="vertical-align: top;">
            <asp:TextBox ID="txtCustomerPN" Style="text-align: center;" runat="server" Width="60px"></asp:TextBox>
        </th>
        <th class="camposSinBordes itemFields" style="vertical-align: top;">
            <asp:TextBox ID="txtManufacturePN" Style="text-align: center;" runat="server" Width="60px"></asp:TextBox>
        </th>
        <th class="camposSinBordes itemFields" style="vertical-align: top;">
            <asp:TextBox ID="txtSupplierPN" Style="text-align: center;" runat="server" Width="60px"></asp:TextBox>
        </th>
        <th class="camposSinBordes itemFields" style="vertical-align: top;">
            <asp:TextBox ID="txtCommCode" Style="text-align: center;" runat="server" Width="60px"></asp:TextBox>
        </th>
        <th class="camposSinBordes itemFields" style="vertical-align: top;">
            <asp:TextBox ID="txtMaterial" runat="server" Width="140px" Height="40px" Rows="2"
                TextMode="MultiLine" Style="overflow-y: auto; font-family: Tahoma;"></asp:TextBox>
        </th>
        <th class="camposSinBordes itemFields" style="vertical-align: top;">
            <asp:DropDownList ID="cboUM" runat="server" Width="70px">
                <asp:ListItem Value="Each">Each</asp:ListItem>
                <asp:ListItem Value="in">in</asp:ListItem>
                <asp:ListItem Value="ft">ft</asp:ListItem>
                <asp:ListItem Value="yd">yd</asp:ListItem>
                <asp:ListItem Value="mm">mm</asp:ListItem>
                <asp:ListItem Value="cm">cm</asp:ListItem>
                <asp:ListItem Value="m">m</asp:ListItem>
                <asp:ListItem Value="g">g</asp:ListItem>
                <asp:ListItem Value="kg">kg</asp:ListItem>
                <asp:ListItem Value="lb">lb</asp:ListItem>
                <asp:ListItem Value="oz">oz</asp:ListItem>
                <asp:ListItem Value="lt">lt</asp:ListItem>
            </asp:DropDownList>
        </th>
        <th class="camposSinBordes itemFields" style="vertical-align: top;">
            <asp:TextBox ID="txtCost" runat="server" Width="50px" Style="text-align: right; visibility: hidden;">0</asp:TextBox>
        </th>
        <th class="camposSinBordes">
            <!-- Vendor Quote Est -->
            <div style="width: 70px;">
            </div>
        </th>
        <th class="camposSinBordes" style="vertical-align: top;">
            <asp:TextBox ID="txtQuantity" validate="number" validationid="validatingBOMDetail"
                runat="server" Width="56px" Style="text-align: right" onchange="calculateEAU()"
                onkeyup="calculateEAU()">0</asp:TextBox>
        </th>
        <th class="camposSinBordes" style="vertical-align: top;">
            <asp:TextBox ID="txtEAU" runat="server" validate="numbers" validationid="validatingBOMDetail"
                Width="60px" Style="text-align: right" onchange="calculateQtyRequired()" onkeyup="calculateQtyRequired()">0</asp:TextBox>
        </th>
        <th class="camposSinBordes" style="vertical-align: top;">
            <asp:TextBox ID="txtCapComAssm" validationid="validatingBOMDetail" runat="server"
                Width="60px"></asp:TextBox>
        </th>
        <th class="camposSinBordes" style="vertical-align: top;">
            <asp:TextBox ID="txtPurchasingComments" runat="server" Width="136px" Height="40px"
                TextMode="MultiLine" Style="overflow-y: auto; font-family: Tahoma"></asp:TextBox>
        </th>
        <th class="camposSinBordes">
            <!-- Sales Status -->
            <div style="width: 70px;">
            </div>
        </th>
        <th class="camposSinBordes">
            <div style="width: 70px;">
            </div>
         </th>
        <th class="camposSinBordes" style="vertical-align: top;">
            <asp:CheckBox ID="chkDirectedBuy" runat="server" Width="60px" />
        </th>
        <th class="camposSinBordes" style="vertical-align: top;">
            <asp:DropDownList ID="cboPurchasingStatus" runat="server" Width="120px">
                <asp:ListItem Selected="True"></asp:ListItem>
                <asp:ListItem Value="Q">Quote</asp:ListItem>
                <asp:ListItem Value="E">Estimate</asp:ListItem>
                <asp:ListItem Value="P">Pass Thru</asp:ListItem>
                <asp:ListItem Value="M">Manufacture</asp:ListItem>
                <asp:ListItem Value="Firm Requirement">Firm Requirement</asp:ListItem>
            </asp:DropDownList>
        </th>
        <th class="camposSinBordes" style="vertical-align: top;">
            <asp:Button ID="btnAdd" validationid="validatingBOMDetail" runat="server" Text="Add"
                OnClick="add_Click" />
        </th>
        <th class="camposSinBordes">
        </th>
    </tr>
</table>
<div style="clear: both; top: 30px;">
    <div id="accordionBOM" style="position: relative; width: 1860px;">
        <asp:Repeater ID="repeaterBOMDetail" runat="server" OnItemDataBound="R1_ItemDataBound">
            <ItemTemplate>
                <h3 style="height: 20px;">
                    <div>
                        <asp:CheckBox ID="chkSelect" runat="server" Style="float: left; position: absolute; left: 5px;" clickeableInHeader="true" />
                        <asp:ImageButton ImageUrl="~/pics/delete-icon.png" Height="20px" ID="deleteByID"
                            OnCommand="deleteByID" clickeableInHeader="true" runat="server" Text="Edit" Style="float: left;
                            position: absolute; left: 30px;" />
                        <asp:ImageButton ImageUrl="~/pics/edit-icon.png" Height="20px" ID="updateByID" clickeableInHeader="true"
                            OnCommand="updateByID" runat="server" Text="Delete" Style="float: left; position: absolute;
                            left: 60px;" />
                        <asp:LinkButton ID="linkAssignedToLine" runat="server" clickeableInHeader="true"
                            CommandArgument="" OnCommand="takeBOMLine" Style="float: left; position: absolute;
                            left: 90px;">
                        Take
                        </asp:LinkButton>
                        <asp:HiddenField ID="hiddenBOMDetailKey" runat="server" Value='<%# DataBinder.Eval(Container.DataItem, "Id")%>' />
                        <table cellspacing="0" align="left" class="BOMLine">
                            <tr style="height: 19px; white-space: nowrap;">
                                <td align="center" class="tableCell" style="width: 60px; min-width: 60px; max-width: 650px;">
                                    <asp:Label ID="lblStatus" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Status")%>'></asp:Label>
                                </td>
                                <td align="center" class="tableCell" style="width: 30px; min-width: 30px; max-width: 30px;">
                                    <%# DataBinder.Eval(Container.DataItem, "LinePosition")%>
                                </td>
                                <td class="tableCell" style="width: 132px; min-width: 132px; max-width: 132px;">
                                    <asp:Label ID="lblPartNumber" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "PartNumber") %>'></asp:Label>
                                </td>
                                <td align="center" class="tableCell" style="width: 81px; min-width: 81px; max-width: 81px;">
                                    <%# DataBinder.Eval(Container.DataItem, "CapsonicPN")%>
                                </td>
                                <td align="center" class="tableCell" style="width: 81px; min-width: 81px; max-width: 81px;">
                                    <%# DataBinder.Eval(Container.DataItem, "CustomerPN")%>
                                </td>
                                <td align="center" class="tableCell" style="width: 100px; min-width: 100px; max-width: 100px;">
                                    <%# DataBinder.Eval(Container.DataItem, "ManufacturePN")%>
                                </td>
                                <td align="center" class="tableCell" style="width: 81px; min-width: 81px; max-width: 81px;">
                                    <%# DataBinder.Eval(Container.DataItem, "SupplierPN")%>
                                </td>
                                <td align="center" class="tableCell" style="width: 85px; min-width: 85px; max-width: 85px;">
                                    <%# DataBinder.Eval(Container.DataItem, "CommCode")%>
                                </td>
                                <td class="tableCell" style="width: 145px; min-width: 145px; max-width: 145px;">
                                    <%# DataBinder.Eval(Container.DataItem, "Material")%>
                                </td>
                                <td align="center" class="tableCell" style="width: 70px; min-width: 70px; max-width: 70px;">
                                    <%# DataBinder.Eval(Container.DataItem, "Um")%>
                                </td>
                                <td align="right" class="tableCell" style="width: 60px; min-width: 60px; max-width: 60px;">
                                    <%# DataBinder.Eval(Container.DataItem, "Cost")%>
                                </td>
                                <td align="center" class="tableCell" style="width: 70px; min-width: 70px; max-width: 70px;">
                                    <%# DataBinder.Eval(Container.DataItem, "VendorQuoteEst")%>
                                </td>
                                <td align="right" class="tableCell" style="width: 63px; min-width: 63px; max-width: 63px;">
                                    <%# DataBinder.Eval(Container.DataItem, "Qty")%>
                                </td>
                                <td align="right" class="tableCell" style="width: 71px; min-width: 71px; max-width: 71px;">
                                    <%# DataBinder.Eval(Container.DataItem, "EAU")%>
                                </td>
                                <td align="center" class="tableCell" style="width: 60px; min-width: 60px; max-width: 60px;">
                                    <%# DataBinder.Eval(Container.DataItem, "CapComAssm")%>
                                </td>
                                <td align="center" class="tableCell" style="width: 145px; min-width: 145px; max-width: 145px;">
                                    <%# DataBinder.Eval(Container.DataItem, "PurchasingComments")%>
                                </td>
                                <td align="center" class="tableCell" style="width: 70px; min-width: 70px; max-width: 70px;">
                                    <%# DataBinder.Eval(Container.DataItem, "SalesStatus")%>
                                </td>
                                <td class="tableCell" style="width: 70px; min-width: 70px; max-width: 70px;">
                                    <%# DataBinder.Eval(Container.DataItem, "SalesComments")%>
                                </td>
                                <td align="center" class="tableCell" style="width: 60px; min-width: 60px; max-width: 60px;">
                                    <%# DataBinder.Eval(Container.DataItem, "DirectedBuy")%>
                                </td>
                                <td align="center" class="tableCell" style="width: 125px; min-width: 125px; max-width: 125px;">
                                    <%# DataBinder.Eval(Container.DataItem, "PurchasingStatus")%>
                                </td>
                            </tr>
                        </table>
                    </div>
                </h3>
                <div id="accordionContainer">
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</div>
<div id="divBOMDetailList" style="clear: both;" runat="server" align="center">
</div>
<uc3:notifier ID="uscNotifier" OnPrompt="on_prompt_partNumber" runat="server" />
<uc1:Validator ID="Validator1" runat="server" />


<asp:Button ID="btnResendRFQ" runat="server" Text="Resend RFQ" OnClick="btnResendRFQ_Click"
    Style="display: none;" />
<asp:HiddenField ID="HiddenFieldResendRFQ" runat="server" />

<asp:Button ID="btnEditRFQBuyerSide" runat="server" Text="Edit RFQ Buyer Side" 
    Style="display: none;" onclick="btnEditRFQBuyerSide_Click" />
<asp:HiddenField ID="HiddenFieldEditRFQBuyerSide" runat="server" />


<script type="text/javascript">
    jQuery(document).ready(function() {
        jQuery("#accordionBOM").accordion({
            //            beforeActivate: function(event, ui) {
            //                ui.oldPanel.hide();
            //                ui.newPanel.hide();
            //            },
            activate: function(event, ui) {
                var vActive = jQuery(this).accordion("option", "active");
                if (vActive.toString() !== "false") {
                    //jQuery('.dataTable').hide();
                    var bomDetailKey;
                    bomDetailKey = ui.newHeader.children().children()[4].value;
                    ui.newPanel.load('<%= ResolveUrl("~/RFQ/RFQList.aspx") %>?bomComponent=' + bomDetailKey + '&noCache=' + Number(new Date()) + ' #clientID_GridRFQList',
                function(responseTxt, statusTxt, xhr) {
                    if (statusTxt == "success")
                    //jQuery(this).find("#clientID_GridRFQList").children().children().css("display", "block");
                        jQuery('.dataTable').dataTable({
                            "bDestroy": true,
                            "bStateSave": true,
                            "bFilter": false,
                            "bLengthChange": false,
                            "bInfo": false,
                            "bPaginate": false
                        }).show();
                    if (statusTxt == "error")
                        alert("Error: " + xhr.status + ": " + xhr.statusText);
                });
                    ui.newPanel.show();
                }
            },
            active: false,
            collapsible: true,
            heightStyle: "content",
            icons: null,
            clearStyle: true
        });
        clickeableInHeader();
    });
    function clickeableInHeader() {
        jQuery('[clickeableInHeader="true"]').click(function(e) {
            e.stopPropagation();
            //Your Code here(For example a call to your function)
        });
    }
    function deleteRFQByID(sRFQ_ID) {
        if (confirm('Every information related to this RFQ will be deleted as well.')) {
            var activePaneNumber = jQuery("#accordionBOM").accordion('option', 'active');
            activeHeader = jQuery("#accordionBOM h3").eq(activePaneNumber);
            var activePaneContent = jQuery(event.srcElement).parent().parent().parent().parent().parent().parent().parent();
            
            jQuery.ajax({
                type: "POST",
                url: '<%= ResolveUrl("~/RFQ/RFQList.aspx/deleteByID") %>',
                data: "{sRFQHeaderKey:'" + sRFQ_ID + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function(msg) {
                    // Replace the div's content with the page method's return.
                    //$("#Result").text(msg.d);
                    if (msg.d != "") {
                        var vActive = jQuery("#accordionBOM").accordion("option", "active");
                        if (vActive.toString() !== "false") {
                            var bomDetailKey;
                            bomDetailKey = activeHeader.children().children()[4].value;
                            activePaneContent.load('<%= ResolveUrl("~/RFQ/RFQList.aspx") %>?bomComponent=' + bomDetailKey + '&noCache=' + Number(new Date()) + ' #clientID_GridRFQList',
                function(responseTxt, statusTxt, xhr) {
                    if (statusTxt == "success") {
                        //jQuery(this).find("#clientID_GridRFQList").children().children().css("display", "block");
                        jQuery('.dataTable').dataTable({
                            "bDestroy": true,
                            "bStateSave": true,
                            "bFilter": false,
                            "bLengthChange": false,
                            "bInfo": false,
                            "bPaginate": false
                        }).show();
                        alertify.success("RFQ deleted successfully;");
                    }
                    if (statusTxt == "error")
                        alert("Error: " + xhr.status + ": " + xhr.statusText);
                });
                        }
                    }
                    else
                        alert("An error has occurred.");
                },
                error: function(a, b, c) {
                    alert("An error has occurred.");
                }
            });
        }
        return false;
    }
    function setAwardByRFQ_ID(sRFQ_ID) {
        if (confirm('Are you sure you want to set its status to Award?')) {
            var activePaneNumber = jQuery("#accordionBOM").accordion('option', 'active');
            activeHeader = jQuery("#accordionBOM h3").eq(activePaneNumber);
            var activePaneContent = jQuery(event.srcElement).parent().parent().parent().parent().parent().parent().parent();
            jQuery.ajax({
                type: "POST",
                url: '<%= ResolveUrl("~/RFQ/RFQList.aspx/awardByRFQID") %>',
                data: "{sRFQHeaderKey:'" + sRFQ_ID + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function(msg) {
                    // Replace the div's content with the page method's return.
                    //$("#Result").text(msg.d);
                    if (msg.d != "") {
                        var vActive = jQuery("#accordionBOM").accordion("option", "active");
                        if (vActive.toString() !== "false") {
                            var bomDetailKey;
                            bomDetailKey = activeHeader.children().children()[4].value;
                            activePaneContent.load('<%= ResolveUrl("~/RFQ/RFQList.aspx") %>?bomComponent=' + bomDetailKey + '&noCache=' + Number(new Date()) + ' #clientID_GridRFQList',
                function(responseTxt, statusTxt, xhr) {
                    if (statusTxt == "success") {
                        //jQuery(this).find("#clientID_GridRFQList").children().children().css("display", "block");
                        jQuery('.dataTable').dataTable({
                            "bDestroy": true,
                            "bStateSave": true,
                            "bFilter": false,
                            "bLengthChange": false,
                            "bInfo": false,
                            "bPaginate": false
                        }).show();
                        alertify.success("RFQ set awarded successfully;");
                    }
                    if (statusTxt == "error")
                        alert("Error: " + xhr.status + ": " + xhr.statusText);
                });
                        }
                    }
                    else
                        alert("An error has occurred.");
                },
                error: function(a, b, c) {
                    alert("An error has occurred.");
                }
            });
        }
        return false;
    }
    function resendRFQbyID(sRFQ_ID) {
        jQuery("#<%= HiddenFieldResendRFQ.ClientID %>").val(sRFQ_ID);
        jQuery("#<%= btnResendRFQ.ClientID %>").click();
        return false;
    }
    function editRFQBuyerSide(sRFQ_ID) {
        jQuery("#<%= HiddenFieldEditRFQBuyerSide.ClientID %>").val(sRFQ_ID);
        jQuery("#<%= btnEditRFQBuyerSide.ClientID %>").click();
        return false;
    }
</script>


<asp:Panel ID="panelResendRFQ" runat="server" Visible="false">
    <uc4:resendRFQ ID="uscResendRFQ" runat="server" OnOk_Click="on_resendRFQ" OnCancel_Click="on_cancel_resendRFQ" />
    <script type="text/javascript">
        jQuery(document).ready(function() {
            document.getElementById("<%= this.panelResendRFQ.ClientID %>").setAttribute("title", "Re-send RFQ");
            jQuery("#<%= this.panelResendRFQ.ClientID %>").dialog({ autoOpen: true,
                appendTo: jQuery('form:first'),
                width: 440, modal: true,
                dialogClass: "no-close", closeOnEscape: false, 
            });
        });
    </script>

</asp:Panel>
<asp:Panel ID="panelEditRFQBuyerSide" runat="server" Visible="false">
    <uc5:sendNewRFQEdit ID="uscSendNewRFQEdit" runat="server"  OnSend_Click="on_sendRFQ" OnSave_Click="on_editRFQBuyerSide" OnCancel_Click="on_cancel_editRFQBuyerSide" />
    <script type="text/javascript">
        jQuery(document).ready(function() {
            document.getElementById("<%= this.panelEditRFQBuyerSide.ClientID %>").setAttribute("title", "Edit RFQ Buyer-Side");
            jQuery("#<%= this.panelEditRFQBuyerSide.ClientID %>").dialog({ autoOpen: true,
                appendTo: jQuery('form:first'),
                width: 950, modal: true,
                dialogClass: "no-close", closeOnEscape: false
            });
        });
    </script>

</asp:Panel>