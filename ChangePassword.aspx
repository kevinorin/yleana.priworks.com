<%@ Page Title="" Language="C#" MasterPageFile="~/studentMaster.Master" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="yleana.ChangePassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table border="0" align="center" style="text-align: center; width: 50%; padding-left: 20px; margin-top: 20px; border: 0px solid">
        <tr>
            <td style="text-align: left;">
                <h1 style="font-weight: 600; font-style: italic;"> Change Password </h1>
            </td>
        </tr>
        <tr>
            <td style="text-align: left;">
                <label class="LabelInput">Current Password : </label>
                <span style="color: red;">*</span><br />
                <telerik:RadTextBox ID="txtCurrentPassword" MaxLength="8" TextMode="Password" runat="server" ></telerik:RadTextBox><br /> 
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ForeColor="Red" Display="Dynamic" ControlToValidate="txtCurrentPassword" ErrorMessage="Current password should not be empty!"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="text-align: left;">
                <label class="LabelInput">New Password : </label>
                <span style="color: red;">*</span><br />
                <telerik:RadTextBox ID="txtNewPassword" runat="server" TextMode="Password" MaxLength="8"></telerik:RadTextBox><br /> 
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ForeColor="Red" Display="Dynamic" ControlToValidate="txtNewPassword" ErrorMessage="New password should not be empty!"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="text-align: left;">
                <label class="LabelInput">Confirm New Password : </label>
                <span style="color: red;">*</span><br />
                <telerik:RadTextBox ID="txtNewPasswordConfirm" runat="server" TextMode="Password" MaxLength="8" ></telerik:RadTextBox><br /> 
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ForeColor="Red" Display="Dynamic" ControlToValidate="txtNewPasswordConfirm" ErrorMessage="Confirm new password should not be empty!"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="text-align: center;">
                <telerik:RadButton ID="btnUpdate" ButtonType="StandardButton" runat="server" Text="Change Password" OnClick="btnUpdate_Click"></telerik:RadButton>
            </td>
        </tr>
        <tr>
            <td style="text-align: center;">
                <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>            
            </td>
        </tr>
    </table>
</asp:Content>
