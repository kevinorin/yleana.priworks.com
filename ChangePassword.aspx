<%@ Page Title="" Language="C#" MasterPageFile="~/studentMaster.Master" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="yleana.ChangePassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
	<div class="rspForms col-lg-12">
		<div class="row">
			<div class="col-md-8 col-md-offset-3">
				<h1>Change Password </h1>
				<div class="row spacedRow">
					<div class="col-md-4">
						<label class="LabelInput"><span style="color: red;">*</span> Current Password: </label>
					</div>
					<div class="col-md-8">
						<telerik:RadTextBox ID="txtCurrentPassword" MaxLength="8" TextMode="Password" runat="server"></telerik:RadTextBox><br />
						<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ForeColor="Red" Display="Dynamic" ControlToValidate="txtCurrentPassword" ErrorMessage="Current password is required"></asp:RequiredFieldValidator>
					</div>
				</div>

				<div class="row spacedRow">
					<div class="col-md-4">
						<label class="LabelInput"><span style="color: red;">*</span> New Password: </label>
					</div>
					<div class="col-md-8">
						<telerik:RadTextBox ID="txtNewPassword" runat="server" TextMode="Password" MaxLength="8"></telerik:RadTextBox><br />
						<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ForeColor="Red" Display="Dynamic" ControlToValidate="txtNewPassword" ErrorMessage="New password is required"></asp:RequiredFieldValidator>
					</div>
				</div>

				<div class="row spacedRow">
					<div class="col-md-4">
						<label class="LabelInput"><span style="color: red;">*</span> Confirm New Password: </label>
					</div>
					<div class="col-md-8">
						<telerik:RadTextBox ID="txtNewPasswordConfirm" runat="server" TextMode="Password" MaxLength="8"></telerik:RadTextBox><br />
						<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ForeColor="Red" Display="Dynamic" ControlToValidate="txtNewPasswordConfirm" ErrorMessage="Confirm new password is required"></asp:RequiredFieldValidator>
						<br />	<br />
						<telerik:RadButton ID="btnUpdate" ButtonType="StandardButton" runat="server" Text="Change Password" OnClick="btnUpdate_Click"></telerik:RadButton>
					</div>
				</div>

				<div class="row spacedRow">
					<div class="col-md-4">
						<asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
					</div>
				</div>

			</div>
		</div>
	</div>
	</div>
</asp:Content>
