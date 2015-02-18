<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="ColorLabel.aspx.cs" Inherits="YleanaAdmin.ColorLabel" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
		<h1>Color Label</h1>
	<br />
	<br />	
	<asp:Label ID="lblRedLabel" runat="server" Text="RED"></asp:Label>
	<br />
	<telerik:RadTextBox ID="txtRedLabel" runat="server" Width="600" TextMode="MultiLine"></telerik:RadTextBox>
	<br />
	<br />
	<asp:Label ID="lblGreenLabel" runat="server" Text="GREEN"></asp:Label>
	<br />
	<telerik:RadTextBox ID="txtGreenLabel" runat="server" Width="600" TextMode="MultiLine"></telerik:RadTextBox>
	<br />
	<br />
	<asp:Label ID="lblYellowLabel" runat="server" Text="YELLOW"></asp:Label>
	<br />
	<telerik:RadTextBox ID="txtYellowLabel" runat="server" Width="600" TextMode="MultiLine"></telerik:RadTextBox>
	<br />
	<br />
	<telerik:RadButton ID="btnUpdate" ButtonType="StandardButton" runat="server" Text="Update" OnClick="btnUpdate_Click"></telerik:RadButton>
	<br />
	<br />
	<asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
	<br />
	<br /> 
</asp:Content>
