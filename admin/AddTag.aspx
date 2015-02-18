<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="AddTag.aspx.cs" Inherits="YleanaAdmin.AddTag" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
	<h1>Add Tag</h1>
	<br />
	<br />	
	<asp:Label ID="lblTagName" runat="server" Text="Tag Name"></asp:Label>
	<br />
	<telerik:RadTextBox ID="txtTagName" runat="server" Width="600"></telerik:RadTextBox>
	<br />
	<br />
	<asp:Label ID="lblTagDescription" runat="server" Text="Tag Description"></asp:Label>
	<br />
	<telerik:RadTextBox ID="txtTagDescription" runat="server" Width="600" Height="200" TextMode="MultiLine"></telerik:RadTextBox>
	<br />
	<br />
	<asp:CheckBox ID="chkActive" runat="server" Text="Active" />
	<br />
	<br />
	<telerik:RadButton ID="btnAddTag" ButtonType="StandardButton" runat="server" Text="Add Tag" OnClick="btnAddTag_Click"></telerik:RadButton>
	<br />
	<br />
	<asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
	<br />
	<br />  
</asp:Content>
