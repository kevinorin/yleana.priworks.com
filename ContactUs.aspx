<%@ Page Title="" Language="C#" MasterPageFile="~/studentMaster.Master" AutoEventWireup="true" CodeBehind="ContactUs.aspx.cs" Inherits="yleana.Contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

	<div class="rspForms col-lg-12">
		<div class="row">
			<div class="col-md-8 col-md-offset-3">
				<h1>Contact Us</h1>
                <div class="row">
					<div class="col-md-9">
						<asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
					</div>
				</div>
                <br />
				<div>
					<p>Hello! We’re so excited that you chose to apply to Yleana. If you’re not associated with any of the partner organizations with whom we’re currently associated, please use the space below to tell us about the school or organization you would like us to partner with. </p>
					<p>Please provide the name of your school, where it is located, the name of someone we can speak with there, (your teacher/college counselor/community coordinator) and a phone number and/or an email at which we can reach them. The more information you give us, the faster we can get in touch with them and help you get access to Yleana!</p>
					<p>Also feel free to give us any other information about yourself or your organization that you think would be helpful.</p>
				</div>
				<div class="row spacedRow">
					<div class="col-md-3">
						<label class="LabelInput"><span style="color: red;">*</span> Name: </label>
					</div>
					<div class="col-md-9">
						<telerik:RadTextBox ID="txtName" runat="server"></telerik:RadTextBox>
						<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Display="Dynamic" ControlToValidate="txtName" ForeColor="Red" ErrorMessage="Name cannot be empty!"></asp:RequiredFieldValidator>
					</div>
				</div>
				<div class="row spacedRow">
					<div class="col-md-3">
						<label class="LabelInput"><span style="color: red;">*</span> Email Address: </label>
					</div>
					<div class="col-md-9">
						<telerik:RadTextBox ID="txtEmail" runat="server"></telerik:RadTextBox>
						<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="Dynamic"
							ControlToValidate="txtEmail" ForeColor="Red" ErrorMessage="Email address cannot be empty!"></asp:RequiredFieldValidator>
					</div>
				</div>
				<div class="row spacedRow">
					<div class="col-md-3">
						<label class="LabelInput"><span style="color: red;">*</span> Phone: </label>
					</div>
					<div class="col-md-9">
						<telerik:RadMaskedTextBox ID="txtPhone" runat="server" Mask="(###)###-####"></telerik:RadMaskedTextBox>
						<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" Display="Dynamic"
							ControlToValidate="txtPhone" ForeColor="Red" ErrorMessage="Phone number cannot be empty!"></asp:RequiredFieldValidator>
						<%--<asp:RegularExpressionValidator Display="Dynamic" ForeColor="Red" ID="MaskedTextBoxRegularExpressionValidator"
                                runat="server" ErrorMessage="Please format your cell phone number like this: (###)###-####" ControlToValidate="txtPhone"
                                ValidationExpression="^[\( ][0-9X][1-9][0-9][\) ]?[0-9]{3}[\- ]?[0-9]{4}$"></asp:RegularExpressionValidator>--%>
					</div>
				</div>
				<div class="row spacedRow">
					<div class="col-md-3">
						<label class="LabelInput"><span style="color: red;">*</span> Message: </label>
					</div>
					<div class="col-md-9">
						<telerik:RadTextBox ID="txtMessage" runat="server" TextMode="MultiLine" Width="95%" Rows="8"></telerik:RadTextBox>
						<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" Display="Dynamic" ControlToValidate="txtMessage" ForeColor="Red" ErrorMessage="Message cannot be empty!"></asp:RequiredFieldValidator>
					</div>
				</div>

				<div class="centered500">
					<div class="col-md-9">
						<telerik:RadButton ID="btnSend" runat="server" Text="Send" OnClick="btnSend_Click"></telerik:RadButton>
					</div>
				</div>
				<br />
				<br />
			</div>
		</div>
	</div>
</asp:Content>
