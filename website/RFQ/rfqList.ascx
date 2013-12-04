<%@ Control Language="C#" AutoEventWireup="true" CodeFile="rfqList.ascx.cs" Inherits="rfqList" %>
<div align="center">
    <asp:GridView ID="gridRFQList" runat="server" AutoGenerateColumns="False" class="display" style="display:none;"
        DataSourceID="SqlDataSource" DataKeyNames="RFQHeaderKey" OnPreRender="preRenderGridView"
        RowStyle-Height="27px" OnRowCommand="gridView_RowCommand"
        onrowdatabound="gridRFQList_RowDataBound">
<RowStyle Height="27px"></RowStyle>
        <Columns>
            <asp:BoundField DataField="RfqGenerated" HeaderText="RFQ Number" SortExpression="RFQGenerated" />
            <asp:BoundField DataField="PartNumber" HeaderText="Part Number" SortExpression="PartNumber" />
            <asp:BoundField DataField="SupplierName" HeaderText="Vendor" SortExpression="SupplierName" />
            <asp:BoundField DataField="DueDate" HeaderText="Due Date" SortExpression="DueDate"
                DataFormatString="{0:d}" />
            <asp:TemplateField HeaderText="Status" SortExpression="Status">
                <ItemTemplate>
                    <a target="_blank" href='<%# "rfqFormMain.aspx?rfq=" + Eval("RFQHeaderKey")%>'>
                        <%# Eval("Status")%></a>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="false" OnClientClick="javascript:return confirm('Are you sure?');"
                        CommandName="setAwarded" Text="Set Awarded"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource" runat="server" OnInit="on_sqldatasource_Init"
        SelectCommand="SELECT * FROM [viewRFQHeader_ReadAll]"></asp:SqlDataSource>
</div>

<script type="text/javascript">
    jQuery(document).ready(function() {
        jQuery('#<%= this.gridRFQList.ClientID %>').dataTable().show();
    });
</script>

