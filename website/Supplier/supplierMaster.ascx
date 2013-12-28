<%@ Control Language="C#" AutoEventWireup="true" CodeFile="supplierMaster.ascx.cs"
    Inherits="supplierMaster" %>
<div align="center">
    <table cellspacing="1" style="width: 590px">
        <tr style="display: none;">
            <td align="right">
                Mode:
            </td>
            <td align="left">
                <asp:Label ID="lblMode" runat="server" Text="New"></asp:Label>
            </td>
        </tr>
        <tr style="display: none;">
            <td align="right">
                ID:
            </td>
            <td align="left">
                <asp:Label ID="lblID" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td align="right">
                Supplier Name
            </td>
            <td align="left">
                <asp:TextBox ID="txtSupplierName" runat="server" Width="380px" validate="required"
                    validationid="validatingSupplierForm"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right">
                Manufacturing Location
            </td>
            <td align="left">
                <asp:TextBox ID="txtManufacturingLocation" runat="server" Width="380px" validate="required"
                    validationid="validatingSupplierForm"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right">
                Ship Location
            </td>
            <td align="left">
                <asp:TextBox ID="txtShipLocation" runat="server" Width="380px" validate="required"
                    validationid="validatingSupplierForm"></asp:TextBox>
            </td>
        </tr>
        <tr align="left">
            <td align="right">
                Quoted Currency
            </td>
            <td align="left">
                <asp:TextBox ID="txtQuotedCurrency" runat="server" Width="200px" validate="required"
                    validationid="validatingSupplierForm"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
            <td align="left">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td align="right">
                Contact Name
            </td>
            <td align="left">
                <asp:TextBox ID="txtContactName" runat="server" Width="380px" validate="required"
                    validationid="validatingSupplierForm"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right">
                Contact Phone Number
            </td>
            <td align="left">
                <asp:TextBox ID="txtContactPhoneNumber" runat="server" validate="required" validationid="validatingSupplierForm"
                    Width="380px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right">
                Contact Cell Phone
            </td>
            <td align="left">
                <asp:TextBox ID="txtContactCellPhone" runat="server" validate="required" validationid="validatingSupplierForm"
                    Width="380px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right">
                Contact Email
            </td>
            <td align="left">
                <asp:TextBox ID="txtContactEmail" runat="server" Width="380px" validate="required"
                    validationid="validatingSupplierForm"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right">
                &nbsp;
            </td>
            <td align="left">
                &nbsp;
            </td>
        </tr>
    </table>
    <div id="fieldsToHideForVendor" runat="server">
        <table>
            <tr>
                <td align="right">
                    Capabilities
                </td>
                <td align="left">
                    <asp:TextBox ID="txtCapabilities" runat="server" Width="380px" validate="required"
                        validationid="validatingSupplierForm" Height="60px" TextMode="MultiLine"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td align="right">
                    Comments
                </td>
                <td align="left">
                    <asp:TextBox ID="txtComments" runat="server" Width="380px" validate="required" validationid="validatingSupplierForm"
                        Height="60px" TextMode="MultiLine"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td align="right">
                    Commodity
                </td>
                <td align="left">
                    <asp:TextBox ID="txtCommodity" runat="server" Width="380px" validate="required" validationid="validatingSupplierForm"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td align="right">
                    Visible
                </td>
                <td align="left">
                    <asp:CheckBox ID="chkVisible" runat="server" />
                </td>
            </tr>
            <tr>
                <td align="right">
                    &nbsp;
                </td>
                <td align="left">
                    &nbsp;
                </td>
            </tr>
        </table>
    </div>
</div>
