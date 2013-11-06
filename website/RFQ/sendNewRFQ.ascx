<%@ Control Language="C#" AutoEventWireup="true" CodeFile="sendNewRFQ.ascx.cs" Inherits="SendNewRFQ" %>
<%@ Register src="rfqEAV.ascx" tagname="rfqEAV" tagprefix="uc1" %>
<style type="text/css">
    .style1
    {
        width: 118px;
    }
    .style2
    {
        width: 118px;
        height: 10px;
    }
    .style3
    {
        height: 19px;
    }
    .style4
    {
        height: 10px;
    }
    .style5
    {
        width: 100%;
    }
</style>
<div align="center">
    <br />
    <asp:Label ID="lblBomDetailID" runat="server" Text="1" Visible="False"></asp:Label>
    <asp:FormView ID="frmBOMLine" runat="server" DataSourceID="SqlDataSourceRFQCountPerBOMDetail"
        Width="480px">
        <ItemTemplate>
        <table cellspacing="0" class="style5">
        <tr>
            <td align="right">
                Inquiry Number:</td>
            <td align="left">
                <asp:Label ID="InquiryNumberLabel" runat="server" 
                    Text='<%# Bind("InquiryNumber") %>' />
                </td>
        </tr>
        <tr>
            <td align="right">
                Revision:</td>
            <td align="left">
                <asp:Label ID="RevisionLabel" runat="server" 
                    Text='<%# Bind("Revision") %>' />
                </td>
        </tr>
        <tr>
            <td align="right">
                Product:</td>
            <td align="left">
                <asp:Label ID="PartDescriptionLabel" runat="server" 
                    Text='<%# Bind("PartDescription") %>' />
                </td>
        </tr>
        <tr>
            <td align="right">
                Part Number:</td>
            <td align="left">
                <asp:Label ID="PartNumberLabel" runat="server" 
                    Text='<%# Bind("PartNumber") %>' />
                </td>
        </tr>
        <tr>
            <td align="right">
                Material</td>
            <td align="left">
                <asp:Label ID="MaterialLabel" runat="server" 
                    Text='<%# Bind("Material") %>' />
                </td>
        </tr>
        </table>
        </ItemTemplate>
    </asp:FormView>
    
    
    
    
    
    <br />
    <table cellspacing="0" style="width: 479px">
        <tr>
            <td align="right" class="style1">
                Vendor
            </td>
            <td class="style3" align="left">
                <asp:DropDownList ID="cboSupplier" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1"
                    DataTextField="SupplierName" DataValueField="SupplierMasterKey" OnDataBound="on_dataBound_supplier"
                    OnSelectedIndexChanged="cboSupplier_SelectedIndexChanged" Width="350px">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td align="right" class="style1">
                Email
            </td>
            <td class="style3" align="left">
                <asp:TextBox ID="txtEmail" runat="server" Width="346px"></asp:TextBox>
            </td>
        </tr>
        <tr style="height:10px;">
            <td class="style2">
            </td>
            <td class="style4">
            </td>
        </tr>
        <tr>
            <td align="right" class="style1">
                EAV</td>
            <td class="style3" align="left">
                <uc1:rfqEAV ID="uscRfqEAV" runat="server" />
            </td>
        </tr>
        <tr>
            <td align="right" class="style1">
                Due Date
            </td>
            <td align="left">
                <asp:TextBox ID="txtDueDate" runat="server" Width="200px"></asp:TextBox>
                <asp:Button ID="btnCalendar" runat="server" OnClick="btnCalendar_Click" Text="..." />
            </td>
        </tr>
        <tr style="height:30px;">
            <td class="style1" align="right">
                
                Target Price</td>
            <td align="left">
                
                <input id="chkTargetPrice" type="checkbox" onchange="toggleTargetPrice();" /><asp:TextBox ID="txtTargetPrice" style="display:none;"
                    runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style1">
                
            </td>
            <td>
                
                &nbsp;</td>
        </tr>
        <tr>
            <td align="center" colspan="2">
                <asp:Button ID="btnSendRFQ" runat="server" OnClick="btnSendRFQ_Click"  Text="Send New RFQ"
                    Width="136px" />
                <asp:Button ID="btnCancel" runat="server" OnClick="btnCancel_Click" Text="Cancel"
                    Width="70px" />
            </td>
        </tr>
    </table>
    <asp:SqlDataSource OnInit="on_sqldatasource_Init"
     ID="SqlDataSource1" runat="server" 
        SelectCommand="SELECT [SupplierName], [SupplierMasterKey], [ContactEmail] FROM [SupplierMaster] ORDER BY [SupplierName]">
    </asp:SqlDataSource>
    <asp:Panel ID="panelPopup" runat="server" Visible="false">
        <asp:Button runat="server" Text="" CssClass="OverlayCalendar" Style="border: 0;"
            ID="btnCalendarBackground" OnClick="btnCalendarBackground_Click" />
        <asp:Panel ID="popupContainer" runat="server" CssClass="PopUpCalendar">
            <asp:Calendar ID="calendar" runat="server" OnSelectionChanged="calendar_SelectionChanged">
            </asp:Calendar>
        </asp:Panel>
    </asp:Panel>
    <asp:SqlDataSource 
    OnInit="on_sqldatasource_Init"
    ID="SqlDataSourceRFQCountPerBOMDetail" runat="server" 
        
        SelectCommand="SELECT InquiryNumber, TopPartNumber, PartDescription, PartNumber, Description, Qty, Cost, Revision, Material FROM viewRFQCountPerBOMDetail WHERE (BOMDetailKey = @BOMDetailKey)" 
        ConnectionString="Data Source=CAPSP;Initial Catalog=APQM_DB;Integrated Security=True" 
        ProviderName="System.Data.SqlClient">
        <SelectParameters>
            <asp:ControlParameter ControlID="lblBomDetailID" DefaultValue="-1" Name="BOMDetailKey"
                PropertyName="Text" Type="Decimal" />
        </SelectParameters>
    </asp:SqlDataSource>
</div>
<script type="text/javascript">
    function EnviarMail() {
        event.srcElement.disabled = true;
        return true;
    }
    function toggleTargetPrice() {
        jQuery('#<%= txtTargetPrice.ClientID %>').toggle();
    }
</script>