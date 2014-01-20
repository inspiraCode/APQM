<%@ Control Language="C#" AutoEventWireup="true" CodeFile="supplierMaster.ascx.cs"
    Inherits="supplierMaster" %>
<%@ Register src="Commodity.ascx" tagname="Commodity" tagprefix="uc1" %>
<style type="text/css">
    .style4
    {
        
    }
</style>
<div align="center">
    <table id="tableSupplierMaster" cellspacing="1" style="width: 590px; float:left;" >
        <tr style="display: none;">
            <td align="right" class="style4">
                Mode:
            </td>
            <td align="left">
                <asp:Label ID="lblMode" runat="server" Text="New"></asp:Label>
            </td>
        </tr>
        <tr style="display: none;">
            <td align="right" class="style4">
                ID:
            </td>
            <td align="left">
                <asp:Label ID="lblID" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td align="right" class="style4">
                Supplier Name
            </td>
            <td align="left">
                <asp:TextBox ID="txtSupplierName" runat="server" Width="380px" validate="required"
                    validationid="validatingSupplierForm"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right" class="style4">
                Manufacturing Location
            </td>
            <td align="left">
                <asp:TextBox ID="txtManufacturingLocation" runat="server" Width="380px" validate="required"
                    validationid="validatingSupplierForm"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right" class="style4">
                Ship Location
            </td>
            <td align="left">
                <asp:TextBox ID="txtShipLocation" runat="server" Width="380px" validate="required"
                    validationid="validatingSupplierForm"></asp:TextBox>
            </td>
        </tr>
        <tr align="left">
            <td align="right" class="style4">
                Quoted Currency
            </td>
            <td align="left">
                <asp:TextBox ID="txtQuotedCurrency" runat="server" Width="200px" validate="required"
                    validationid="validatingSupplierForm"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style4">
                &nbsp;
            </td>
            <td align="left">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td align="right" class="style4">
                Contact Name
            </td>
            <td align="left">
                <asp:TextBox ID="txtContactName" runat="server" Width="380px" validate="required"
                    validationid="validatingSupplierForm"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right" class="style4">
                Contact Phone Number
            </td>
            <td align="left">
                <asp:TextBox ID="txtContactPhoneNumber" runat="server" validate="required" validationid="validatingSupplierForm"
                    Width="380px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right" class="style4">
                Contact Cell Phone
            </td>
            <td align="left">
                <asp:TextBox ID="txtContactCellPhone" runat="server"
                    Width="380px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right" class="style4">
                Contact Email
            </td>
            <td align="left">
                <asp:TextBox ID="txtContactEmail" runat="server" Width="380px" validate="required"
                    validationid="validatingSupplierForm"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right" class="style4">
                &nbsp;
            </td>
            <td align="left">
                &nbsp;
            </td>
        </tr>
    </table>
    <div id="fieldsToHideForVendor" runat="server">
        <table cellspacing="1">
            <tr>
                <td align="right" class="style4">
                    Capabilities
                </td>
                <td align="left">
                    <asp:TextBox ID="txtCapabilities" runat="server" Width="380px" validate="required"
                        validationid="validatingSupplierForm" Height="60px" TextMode="MultiLine"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td align="right" class="style4">
                    Comments
                </td>
                <td align="left">
                    <asp:TextBox ID="txtComments" runat="server" Width="380px" validate="required" validationid="validatingSupplierForm"
                        Height="60px" TextMode="MultiLine"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td align="right" class="style4">
                    Commodity
                </td>
                <td align="left">
                    <asp:TextBox ID="txtCommodity" runat="server" Width="380px" validate="required" validationid="validatingSupplierForm"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td align="right" class="style4">
                    &nbsp;</td>
                <td align="left">
                    &nbsp;</td>
            </tr>
            <tr>
                <td align="right" class="style4">
                    Commodity</td>
                <td align="left">
                    <uc1:Commodity ID="uscCommodity" runat="server" />
                </td>
            </tr>
            <tr>
                <td align="right" class="style4">
                    Visible
                </td>
                <td align="left">
                    <asp:CheckBox ID="chkVisible" runat="server" />
                </td>
            </tr>
            <tr>
                <td align="right" class="style4">
                    &nbsp;
                </td>
                <td align="left">
                    &nbsp;
                </td>
            </tr>
        </table>
    </div>
</div>
