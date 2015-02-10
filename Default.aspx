<%@ Page Title="" Language="C#" MasterPageFile="~/studentMaster.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="yleana.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div align="centre" style="text-align:center">
        <table align="center">
            <tr style="height:50px;">
                <td style="font-size:large;">Our application is open from March 1- April 1, 2015. <br /> You must be associated with one of the following partner organizations to apply for Yleana 2015</td>
            </tr>
            <tr style="height:50px;">
                <td>
                    <asp:Button ID="btnFirsttime" runat="server" Text="First time applicants" OnClick="btnFirsttime_Click" />
                    <br />
                </td>
            </tr>
            <tr style="height:50px;">
                <td>
                    <telerik:RadButton ID="btnReturn" ButtonType="StandardButton" runat="server" Text="Returning Applicants" OnClick="btnReturn_Click" ></telerik:RadButton>
                    <br />
                </td>
            </tr>
            <tr style="height:50px;">
                <td>
                    <asp:Button ID="btnNotPartnerAss" runat="server" Text="Not Associated with one of our partner orgs? Contact us here!"  OnClick="btnNotPartnerAss_Click" />
                    <br />
                </td>
            </tr>
            <tr><td><asp:Label ID="lblMsg" runat="server"></asp:Label></td></tr>
        </table>
    </div>
</asp:Content>
