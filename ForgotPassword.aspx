<%@ Page Title="" Language="C#" MasterPageFile="~/StudentMaster.Master" AutoEventWireup="true" CodeBehind="ForgotPassword.aspx.cs" Inherits="yleana.ForgotPassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
	<div class="rspForms col-lg-12">
		<div class="row">
			<div class="col-md-8 col-md-offset-3">
				<div class="centered500">
					<h1>Forgot Your Password</h1>
					<asp:Label ID="lblInfo" runat="server" Text="Enter the email address associated with your account."></asp:Label>
					<br />
					<br />
					<telerik:RadTextBox ID="txtEmailAddress" runat="server"></telerik:RadTextBox>
					<br />
					<br />
					<telerik:RadButton ID="btnSubmit" runat="server" CausesValidation="false" ButtonType="StandardButton" Text="SUBMIT" Width="20%" OnClick="btnSubmit_Click"></telerik:RadButton>
					<br />
					<br />
					<asp:Label ID="lblMessage" runat="server"></asp:Label>
					<br /><br />
				</div>
			</div>
		</div>
</asp:Content>
