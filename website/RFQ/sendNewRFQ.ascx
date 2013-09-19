<%@ Control Language="C#" AutoEventWireup="true" CodeFile="sendNewRFQ.ascx.cs" Inherits="SendNewRFQ" %>
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
</style>
<div align="center">
    <br />
    <asp:Label ID="lblBomDetailID" runat="server" Text="1" Visible="False"></asp:Label>
    <asp:FormView ID="frmBOMLine" runat="server" DataSourceID="SqlDataSourceRFQCountPerBOMDetail"
        Width="480px">
        <EditItemTemplate>
            <div width="100px">
                InquiryNumber:</div>
            <asp:TextBox ID="InquiryNumberTextBox" runat="server" Text='<%# Bind("InquiryNumber") %>' />
            <br />
            TopPartNumber:
            <asp:TextBox ID="TopPartNumberTextBox" runat="server" Text='<%# Bind("TopPartNumber") %>' />
            <br />
            PartDescription:
            <asp:TextBox ID="PartDescriptionTextBox" runat="server" Text='<%# Bind("PartDescription") %>' />
            <br />
            PartNumber:
            <asp:TextBox ID="PartNumberTextBox" runat="server" Text='<%# Bind("PartNumber") %>' />
            <br />
            Description:
            <asp:TextBox ID="DescriptionTextBox" runat="server" Text='<%# Bind("Description") %>' />
            <br />
            Qty:
            <asp:TextBox ID="QtyTextBox" runat="server" Text='<%# Bind("Qty") %>' />
            <br />
            Cost:
            <asp:TextBox ID="CostTextBox" runat="server" Text='<%# Bind("Cost") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
                Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False"
                CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <InsertItemTemplate>
            InquiryNumber:
            <asp:TextBox ID="InquiryNumberTextBox0" runat="server" Text='<%# Bind("InquiryNumber") %>' />
            <br />
            TopPartNumber:
            <asp:TextBox ID="TopPartNumberTextBox0" runat="server" Text='<%# Bind("TopPartNumber") %>' />
            <br />
            PartDescription:
            <asp:TextBox ID="PartDescriptionTextBox0" runat="server" Text='<%# Bind("PartDescription") %>' />
            <br />
            PartNumber:
            <asp:TextBox ID="PartNumberTextBox0" runat="server" Text='<%# Bind("PartNumber") %>' />
            <br />
            Description:
            <asp:TextBox ID="DescriptionTextBox0" runat="server" Text='<%# Bind("Description") %>' />
            <br />
            Qty:
            <asp:TextBox ID="QtyTextBox0" runat="server" Text='<%# Bind("Qty") %>' />
            <br />
            Cost:
            <asp:TextBox ID="CostTextBox0" runat="server" Text='<%# Bind("Cost") %>' />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False"
                CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
            InquiryNumber:
            <asp:Label ID="InquiryNumberLabel" runat="server" Text='<%# Bind("InquiryNumber") %>' />
            <br />
            TopPartNumber:
            <asp:Label ID="TopPartNumberLabel" runat="server" Text='<%# Bind("TopPartNumber") %>' />
            <br />
            PartDescription:
            <asp:Label ID="PartDescriptionLabel" runat="server" Text='<%# Bind("PartDescription") %>' />
            <br />
            PartNumber:
            <asp:Label ID="PartNumberLabel" runat="server" Text='<%# Bind("PartNumber") %>' />
            <br />
            Description:
            <asp:Label ID="DescriptionLabel" runat="server" Text='<%# Bind("Description") %>' />
            <br />
            Qty:
            <asp:Label ID="QtyLabel" runat="server" Text='<%# Bind("Qty") %>' />
            <br />
            Cost:
            <asp:Label ID="CostLabel" runat="server" Text='<%# Bind("Cost") %>' />
            <br />
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
                RFQ Number
            </td>
            <td class="style3" align="left">
                <asp:TextBox ID="txtRfqNumber" runat="server" Width="200px"></asp:TextBox>
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
        <tr>
            <td class="style1">
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td align="center" colspan="2">
                <asp:Button ID="btnSendRFQ" runat="server" OnClick="btnSendRFQ_Click" Text="Send New RFQ"
                    Width="136px" />
                &nbsp;<asp:Button ID="btnCancel" runat="server" OnClick="btnCancel_Click" Text="Cancel"
                    Width="70px" />
            </td>
        </tr>
    </table>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:APQM_DBConnectionString %>"
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
    <asp:SqlDataSource ID="SqlDataSourceRFQCountPerBOMDetail" runat="server" ConnectionString="<%$ ConnectionStrings:APQM_DBConnectionString %>"
        SelectCommand="SELECT [InquiryNumber], [TopPartNumber], [PartDescription], [PartNumber], [Description], [Qty], [Cost] FROM [viewRFQCountPerBOMDetail] WHERE ([BOMDetailKey] = @BOMDetailKey)">
        <SelectParameters>
            <asp:ControlParameter ControlID="lblBomDetailID" DefaultValue="-1" Name="BOMDetailKey"
                PropertyName="Text" Type="Decimal" />
        </SelectParameters>
    </asp:SqlDataSource>
</div>
