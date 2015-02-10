<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="EditUser.aspx.cs" Inherits="YleanaAdmin.EditUser" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
	<h1>Update User</h1>
	<asp:Label ID="lblOrganization" runat="server" Text="Organization Name:"></asp:Label>&nbsp;&nbsp;
	<asp:Label ID="lblOrganizationName" runat="server"></asp:Label>
	<br />
	<br />
	<asp:Label ID="lblEmail" runat="server" Text="Email Address:"></asp:Label>&nbsp;&nbsp;
	<asp:Label ID="lblEmailAddress" runat="server"></asp:Label>
	<telerik:RadTextBox ID="txtEmailAddress" runat="server" Visible="false"></telerik:RadTextBox>
	<telerik:RadButton ID="btnChangeEmail" runat="server" Text="Change Email" OnClick="btnChangeEmail_Click"></telerik:RadButton>
	<br />
	<br />
	<asp:Label ID="lblFirst" runat="server" Text="First Name"></asp:Label>
	<br />
	<telerik:RadTextBox ID="txtFirstName" runat="server" Width="600"></telerik:RadTextBox>
	<br />
	<br />
	<asp:Label ID="lblLast" runat="server" Text="Last Name"></asp:Label>
	<br />
	<telerik:RadTextBox ID="txtLastName" runat="server" Width="600"></telerik:RadTextBox>	
	<br />
	<br />
	<asp:CheckBox ID="chkActive" runat="server" Text="Is Active"></asp:CheckBox>
	<br /><br />	
	<telerik:RadButton ID="btnUpdateUser" ButtonType="StandardButton" runat="server" Text="Update User" OnClick="btnUpdateUser_Click"></telerik:RadButton>
	<br />
	<br />
	<asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
	<br />
	<br /> 
</asp:Content>
