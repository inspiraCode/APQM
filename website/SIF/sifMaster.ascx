<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SifMaster.ascx.cs" Inherits="SifMaster" %>
<%@ Register Src="sifDetail.ascx" TagName="sifDetail" TagPrefix="uc1" %>
<%@ Register src="../Utils/Notifier/notifier.ascx" tagname="notifier" tagprefix="uc2" %>
<style type="text/css">
    .style1
    {
        width: 195px;
    }
</style>
<br />
<div align="center">
    <table cellspacing="1" style="width: 916px; margin-right: 0px;">
        <tr>
            <td align="right">
                Mode:
            </td>
            <td align="left">
                <asp:Label ID="lblMode" runat="server" Text="New"></asp:Label>
            </td>
            <td align="left">
            </td>
            <td align="left" class="style1">
            </td>
            <td align="left">
            </td>
            <td align="left">
            </td>
        </tr>
        <tr>
            <td align="right">
                ID:
            </td>
            <td align="left">
                <asp:Label ID="lblID" runat="server"></asp:Label>
            </td>
            <td align="left">
                BOM:
            </td>
            <td align="left" class="style1">
                <asp:Label ID="lblBOM" runat="server"></asp:Label>
            </td>
            <td align="left">
            </td>
            <td align="left">
            </td>
        </tr>
        <tr>
            <td align="right">
            </td>
            <td align="left">
            </td>
            <td align="left">
            </td>
            <td align="left" class="style1">
            </td>
            <td align="left">
            </td>
            <td align="left">
            </td>
        </tr>
        <tr>
            <td align="right">
                Inquiry Number
            </td>
            <td align="left">
                <asp:TextBox ID="txtInquiryNumber" runat="server" Width="150px" TabIndex="1"></asp:TextBox>
            </td>
            <td align="right">
                Priority
            </td>
            <td align="left" class="style1">
                <asp:TextBox ID="txtPriority" runat="server" Width="100px" TabIndex="3"></asp:TextBox>
            </td>
            <td align="right">
                Sales Person
            </td>
            <td align="left">
                <asp:TextBox ID="txtSalesPerson" runat="server" Width="185px" TabIndex="6"></asp:TextBox>
            </td>
        </tr>
        <tr align="left">
            <td align="right">
                Revision
            </td>
            <td align="left">
                <asp:TextBox ID="txtRevision" runat="server" Width="100px" TabIndex="2"></asp:TextBox>
            </td>
            <td align="left">
                Market Sector</td>
            <td align="left" class="style1">
                <asp:DropDownList ID="cboMarketSector" runat="server" 
                    Width="124px" DataSourceID="SqlDataSourceMarketSector" DataTextField="Name" 
                    DataValueField="MarketSectorID" TabIndex="4">
                </asp:DropDownList>
                <asp:Button ID="btnNewMarketSector" runat="server" Text="New" Width="60px" 
                    TabIndex="5" />
            </td>
            <td align="right">
                Cost Model Location
            </td>
            <td align="left">
                <asp:TextBox ID="txtCostModelLoc" runat="server" Width="185px" TabIndex="7"></asp:TextBox>
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
                <asp:DropDownList ID="cboCustomer" runat="server" Height="22px" Width="195px" 
                    TabIndex="8">
                </asp:DropDownList>
                <asp:Button ID="btnNewCustomer" runat="server" Text="New" Width="45px" 
                    TabIndex="9" />
            </td>
            <td align="right" class="style1">
                Division/Location
            </td>
            <td align="left" colspan="2">
                <asp:TextBox ID="txtDivLoc" runat="server" Width="260px" TabIndex="13"></asp:TextBox>
            </td>
        </tr>
        <tr style="display: none">
            <td align="right">
                Contact
            </td>
            <td align="left" colspan="2">
                <asp:TextBox ID="txtContact" runat="server" Width="240px" TabIndex="10"></asp:TextBox>
            </td>
            <td align="right" class="style1">
                Department
            </td>
            <td align="left" colspan="2">
                <asp:TextBox ID="txtDepartment" runat="server" Width="260px" TabIndex="14"></asp:TextBox>
            </td>
        </tr>
        <tr style="display: none">
            <td align="right">
                Bussines Class
            </td>
            <td align="left" colspan="2">
                <asp:TextBox ID="txtBussinesClass" runat="server" Width="240px" TabIndex="11"></asp:TextBox>
            </td>
            <td align="right" class="style1">
                Reason For Quote
            </td>
            <td align="left" colspan="2">
                <asp:TextBox ID="txtReasonForQuote" runat="server" Width="260px" TabIndex="15"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right">
                Product
            </td>
            <td align="left" colspan="2">
                <asp:TextBox ID="txtProduct" runat="server" Width="240px" TabIndex="12"></asp:TextBox>
            </td>
            <td align="right" class="style1">
                Application/Program
            </td>
            <td align="left" colspan="2">
                <asp:TextBox ID="txtApplication" runat="server" Width="260px" TabIndex="16"></asp:TextBox>
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
                <asp:TextBox ID="txtSpecification" runat="server" Width="180px" TabIndex="17"></asp:TextBox>
            </td>
            <td align="left">
            </td>
            <td align="right" class="style1">
                Part Print
            </td>
            <td align="left" colspan="2">
                <asp:TextBox ID="txtPartPrint" runat="server" Width="260px" TabIndex="20"></asp:TextBox>
            </td>
        </tr>
        <tr style="display: none">
            <td align="right">
                Drawing Level
            </td>
            <td align="left">
                <asp:TextBox ID="txtDrawingLevel" runat="server" Width="180px" TabIndex="18"></asp:TextBox>
            </td>
            <td align="left">
            </td>
            <td align="right" class="style1">
                Sample
            </td>
            <td align="left" colspan="2">
                <asp:TextBox ID="txtSample" runat="server" Width="80px" TabIndex="21"></asp:TextBox>
            </td>
        </tr>
        <tr style="display: none">
            <td align="right">
                Task Description
            </td>
            <td align="left">
                <asp:TextBox ID="txtTaskDescription" runat="server" Width="180px" TabIndex="19"></asp:TextBox>
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
        <tr align="center">
            <td align="center" colspan="6">
                <div style="border-radius: 10px;border: solid #D3D3D3;background-color: #D3D3D3;min-height:20px;">
                    <uc1:sifDetail ID="uscSifDetail" runat="server" />
                </div>
            </td>
        </tr>
        <tr>
            <td align="right" colspan="3">
                Tooling Target
            </td>
            <td align="left" colspan="2">
                <asp:TextBox ID="txtToolingTarget" runat="server" Width="180px" TabIndex="22"></asp:TextBox>
            </td>
            <td align="left">
            </td>
        </tr>
        <tr>
            <td align="right" colspan="3">
                Primary Competitors
            </td>
            <td align="left" colspan="2">
                <asp:TextBox ID="txtPrimaryCompetitors" runat="server" Width="320px" 
                    TabIndex="23"></asp:TextBox>
            </td>
            <td align="left">
            </td>
        </tr>
        <tr style="display: none">
            <td align="right" colspan="3">
                Specific Resource Requirements
            </td>
            <td align="left" colspan="2">
                <asp:TextBox ID="txtSpecificResourceRequirements" runat="server" Width="320px" 
                    TabIndex="24"></asp:TextBox>
            </td>
            <td align="left">
            </td>
        </tr>
        <tr style="display: none">
            <td align="right" colspan="3">
                Technical
            </td>
            <td align="left" colspan="2">
                <asp:TextBox ID="txtTechnical" runat="server" Width="320px" TabIndex="25"></asp:TextBox>
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
                <asp:TextBox ID="txtQuoteDue" runat="server" Width="180px" TabIndex="26"></asp:TextBox>
            </td>
            <td align="left">
            </td>
        </tr>
        <tr>
            <td align="right" colspan="3">
                SOP
            </td>
            <td align="left" colspan="2">
                <asp:TextBox ID="txtSOP" runat="server" Width="180px" TabIndex="27"></asp:TextBox>
            </td>
            <td align="left">
            </td>
        </tr>
    </table>
</div>
<br />
<div align="center" style="display: block;">
    <asp:Button ID="btnSave" runat="server" Text="Save" Width="70px" OnClick="btnSave_Click"
        TabIndex="28" />
    <asp:Button ID="btnCancel" runat="server" Text="Cancel" Width="70px" OnClick="btnCancel_Click"
        TabIndex="29" />
</div>
<asp:HiddenField ID="txtPrompt" runat="server" OnValueChanged="txtPrompt_ValueChanged" />
<asp:SqlDataSource ID="SqlDataSourceMarketSector" runat="server"  OnInit="on_sqldatasource_Init"
    ProviderName="System.Data.SqlClient" 
    SelectCommand="SELECT [MarketSectorID], [Name] FROM [MarketSector] ORDER BY [Name]">
</asp:SqlDataSource>
<uc2:notifier ID="uscNotifier" OnPrompt="on_prompt" runat="server" />
