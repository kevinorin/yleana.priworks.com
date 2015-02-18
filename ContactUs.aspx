<%@ Page Title="" Language="C#" MasterPageFile="~/studentMaster.Master" AutoEventWireup="true" CodeBehind="ContactUs.aspx.cs" Inherits="yleana.ContactUs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

	<div class="rspForms col-lg-10 col-lg-offset-1 col-md-10 col-md-offset-1">
		<h1>Contact Us</h1>

		<div class="row">
			<div class="col-md-6">
				<label class="LabelInput"><span style="color: red;">*</span> Name : </label>
				<telerik:RadTextBox ID="txtName" runat="server"></telerik:RadTextBox>
				<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Display="Dynamic" ControlToValidate="txtName" ForeColor="Red" ErrorMessage="The Name can not be empty!"></asp:RequiredFieldValidator>
			</div>			
		</div>
        <div class="row">
            <div class="col-md-6">
				<label class="LabelInput"><span style="color: red;">*</span> Email Address : </label>
				<telerik:RadTextBox ID="txtEmail" runat="server"></telerik:RadTextBox>
				<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="Dynamic" ControlToValidate="txtEmail" ForeColor="Red" ErrorMessage="The Email address can not be empty!"></asp:RequiredFieldValidator>
			</div>
        </div>
        <div class="row">
            <div class="col-md-6">
				<label class="LabelInput"><span style="color: red;">*</span> Phone : </label>
				<telerik:RadMaskedTextBox ID="txtPhone" runat="server" Mask="(###) ### - ####" ></telerik:RadMaskedTextBox>
				<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" Display="Dynamic" ControlToValidate="txtPhone" ForeColor="Red" ErrorMessage="The Phone number can not be empty!"></asp:RequiredFieldValidator>
			</div>
        </div>
        <div class="row">
            <div class="col-md-6">
				<label class="LabelInput"><span style="color: red;">*</span> Subject : </label>
				<telerik:RadTextBox ID="txtSubject" runat="server" Text="I don’t have a partner organization." ReadOnly="true" Width="50%"></telerik:RadTextBox>
				<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" Display="Dynamic" ControlToValidate="txtEmail" ForeColor="Red" ErrorMessage="The Email address can not be empty!"></asp:RequiredFieldValidator>
			</div>
        </div>
		<div class="row">
			<div class="col-md-6">
				<label class="LabelInput"><span style="color: red;">*</span> Message : </label>
				<telerik:RadTextBox ID="txtMessage" runat="server" TextMode="MultiLine" Width="95%" Rows="8"></telerik:RadTextBox>
				<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" Display="Dynamic" ControlToValidate="txtMessage" ForeColor="Red" ErrorMessage="The Email message can not be empty!"></asp:RequiredFieldValidator>
			</div>
		</div>

		<div class="row">
			<div class="col-md-6">
				<telerik:RadButton ID="btnSend" runat="server" Text="Send" OnClick="btnSend_Click"></telerik:RadButton>				
			</div>
		</div>
        <div class="row">
			<div class="col-md-6">
				<asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
			</div>
		</div>
	</div>
</asp:Content>
