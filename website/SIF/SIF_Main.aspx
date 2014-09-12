<%@ Page Title="" Language="C#" MasterPageFile="~/_Layouts/MasterMenu.master" AutoEventWireup="true"
    CodeFile="SIF_Main.aspx.cs" Inherits="SIF_SIF_Main" %>

<%@ Register Src="../Utils/Validator/Validator.ascx" TagName="Validator" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PlaceHolderMain" runat="Server">
    <style type="text/css">
        .handsontable table.htCore
        {
            width: initial;
        }
    </style>
    <span class="mainTitle">SIFs</span>
    <uc1:Validator ID="Validator1" runat="server" />
    <div id="divImgEmail" style="display: block; position: fixed; width: 105px; height: 35px;
        z-index: 1000; background-color: white; border: 2px solid gray; padding: 5px;">
        <img alt="" src="<%= ResolveUrl("~/Utils/loading.gif") %>" style="display: inline;
            position: relative;" />
        <span style="display: inline; position: relative;">Please wait..</span>
    </div>
    <br />
    <input type="button" id="btnNewSIF" value="New SIF" style="position: fixed;right: 10px;top: 174px;" />
    <div id="divMainContent" style="display: none;">
        <div id="divFilterByUser">
            <table cellspacing="0" align="left">
                <tr>
                    <td align="right">
                        Assigned To:
                    </td>
                    <td>
                        <div id="divUsers">
                        </div>
                    </td>
                    <td>
                        Date From:
                    </td>
                    <td>
                        <input type="text" id="txtDateFilterFrom" datepicker="true" style="width: 180px;" />
                    </td>
                    <td>
                        Date To:
                    </td>
                    <td>
                        <input type="text" id="txtDateFilterTo" datepicker="true" style="width: 180px;" />
                    </td>
                    <td>
                        <input type="button" value="Filter" onclick="on_filter_sifList();return false;" />
                    </td>
                </tr>
            </table>
        </div>
        <br />
        <br />
        <br />
        <div id="divSIFList">
            <table class="display SIFList" style="display: none; width:1170px;min-width:1170px;max-width:1170px; font-size: 10px; text-align: center;">
                <thead>
                    <tr>
                        <th>
                            SIF
                        </th>
                        <th>
                            Assigned To
                        </th>
                        <th>
                            Inquiry Number
                        </th>
                        <th>
                            Revision
                        </th>
                        <th>
                            Priority
                        </th>
                        <th>
                            Sales Person
                        </th>
                        <th>
                            Customer
                        </th>
                        <th>
                            Added to APQM
                        </th>
                        <th>
                            Created In
                        </th>
                        <th>
                            BOM
                        </th>
                        <th>
                            Progress
                        </th>
                        <th>
                        </th>
                        <th>
                        </th>
                    </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
        </div>
    </div>
    <div id="diDialog_SIF" title="Sales Inquiry Form" style="display: none;">
        <table cellspacing="1" style="margin-right: 0px;">
            <tr>
                <td align="right">
                    Inquiry Number
                </td>
                <td align="left">
                    <input type="text" id="txtInquiryNumber" style="width: 150px;" tabindex="1" />
                </td>
                <td align="right">
                    Priority
                </td>
                <td align="left" class="style1">
                    <input type="text" id="txtPriority" style="width: 100px;" tabindex="3" />
                </td>
                <td align="right">
                    Sales Person
                </td>
                <td align="left">
                    <input type="text" id="txtSalesPerson" style="width: 185px;" tabindex="6" />
                </td>
            </tr>
            <tr align="left">
                <td align="right">
                    Revision
                </td>
                <td align="left">
                    <input type="text" id="txtRevision" style="width: 100px;" tabindex="2" />
                </td>
                <td align="left">
                    Market Sector
                </td>
                <td align="left" class="style1" style="width: 270px;">
                    <div id="divMarketSector" style="display: inline-block;">
                    </div>
                    <%--<asp:DropDownList ID="cboMarketSector" runat="server" Width="124px" DataSourceID="SqlDataSourceMarketSector"
                                DataTextField="Name" DataValueField="MarketSectorID" TabIndex="4">
                            </asp:DropDownList>--%>
                    <input type="button" id="btnNewMarketSector" onclick="on_newMarketSector_click();return false;"
                        value="New" style="width: 60px; display: inline-block;" tabindex="5" />
                </td>
                <td align="right">
                    Cost Model Location
                </td>
                <td align="left">
                    <input type="text" id="txtCostModelLoc" style="width: 185px;" tabindex="7" />
                </td>
            </tr>
            <tr>
                <td align="right" height="25px" colspan="6">
                    <div style="border: solid; border-color: gray; border-width: 1px;">
                    </div>
                </td>
            </tr>
            <tr>
                <td align="right">
                    Customer
                </td>
                <td align="left" colspan="2">
                    <div id="divCustomer" style="display: inline-block;">
                    </div>
                    <%--<asp:DropDownList ID="cboCustomers" runat="server" Height="22px" Width="195px" TabIndex="8">
                            </asp:DropDownList>--%>
                    <input type="button" id="btnNewCustomer" onclick="on_newCustomer_click();return false;"
                        value="New" style="width: 55px; display: inline-block;" tabindex="5" />
                </td>
                <td align="right" class="style1">
                    Division/Location
                </td>
                <td align="left" colspan="2">
                    <input type="text" id="txtDivLoc" style="width: 260px;" tabindex="13" />
                </td>
            </tr>
            <tr style="display: none">
                <td align="right">
                    Contact
                </td>
                <td align="left" colspan="2">
                    <input type="text" id="txtContact" style="width: 240px;" tabindex="10" />
                </td>
                <td align="right" class="style1">
                    Department
                </td>
                <td align="left" colspan="2">
                    <input type="text" id="txtDepartment" style="width: 260px;" tabindex="14" />
                </td>
            </tr>
            <tr style="display: none">
                <td align="right">
                    Bussines Class
                </td>
                <td align="left" colspan="2">
                    <input type="text" id="txtBussinesClass" style="width: 240px;" tabindex="11" />
                </td>
                <td align="right" class="style1">
                    Reason For Quote
                </td>
                <td align="left" colspan="2">
                    <input type="text" id="txtReasonForQuote" style="width: 260px;" tabindex="15" />
                </td>
            </tr>
            <tr>
                <td align="right">
                    Product
                </td>
                <td align="left" colspan="2">
                    <input type="text" id="txtProduct" style="width: 240px;" tabindex="12" />
                </td>
                <td align="right" class="style1">
                    Application/Program
                </td>
                <td align="left" colspan="2">
                    <input type="text" id="txtApplication" style="width: 260px;" tabindex="16" />
                </td>
            </tr>
            <tr style="display: none">
                <td align="right" height="25px" colspan="6">
                    <div style="border: solid; border-color: gray; border-width: 1px;">
                    </div>
                </td>
            </tr>
            <tr style="display: none">
                <td align="right">
                    Specification
                </td>
                <td align="left">
                    <input type="text" id="txtSpecification" style="width: 180px;" tabindex="17" />
                </td>
                <td align="left">
                </td>
                <td align="right" class="style1">
                    Part Print
                </td>
                <td align="left" colspan="2">
                    <input type="text" id="txtPartPrint" style="width: 260px;" tabindex="20" />
                </td>
            </tr>
            <tr style="display: none">
                <td align="right">
                    Drawing Level
                </td>
                <td align="left">
                    <input type="text" id="txtDrawingLevel" style="width: 180px;" tabindex="18" />
                </td>
                <td align="left">
                </td>
                <td align="right" class="style1">
                    Sample
                </td>
                <td align="left" colspan="2">
                    <input type="text" id="txtSample" style="width: 80px;" tabindex="21" />
                </td>
            </tr>
            <tr style="display: none">
                <td align="right">
                    Task Description
                </td>
                <td align="left">
                    <input type="text" id="txtTaskDescription" style="width: 180px;" tabindex="19" />
                </td>
                <td align="left">
                </td>
                <td align="left" class="style1">
                </td>
                <td align="left">
                </td>
                <td align="right">
                </td>
            </tr>
            <tr>
                <td align="right" height="25px" colspan="6">
                    <div style="border: solid; border-color: gray; border-width: 1px;">
                    </div>
                </td>
            </tr>
        </table>

        <%------------------------------------- SIF Detail-----------------------------------%>
        <div style="border-radius: 10px; border: solid #D3D3D3; background-color: #D3D3D3;
            min-height: 120px; padding: 4px;">
            <div id="divSIFDetail">
            </div>
        </div>

        <%----------------------------------------------------------------------------------%>
        <table style="width: 100%;">
            <tr>
                <td align="right" colspan="3" style="width:220px;">
                    Tooling Target
                </td>
                <td align="left" colspan="2">
                    <input type="text" id="txtToolingTarget" style="width: 180px; text-align: right;"
                        tabindex="22" />
                </td>
                <td align="left">
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td align="right" colspan="3">
                    Primary Competitors
                </td>
                <td align="left" colspan="2">
                    <input type="text" id="txtPrimaryCompetitors" style="width: 320px;" tabindex="23" />
                </td>
                <td align="left">
                </td>
            </tr>
            <tr style="display: none">
                <td align="right" colspan="3">
                    Specific Resource Requirements
                </td>
                <td align="left" colspan="2">
                    <input type="text" id="txtSpecificResourceRequirements" style="width: 320px;" tabindex="24" />
                </td>
                <td align="left">
                </td>
            </tr>
            <tr style="display: none">
                <td align="right" colspan="3">
                    Technical
                </td>
                <td align="left" colspan="2">
                    <input type="text" id="txtTechnical" style="width: 320px;" tabindex="25" />
                </td>
                <td align="left">
                </td>
            </tr>
            <tr>
                <td align="right" height="25px" colspan="6">
                    <div style="border: solid; border-color: gray; border-width: 1px;">
                    </div>
                </td>
            </tr>
            <tr>
                <td align="right" colspan="3">
                    Quote Due
                </td>
                <td align="left" colspan="2">
                    <input type="text" id="txtQuoteDue" datepicker="true" style="width: 180px;" tabindex="26" />
                </td>
                <td align="left">
                </td>
            </tr>
            <tr>
                <td align="right" colspan="3">
                    SOP
                </td>
                <td align="left" colspan="2">
                    <input type="text" id="txtSOP" datepicker="true" style="width: 180px;" tabindex="27" />
                </td>
                <td align="left">
                </td>
            </tr>
        </table>
        <br />
        <div style="width: 180px; margin: auto;">
            <input type="button" id="btnSaveSIF" onclick="return false;" style="width: 80px;"
                value="Save" />
            <input type="button" id="btnCancelSaveSIF" onclick="on_closeSaveSIF();return false;"
                value="Cancel" style="width: 80px;" />
        </div>
    </div>
    <div id="divDialog_NewMarketSector" title="New MarketSector" style="display: none;">
        <div align="center">
            <div id="divNewMarketSector">
                <table cellspacing="0">
                    <tr>
                        <td align="right">
                            <b style="margin-right: 5px;">MarketSector:</b>
                        </td>
                        <td>
                            <input type="text" id="txtNewMarketSector" style="width: 350px;" validate="required"
                                validationid="validatingNewMarketSector" />
                        </td>
                    </tr>
                    <tr style="height: 40px;">
                        <td colspan="2">
                        </td>
                    </tr>
                    <tr>
                        <td align="center" colspan="3">
                            <input type="button" id="btnCreateMarketSector" onclick="return false;" style="width: 80px;"
                                validationid="validatingNewMarketSector" value="Create" />
                            <input type="button" id="btnCancelCreateMarketSector" onclick="on_closeCreateMarketSector();"
                                value="Cancel" style="width: 80px;" />
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
    <div id="divDialog_NewCustomer" title="New Customer" style="display: none;">
        <div align="center">
            <div id="divNewCustomer">
                <table cellspacing="0">
                    <tr>
                        <td align="right">
                            <b style="margin-right: 5px;">Customer:</b>
                        </td>
                        <td>
                            <input type="text" id="txtNewCustomer" style="width: 350px;" validate="required"
                                validationid="validatingNewCustomer" />
                        </td>
                    </tr>
                    <tr style="height: 40px;">
                        <td colspan="2">
                        </td>
                    </tr>
                    <tr>
                        <td align="center" colspan="3">
                            <input type="button" id="btnCreateCustomer" onclick="return false;" style="width: 80px;"
                                validationid="validatingNewCustomer" value="Create" />
                            <input type="button" id="btnCancelCreateCustomer" onclick="on_closeCreateCustomer();"
                                value="Cancel" style="width: 80px;" />
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        var Users = [];
        var MarketSectors = [];
        var Customers = [];
        var SIFList = [];
        var cookieSIFListDateFrom;
        var cookieSIFListDateTo;
        var cookieSIFListUser;
        jQuery(document).ready(function () {
            jQuery('#divImgEmail').css("top", (jQuery(window).height() / 2) - (jQuery('#divImgEmail').outerHeight() / 2));
            jQuery('#divImgEmail').css("left", (jQuery(window).width() / 2) - (jQuery('#divImgEmail').outerWidth() / 2));
            jQuery("#tabs").tabs();
            cookieSIFListUser = jQuery.trim(jQuery.cookie('SIFListUser'));
            if (cookieSIFListUser == "") cookieSIFListUser = "All";
            cookieSIFListDateFrom = jQuery.trim(jQuery.cookie('SIFListDateFrom'));
            cookieSIFListDateTo = jQuery.trim(jQuery.cookie('SIFListDateTo'));
            getResources();
        });
        function getResources() {
            getUsers();
            getMarketSectors();
            getCustomers();
        }
        function getUsers() {
            jQuery.getJSON('<%= ResolveUrl("~/WebService/Catalogs.aspx") %>?cmd=read&catalog=user', function (result) {
                Users = result;
                readCallBack();
            });
            return true;
        }
        function getMarketSectors() {
            jQuery.getJSON('<%= ResolveUrl("~/WebService/Catalogs.aspx") %>?cmd=read&catalog=marketsector', function (result) {
                MarketSectors = result;
                readCallBack();
            });
            return true;
        }
        function getCustomers() {
            jQuery.getJSON('<%= ResolveUrl("~/WebService/Catalogs.aspx") %>?cmd=read&catalog=customer', function (result) {
                Customers = result;
                readCallBack();
            });
            return true;
        }
        var readCounter = 0;
        function readCallBack() {
            readCounter++;
            if (readCounter == 3) {
                readCounter = 0;
                load();
            }
        }
        function load() {
            populateUsers();
            populateMarketSectors();
            populateCustomers();
            jQuery("#txtDateFilterFrom").val(cookieSIFListDateFrom);
            jQuery("#txtDateFilterTo").val(cookieSIFListDateTo);
            jQuery('#cboUsers').val(cookieSIFListUser).trigger("chosen:updated");
            filterSIFList();
        }
        function populateMarketSectors() {
            var strMarketSectors = '<select id="cboMarketSectors" tabindex="5">';
            for (var i = 0; i < MarketSectors.length; i++) {
                var current = MarketSectors[i];
                strMarketSectors += '<option value="' + current.Id + '">' + current.Name + '</option>';
            }
            strMarketSectors += '</select>';

            jQuery("#divMarketSector").html(strMarketSectors);
            jQuery("#cboMarketSectors").chosen({ width: "200px" });
        }
        function populateCustomers() {
            var strCustomers = '<select id="cboCustomers" tabindex="5">';
            for (var i = 0; i < Customers.length; i++) {
                var current = Customers[i];
                strCustomers += '<option value="' + current.Id + '">' + current.CustomerName + '</option>';
            }
            strCustomers += '</select>';

            jQuery("#divCustomer").html(strCustomers);
            jQuery("#cboCustomers").chosen({ width: "190px" });
        }
        function getMarketSectorByID(idMarketSector) {
            for (var i = 0; i < MarketSectors.length; i++) {
                if (MarketSectors[i].Id == idMarketSector) {
                    return MarketSectors[i];
                }
            }
            return null;
        }
        function getCustomerByID(idCustomer) {
            for (var i = 0; i < Customers.length; i++) {
                if (Customers[i].Id == idCustomer) {
                    return Customers[i];
                }
            }
            return null;
        }
        function populateUsers() {
            var strUsers = '<select id="cboUsers" tabindex="0">';
            strUsers += '<option value ="All">All</option>';
            for (var i = 0; i < Users.length; i++) {
                var current = Users[i];
                strUsers += '<option value="' + current.UserName + '">' + current.UserName + '</option>';
            }
            strUsers += '</select>';

            jQuery("#divUsers").html(strUsers);
            jQuery("#cboUsers").chosen({ disable_search: true, width: "285px" });
            jQuery("#divMainContent").show();
        }

        function on_filter_sifList() {
            filterSIFList();
        }

        function filterSIFList() {
            SIFList = [];
            jQuery("#divSIFList").css("visibility", "hidden");
            jQuery("#divImgEmail").show();
            
            var strSelectedUser = jQuery("#cboUsers option:selected").val();

            persistFilter();

            jQuery.getJSON('<%= ResolveUrl("~/WebService/SIF.aspx") %>?cmd=readbyuser&user=' + strSelectedUser +
                    '&dateFrom=' + getJSONDate(jQuery("#txtDateFilterFrom").val()) +
                    '&dateTo=' + getJSONDate(jQuery("#txtDateFilterTo").val()), function (response) {
                        SIFList = response.Result;
                        refreshSIFList();
                        jQuery("#divImgEmail").hide();
                        jQuery("#divSIFList").css("visibility", "visible");
            });
        }
        function persistFilter() {
            jQuery.cookie('SIFListUser', jQuery("#cboUsers option:selected").val(), { expires: 365 });
            jQuery.cookie('SIFListDateFrom', jQuery("#txtDateFilterFrom").val(), { expires: 365 });
            jQuery.cookie('SIFListDateTo', jQuery("#txtDateFilterTo").val(), { expires: 365 });
            cookieSIFListUser = jQuery("#cboUsers option:selected").val();
            cookieSIFListDateFrom = jQuery("#txtDateFilterFrom").val();
            cookieSIFListDateTo = jQuery("#txtDateFilterTo").val();
        }
        function refreshSIFList() {
            var theTable = jQuery(".SIFList").dataTable();
            try {
                theTable.fnDestroy();
            } catch (e) { }

            theTable.dataTable({
                "aaData": getSIFArray(SIFList),
                "aoColumns": [
                    null,
                    {
                        "mRender": function (data, type, full) {
                            var sifId = full[full.length - 2];
                            if (data == "") data = "Take";
                            return '<a href="#" onclick="on_takeSIF_click(' + sifId + ',afterTakeSIF);return false;">' + data + '</a>';
                        }
                    },
                    null,
                    null,
                    null,
                    null,
                    null,
                    {
                        "sType": "date",
                        "mRender": function (data, type, full) {
                            return formatDateTime(data);
                        }
                    },
                    {
                        "mRender": function (data, type, full) {
                            if (data < 0) return "APQM";
                            return "Sales DB";
                        }
                    },
                    {
                        "mRender": function (data, type, full) {
                            var bomId = full[full.length - 1];
                            var sifId = full[full.length - 2];
                            if (bomId > -1) {
                                if (jQuery.trim(data) == "") return '<a style="min-width: 80px;display: inline-block;" href="../BOM/BOM_Main.aspx?bom=' + full[full.length - 1] + '" target="_blank">Edit BOM</a>' +
                                '<input type="image" src="../pics/delete-icon.png" style="height:20px;" ' +
                                '    onclick="deleteBOMByID(' + full[full.length - 1] + ');return false;" />';

                                return '<a style="min-width: 80px;display: inline-block;" href="../BOM/BOM_Main.aspx?bom=' + full[full.length - 1] + '" target="_blank">' + data + '</a>' +
                                '<input type="image" src="../pics/delete-icon.png" style="height:20px;" ' +
                                '    onclick="deleteBOMByID(' + full[full.length - 1] + ');return false;" />';
                            } else {
                                return '<a href="#" onclick="on_createBOM_click(' + sifId + ',afterCreateBOM);return false;">Create BOM</a>';
                            }
                        }
                    }, {
                        "mRender": function (data, type, full) {
                            return '<div class="BOMProgressBar" style="height: 20px; width: 100px;margin:auto;"><div value="' + data + '"></div></div>';
                        },
                        "iDataSort": 11
                    },
                    {
                        "bVisible": false
                    },
                    {
                        "bVisible": false
                    }
                ],
                "fnDrawCallback": function () {
                    makeProgresBar();
                },
                "bStateSave": true,
                "bFilter": true,
                "bLengthChange": true,
                "bInfo": true,
                "bPaginate": true
            }).show();
        }
        function getSIFArray(arrSIFList) {
            var result = [];
            for (var i = 0; i < arrSIFList.length; i++) {
                var currentSIF = arrSIFList[i];
                var oCurrent = ['<input type="image" src="../pics/delete-icon.png" style="height:20px;" ' +
                    '    onclick="deleteSIFByID(' + currentSIF.Id + ');return false;" />' +
                    '<input type="image" src="../pics/edit-icon.png" style="height:20px;margin-left: 5px;" onclick="on_openSIF(' + currentSIF.Id + ');return false;" />',
                                currentSIF.AssignedTo,
                                currentSIF.InquiryNumber,
                                currentSIF.Revision,
                                currentSIF.Priority,
                                currentSIF.SalesPerson,
                                currentSIF.CustomerName,
                                currentSIF.CreatedDate,
                                currentSIF.SalesDBID,
                                currentSIF.TopPartNumber,
                                currentSIF.BOMProgress,
                                currentSIF.BOMProgress,
                                currentSIF.Id,
                                currentSIF.BomId
                                ];
                result.push(oCurrent);
            }
            return result;
        }
        function makeProgresBar() {
            try {
                $(".BOMProgressBar").progressbar("destroy");
            }
            catch (e) { }
            jQuery('.BOMProgressBar').each(function () {
                var progressLabel = jQuery(this.children);
                var iProgressBarValue = Number(Number(progressLabel.attr("value")).toFixed(1));
                var progressBar = jQuery(this);
                jQuery(this).progressbar({
                    value: false
                });
                progressBar.css("position", "relative");
                progressLabel.css("position", "absolute").css("top", "3px");
                progressBar.progressbar({ value: iProgressBarValue });
                if (iProgressBarValue < 100) {
                    progressLabel.text('' + iProgressBarValue + '%');
                    progressLabel.css("left", "40%");
                }
                else {
                    progressLabel.text('Complete!');
                    progressLabel.css("left", "23%");
                }
            });


        }
        function afterTakeSIF(iSIF_ID,response) {
            for (var i = 0; i < SIFList.length; i++) {
                var current = SIFList[i];
                if (current.Id == iSIF_ID) {
                    current.AssignedTo = response.Result;
                    refreshSIFList();
                    return;
                }
            }
        }
        function afterCreateBOM(iSIF_ID, iBOM_ID) {
            for (var i = 0; i < SIFList.length; i++) {
                var current = SIFList[i];
                if (current.Id == iSIF_ID) {
                    current.BomId = iBOM_ID;
                    refreshSIFList();
                    return;
                }
            }
        }
        function on_takeSIF_click(iSIF_ID, onSuccess) {
            if (confirm("Are you sure you want to take a SIF?")) {
                var to = '<%= ResolveUrl("~/WebService/SIF.aspx") %>?cmd=takeSIF&sif_id=' + iSIF_ID;

                jQuery("#divImgEmail").css("display", "block");

                jQuery.ajax({
                    type: "POST",
                    url: to,
                    data: {},
                    contentType: "application/json;charset=utf-8",
                    dataType: "html",
                    success: function (response) {
                        response = JSON.parse(response);
                        if (response.ErrorThrown === true) {
                            alertify.alert(response.ResponseDescription);
                        } else {
                            try {
                                onSuccess(iSIF_ID, response);
                            } catch (e) { }
                            alertify.success(response.ResponseDescription);
                        }
                        jQuery("#divImgEmail").hide();
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        if (console && console.log) {
                            console.log(jqXHR);
                            console.log(textStatus);
                            console.log(errorThrown);
                        }
                        try {
                            onFail();
                        } catch (e) { }
                    }
                });
            }
        }
        function on_createBOM_click(iSIF_ID, onSuccess) {
                var to = '<%= ResolveUrl("~/WebService/BOM.aspx") %>?cmd=createBOM&sif_id=' + iSIF_ID;

                jQuery("#divImgEmail").css("display", "block");

                jQuery.ajax({
                    type: "POST",
                    url: to,
                    data: {},
                    contentType: "application/json;charset=utf-8",
                    dataType: "html",
                    success: function (response) {
                        response = JSON.parse(response);
                        if (response.ErrorThrown === true) {
                            alertify.alert(response.ResponseDescription);
                        } else {
                            try {
                                onSuccess(iSIF_ID, response.Result);
                            } catch (e) { }
                            alertify.success(response.ResponseDescription);
                        }
                        jQuery("#divImgEmail").hide();
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        if (console && console.log) {
                            console.log(jqXHR);
                            console.log(textStatus);
                            console.log(errorThrown);
                        }
                        try {
                            onFail();
                        } catch (e) { }
                    }
                });
        }
        function deleteSIFByID(iSIF_ID) {
            if (confirm("Are you sure you want to delete a SIF?")) {
                var to = '<%= ResolveUrl("~/WebService/SIF.aspx") %>?cmd=delete&id=' + iSIF_ID;

                jQuery("#divImgEmail").css("display", "block");

                jQuery.ajax({
                    type: "POST",
                    url: to,
                    data: {},
                    contentType: "application/json;charset=utf-8",
                    dataType: "html",
                    success: function (response) {
                        response = JSON.parse(response);
                        if (response.Result == "OK") {
                            afterDeleteSIF(iSIF_ID);
                        } else {
                            alertify.error(response);
                        }
                        jQuery("#divImgEmail").hide();
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        if (console && console.log) {
                            console.log(jqXHR);
                            console.log(textStatus);
                            console.log(errorThrown);
                        }
                        try {
                            onFail();
                        } catch (e) { }
                    }
                });
            }
        }
        function deleteBOMByID(iBOM_ID) {
            if (confirm("Are you sure you want to delete a BOM?")) {
                var to = '<%= ResolveUrl("~/WebService/BOM.aspx") %>?cmd=deleteBOM&id=' + iBOM_ID;

                jQuery("#divImgEmail").css("display", "block");

                jQuery.ajax({
                    type: "POST",
                    url: to,
                    data: {},
                    contentType: "application/json;charset=utf-8",
                    dataType: "html",
                    success: function (response) {
                        response = JSON.parse(response);
                        if (response.Result == "OK") {
                            afterDeleteBOM(iBOM_ID);
                        } else {
                            alertify.error(response);
                        }
                        jQuery("#divImgEmail").hide();
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        if (console && console.log) {
                            console.log(jqXHR);
                            console.log(textStatus);
                            console.log(errorThrown);
                        }
                        try {
                            onFail();
                        } catch (e) { }
                    }
                });
            }
        }
        function afterDeleteBOM(iBOM_ID) {
            for (var j = 0; j < SIFList.length; j++) {
                var currentSIF = SIFList[j];
                if (currentSIF.BomId == iBOM_ID) {
                    currentSIF.BomId = -1;
                    refreshSIFList();
                    alertify.success("BOM deleted successfully;");
                    return;
                }
            }
        }
        function on_closeSaveSIF() {
            jQuery("#diDialog_SIF").dialog("close");
        }
        function on_openSIF(iSIF_ID) {
            jQuery("#btnSaveSIF").prop("disabled", false);
            jQuery("#btnCancelSaveSIF").prop("disabled", false);
            jQuery("#divPleaseWait").hide();

            var sifToSave = getSIFByID(iSIF_ID);
            if (sifToSave != null) {

                jQuery('#txtApplication').val(sifToSave.Application);
                jQuery('#txtBussinesClass').val(sifToSave.BussinesClass);
                jQuery('#txtContact').val(sifToSave.Contact);
                jQuery('#txtCostModelLoc').val(sifToSave.CostModelLoc);
                jQuery('#cboCustomers').val(sifToSave.CustomerKey).trigger("chosen:updated");
                jQuery('#txtDepartment').val(sifToSave.Department);
                jQuery('#txtDivLoc').val(sifToSave.DivLoc);
                jQuery('#txtDrawingLevel').val(sifToSave.DrawingLevel);
                jQuery('#txtInquiryNumber').val(sifToSave.InquiryNumber);
                jQuery('#cboMarketSectors').val(sifToSave.MarketSectorID).trigger("chosen:updated");
                jQuery('#txtPartPrint').val(sifToSave.PartPrint);
                jQuery('#txtPrimaryCompetitors').val(sifToSave.PrimaryCompetitors);
                jQuery('#txtPriority').val(sifToSave.Priority);
                jQuery('#txtProduct').val(sifToSave.Product);
                jQuery('#txtQuoteDue').val(formatDate(sifToSave.QuoteDue));
                jQuery('#txtReasonForQuote').val(sifToSave.Reason4Quote);
                jQuery('#txtRevision').val(sifToSave.Revision);
                jQuery('#txtSalesPerson').val(sifToSave.SalesPerson);
                jQuery('#txtSample').val(sifToSave.Sample);
                jQuery('#txtSOP').val(formatDate(sifToSave.Sop));
                jQuery('#txtSpecificResourceRequirements').val(sifToSave.SpecificResourceRequirements);
                jQuery('#txtSpecification').val(sifToSave.Specification);
                jQuery('#txtTaskDescription').val(sifToSave.TaskDescription);
                jQuery('#txtTechnical').val(sifToSave.Technical);
                jQuery('#txtToolingTarget').val(sifToSave.ToolingTarget);

                populateSIFVolumes(sifToSave.SifDetail);

                jQuery("#btnSaveSIF").unbind("click").click(function () {
                    saveSIF(sifToSave, afterSaveSIF);
                });

                jQuery("#diDialog_SIF").dialog({ autoOpen: true,
                    appendTo: jQuery('form:first'),
                    width: 990, height: 550, modal: true, closeOnEscape: false
                });


            } else {
                alertify.alert("An error has occurried. Try refreshing the page.");
            }
        }
        function populateSIFVolumes(SIFDetail) {
            var sifHorizontalDetailData = [];
            if (SIFDetail != null && SIFDetail.length > 0) {
                for (var k = 0; k < SIFDetail.length; k++) {
                    var currentSIFDetail = SIFDetail[k];
                    sifHorizontalDetailData.push(currentSIFDetail);
                }
            }

            var sifVerticalDetailData = [];
            var rowProgramYear = [];
            var rowProjectedAnnualVolume = [];
            var rowPorcentageVolumePerAward = [];
            var rowProjectedTargetPrice = [];
            var rowAnnualRevenue = [];

            for (var i = 0; i < sifHorizontalDetailData.length; i++) {
                var current = sifHorizontalDetailData[i];
                rowProgramYear.push(current.ProgramYear || null);
                rowProjectedAnnualVolume.push(current.ProjectedAnnualVolume || null);
                rowPorcentageVolumePerAward.push(current.PercentVolumePerAward || null);
                rowProjectedTargetPrice.push(current.ProjectedTargetPrice || null);
                rowAnnualRevenue.push(current.AnnualRevenue || null);
            }

            sifVerticalDetailData.push(rowProgramYear);
            sifVerticalDetailData.push(rowProjectedAnnualVolume);
            sifVerticalDetailData.push(rowPorcentageVolumePerAward);
            sifVerticalDetailData.push(rowProjectedTargetPrice);
            sifVerticalDetailData.push(rowAnnualRevenue);

            jQuery("#divSIFDetail").handsontable({
                data: sifVerticalDetailData,
                width: 950,
                colHeaders: false,
                minRows: 5,
                maxRows: 5,
                minCols: 15,
                minSpareCols: 1,
                allowInvalid: false,
                rowHeaders: ["Program Year", "Projected Annual Volume", "% of Volume Per Award", "Projected / Target Price", "Annual Revenue"],
                afterRender: function () {
                    //jQuery("#divSIFDetail table").css("width", "100%");
                    jQuery("#divSIFDetail th").css({ "width": "170px", "max-width": "170px", "min-width": "170px", "text-align": "right" });
                },
                cells: function (row, col, prop) {
                    var cellProperties = {};
                    cellProperties.type = 'numeric';
                    cellProperties.format = '0[.]00';
                    return cellProperties;
                }
            });

        }

        function getSIFByID(iSIF_ID) {
            for (var j = 0; j < SIFList.length; j++) {
                if (SIFList[j].Id == iSIF_ID) {
                    return SIFList[j];
                }
            }
            return null;
        }
        function afterDeleteSIF(iSIF_ID) {
            for (var j = 0; j < SIFList.length; j++) {
                var currentSIF = SIFList[j];
                if (currentSIF.Id == iSIF_ID) {
                    SIFList.splice(j, 1);
                    refreshSIFList();
                    alertify.success("SIF deleted successfully.");
                    return;
                }
            }
        }
        function afterSaveSIF(response) {
            //var sifUpdated = response.Result;

            for (var i = 0; i < SIFList.length; i++) {
                if (SIFList[i].Id == response.Result.Id) {
                    SIFList[i] == response.Result;
                    jQuery("#diDialog_SIF").dialog("close");
                    result;
                }
            }

            alertify.alert("SIF updated correctly, but there was an error on the page, try refrhesing the page.");

        }

        function saveSIF(sifToSave, onSuccess) {

            if (sifToSave == null) {
                alertify.alert("Error: SIF not found, try refreshing the page.");
                jQuery("#btnSaveSIF").prop("disabled", false);
                jQuery("#btnCancelSaveSIF").prop("disabled", false);
                return;
            }
            jQuery("#btnSaveSIF").prop("disabled", true);
            jQuery("#btnCancelSaveSIF").prop("disabled", true);

            sifToSave.Application = jQuery('#txtApplication').val();
            sifToSave.BussinesClass = jQuery('#txtBussinesClass').val();
            sifToSave.Contact = jQuery('#txtContact').val();
            sifToSave.CostModelLoc = jQuery('#txtCostModelLoc').val();
            sifToSave.CustomerKey = jQuery('#cboCustomers').val();
            sifToSave.Department = jQuery('#txtDepartment').val();
            sifToSave.DivLoc = jQuery('#txtDivLoc').val();
            sifToSave.DrawingLevel = jQuery('#txtDrawingLevel').val();
            sifToSave.InquiryNumber = jQuery('#txtInquiryNumber').val();
            sifToSave.MarketSectorID = jQuery('#cboMarketSectors').val();
            sifToSave.PartPrint = jQuery('#txtPartPrint').val();
            sifToSave.PrimaryCompetitors = jQuery('#txtPrimaryCompetitors').val();
            sifToSave.Priority = jQuery('#txtPriority').val();
            sifToSave.Product = jQuery('#txtProduct').val();
            sifToSave.QuoteDue = getJSONDate(jQuery('#txtQuoteDue').val());
            sifToSave.Reason4Quote = jQuery('#txtReasonForQuote').val();
            sifToSave.Revision = jQuery('#txtRevision').val();
            sifToSave.SalesPerson = jQuery('#txtSalesPerson').val();
            sifToSave.Sample = jQuery('#txtSample').val();
            sifToSave.Sop = getJSONDate(jQuery('#txtSOP').val());
            sifToSave.SpecificResourceRequirements = jQuery('#txtSpecificResourceRequirements').val();
            sifToSave.Specification= jQuery('#txtSpecification').val();
            sifToSave.TaskDescription = jQuery('#txtTaskDescription').val();
            sifToSave.Technical = jQuery('#txtTechnical').val();
            sifToSave.ToolingTarget = jQuery('#txtToolingTarget').val();

            theTable = jQuery("#divSIFDetail").handsontable("getInstance");
            var theData = theTable.getData();
            var sifVolumesToSave = [];


            if (theData.length > 0) {
                for (var j = 0; j < theData[0].length; j++) {
                    var sifVolume = {
                        ProgramYear: theData[0][j],
                        ProjectedAnnualVolume: theData[1][j],
                        PercentVolumePerAward: theData[2][j],
                        ProjectedTargetPrice: theData[3][j],
                        AnnualRevenue: theData[4][j]
                    }
                    sifVolumesToSave.push(sifVolume);
                }
            }

            for (var i = sifVolumesToSave.length - 1; i >= 0; i--) {
                var allNulls = true;
                for (prop in sifVolumesToSave[i]) {
                    if (sifVolumesToSave[i].hasOwnProperty(prop)) {
                        if (jQuery.trim(sifVolumesToSave[i][prop]) != "") {
                            allNulls = false;
                            break;
                        }
                    }
                }
                if (allNulls) {
                    sifVolumesToSave.splice(i, 1);
                } else {
                    for (prop in sifVolumesToSave[i]) {
                        if (sifVolumesToSave[i].hasOwnProperty(prop)) {
                            if (jQuery.trim(sifVolumesToSave[i][prop]) == "") {
                                if (prop == "ProgramYear") {
                                    sifVolumesToSave[i][prop] = '';
                                } else {
                                    sifVolumesToSave[i][prop] = 0;
                                }
                            }
                        }
                    } 
                }
            }

            sifToSave.SifDetail = sifVolumesToSave;

            var to = '<%= ResolveUrl("~/WebService/SIF.aspx") %>?cmd=update';

            jQuery("#divImgEmail").css("display", "block");
            jQuery.ajax({
                type: "POST",
                url: to,
                data: JSON.stringify(sifToSave),
                contentType: "application/json;charset=utf-8",
                dataType: "html",
                success: function (response) {
                    response = jQuery.parseJSON(response);
                    if (response.ErrorThrown === true) {
                        try { onFail(); } catch (e) { }
                        alertify.alert(response.ResponseDescription);
                    } else {
                        try { onSuccess(response); } catch (e) { }
                        alertify.success(response.ResponseDescription);
                    }
                    jQuery("#btnSaveSIF").prop("disabled", false);
                    jQuery("#btnCancelSaveSIF").prop("disabled", false);
                    jQuery("#divImgEmail").hide();
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    if (console && console.log) {
                        console.log(jqXHR);
                        console.log(textStatus);
                        console.log(errorThrown);
                    }
                    try {
                        onFail();
                    } catch (e) { }
                    jQuery("#btnSaveSIF").prop("disabled", false);
                    jQuery("#btnCancelSaveSIF").prop("disabled", false);
                    jQuery("#divImgEmail").hide();
                }
            });
        }
        function on_newMarketSector_click() {
            jQuery("#btnCreateMarketSector").prop("disabled", false);
            jQuery("#btnCancelCreateMarketSector").prop("disabled", false);

            jQuery("#txtNewMarketSector").val('');
            jQuery("#btnCreateMarketSector").unbind("click").click(function () { createMarketSector(this, afterCreateMarketSector); });

            jQuery("#divDialog_NewMarketSector").dialog({ autoOpen: true,
                appendTo: jQuery('form:first'),
                width: 520, modal: true, closeOnEscape: false
            });
        }
        function createMarketSector(e, onSuccess) {
            if (validate()) {
                jQuery("#btnCreateMarketSector").prop("disabled", true);
                jQuery("#btnCancelCreateMarketSector").prop("disabled", true);

                var marketSectorToCreate = {
                    Name: jQuery("#txtNewMarketSector").val()
                };

                var to = '<%= ResolveUrl("~/WebService/Catalogs.aspx") %>?cmd=create&catalog=marketsector';

                jQuery("#divImgEmail").css("display", "block");
                jQuery.ajax({
                    type: "POST",
                    url: to,
                    data: JSON.stringify(marketSectorToCreate),
                    contentType: "application/json;charset=utf-8",
                    dataType: "html",
                    success: function (response) {
                        response = jQuery.parseJSON(response);
                        if (response.ErrorThrown === true) {
                            try { onFail(); } catch (e) { }
                            alertify.alert(response.ResponseDescription);
                        } else {
                            try { onSuccess(response); } catch (e) { }
                            alertify.success(response.ResponseDescription);
                        }
                        jQuery("#divImgEmail").hide();
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        if (console && console.log) {
                            console.log(jqXHR);
                            console.log(textStatus);
                            console.log(errorThrown);
                        }
                        try {
                            onFail();
                        } catch (e) { }
                        jQuery("#btnCreateMarketSector").prop("disabled", false);
                        jQuery("#btnCancelCreateMarketSector").prop("disabled", false);
                        jQuery("#divImgEmail").hide();
                    }
                });
            } else {
                jQuery("#btnCreateMarketSector").prop("disabled", false);
                jQuery("#btnCancelCreateMarketSector").prop("disabled", false);
                return;
            }
        }
        function afterCreateMarketSector(response) {
            var marketSectorCreated = response.Result;
            MarketSectors.push(marketSectorCreated);
            jQuery("#divDialog_NewMarketSector").dialog("close");
            jQuery("#cboMarketSectors").append('<option value="' + marketSectorCreated.Id + '">' + marketSectorCreated.Name + '</option>')
            jQuery("#cboMarketSectors").trigger("chosen:updated");
        }

        function on_closeCreateMarketSector() {
            jQuery("#divDialog_NewMarketSector").dialog("close");
        }

        function on_newCustomer_click() {
            jQuery("#btnCreateCustomer").prop("disabled", false);
            jQuery("#btnCancelCreateCustomer").prop("disabled", false);

            jQuery("#txtNewCustomer").val('');
            jQuery("#btnCreateCustomer").unbind("click").click(function () { createCustomer(this, afterCreateCustomer); });

            jQuery("#divDialog_NewCustomer").dialog({ autoOpen: true,
                appendTo: jQuery('form:first'),
                width: 520, modal: true, closeOnEscape: false
            });
        }
        function createCustomer(e, onSuccess) {
            if (validate()) {
                jQuery("#btnCreateCustomer").prop("disabled", true);
                jQuery("#btnCancelCreateCustomer").prop("disabled", true);

                var marketSectorToCreate = {
                    CustomerName: jQuery("#txtNewCustomer").val()
                };

                var to = '<%= ResolveUrl("~/WebService/Catalogs.aspx") %>?cmd=create&catalog=customer';

                jQuery("#divImgEmail").css("display", "block");
                jQuery.ajax({
                    type: "POST",
                    url: to,
                    data: JSON.stringify(marketSectorToCreate),
                    contentType: "application/json;charset=utf-8",
                    dataType: "html",
                    success: function (response) {
                        response = jQuery.parseJSON(response);
                        if (response.ErrorThrown === true) {
                            try { onFail(); } catch (e) { }
                            alertify.alert(response.ResponseDescription);
                        } else {
                            try { onSuccess(response); } catch (e) { }
                            alertify.success(response.ResponseDescription);
                        }
                        jQuery("#divImgEmail").hide();
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        if (console && console.log) {
                            console.log(jqXHR);
                            console.log(textStatus);
                            console.log(errorThrown);
                        }
                        try {
                            onFail();
                        } catch (e) { }
                        jQuery("#btnCreateCustomer").prop("disabled", false);
                        jQuery("#btnCancelCreateCustomer").prop("disabled", false);
                        jQuery("#divImgEmail").hide();
                    }
                });
            } else {
                jQuery("#btnCreateCustomer").prop("disabled", false);
                jQuery("#btnCancelCreateCustomer").prop("disabled", false);
                return;
            }
        }
        function afterCreateCustomer(response) {
            var customerCreated = response.Result;
            Customers.push(customerCreated);
            jQuery("#divDialog_NewCustomer").dialog("close");
            jQuery("#cboCustomers").append('<option value="' + customerCreated.Id + '">' + customerCreated.CustomerName + '</option>')
            jQuery("#cboCustomers").trigger("chosen:updated");
        }
        function on_closeCreateCustomer() {
            jQuery("#divDialog_NewCustomer").dialog("close");
        }
    </script>
</asp:Content>
