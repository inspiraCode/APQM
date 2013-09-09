<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SurveyForm.ascx.cs" Inherits="SurveyForm" %>
<%@ Register Src="surveyContactsExecutive.ascx" TagName="surveyContactsExecutive"
    TagPrefix="uc1" %>
<%@ Register Src="surveyContactsSales.ascx" TagName="surveyContactsSales" TagPrefix="uc2" %>
<%@ Register Src="surveyContactsQuality.ascx" TagName="surveyContactsQuality" TagPrefix="uc3" %>
<%@ Register Src="surveyContactsCustomerSupport.ascx" TagName="surveyContactsCustomerSupport"
    TagPrefix="uc4" %>
<%@ Register Src="surveyContactsAfterHours.ascx" TagName="surveyContactsAfterHours"
    TagPrefix="uc5" %>

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
        width: 152px;
        height: 24px;
    }
    .style10
    {
    }
    .style11
    {
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
    .style23
    {
        width: 16px;
    }
    .style24
    {
        height: 19px;
    }
    .style25
    {
        width: 183px;
        height: 19px;
    }
    .style26
    {
        width: 16px;
        height: 19px;
    }
    .style27
    {
        height: 16px;
    }
    .style28
    {
        width: 183px;
        height: 16px;
    }
    .style29
    {
        width: 16px;
        height: 16px;
    }
    .style32
    {
        width: 110px;
        height: 13px;
    }
    .style33
    {
        height: 13px;
    }
    .style34
    {
        width: 183px;
        height: 13px;
    }
    .style35
    {
        width: 16px;
        height: 13px;
    }
    .style36
    {
        width: 152px;
    }
    .style37
    {
        height: 19px;
        width: 152px;
    }
    .style38
    {
        height: 16px;
        width: 152px;
    }
    .style39
    {
        height: 13px;
        width: 152px;
    }
    #Select1
    {
        width: 204px;
    }
</style>
<div align="center" style="height:525px; overflow-y: auto;">
    <table cellspacing="1" 
        style="width: 1030px; margin-right: 0px; height: 1282px;">
        <tr>
            <td align="right" class="style36">
                Mode
            </td>
            <td align="left" class="style6">
                <asp:Label ID="lblMode" runat="server" Text="New"></asp:Label>
            </td>
            <td align="left" class="style14">
                &nbsp;
            </td>
            <td align="left" class="style15">
                &nbsp;
            </td>
            <td align="left" class="style16">
                &nbsp;
            </td>
            <td align="left" class="style23">
                &nbsp;</td>
            <td align="left" class="style4" colspan="2">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td align="right" class="style36">
                ID
            </td>
            <td align="left" class="style6">
                <asp:Label ID="lblID" runat="server"></asp:Label>
            </td>
            <td align="right" class="style14">
                &nbsp;</td>
            <td align="right" class="style15">
                                Supplier</td>
            <td align="left" bgcolor="#666666">
                <asp:Label ID="lblSupplier" runat="server" ForeColor="White">This is an example of Supplier</asp:Label>
            </td>
            <td align="center" class="style23">
                &nbsp;</td>
            <td align="center" colspan="2" rowspan="4" bgcolor="Gray" style="font-size: 12px;padding: 3px;" >
                Union (Y or N)<br />
                <asp:RadioButton ID="radUnion" runat="server" GroupName="Union" Text="Yes" 
                    TabIndex="9" />
                <asp:RadioButton ID="radUnionNo" runat="server" GroupName="Union" Text="No" 
                    TabIndex="10" />
                <br />
                Local<br />
                <asp:TextBox ID="txtLocal" runat="server" Width="117px" TabIndex="11"></asp:TextBox>
                <br />
                Contract Expiration<br />
                <asp:TextBox ID="txtContractExpiration" runat="server" Width="97px" 
                    TabIndex="12"></asp:TextBox>                
            </td>
        </tr>
        <tr>
            <td align="right" class="style36">
                Last Survey
            </td>
            <td align="left" class="style6">
                <asp:Label ID="lblLastSurvey" runat="server"></asp:Label>
            </td>
            <td align="right" class="style14">
                &nbsp;</td>
            <td align="right" class="style15">
                Contact Person</td>
            <td align="left" bgcolor="#666666">
                <asp:Label ID="lblContactPerson" runat="server" ForeColor="White">This is an example of Contact Person</asp:Label>
            </td>
            <td align="center" class="style23" >
                &nbsp;</td>
        </tr>
        <tr>
            <td align="right" class="style36">
                NDA Rec&#39;d
            </td>
            <td align="left" class="style6">
                <asp:Label ID="lblNDARec" runat="server"></asp:Label>
            </td>
            <td align="right" class="style14">
                &nbsp;</td>
            <td align="right" class="style15">
                Contact Phone</td>
            <td align="left" class="style16" bgcolor="#666666">
                <asp:Label ID="lblContactPhone" runat="server" ForeColor="White">6563123456</asp:Label>
            </td>
            <td align="center" class="style23" >
                &nbsp;</td>
        </tr>
        <tr align="left">
            <td align="right" class="style36">
                RFQ Score
            </td>
            <td align="left" class="style6">
                <asp:Label ID="lblRFQScore" runat="server"></asp:Label>
            </td>
            <td align="left" class="style14">
            </td>
            <td align="left" class="style15">
            </td>
            <td align="right" class="style16">
                &nbsp;
            </td>
            <td align="center" class="style23">
                &nbsp;</td>
        </tr>
        <tr>
            <td align="right" class="style36">
                &nbsp;
            </td>
            <td align="left" colspan="2">
                &nbsp;
            </td>
            <td align="right" class="style15">
                &nbsp;
            </td>
            <td align="left">
                &nbsp;
            </td>
            <td align="left" class="style23">
                &nbsp;</td>
            <td align="left">
                &nbsp;
            </td>
            <td align="left">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td align="right" class="style36">
                Address
            </td>
            <td align="left" colspan="2">
                <asp:TextBox ID="txtAddress" runat="server" Width="260px" TabIndex="1"></asp:TextBox>
            </td>
            <td align="right" class="style15">
                Primary Business
            </td>
            <td align="left">
                <asp:TextBox ID="txtPrimaryBusiness" runat="server" Width="260px" TabIndex="5"></asp:TextBox>
            </td>
            <td align="left" class="style23">
                &nbsp;</td>
            <td align="left">
                &nbsp;
            </td>
            <td align="left">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td align="right" class="style37">
                City
            </td>
            <td align="left" colspan="2" class="style24">
                <asp:TextBox ID="txtCity" runat="server" Width="260px" TabIndex="1"></asp:TextBox>
            </td>
            <td align="right" class="style25">
                Secondary Business
            </td>
            <td align="left" class="style24">
                <asp:TextBox ID="txtSecundaryBusiness" runat="server" Width="260px" 
                    TabIndex="6"></asp:TextBox>
            </td>
            <td align="left" class="style26">
                </td>
            <td align="left" class="style24">
                &nbsp;
            </td>
            <td align="left" class="style24">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td align="right" class="style37">
                State
            </td>
            <td align="left" colspan="2" class="style24">
                <asp:TextBox ID="txtState" runat="server" Width="260px" TabIndex="2"></asp:TextBox>
            </td>
            <td align="right" class="style25">
                Manufacturing Method
            </td>
            <td align="left" class="style24">
                <asp:TextBox ID="txtManufacturingMethod" runat="server" Width="260px" 
                    TabIndex="7"></asp:TextBox>
            </td>
            <td align="left" class="style26">
                </td>
            <td align="left" class="style24">
                &nbsp;
            </td>
            <td align="left" class="style24">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td align="right" class="style38">
                Zip
            </td>
            <td align="left" colspan="2" class="style27">
                <asp:TextBox ID="txtZip" runat="server" Width="260px" TabIndex="3"></asp:TextBox>
            </td>
            <td align="right" class="style28">
                Current Capacity
            </td>
            <td align="left" class="style27">
                <asp:TextBox ID="txtCurrentCapacity" runat="server" Width="260px" TabIndex="8"></asp:TextBox>
            </td>
            <td align="left" class="style29">
                </td>
            <td align="left" class="style27">
                &nbsp;
            </td>
            <td align="left" class="style27">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td align="right" class="style39">
                Website
            </td>
            <td align="left" colspan="2" class="style33">
                <asp:TextBox ID="txtWebsite" runat="server" Width="260px" TabIndex="4"></asp:TextBox>
            </td>
            <td align="left" class="style34">
                &nbsp;
            </td>
            <td align="left" class="style32">
                &nbsp;
            </td>
            <td align="left" class="style35">
                </td>
            <td align="left" class="style33">
                &nbsp;
            </td>
            <td align="left" class="style33">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td align="right" class="style36">
                &nbsp;
            </td>
            <td align="left" colspan="2">
                &nbsp;
            </td>
            <td align="center" class="style7" colspan="2">
                &nbsp;</td>
            <td align="left" class="style23">
                &nbsp;</td>
            <td align="left">
                &nbsp;&nbsp;</td>
            <td align="left">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td align="right" class="style36">
                &nbsp;</td>
            <td align="left" colspan="2">
                &nbsp;</td>
            <td align="center" class="style7" colspan="2">
                &nbsp;</td>
            <td align="left" class="style23">
                &nbsp;</td>
            <td align="left">
                &nbsp;</td>
            <td align="left">
                &nbsp;</td>
        </tr>
        <tr>
            <td align="right" class="style36">
                Current Annual Sales
            </td>
            <td align="left" colspan="2">
                <asp:TextBox ID="txtCurrentAnnualSales" runat="server" Width="259px" 
                    TabIndex="13"></asp:TextBox>
            </td>
            <td align="center" class="style7" colspan="2">
                Tooling
            </td>
            <td align="left" class="style23">
                &nbsp;</td>
            <td align="left">
                &nbsp;&nbsp;</td>
            <td align="left">
                &nbsp;</td>
        </tr>
        <tr>
            <td align="right" class="style36">
                &nbsp;</td>
            <td align="left" colspan="2">
            <div style="width: 262px" align="right">
                Year<asp:TextBox ID="txtYearForecastSales" runat="server" Width="46px" 
                    TabIndex="14"></asp:TextBox>
            &nbsp;Value<asp:TextBox ID="txtValueForecastYear" runat="server" Width="43px" 
                    TabIndex="15"></asp:TextBox>
            &nbsp;<asp:Button ID="btnAddForecastSale" runat="server" Text="+" Width="35px" 
                    onclick="btnAddForecastSale_Click" TabIndex="16" />
                <asp:Button ID="btnRemoveForecastSale" runat="server" Text="-" Width="35px" 
                    onclick="btnRemoveForecastSale_Click" TabIndex="17" />
            </div>                
            </td>
            <td align="right" class="style15" colspan="2">
                New-In-House Manufacture
                <asp:CheckBox ID="chkNewInHouseManufacture" runat="server" Text=" " 
                    TabIndex="19" />
            </td>
            <td align="left" class="style23">
                &nbsp;</td>
            <td align="left">
                &nbsp;
            </td>
            <td align="left">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td align="right" class="style9">
                Forecast Sales
            </td>
            <td align="left" colspan="2" class="style10" rowspan="4">
                <asp:ListBox ID="lstForecastSales" runat="server" Height="93px" Width="260px" 
                    TabIndex="18"></asp:ListBox>
            </td>
            <td align="right" class="style11" colspan="2">
                New Outsourced
                <asp:CheckBox ID="chkNewOutsourced" runat="server" Text=" " TabIndex="20" />
            </td>
            <td align="left" class="style23">
                &nbsp;</td>
            <td align="left" class="style10">
            </td>
            <td align="left" class="style10">
            </td>
        </tr>
        <tr>
            <td align="right" class="style36">
                &nbsp;
            </td>
            <td align="right" class="style15" colspan="2">
                Repair In-House
                <asp:CheckBox ID="chkRepairInHouse" runat="server" Text=" " TabIndex="21" />
            </td>
            <td align="left" class="style23">
                &nbsp;</td>
            <td align="left">
                &nbsp;
            </td>
            <td align="left">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td align="right" class="style36">
                &nbsp;
            </td>
            <td align="right" class="style15" colspan="2">
                Repair Outsource
                <asp:CheckBox ID="chkRepairOutsource" runat="server" Text=" " TabIndex="22" />
            </td>
            <td align="left" class="style23">
                &nbsp;</td>
            <td align="left">
                &nbsp;
            </td>
            <td align="left">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td align="right" class="style36">
                &nbsp;
            </td>
            <td align="left" class="style15">
                &nbsp;
            </td>
            <td align="left" class="style16">
                &nbsp;
            </td>
            <td align="left" class="style23">
                &nbsp;</td>
            <td align="left">
                &nbsp;
            </td>
            <td align="left">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td align="right" class="style36">
                &nbsp;</td>
            <td align="left" colspan="2">
                &nbsp;</td>
            <td align="left" class="style15">
                &nbsp;</td>
            <td align="left" class="style16">
                &nbsp;</td>
            <td align="left" class="style23">
                &nbsp;</td>
            <td align="left">
                &nbsp;</td>
            <td align="left">
                &nbsp;</td>
        </tr>
        <tr>
            <td align="right" class="style36">
                &nbsp;</td>
            <td align="left" colspan="2">
                &nbsp;</td>
            <td align="left" class="style15">
                &nbsp;</td>
            <td align="left" class="style16">
                &nbsp;</td>
            <td align="left" class="style23">
                &nbsp;</td>
            <td align="left">
                &nbsp;</td>
            <td align="left">
                &nbsp;</td>
        </tr>
        <tr>
            <td align="right" class="style36">
                &nbsp;
            </td>
            <td align="left" colspan="2">
                <div style="width: 260px" align="right">
            <asp:DropDownList ID="cboIndustries" runat="server" style="margin-left: 0px" 
                    Width="140px" TabIndex="23">
                </asp:DropDownList>
                <asp:Button ID="btnAddIndustrie" runat="server" Text="+" Width="26px" 
                        onclick="btnAddIndustrie_Click" TabIndex="24" />
                <asp:Button ID="btnRemoveIndustrie" runat="server" Text="-" Width="26px" 
                        onclick="btnRemoveIndustrie_Click" TabIndex="25" />
                <asp:Button ID="btnNewIndustrie" runat="server" Text="New" Width="45px" 
                        TabIndex="26" />
            </div>                
            </td>
            <td align="left" class="style15">
                &nbsp;
            </td>
            <td align="left" class="style16">
            <div style="width: 260px" align="right">
            <asp:DropDownList ID="cboCertification" runat="server" style="margin-left: 0px" 
                    Width="140px" TabIndex="28" >
                </asp:DropDownList>
                <asp:Button ID="btnAddCertification" runat="server" Text="+" Width="26px" 
                    onclick="btnAddCertification_Click" TabIndex="29" />
                <asp:Button ID="btnRemoveCertification" runat="server" Text="-" Width="26px" 
                    onclick="btnRemoveCertification_Click" TabIndex="30" />
                <asp:Button ID="btnNewCertification" runat="server" Text="New" Width="45px" 
                    TabIndex="31" />
            </div>                
            </td>
            <td align="left" class="style23">
                &nbsp;</td>
            <td align="left">
                &nbsp;
            </td>
            <td align="left">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td align="right" class="style36">
                Industries Supplied
            </td>
            <td align="left" class="style2" colspan="2" rowspan="4">
                <asp:ListBox ID="lstIndustries" runat="server" Height="93px" Width="260px" 
                    TabIndex="27">
                </asp:ListBox>
            </td>
            <td align="right" class="style15">
                Certifications
            </td>
            <td align="left" class="style16" rowspan="4">
                <asp:ListBox ID="lstCertifications" runat="server" Height="93px" Width="260px" 
                    TabIndex="32"></asp:ListBox>
            </td>
            <td align="left" class="style23">
                &nbsp;</td>
            <td align="left">
                &nbsp;
            </td>
            <td align="left">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td align="right" class="style36">
                &nbsp;
            </td>
            <td align="right" class="style15">
                &nbsp;
            </td>
            <td align="left" class="style23">
                &nbsp;</td>
            <td align="left">
                &nbsp;
            </td>
            <td align="left">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td align="right" class="style36">
                &nbsp;
            </td>
            <td align="left" class="style15">
                &nbsp;
            </td>
            <td align="left" class="style23">
                &nbsp;</td>
            <td align="left">
                &nbsp;
            </td>
            <td align="left">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td align="right" class="style36">
                &nbsp;
            </td>
            <td align="left" class="style15">
                &nbsp;
            </td>
            <td align="left" class="style23">
                &nbsp;</td>
            <td align="left">
                &nbsp;
            </td>
            <td align="left">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td align="right" class="style36">
                &nbsp;
            </td>
            <td align="left" class="style6">
                &nbsp;
            </td>
            <td align="left" class="style14">
                &nbsp;
            </td>
            <td align="left" class="style15">
                &nbsp;
            </td>
            <td align="left" class="style16">
                &nbsp;
                </td>
            <td align="left" class="style23">
                &nbsp;</td>
            <td align="left">
                &nbsp;
            </td>
            <td align="left">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td align="right" class="style13" colspan="8">
                <table align="center" cellspacing="0" class="style17">
                    <tr>
                        <td class="style21">
                            <div id="divExecutive">
                                <uc1:surveyContactsExecutive ID="uscContactExecutive" runat="server" />
                            </div>
                        </td>
                        <td class="style22">
                            <div id="divSales">
                                <uc2:surveyContactsSales ID="uscContactSales" runat="server" />
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td class="style19">
                            <div id="divQuality">
                                <uc3:surveyContactsQuality ID="uscContactQuality" runat="server" />
                            </div>
                        </td>
                        <td class="style20">
                            <div id="divCustomerSupport">
                                <uc4:surveyContactsCustomerSupport ID="uscContactCustomerSupport" runat="server" />
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td class="style18">
                            <div id="divAfterHoursContact">
                                <uc5:surveyContactsAfterHours ID="uscContactAfterHours" runat="server" />
                            </div>
                        </td>
                        <td align="center">
                            Notes/Comments<br />
                            <asp:TextBox ID="txtNotes" runat="server" Height="167px" Width="401px" 
                                TextMode="MultiLine" TabIndex="63"></asp:TextBox>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td align="right" colspan="3">
                <asp:HiddenField ID="txtPrompt" runat="server" 
                    onvaluechanged="txtPrompt_ValueChanged" />                
            <td align="left" colspan="5">
                    &nbsp;
                </td>
        </tr>        
    </table>
</div>
<div align="center" style="border-top: solid #666666;padding-top: 5px;">
    <asp:Button ID="btnSave" runat="server" Text="Save" Width="70px" 
        OnClick="btnSave_Click" TabIndex="64" />
    <asp:Button ID="btnCancel" runat="server" Text="Cancel" Width="70px" 
        OnClick="btnCancel_Click" TabIndex="65" />
</div>