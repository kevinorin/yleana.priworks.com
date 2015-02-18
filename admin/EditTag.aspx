<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="EditTag.aspx.cs" Inherits="YleanaAdmin.EditTag" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
	<h1>Update Tag</h1>
	<br />
	<br />	
	<asp:Label ID="lblTag" runat="server" Text="Tag Name:"></asp:Label>
	<br />
	<asp:Label ID="lblTagName" runat="server"></asp:Label>
	<br />
	<br />
	<asp:Label ID="lblTagDescription" runat="server" Text="Tag Description:"></asp:Label>
	<br />
	<telerik:RadTextBox ID="txtTagDescription" runat="server" Width="600" Height="200" TextMode="MultiLine"></telerik:RadTextBox>
	<br />
	<br />
	<asp:CheckBox ID="chkActive" runat="server" Text="Active" />
	<br />
	<br />
	<telerik:RadButton ID="btnUpdateTag" ButtonType="StandardButton" runat="server" Text="Update Tag" OnClick="btnUpdateTag_Click"></telerik:RadButton>
	<br />
	<br />
	<asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
	<br />
	<br />  
</asp:Content>
