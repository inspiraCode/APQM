<%@ Control Language="C#" AutoEventWireup="true" CodeFile="sifDetail.ascx.cs" Inherits="SIF_sifDetail" %>
<style type="text/css">
    .textManual
    {
        font-size: 12px;
        border: 0px;
        height: 13px;
        background-color: Transparent;
        text-align: right;
        max-width: 70px;
        width: 70px;
    }
</style>
<div align="center" style="font-size: 12px;">
    <%--<div style="float: left" runat="server" id="divHeader" visible="false">
    </div>--%>
    <div align="left">
        <asp:Repeater ID="repeaterSIFDetail" runat="server">
            <HeaderTemplate>
                <table border="0" style="text-align: right; float: left;">
                    <tr>
                        <td>
                            <table>
                                <tr height='12px;'>
                                    <td>
                                        <asp:Label ID="Label13" runat="server" Text="Program Year">                            
                                        </asp:Label>
                                    </td>
                                </tr>
                                <tr height='12px;'>
                                    <td>
                                        <asp:Label ID="Label1" runat="server" Text="Projected Annual Volume">                            
                                        </asp:Label>
                                    </td>
                                </tr>
                                <tr height='12px;' toHide="true">
                                    <td>
                                        <asp:Label ID="Label2" runat="server" Text="% of Volume per Award">
                                        </asp:Label>
                                    </td>
                                </tr>
                                <tr height='12px;' toHide="true">
                                    <td>
                                        <asp:Label ID="Label3" runat="server" Text="Projected/Target Price">
                            
                                        </asp:Label>
                                    </td>
                                </tr>
                                <tr height='12px;' toHide="true">
                                    <td>
                                        <asp:Label ID="Label4" runat="server" Text="Annual Revenue">
                            
                                        </asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
                <table>
                    <tr>
            </HeaderTemplate>
            <ItemTemplate>
                <td>
                    <table style="text-align: right;">
                        <tr height='11px;'>
                            <td>
                                <asp:Label ID="lblYear" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "ProgramYear")%>'>                            
                                </asp:Label>
                            </td>
                        </tr>
                        <tr height='11px;'>
                            <td>
                                <asp:Label ID="lblMaterialTotal" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "ProjectedAnnualVolume")%>'>                            
                                </asp:Label>
                            </td>
                        </tr>
                        <tr height='11px;' toHide="true">
                            <td>
                                <asp:Label ID="lblServiceTotal" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "PercentVolumePerAward")%>'>
                                </asp:Label>
                            </td>
                        </tr>
                        <tr height='11px;' toHide="true">
                            <td>
                                <asp:Label ID="lblScrapTotal" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "ProjectedTargetPrice")%>'>
                                </asp:Label>
                            </td>
                        </tr>
                        <tr height='11px;' toHide="true">
                            <td>
                                <asp:Label ID="lblLaborTotal" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "AnnualRevenue")%>'>
                                </asp:Label>
                            </td>
                        </tr>
                    </table>
                </td>
            </ItemTemplate>
            <FooterTemplate>
                </tr> </table>
            </FooterTemplate>
        </asp:Repeater>
    </div>
</div>
