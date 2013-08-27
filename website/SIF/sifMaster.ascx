<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SifMaster.ascx.cs" Inherits="SifMaster" %>

<div align="center" class="mainSection">
    <table cellspacing="1" style="width: 916px; margin-right: 0px;">
        <tr>
            <td align="right" >
                Mode:
            </td>
            <td align="left" >
                <asp:Label ID="lblMode" runat="server" Text="New"></asp:Label>
            </td>
            <td align="left" >
                &nbsp;
            </td>
            <td align="left" >
                &nbsp;
            </td>
            <td align="left" >
                &nbsp;
            </td>
            <td align="left" >
                &nbsp;
            </td>
        </tr>
        <tr>
            <td align="right" >
                ID:
            </td>
            <td align="left" >
                <asp:Label ID="lblID" runat="server"></asp:Label>
            </td>
            <td align="left" >
                &nbsp;
            </td>
            <td align="left" >
                &nbsp;
            </td>
            <td align="left" >
                &nbsp;
            </td>
            <td align="left" >
                &nbsp;
            </td>
        </tr>
        <tr>
            <td align="right" >
                </td>
            <td align="left" >
                </td>
            <td align="left" >
                &nbsp;
            </td>
            <td align="left" >
                &nbsp;
            </td>
            <td align="left" >
                &nbsp;
            </td>
            <td align="left" >
                &nbsp;
            </td>
        </tr>
        <tr>
            <td align="right" >
                Inquiry Number
            </td>
            <td align="left" >
                <asp:TextBox ID="txtInquiryNumber" runat="server" Width="150px"></asp:TextBox>
            </td>
            <td align="right" >
                Priority</td>
            <td align="left" >
                <asp:TextBox ID="txtPriority" runat="server" Width="100px"></asp:TextBox>
            </td>
            <td align="right" >
                Sales Person</td>
            <td align="left" >
                <asp:TextBox ID="txtSalesPerson" runat="server" Width="185px"></asp:TextBox>
            </td>
        </tr>
        <tr align="left">
            <td align="right" >
                Revision
            </td>
            <td align="left" >
                <asp:TextBox ID="txtRevision" runat="server" Width="100px"></asp:TextBox>
            </td>
            <td align="left" >
            </td>
            <td align="left" >
            </td>
            <td align="right" >
                 Cost Model Location</td>
            <td align="left" >
                <asp:TextBox ID="txtCostModelLoc" runat="server" Width="185px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right" height="25px" colspan="6">
            <div style="border: solid;border-color: gray;border-width: 2px;"></div>
            </td>
        </tr>
        <tr>
            <td align="right" >               
                Customer
            </td>
            <td align="left" colspan="2">                
                <asp:TextBox ID="txtCustomerKey" runat="server" Width="240px"></asp:TextBox>
            </td>
            <td align="right"  >
                Division/Location</td>
            <td   align="left" colspan="2">
                <asp:TextBox ID="txtDivLoc" runat="server" Width="260px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right" >
                Contact
            </td>
            <td align="left" colspan="2">
                <asp:TextBox ID="txtContact" runat="server" Width="240px"></asp:TextBox>
                &nbsp;
            </td>
            <td align="right" >
                &nbsp;Department</td>
            <td align="left"  colspan="2">
                <asp:TextBox ID="txtDepartment" runat="server" Width="260px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right" >
                Bussines Class
            </td>
            <td align="left" colspan="2">
                <asp:TextBox ID="txtBussinesClass" runat="server" Width="240px"></asp:TextBox>
            </td>
            <td align="right" >
                Reason For Quote</td>
            <td align="left"  colspan="2">
                <asp:TextBox ID="txtReasonForQuote" runat="server" Width="260px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right" >
                Product
            </td>
            <td align="left" colspan="2">
                <asp:TextBox ID="txtProduct" runat="server" Width="240px"></asp:TextBox>
            </td>
            <td align="right" >
                &nbsp;Application/Program</td>
            <td align="left"  colspan="2">
                <asp:TextBox ID="txtApplication" runat="server" Width="260px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right" >
                &nbsp;</td>
            <td align="left" >
                &nbsp;</td>
            <td align="left" >
                &nbsp;
            </td>
            <td align="left" >
                &nbsp;
            </td>
            <td align="left" >
                &nbsp;
            </td>
            <td align="left" >
                &nbsp;
            </td>
        </tr>
        <tr>
            <td align="right" >
                Specification
            </td>
            <td align="left" >
                <asp:TextBox ID="txtSpecification" runat="server" Width="180px"></asp:TextBox>
            </td>
            <td align="left" >
                &nbsp;
            </td>
            <td align="right" >
                Part Print</td>
            <td align="left"  colspan="2">
                <asp:TextBox ID="txtPartPrint" runat="server" Width="260px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right" >
                Drawing Level
            </td>
            <td align="left" >
                <asp:TextBox ID="txtDrawingLevel" runat="server" Width="180px"></asp:TextBox>
            </td>
            <td align="left" >
                &nbsp;
            </td>
            <td align="right" >
                Sample</td>
            <td align="left"  colspan="2">
                <asp:TextBox ID="txtSample" runat="server" Width="80px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right" >
                Task Description
            </td>
            <td align="left" >
                <asp:TextBox ID="txtTaskDescription" runat="server" Width="180px"></asp:TextBox>
            </td>
            <td align="left" >
                &nbsp;
            </td>
            <td align="left" >
                &nbsp;
            </td>
            <td align="left" >
                &nbsp;
            </td>
            <td align="right" >
                &nbsp;
            </td>
        </tr>
        <tr>
            <td align="right"  height="25px" colspan="6">
            <div style="border: solid;border-color: gray;border-width: 2px;"></div>
            </td>
        </tr>
        <tr>
            <td align="right"  colspan="3">
                Tooling Target
            </td>
            <td align="left"  colspan="2">
                <asp:TextBox ID="txtToolingTarget" runat="server" Width="180px"></asp:TextBox>
            </td>
            <td align="left" >
                &nbsp;
            </td>
        </tr>
        <tr>
            <td align="right"  colspan="3">
                Primary Competitors             </td>
            <td align="left"  colspan="2">
                <asp:TextBox ID="txtPrimaryCompetitors" runat="server" Width="320px" 
                    Height="22px"></asp:TextBox>
            </td>
            <td align="left" >
                &nbsp;
            </td>
        </tr>
        <tr>
            <td align="right"  colspan="3">
                Specific Resource Requirements</td>
            <td align="left"  colspan="2">
                <asp:TextBox ID="txtSpecificResourceRequirements" runat="server" Width="320px"></asp:TextBox>
            </td>
            <td align="left" >
                &nbsp;
            </td>
        </tr>
        <tr>
            <td align="right"  colspan="3">
                Technical</td>
            <td align="left"  colspan="2">
                <asp:TextBox ID="txtTechnical" runat="server" Width="320px"></asp:TextBox>
            </td>
            <td align="left" >
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
