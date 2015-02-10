<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="YleanaAdmin.ChangePassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
	<h1>Change Password</h1>	
	<br />
	<br />
	<asp:Label ID="lblCurrentPassword" runat="server" Text="Current Password"></asp:Label>
	<br />
	<telerik:RadTextBox ID="txtCurrentPassword" runat="server" Width="600"></telerik:RadTextBox>
	<br />
	<br />
	<asp:Label ID="lblNewPassword" runat="server" Text="New Password"></asp:Label>
	<br />
	<telerik:RadTextBox ID="txtNewPassword" runat="server" Width="600"></telerik:RadTextBox>
	<br />
	<br />
	<asp:Label ID="lblNewPasswordConfirm" runat="server" Text="Confirm New Password"></asp:Label>
	<br />
	<telerik:RadTextBox ID="txtNewPasswordConfirm" runat="server" Width="600"></telerik:RadTextBox>
	<br />
	<br />
	<telerik:RadButton ID="btnUpdate" ButtonType="StandardButton" runat="server" Text="Change Password" OnClick="btnUpdate_Click"></telerik:RadButton>
	<br />
	<br />
	<asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
	<br />
	<br />
</asp:Content>
