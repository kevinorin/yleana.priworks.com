<%@ Page Title="" Language="C#" MasterPageFile="~/StudentMaster.Master" AutoEventWireup="true" CodeBehind="Registration7.aspx.cs" Inherits="yleana.Registration7" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
	<script type="text/javascript">
		function StandardConfirm(sender, args) {
			args.set_cancel(!window.confirm("Please Check all the details before submit!, Once submitted you cannot change anything."));
		}

		function validateRadUpload(source, e) {
			e.IsValid = false;
			var upload = $find("<%= RaduploadCodeOfConduct.ClientID %>");
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
			var upload = $find("<%= RaduploadPermissionSlip.ClientID %>");
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
							<p>When you upload a form, it will overwrite any existing forms: That means that if you've already uploaded your Code of Conduct, and you want to change something about it, just upload it again and it will replace what's already there. </p>
							<p>That also means, though, that if you upload something that's already there, what WAS there will be gone.</p>
						</div>
					</div>

					<div class="row spacedRow">
						<div class="col-md-5">
							<label><span style="color: red;">*</span>Select Code of Conduct file: </label>
							(<asp:LinkButton ID="lnkConductForm" runat="server" Text="Download Form" CausesValidation="false" OnClick="lnkConductForm_Click"></asp:LinkButton>)
							<br />
							<label style="font-size: smaller;">Allowed extensions (.doc,.docx,.rtf,.pdf,.jpeg,.gif) </label>
						</div>
						<div class="col-md-7">
							<asp:Label ID="lblUploadedCodeofConduct" runat="server"></asp:Label>
							<telerik:RadUpload Style="text-align: left !important; width: 250px !important;" ID="RaduploadCodeOfConduct" runat="server" ControlObjectsVisibility="None" MaxFileInputsCount="1" AllowedFileExtensions=".doc,.docx,.rtf,.pdf,.jpeg,.gif"></telerik:RadUpload>
							<br />
							<asp:CustomValidator ID="CustomValidator1" runat="server" Display="Dynamic" ClientValidationFunction="validateRadUpload" ForeColor="Red" ErrorMessage="Please select code of conduct file to upload"></asp:CustomValidator>
						</div>
					</div>

					<div class="row spacedRow">
						<div class="col-md-5">
							<label><span style="color: red;">*</span>Select General Permission Slip file: </label>
							(<asp:LinkButton ID="lnkPermissionForm" runat="server" Text="Download Form" CausesValidation="false" OnClick="lnkPermissionForm_Click"></asp:LinkButton>)							
							<label style="font-size: smaller;">Allowed extensions (.doc,.docx,.rtf,.pdf,.jpeg,.gif) </label>
						</div>
						<div class="col-md-7">
							<asp:Label ID="lblPermissionSlip" runat="server"></asp:Label><br />
							<telerik:RadUpload Style="text-align: left !important; width: 250px !important;" ID="RaduploadPermissionSlip" runat="server" ControlObjectsVisibility="None" MaxFileInputsCount="1" AllowedFileExtensions=".doc,.docx,.rtf,.pdf,.jpeg,.gif"></telerik:RadUpload>
							<br />
							<asp:CustomValidator ID="CustomValidator2" runat="server" Display="Dynamic" ClientValidationFunction="validateRadUpload1" ForeColor="Red" ErrorMessage="Please select Permission slip file to upload"></asp:CustomValidator>
						</div>
					</div>

					<div class="row spacedRow">
						<div class="col-md-5">
							<label>Select Statement of parent/guardian Support file: </label>
							(<asp:LinkButton ID="lnkPGSupportForm" runat="server" Text="Download Form" CausesValidation="false" OnClick="lnkPGSupportForm_Click"></asp:LinkButton>)							
							<label style="font-size: smaller;">Allowed extensions (.doc,.docx,.rtf,.pdf,.jpeg,.gif) </label>
						</div>
						<div class="col-md-7">
							<asp:Label ID="lblParentGuardianSupport" runat="server"></asp:Label><br />
							<telerik:RadUpload Style="text-align: left !important; width: 250px !important;" ID="RaduploadParentGuardianSupport" runat="server" ControlObjectsVisibility="None" MaxFileInputsCount="1" AllowedFileExtensions=".doc,.docx,.rtf,.pdf,.jpeg,.gif"></telerik:RadUpload>
							<br />
							<asp:CustomValidator ID="CustomValidator3" runat="server" Display="Dynamic" ClientValidationFunction="validateRadUpload" ForeColor="Red" ErrorMessage="Please select Transcript file to upload"></asp:CustomValidator>
						</div>
					</div>

					<div class="row spacedRow">
						<div class="col-md-5">
							<label>Select Medical Form: </label>
							(<asp:LinkButton ID="lnkMedicalform" runat="server" Text="Download Form" CausesValidation="false" OnClick="lnkMedicalform_Click"></asp:LinkButton>)							
							<label style="font-size: smaller;">Allowed extensions (.doc,.docx,.rtf,.pdf,.jpeg,.gif) </label>
						</div>
						<div class="col-md-7">
							<asp:Label ID="lblMedicalForm" runat="server"></asp:Label><br />
							<telerik:RadUpload Style="text-align: left !important; width: 250px !important;" ID="RaduploadMedical" runat="server" ControlObjectsVisibility="None" MaxFileInputsCount="1" AllowedFileExtensions=".doc,.docx,.rtf,.pdf,.jpeg,.gif"></telerik:RadUpload>
							<br />
							<asp:CustomValidator ID="CustomValidator4" runat="server" Display="Dynamic" ClientValidationFunction="validateRadUpload" ForeColor="Red" ErrorMessage="Please select Transcript file to upload"></asp:CustomValidator>
						</div>
					</div>

					<div class="row spacedRow">
						<div class="col-md-5">
							<label>Select Copy of Insurance Form: </label>
							<label style="font-size: smaller;">Allowed extensions (.doc,.docx,.rtf,.pdf,.jpeg,.gif) </label>
						</div>
						<div class="col-md-7">
							<asp:Label ID="lblInsuranceForm" runat="server"></asp:Label><br />
							<telerik:RadUpload Style="text-align: left !important; width: 250px !important;" ID="RaduploadInsurance" runat="server" ControlObjectsVisibility="None" MaxFileInputsCount="1" AllowedFileExtensions=".doc,.docx,.rtf,.pdf,.jpeg,.gif"></telerik:RadUpload>
							<br />
							<asp:CustomValidator ID="CustomValidator5" runat="server" Display="Dynamic" ClientValidationFunction="validateRadUpload" ForeColor="Red" ErrorMessage="Please select Transcript file to upload"></asp:CustomValidator>
						</div>
					</div>
				</div>
			</div>
	</asp:Panel>

	<div class="rspForms col-lg-12">
		<div class="row">
			<div class="col-md-8 col-md-offset-3">
				<div class="col-md-12">
					<asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label><br />
					<br />
					<telerik:RadButton ID="btnPrevious" runat="server" CausesValidation="false" ButtonType="StandardButton" Text="Previous" Width="20%" OnClick="btnPrevious_Click"></telerik:RadButton>
					<telerik:RadButton ID="btnSave" runat="server" CausesValidation="false" ButtonType="StandardButton" Text="SAVE SECTION" Width="20%" OnClick="btnSave_Click"></telerik:RadButton>
					<telerik:RadButton ID="btnSubmit" runat="server" CausesValidation="false" ButtonType="StandardButton" Text="SUBMIT" Width="20%" OnClick="btnSubmit_Click"></telerik:RadButton>
				</div>
				<div class="row">
					<div class="col-md-8 col-md-offset-3">
						<div class="col-md-4">
							<label class="LabelInput">Step 2 of 2</label>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</asp:Content>
