<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="AddUser.aspx.cs" Inherits="YleanaAdmin.AddUser" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
	<h1>Add User</h1>
	<asp:Label ID="lblOrganization" runat="server" Text="Yleana or Partner Organization"></asp:Label>
	<br />
	<br />
	<telerik:RadDropDownList ID="ddlOrganization" runat="server" DropDownWidth="300" DefaultMessage="Select Organization">	
	</telerik:RadDropDownList>
	<br />
	<br />
	<asp:Label ID="lblEmail" runat="server" Text="Email Address"></asp:Label>
	<br />
	<telerik:RadTextBox ID="txtEmailAddress" runat="server" Width="600"></telerik:RadTextBox>
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
	<telerik:RadButton ID="btnAddUser" ButtonType="StandardButton" runat="server" Text="Add User" OnClick="btnAddUser_Click"></telerik:RadButton>
	<br />
	<br />
	<asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
	<br />
	<br />    
</asp:Content>
