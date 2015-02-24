<%@ Page Title="" Language="C#" MasterPageFile="~/studentMaster.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="yleana.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
	<div class="rspForms col-lg-12">
		<div class="row">
			<div class="col-md-8 col-md-offset-4">
				<div class="centered500">
					<h1>Login</h1>
					<label class="LabelInput">Email</label><span style="color: red;">*</span><br />
					<telerik:RadTextBox ID="txtUserId" runat="server" MaxLength="100"></telerik:RadTextBox><br />
					<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Display="Dynamic" ControlToValidate="txtUserId" ForeColor="Red" ErrorMessage="User ID cannot be empty!"></asp:RequiredFieldValidator>
				</div>

				<div class="centered500">
					<label class="LabelInput">Password</label><span style="color: red;">*</span><br />
					<telerik:RadTextBox ID="txtPassword" runat="server" TextMode="Password"></telerik:RadTextBox><br />
					<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" Display="Dynamic" ControlToValidate="txtPassword" ForeColor="Red" ErrorMessage="Password cannot be empty!"></asp:RequiredFieldValidator>
				</div>

				<div class="centered500">
					<telerik:RadButton ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click"></telerik:RadButton>
					<br />
					<br />
					<asp:HyperLink ID="lnlForgotPass" runat="server" NavigateUrl="~/ForgotPassword.aspx" Text="Forgot Password"></asp:HyperLink>
					<br />
					<br />
					<asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
				</div>
			</div>
		</div>
	</div>
</asp:Content>
