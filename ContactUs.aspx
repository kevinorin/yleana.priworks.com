<%@ Page Title="" Language="C#" MasterPageFile="~/studentMaster.Master" AutoEventWireup="true" CodeBehind="ContactUs.aspx.cs" Inherits="yleana.ContactUs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table border="0"  align="center"  style="text-align:center;width:50%;padding-left:20px;margin-top:20px; border:0px solid">
                <tr>
                    <td colspan="2">
                        <h1 style="font-weight: 600; font-style: italic; text-align: center; margin: 10px 0 20px;">Contact Us</h1>
                    </td>
                </tr>
                <tr>
                    <td style="text-align:left;">
                        <label class="TextBoxInput">Name : </label><span style="color: red;">*</span><br />
                        <telerik:RadTextBox ID="txtName" runat="server"></telerik:RadTextBox><br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Display="Dynamic" ControlToValidate="txtName" ForeColor="Red" ErrorMessage="The Name can not be empty!"></asp:RequiredFieldValidator>
                    </td>
                </tr>
        <tr>
                    <td style="text-align:left;">
                        <label class="TextBoxInput">Email Address : </label><span style="color: red;">*</span><br />
                        <telerik:RadTextBox ID="txtEmail" runat="server"></telerik:RadTextBox><br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="Dynamic" ControlToValidate="txtEmail" ForeColor="Red" ErrorMessage="The Email address can not be empty!"></asp:RequiredFieldValidator>
                    </td>
                </tr>
        <tr>
                    <td style="text-align:left;">
                        <label class="TextBoxInput">Message : </label><span style="color: red;">*</span><br />
                        <telerik:RadTextBox ID="txtMessage" runat="server" TextMode="MultiLine" Width="95%" Rows="8" ></telerik:RadTextBox><br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" Display="Dynamic" ControlToValidate="txtMessage" ForeColor="Red" ErrorMessage="The Email message can not be empty!"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <telerik:RadButton ID="btnSend" runat="server" Text="Send" OnClick="btnSend_Click"></telerik:RadButton>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
                    </td>
                </tr>
        </table>

</asp:Content>
