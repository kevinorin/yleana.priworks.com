<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="YleanaAdmin.Register" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="Telerik" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
	<title>Yleana Admin</title>
	<link rel="stylesheet" href="css/simple-sidebar.css" />
	<link rel="stylesheet" href="css/custom.css" />
	<link rel="stylesheet" href="css/dashboard.css" />
	<link rel="stylesheet" href="css/jquery.mobile-1.4.0.min.css" />
	<style type="text/css">
		body
		{
			max-width: 100% !important;
		}
	</style>
</head>
<body id="ALMApp">
	<div class="ALM-login-wrap">
		<a href="Register.aspx">
			<img src="images/yleana_logo.png" alt="Yleana" />
		</a>
		<form id="form1" runat="server">
			<telerik:RadScriptManager ID="RadScriptManager1" runat="server" />
			<div style="text-align: center">

				<div>
					<h1 style="font-weight: 600; font-style: italic; text-align: center; margin: 10px 0 20px;">Register</h1>
					<label class="TextBoxInput">User ID</label>
					<div class="ui-input-text ui-body-inherit ui-corner-all ui-shadow-inset">
						<telerik:RadTextBox ID="txtEmail" runat="server"></telerik:RadTextBox>
						<asp:RequiredFieldValidator ID="TextBoxRequiredFieldValidator" runat="server" Display="Dynamic" ControlToValidate="txtEmail" ErrorMessage="The UserID can not be empty!"></asp:RequiredFieldValidator>
					</div>					
					<telerik:RadButton ID="btnLogin" runat="server" Text="Register" OnClick="btnRegister_Click"></telerik:RadButton>
					<br />
					<asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
				</div>
			</div>
		</form>
	</div>
</body>
</html>
