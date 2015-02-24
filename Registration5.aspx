<%@ Page Title="" Language="C#" MaintainScrollPositionOnPostback="true" MasterPageFile="~/studentMaster.Master" AutoEventWireup="true" CodeBehind="Registration5.aspx.cs" Inherits="yleana.Registration5" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
	<script type="text/javascript">
		function StandardConfirm(sender, args) {
			args.set_cancel(!window.confirm("Please Check all the details before submit!, Once submitted you cannot change anything."));
		}

		function validateRadUpload(source, e) {
			e.IsValid = false;
			var upload = $find("<%= RaduploadTranscript.ClientID %>");
			var inputs = upload.getFileInputs();
			for (var i = 0; i < inputs.length; i++) {
				if (inputs[i].value == "") {
					e.IsValid = false;
					break;
				}
				if (!upload.isExtensionValid(inputs[i].value)) {
					alert("Invalid File Extension. \n Please select the file with the extensions .doc,.docx,.rtf,.pdf,.jpeg,.gif ");
					e.IsValid = false;
					break;
				}
				if (inputs[i].value != "" && upload.isExtensionValid(inputs[i].value)) {
					e.IsValid = true;
					break;
				}
			}
		}

		function validateRadUpload1(source, e) {
			e.IsValid = false;
			var upload = $find("<%= RadUploadPersonalStatement.ClientID %>");
			var inputs = upload.getFileInputs();
			for (var i = 0; i < inputs.length; i++) {
				if (inputs[i].value == "") {
					e.IsValid = false;
					break;
				}
				if (!upload.isExtensionValid(inputs[i].value)) {
					alert("Invalid File Extension. \n Please select the file with the extensions .doc,.docx,.rtf,.pdf,.jpeg,.gif ");
					e.IsValid = false;
					break;
				}
				if (inputs[i].value != "" && upload.isExtensionValid(inputs[i].value)) {
					e.IsValid = true;
					break;
				}
			}
		}

	</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
	<asp:Panel ID="panl1" runat="server">
		<div class="rspForms col-lg-12">
			<div class="row">
				<div class="col-md-8 col-md-offset-3">
					<div class="row spacedRow">
						<div class="col-md-12">
							<h1>Forms </h1>
							<p>When you upload a form, it will overwrite any existing forms: That means that if you've already uploaded your Personal Statement, and you want to change something about it, just upload it again and it will replace what's already there. </p>
							<p>That also means, though, that if you upload something that's already there, what WAS there will be gone.</p>
						</div>
					</div>

					<div class="row spacedRow">
						<div class="col-md-4">
							<label class="LabelInput"><span style="color: red;">*</span> Select Transcript file: </label>
							<br />
							<label style="font-size: smaller;">Allowed extensions (.doc,.docx,.rtf,.pdf,.jpeg,.gif) </label>
						</div>
						<div class="col-md-8">
							<asp:Label ID="lblUploadedTranscript" runat="server"></asp:Label><br />
							<telerik:RadUpload Style="text-align: left !important; width: 250px !important;" ID="RaduploadTranscript" runat="server" ControlObjectsVisibility="None" MaxFileInputsCount="1" AllowedFileExtensions=".doc,.docx,.rtf,.pdf,.jpeg,.gif"></telerik:RadUpload>
							<br />
							<asp:CustomValidator ID="CustomValidator1" runat="server" Display="Dynamic" ClientValidationFunction="validateRadUpload" ForeColor="Red" ErrorMessage="Please select Transcript file to upload"></asp:CustomValidator>
						</div>
					</div>

					<div class="row spacedRow">
						<div class="col-md-4">
							<label class="LabelInput"><span style="color: red;">*</span> Select Personal Statement: </label>(<asp:LinkButton ID="LinkButton1" runat="server" Text="Download Form" CausesValidation="false" OnClick="lnkForm_Click"></asp:LinkButton>)
							<br />
							<label style="font-size: smaller;">Allowed extensions (.doc,.docx,.rtf,.pdf,.jpeg,.gif) </label>
						</div>
						<div class="col-md-8">
							<asp:Label ID="lblUploadedPersonalStatement" runat="server"></asp:Label><br />
							<telerik:RadUpload Style="text-align: left !important; width: 250px !important;" ID="RadUploadPersonalStatement" runat="server" ControlObjectsVisibility="None" MaxFileInputsCount="1" AllowedFileExtensions=".doc,.docx,.rtf,.pdf,.jpeg,.gif"></telerik:RadUpload>
							<br />
							<asp:CustomValidator ID="CustomValidator2" runat="server" Display="Dynamic" ClientValidationFunction="validateRadUpload1" ForeColor="Red" ErrorMessage="Please select Personal Statement file to upload"></asp:CustomValidator>
						</div>
					</div>

					<div class="row spacedRow">
						<div class="col-md-4">
							<label class="LabelInput">Select Resume (Optional): </label>
							<br />
							<label style="font-size: smaller;">Allowed extensions (.doc,.docx,.rtf,.pdf,.jpeg,.gif) </label>
						</div>
						<div class="col-md-8">
							<asp:Label ID="lblUploadedResume" runat="server"></asp:Label>
							<telerik:RadUpload Style="text-align: left !important; width: 250px !important;" ID="RadUploadResume" runat="server" ControlObjectsVisibility="None" MaxFileInputsCount="1" AllowedFileExtensions=".doc,.docx,.rtf,.pdf,.jpeg,.gif"></telerik:RadUpload>
							<br />
						</div>
					</div>
				</div>
			</div>
	</asp:Panel>
	<div class="rspForms col-lg-12">
		<div class="row">
			<div class="col-md-8 col-md-offset-3">
				<div class="col-md-12">
					<asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label><br /><br />
					<telerik:RadButton ID="btnPrevious" runat="server" CausesValidation="false" ButtonType="StandardButton" Text="PREVIOUS" Width="20%" OnClick="btnPrevious_Click"></telerik:RadButton>
					<telerik:RadButton ID="btnSave" runat="server" CausesValidation="false" ButtonType="StandardButton" Text="SAVE SECTION" Width="20%" OnClick="btnSave_Click"></telerik:RadButton>
					<telerik:RadButton ID="btnSubmit" runat="server" CausesValidation="false" ButtonType="StandardButton" Text="SUBMIT" Width="20%" OnClick="btnSubmit_Click"></telerik:RadButton>
				</div>
				<div class="row">
					<div class="col-md-8 col-md-offset-3">
						<div class="col-md-4">
							<label class="LabelInput">Step 5 of 5</label>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</asp:Content>
