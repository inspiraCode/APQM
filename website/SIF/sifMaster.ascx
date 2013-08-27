<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SifMaster.ascx.cs" Inherits="SifMaster" %>
<style type="text/css">
    .style1
    {
    }
    .style2
    {
        width: 300px;
    }
    .style3
    {
        width: 1000px;
        text-align: "right";
    }
    .style4
    {
        height: 26px;
    }
    .style5
    {
        width: 1269px;
    }
    .style6
    {
        width: 227px;
    }
</style>
<div align="right">
    <table cellspacing="1" style="width: 999px">
        <tr>
            <td align="right" class="style5">
                Mode:
            </td>
            <td align="left">
                <asp:Label ID="lblMode" runat="server" Text="New"></asp:Label>
            </td>
            <td align="left">
                &nbsp;
            </td>
            <td align="left" class="style3">
                &nbsp;
            </td>
            <td align="left" class="style2">
                &nbsp;
            </td>
            <td align="left" class="style6">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td align="right" class="style5">
                ID:
            </td>
            <td align="left">
                <asp:Label ID="lblID" runat="server"></asp:Label>
            </td>
            <td align="left">
                &nbsp;
            </td>
            <td align="left" class="style3">
                &nbsp;
            </td>
            <td align="left" class="style2">
                &nbsp;
            </td>
            <td align="left" class="style6">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td align="right" class="style5">
                &nbsp;</td>
            <td align="left">
                &nbsp;</td>
            <td align="left">
                &nbsp;
            </td>
            <td align="left" class="style3">
                &nbsp;
            </td>
            <td align="left" class="style2">
                &nbsp;
            </td>
            <td align="left" class="style6">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td align="right" class="style5">
                Inquiry Number
            </td>
            <td align="left">
                <asp:TextBox ID="txtInquiryNumber" runat="server" Width="150px"></asp:TextBox>
            </td>
            <td align="left">
                Priority
            </td>
            <td align="left" class="style3">
                <asp:TextBox ID="txtPriority" runat="server" Width="150px"></asp:TextBox>
            </td>
            <td align="right" class="style2">
                Sales Person</td>
            <td align="left" class="style6">
                <asp:TextBox ID="txtSalesPerson" runat="server" Width="185px"></asp:TextBox>
            </td>
        </tr>
        <tr align="left">
            <td align="right" class="style5">
                Revision
            </td>
            <td align="left">
                <asp:TextBox ID="txtRevision" runat="server" Width="150px"></asp:TextBox>
            </td>
            <td align="left">
            </td>
            <td align="left" class="style3">
            </td>
            <td align="right" class="style2">
                 Cost Model Location</td>
            <td align="left" class="style6">
                <asp:TextBox ID="txtCostModelLoc" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right" class="style5">               
            </td>
            <td align="left">                
            </td>
            <td align="left">
                &nbsp;
            </td>
            <td align="left" class="style3">
                &nbsp;
            </td>
            <td align="left" class="style2">
                &nbsp;
            </td>
            <td align="left" class="style6">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td align="right" class="style5">               
                Customer
            </td>
            <td align="left">                
                <asp:TextBox ID="txtCustomerKey" runat="server" Width="162px"></asp:TextBox>
            </td>
            <td align="left">
                &nbsp;</td>
            <td align="right"  class="style3">
                Division/Location</td>
            <td  class="style2">
                <asp:TextBox ID="txtDivLoc" runat="server" Width="174px"></asp:TextBox>
            </td>
            <td align="left" class="style6">
                &nbsp;</td>
        </tr>
        <tr>
            <td align="right" class="style5">
                Contact
            </td>
            <td align="left">
                <asp:TextBox ID="txtContact" runat="server" Width="154px"></asp:TextBox>
            </td>
            <td align="left">
                &nbsp;
            </td>
            <td align="right" class="style3">
                &nbsp;Department</td>
            <td align="left" class="style2">
                <asp:TextBox ID="txtDepartment" runat="server" Width="195px"></asp:TextBox>
            </td>
            <td align="left" class="style6">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td align="right" class="style5">
                Bussines Class
            </td>
            <td align="left">
                <asp:TextBox ID="txtBussinesClass" runat="server" Width="142px"></asp:TextBox>
            </td>
            <td align="left">
                &nbsp;
            </td>
            <td align="right" class="style3">
                Reason For Quote</td>
            <td align="left" class="style2">
                <asp:TextBox ID="txtReasonForQuote" runat="server"></asp:TextBox>
            </td>
            <td align="left" class="style6">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td align="right" class="style5">
                Product
            </td>
            <td align="left">
                <asp:TextBox ID="txtProduct" runat="server"></asp:TextBox>
            </td>
            <td align="left">
                &nbsp;
            </td>
            <td align="right" class="style3">
                &nbsp;Application/Program</td>
            <td align="left" class="style2">
                <asp:TextBox ID="txtApplication" runat="server" Width="205px"></asp:TextBox>
            </td>
            <td align="left" class="style6">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td align="right" class="style5">
                &nbsp;</td>
            <td align="left">
                &nbsp;</td>
            <td align="left">
                &nbsp;
            </td>
            <td align="left" class="style3">
                &nbsp;
            </td>
            <td align="left" class="style2">
                &nbsp;
            </td>
            <td align="left" class="style6">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td align="right" class="style5">
                Specification
            </td>
            <td align="left">
                <asp:TextBox ID="txtSpecification" runat="server" Width="149px"></asp:TextBox>
            </td>
            <td align="left">
                &nbsp;
            </td>
            <td align="right" class="style3">
                &nbsp;Part Print</td>
            <td align="left" class="style2">
                &nbsp;
                <asp:TextBox ID="txtPartPrint" runat="server" Width="210px"></asp:TextBox>
            </td>
            <td align="left" class="style6">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td align="right" class="style5">
                Drawing Level
            </td>
            <td align="left">
                <asp:TextBox ID="txtDrawingLevel" runat="server"></asp:TextBox>
            </td>
            <td align="left">
                &nbsp;
            </td>
            <td align="right" class="style3">
                Sample</td>
            <td align="left" class="style2">
                <asp:TextBox ID="txtSample" runat="server"></asp:TextBox>
            </td>
            <td align="left" class="style6">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td align="right" class="style5">
                Task Description
            </td>
            <td align="left">
                <asp:TextBox ID="txtTaskDescription" runat="server" Width="162px"></asp:TextBox>
            </td>
            <td align="left">
                &nbsp;
            </td>
            <td align="left" class="style3">
                &nbsp;
            </td>
            <td align="left" class="style2">
                &nbsp;
            </td>
            <td align="right" class="style6">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td align="right" class="style4" colspan="6">
                &nbsp;</td>
        </tr>
        <tr>
            <td align="right" class="style1" colspan="3">
                Tooling Target
                &nbsp;
            </td>
            <td align="left" class="style3">
                <asp:TextBox ID="txtToolingTarget" runat="server" Width="147px"></asp:TextBox>
            </td>
            <td align="left" class="style2">
                &nbsp;
            </td>
            <td align="left" class="style6">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td align="right" class="style1" colspan="3">
                Primary Competitors
                &nbsp;
            </td>
            <td align="left" class="style3">
                <asp:TextBox ID="txtPrimaryCompetitors" runat="server" Width="137px" 
                    Height="22px"></asp:TextBox>
            </td>
            <td align="left" class="style2">
                &nbsp;
            </td>
            <td align="left" class="style6">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td align="right" class="style1" colspan="3">
                Specific Resource Requirements
                &nbsp;
            </td>
            <td align="left" class="style3">
                <asp:TextBox ID="txtSpecificResourceRequirements" runat="server"></asp:TextBox>
            </td>
            <td align="left" class="style2">
                &nbsp;
            </td>
            <td align="left" class="style6">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td align="right" class="style1" colspan="3">
                Technical
                &nbsp;
            </td>
            <td align="left" class="style3">
                <asp:TextBox ID="txtTechnical" runat="server" Width="145px"></asp:TextBox>
            </td>
            <td align="left" class="style2">
                &nbsp;
            </td>
            <td align="left" class="style6">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td align="center" colspan="6">
                <asp:Button ID="btnSave" runat="server" Text="Save" Width="70px" OnClick="btnSave_Click" />
                <asp:Button ID="btnCancel" runat="server" Text="Cancel" Width="70px" OnClick="btnCancel_Click" />
            </td>
        </tr>
    </table>
</div>
