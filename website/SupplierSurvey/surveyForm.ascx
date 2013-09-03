<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SurveyForm.ascx.cs" Inherits="SurveyForm" %>

<%@ Register src="surveyContactsExecutive.ascx" tagname="surveyContactsExecutive" tagprefix="uc1" %>
<%@ Register src="surveyContactsSales.ascx" tagname="surveyContactsSales" tagprefix="uc2" %>
<%@ Register src="surveyContactsQuality.ascx" tagname="surveyContactsQuality" tagprefix="uc3" %>
<%@ Register src="surveyContactsCustomerSupport.ascx" tagname="surveyContactsCustomerSupport" tagprefix="uc4" %>
<%@ Register src="surveyContactsAfterHours.ascx" tagname="surveyContactsAfterHours" tagprefix="uc5" %>

<style type="text/css">
    .style2
    {
    }
    .style4
    {
        width: 260px;
    }
    .style6
    {
        width: 87px;
    }
    .style7
    {
    }
    .style9
    {
        width: 137px;
        height: 24px;
    }
    .style10
    {}
    .style11
    {
        width: 182px;
        height: 24px;
    }
    .style12
    {
        width: 110px;
        height: 24px;
    }
    .style13
    {
    }
    .style14
    {
        width: 121px;
    }
    .style15
    {
        width: 182px;
    }
    .style16
    {
        width: 110px;
    }
    .style17
    {
        width: 100%;
        height: 699px;
    }
    .style18
    {
        width: 510px;
    }
    .style19
    {
        width: 510px;
        height: 253px;
    }
    .style20
    {
        height: 253px;
    }
    .style21
    {
        width: 510px;
        height: 229px;
    }
    .style22
    {
        height: 229px;
    }
</style>

<div align="center" class="mainSection">
    <table cellspacing="1" style="width: 1030px; margin-right: 0px;">
        <tr>
            <td align="right" class="style13" >
                Mode:
            </td>
            <td align="left" class="style6" >
                <asp:Label ID="lblMode" runat="server" Text="New"></asp:Label>
            </td>
            <td align="left" class="style14" >
                &nbsp;
            </td>
            <td align="left" class="style15" >
                &nbsp;
            </td>
            <td align="left" class="style16" >
                &nbsp;
            </td>
            <td align="left" class="style4" colspan="2" >
                &nbsp;</td>
        </tr>
        <tr>
            <td align="right" class="style13" >
                ID:
            </td>
            <td align="left" class="style6" >
                <asp:Label ID="lblID" runat="server"></asp:Label>
            </td>
            <td align="right" class="style14" >
                &nbsp;
                Supplier:</td>
            <td align="left" colspan="2" >
                <asp:Label ID="lblSupplier" runat="server">This is an example of Supplier</asp:Label>
            </td>
            <td align="center" colspan="2" rowspan="4" >
                Union (Y or N)<br />
                <asp:TextBox ID="txtUnion" runat="server" Width="60px"></asp:TextBox>
                <br />
                Local<br />
                <asp:TextBox ID="txtLocal" runat="server" Width="137px"></asp:TextBox>
                <br />
                Contract Expiration:<br />
                <asp:TextBox ID="txtContractExpiration" runat="server" Width="97px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right" class="style13" >
                Last Survey</td>
            <td align="left" class="style6" >
                <asp:TextBox ID="txtLastSurvey" runat="server" Width="97px"></asp:TextBox>
                </td>
            <td align="right" class="style14" >
                &nbsp;
                Contact Person:</td>
            <td align="left" colspan="2" >
                <asp:Label ID="lblContactPerson" runat="server">This is an example of Contact Person</asp:Label>
                &nbsp;
                &nbsp;
            </td>
        </tr>
        <tr>
            <td align="right" class="style13" >
                NDA Rec&#39;d</td>
            <td align="left" class="style6" >
                <asp:TextBox ID="txtNDARec" runat="server" Width="97px"></asp:TextBox>
            </td>
            <td align="right" class="style14" >
                Contact Phone:</td>
            <td align="left" class="style15" >
                <asp:Label ID="lblContactPhone" runat="server">6563123456</asp:Label>
            </td>
            <td align="right" class="style16" >
                &nbsp;</td>
        </tr>
        <tr align="left">
            <td align="right" class="style13" >
                RFQ Score</td>
            <td align="left" class="style6" >
                <asp:TextBox ID="txtRFQScore" runat="server" Width="97px"></asp:TextBox>
            </td>
            <td align="left" class="style14" >
            </td>
            <td align="left" class="style15" >
            </td>
            <td align="right" class="style16" >
                 &nbsp;</td>
        </tr>
        <tr>
            <td align="right" class="style13" >               
                &nbsp;</td>
            <td align="left" colspan="2">                
                &nbsp;</td>
            <td align="right" class="style15"  >
                &nbsp;</td>
            <td   align="left">
                &nbsp;</td>
            <td   align="left">
                &nbsp;</td>
            <td   align="left">
                &nbsp;</td>
        </tr>
        <tr>
            <td align="right" class="style13" >               
                Address
            </td>
            <td align="left" colspan="2">                
                <asp:TextBox ID="txtAddress" runat="server" Width="260px"></asp:TextBox>
            </td>
            <td align="right" class="style15"  >
                Primary Business</td>
            <td   align="left">
                <asp:TextBox ID="txtPrimaryBusiness" runat="server" Width="260px"></asp:TextBox>
            </td>
            <td   align="left">
                &nbsp;</td>
            <td   align="left">
                &nbsp;</td>
        </tr>
        <tr>
            <td align="right" class="style13" >
                City
            </td>
            <td align="left" colspan="2">
                <asp:TextBox ID="txtCity" runat="server" Width="260px"></asp:TextBox>
                &nbsp;
            </td>
            <td align="right" class="style15" >
                Secondary Business</td>
            <td align="left">
                <asp:TextBox ID="txtSecundaryBusiness" runat="server" Width="260px"></asp:TextBox>
            </td>
            <td align="left">
                &nbsp;</td>
            <td align="left">
                &nbsp;</td>
        </tr>
        <tr>
            <td align="right" class="style13" >
                State</td>
            <td align="left" colspan="2">
                <asp:TextBox ID="txtState" runat="server" Width="260px"></asp:TextBox>
            </td>
            <td align="right" class="style15" >
                Manufacturing Method</td>
            <td align="left">
                <asp:TextBox ID="txtManufacturingMethod" runat="server" Width="260px"></asp:TextBox>
            </td>
            <td align="left">
                &nbsp;</td>
            <td align="left">
                &nbsp;</td>
        </tr>
        <tr>
            <td align="right" class="style13" >
                Zip
            </td>
            <td align="left" colspan="2">
                <asp:TextBox ID="txtZip" runat="server" Width="260px"></asp:TextBox>
            </td>
            <td align="right" class="style15" >
                Current Capacity</td>
            <td align="left">
                <asp:TextBox ID="txtCurrentCapacity" runat="server" Width="260px"></asp:TextBox>
            </td>
            <td align="left">
                &nbsp;</td>
            <td align="left">
                &nbsp;</td>
        </tr>
        <tr>
            <td align="right" class="style13" >
                Website</td>
            <td align="left" colspan="2" >
                <asp:TextBox ID="txtWebsite" runat="server" Width="260px"></asp:TextBox>
            </td>
            <td align="left" class="style15" >
                &nbsp;
            </td>
            <td align="left" class="style16" >
                &nbsp;</td>
            <td align="left" >
                &nbsp;</td>
            <td align="left" >
                &nbsp;</td>
        </tr>
        <tr>
            <td align="right" class="style13" >
                &nbsp;</td>
            <td align="left" colspan="2" >
                &nbsp;</td>
            <td align="center" class="style7" colspan="2" >
                Tooling</td>
            <td align="left" >
                &nbsp;</td>
            <td align="left" >
                &nbsp;</td>
        </tr>
        <tr>
            <td align="right" class="style13" >
                Current Annual Sales</td>
            <td align="left" colspan="2" >
                <asp:TextBox ID="txtCurrentAnnualSales" runat="server" Width="259px"></asp:TextBox>
            </td>
            <td align="right" class="style15" >
                New-In-House Manufacture</td>
            <td align="left" class="style16" >
                <asp:TextBox ID="txtNewInHouseManufacture" runat="server" Width="260px"></asp:TextBox>
            </td>
            <td align="left" >
                &nbsp;</td>
            <td align="left" >
                &nbsp;</td>
        </tr>
        <tr>
            <td align="right" class="style9" >
                Forcast Sales</td>
            <td align="left" colspan="2" class="style10" rowspan="4" >
                <asp:ListBox ID="lstForecastSales" runat="server" Height="93px" Width="260px">
                </asp:ListBox>
            </td>
            <td align="right" class="style11" >
                New Outsourced</td>
            <td align="left" class="style12" >
                <asp:TextBox ID="txtNewOutsourced" runat="server" Width="260px"></asp:TextBox>
            </td>
            <td align="left" class="style10" >
            </td>
            <td align="left" class="style10" >
            </td>
        </tr>
        <tr>
            <td align="right" class="style13" >
                &nbsp;</td>
            <td align="right" class="style15" >
                Repair In-House</td>
            <td align="left" class="style16" >
                <asp:TextBox ID="txtRepairInHouse" runat="server" Width="260px"></asp:TextBox>
            </td>
            <td align="left" >
                &nbsp;</td>
            <td align="left" >
                &nbsp;</td>
        </tr>
        <tr>
            <td align="right" class="style13" >
                &nbsp;</td>
            <td align="right" class="style15" >
                Repair Outsource</td>
            <td align="left" class="style16" >
                <asp:TextBox ID="txtRepaiOutsource" runat="server" Width="260px"></asp:TextBox>
            </td>
            <td align="left" >
                &nbsp;</td>
            <td align="left" >
                &nbsp;</td>
        </tr>
        <tr>
            <td align="right" class="style13" >
                &nbsp;</td>
            <td align="left" class="style15" >
                &nbsp;</td>
            <td align="left" class="style16" >
                &nbsp;</td>
            <td align="left" >
                &nbsp;</td>
            <td align="left" >
                &nbsp;</td>
        </tr>
        <tr>
            <td align="right" class="style13" >
                &nbsp;</td>
            <td align="left" colspan="2" >
                &nbsp;</td>
            <td align="left" class="style15" >
                &nbsp;</td>
            <td align="left" class="style16" >
                &nbsp;</td>
            <td align="left" >
                &nbsp;</td>
            <td align="left" >
                &nbsp;</td>
        </tr>
        <tr>
            <td align="right" class="style13" >
                Industries Supplied</td>
            <td align="left" class="style2" colspan="2" rowspan="4" >
                &nbsp;<asp:ListBox ID="lstIndustries" runat="server" Height="93px" 
                    Width="260px">
                </asp:ListBox>
            </td>
            <td align="right" class="style15" >
                Certifications</td>
            <td align="left" class="style16" rowspan="4">
                <asp:ListBox ID="lstCertifications" runat="server" Height="93px" Width="260px">
                </asp:ListBox>
            </td>
            <td align="left">
                &nbsp;</td>
            <td align="left">
                &nbsp;</td>
        </tr>
        <tr>
            <td align="right" class="style13" >
                &nbsp;</td>
            <td align="right" class="style15" >
                &nbsp;</td>
            <td align="left">
                &nbsp;</td>
            <td align="left">
                &nbsp;</td>
        </tr>
        <tr>
            <td align="right" class="style13" >
                &nbsp;</td>
            <td align="left" class="style15" >
                &nbsp;
            </td>
            <td align="left">
                &nbsp;</td>
            <td align="left">
                &nbsp;</td>
        </tr>
        <tr>
            <td align="right" class="style13" >
                &nbsp;</td>
            <td align="left" class="style15" >
                &nbsp;</td>
            <td align="left">
                &nbsp;</td>
            <td align="left">
                &nbsp;</td>
        </tr>
        <tr>
            <td align="right" class="style13" >
                &nbsp;</td>
            <td align="left" class="style6" >
                &nbsp;</td>
            <td align="left" class="style14" >
                &nbsp;</td>
            <td align="left" class="style15" >
                &nbsp;</td>
            <td align="left" class="style16" >
                &nbsp;</td>
            <td align="left" >
                &nbsp;</td>
            <td align="left" >
                &nbsp;</td>
        </tr>
        <tr>
            <td align="right" class="style13" colspan="7" >
                <table align="center" cellspacing="0" class="style17">
                    <tr>
                        <td class="style21">
                            <div id="divExecutive">
                                <uc1:surveyContactsExecutive ID="uscContactExecutive" runat="server" />
                            </div> </td>
                        <td class="style22">
                            <div id="divSales">
                                <uc2:surveyContactsSales ID="uscContactSales" runat="server" />
                            </div></td>
                    </tr>
                    <tr>
                        <td class="style19">
                            <div id="divQuality">
                                <uc3:surveyContactsQuality ID="uscContactQuality" runat="server" />
                            </div></td>
                        <td class="style20">
                            <div id="divCustomerSupport">
                                <uc4:surveyContactsCustomerSupport ID="uscContactCustomerSupport" 
                                    runat="server" />
                            </div></td>
                    </tr>
                    <tr>
                        <td class="style18">
                            <div id="divAfterHoursContact">
                                <uc5:surveyContactsAfterHours ID="uscContactAfterHours" runat="server" />
                            </div></td>
                        <td align="center">
                                                        Notes/Comments<br />
                            <asp:TextBox ID="txtNotes" runat="server" Height="167px" Width="401px"></asp:TextBox>
                            </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td align="right"  colspan="3">
                &nbsp;<td align="left"  colspan="4">
                &nbsp;</td>
        </tr>
        <tr>
            <td align="center" colspan="7">
                <asp:Button ID="btnSave" runat="server" Text="Save" Width="70px" OnClick="btnSave_Click" />
                <asp:Button ID="btnCancel" runat="server" Text="Cancel" Width="70px" OnClick="btnCancel_Click" />
            </td>
        </tr>
    </table>
</div>
