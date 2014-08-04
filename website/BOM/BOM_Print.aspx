<%@ Page Language="C#" AutoEventWireup="true" CodeFile="BOM_Print.aspx.cs" MasterPageFile="~/_Layouts/MasterStatic.master"
    Inherits="BOM_BOM_Main" %>

<%@ Register Src="bomStatusInfo.ascx" TagName="bomStatusInfo" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderBase" runat="Server">
    <style type="text/css">
        
        .CSSTableGenerator {
	margin:0px;padding:0px;
	width:770px;
	border:1px solid #000000;
	
	-moz-border-radius-bottomleft:0px;
	-webkit-border-bottom-left-radius:0px;
	border-bottom-left-radius:0px;
	
	-moz-border-radius-bottomright:0px;
	-webkit-border-bottom-right-radius:0px;
	border-bottom-right-radius:0px;
	
	-moz-border-radius-topright:0px;
	-webkit-border-top-right-radius:0px;
	border-top-right-radius:0px;
	
	-moz-border-radius-topleft:0px;
	-webkit-border-top-left-radius:0px;
	border-top-left-radius:0px;
}.CSSTableGenerator table{
    border-collapse: collapse;
        border-spacing: 0;
	width:100%;
	height:100%;
	margin:0px;padding:0px;
}.CSSTableGenerator tr:last-child td:last-child {
	-moz-border-radius-bottomright:0px;
	-webkit-border-bottom-right-radius:0px;
	border-bottom-right-radius:0px;
}
.CSSTableGenerator table tr:first-child td:first-child {
	-moz-border-radius-topleft:0px;
	-webkit-border-top-left-radius:0px;
	border-top-left-radius:0px;
}
.CSSTableGenerator table tr:first-child td:last-child {
	-moz-border-radius-topright:0px;
	-webkit-border-top-right-radius:0px;
	border-top-right-radius:0px;
}.CSSTableGenerator tr:last-child td:first-child{
	-moz-border-radius-bottomleft:0px;
	-webkit-border-bottom-left-radius:0px;
	border-bottom-left-radius:0px;
}.CSSTableGenerator tr:hover td{
	
}
.CSSTableGenerator tr:nth-child(odd){ background-color:#e5e5e5; }
.CSSTableGenerator tr:nth-child(even)    { background-color:#ffffff; }.CSSTableGenerator td{
	vertical-align:middle;
	
	
	border:1px solid #000000;
	border-width:0px 1px 1px 0px;
	text-align:left;
	padding:7px;
	font-size:10px;
	font-family:Arial;
	font-weight:normal;
	color:#000000;
}.CSSTableGenerator tr:last-child td{
	border-width:0px 1px 0px 0px;
}.CSSTableGenerator tr td:last-child{
	border-width:0px 0px 1px 0px;
}.CSSTableGenerator tr:last-child td:last-child{
	border-width:0px 0px 0px 0px;
}
.CSSTableGenerator tr:first-child td{
		background:-o-linear-gradient(bottom, #cccccc 5%, #b2b2b2 100%);	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #cccccc), color-stop(1, #b2b2b2) );
	background:-moz-linear-gradient( center top, #cccccc 5%, #b2b2b2 100% );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr="#cccccc", endColorstr="#b2b2b2");	background: -o-linear-gradient(top,#cccccc,b2b2b2);

	background-color:#cccccc;
	border:0px solid #000000;
	text-align:center;
	border-width:0px 0px 1px 1px;
	font-size:11px;
	font-family:Arial;
	font-weight:bold;
	color:#000000;
}
.CSSTableGenerator tr:first-child:hover td{
	background:-o-linear-gradient(bottom, #cccccc 5%, #b2b2b2 100%);	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #cccccc), color-stop(1, #b2b2b2) );
	background:-moz-linear-gradient( center top, #cccccc 5%, #b2b2b2 100% );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr="#cccccc", endColorstr="#b2b2b2");	background: -o-linear-gradient(top,#cccccc,b2b2b2);

	background-color:#cccccc;
}
.CSSTableGenerator tr:first-child td:first-child{
	border-width:0px 0px 1px 0px;
}
.CSSTableGenerator tr:first-child td:last-child{
	border-width:0px 0px 1px 1px;
}
    </style>
    <div id="divImgEmail" style="display: none; position: fixed; top: 27px; right: 246px;
        z-index: 1000;">
        <img alt="" src="<%= ResolveUrl("~/Utils/loading.gif") %>" style="display: inline;
            position: relative;" />
        <span style="display: inline; position: relative;">Please wait..</span>
    </div>
    <div style="position: absolute; top: 32px; left: 135px; font-size: 30px;">
        <label id="lblInquiryNumber" bindto="InquiryNumber">
        </label>
        <label id="lblRevision" bindto="Revision">
        </label>
    </div>
    <div align="left">
        <br />
        <table cellspacing="1" align="left" style="width: 600px;">
            <tr style="height: 25px;">
                <td align="right" style="font-weight: bold">
                    Product
                </td>
                <td align="left" colspan="3">
                    <label id="lblProduct" bindto="PartDescription">
                    </label>
                </td>
                <td align="left" rowspan="5">
                </td>
            </tr>
            <tr style="height: 25px;">
                <td align="right" style="font-weight: bold" >
                    Finished Good PN
                </td>
                <td align="left" >
                    <input type="text" id="txtPartNumber" style="width: 120px;" bindto="TopPartNumber" />
                </td>
                <td align="right" style="font-weight: bold" >
                    Market Sector
                </td>
                <td align="left" >
                    <label id="lblMarketSector" bindto="MarketSector">
                    </label>
                </td>
            </tr>
            <tr style="height: 25px;">
                <td align="right" style="font-weight: bold" >
                    Sales Rep
                </td>
                <td align="left" >
                    <label id="lblSalesRep" bindto="SalesPerson">
                    </label>
                </td>
                <td align="right" style="font-weight: bold" >
                    Status
                </td>
                <td align="left" >
                    <div id="progressBar" style="height: 20px; width: 100px;">
                        <div id="progress-label">
                        </div>
                    </div>
                </td>
            </tr>
            <tr style="height: 25px;">
                <td align="right" style="font-weight: bold">
                    Customer
                </td>
                <td align="left">
                    <label id="lblCustomer" bindto="CustomerName">
                    </label>
                </td>
                <td align="right" style="font-weight: bold" class="style8">
                    &nbsp;
                </td>
                <td align="left" >
                    &nbsp;
                </td>
            </tr>
            <tr style="height: 25px;">
                <td >
                </td>
                <td colspan="2" align="left">
                    &nbsp;
                </td>
                <td align="left">
                </td>
            </tr>
        </table>
    </div>
    <div class="CSSTableGenerator" style="clear: both;margin-left: auto;margin-right: auto;">
        <table id="tableBOM">
                <tr>
                    <td>
                        #
                    </td>
                    <td>
                        Status
                    </td>
                    <td>
                        Sales LN
                    </td>
                    <td>
                        Component Part Number
                    </td>
                    <td>
                        Component Part Description/Material
                    </td>
                    <td>
                        UM
                    </td>
                    <td>
                        Cost
                    </td>
                    <td>
                        Qty Required
                    </td>
                    <td>
                        Purchasing Comments
                    </td>
                    <td>
                        Sales Comments
                    </td>
                    <td>
                        Purchasing Status
                    </td>
                </tr>
        </table>
    </div>
    <script type="text/javascript">
        jQuery(document).ready(function () {
            jQuery("#spanTitle").text("BOM");
            load();
        });
        function load() {
            jQuery("#divImgEmail").css("display", "block");
            var params = urlParamsToObject();
            if (params.hasOwnProperty('bom')) {
                getBOM(params.bom);
            }
        }

        function urlParamsToObject() {
            var result = {};
            var urlParams = location.search.split('?');
            for (var i = 1; i < urlParams.length; i++) {
                var paramsDictionary = urlParams[i].split('=');
                result[paramsDictionary[0]] = paramsDictionary[1];
            }
            return result;
        }

        var BOM;
        function getBOM(id) {
            jQuery.getJSON('<%= ResolveUrl("~/WebService/BOM.aspx") %>?cmd=read&id=' + id, function (result) {
                BOM = result;
                refreshForm();
                jQuery("#divImgEmail").hide();
                window.document.close();
                window.print();
            });
            return true;
        }

        function loadBOMDetailList() {

            var strBOMDetailList = '';

            for (var j = 0; j < BOM.BomDetail.length; j++) {
                var current = BOM.BomDetail[j];
                strBOMDetailList += '<tr><td>' + (j + 1) + '</td>' +
'    <td align="center"  > ' +
'        <label id="lblStatus" >' + current.Status + '</label> ' +
'    </td> ' +
'    <td align="center"  > ' +
'        <label id="lblSalesLN" >' + current.LinePosition + '</label> ' +
'    </td> ' +
'    <td  > ' +
'        <label id="lblPartNumber" >' + current.PartNumber + '</label> ' +
'    </td> ' +
'    <td  >' + current.Material +
'    </td> ' +
'    <td align="center"  > ' + current.Um +
'    </td> ' +
'    <td align="right"  > ' + current.Cost +
'    </td> ' +
'    <td align="right"  > ' + current.Qty +
'    </td> ' +
'    <td align="center"  >' + current.PurchasingComments +
'    </td> ' +
'    <td  > ' + current.SalesComments +
'    </td> ' +
'    <td> ' + current.PurchasingStatus +
'    </td></tr>';
            }


            jQuery("#tableBOM").append(strBOMDetailList);
        }


        function refreshForm() {

            var scrollPosition = jQuery("body").scrollTop();
            bindParentFields();
            loadBOMDetailList();
            makeProgresBar();
            jQuery("body").scrollTop(scrollPosition);
        }

        function bindParentFields() {
            jQuery("[bindTo]").each(function () {
                var value = BOM[jQuery(this).attr("bindTo")];
                setValueForControl(this, jQuery(this), value);
            });
        }

        function setValueForControl(ref, control, value) {
            switch (ref.type) {
                case 'text':
                    control.val(value);
                    break;
                case 'textarea':
                    control.val(value);
                    break;
                default:
                    control.text(value);
                    break;
            }
        }

        function getValueFromControl(ref, control, sourceObject) {
            switch (ref.type) {
                case 'text':
                    sourceObject[control.attr("bindTo")] = control.val();
                    break;
                case 'textarea':
                    sourceObject[control.attr("bindTo")] = control.val();
                    break;
                default:
                    sourceObject[control.attr("bindTo")] = control.text();
                    break;
            }
        }

        function makeProgresBar() {

            var countProcessed = 0;
            for (var i = 0; i < BOM.BomDetail.length; i++) {
                var currentLine = BOM.BomDetail[i];
                if (currentLine.Status == "Processed" || currentLine.Status == "No Quote") {
                    countProcessed++;
                }
            }
            var value = 0;
            if (countProcessed > 0)
                value = countProcessed * 100 / BOM.BomDetail.length;

            var progressBar = jQuery('#progressBar');
            var progressLabel = jQuery('#progress-label');
            progressBar.css("position", "relative");
            progressLabel.css("position", "absolute").css("left", "40%").css("top", "3px");
            progressBar.progressbar({
                value: false,
                change: function () {
                    progressLabel.text(progressBar.progressbar("value") + "%");
                    progressLabel.css("left", "40%");
                },
                complete: function () {
                    progressLabel.text("Complete!");
                    progressLabel.css("left", "23%");
                }
            });
            progressBar.progressbar({ value: Number(value.toFixed(1)) });
        }
    </script>
</asp:Content>
