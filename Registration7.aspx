<%@ Page Title="" Language="C#" MasterPageFile="~/StudentMaster.Master" AutoEventWireup="true" CodeBehind="Registration7.aspx.cs" Inherits="yleana.Registration7" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        function StandardConfirm(sender, args) {
            args.set_cancel(!window.confirm("Please Check all the details before submit!, Once submitted you can not change anything."));
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
                        <h1>Form to submit </h1>
                        <p>When you upload a form, it will overwrite any existing forms: That means that if you've already uploaded your Code of Conduct, and you want to change something about it, just upload it again and it will replace what's already there. </p>
                        <p>That also means, though, that if you upload something that's already there, what WAS there will be gone.</p>
                    </div>
                </div>

                <div class="row spacedRow">
                    <div class="col-md-4">
                        <label class="LabelInput"><span style="color: red;">*</span>Select Code of Conduct file : </label><br />
                        <label style="font-size: smaller;">Allowed extensions (.doc,.docx,.rtf,.pdf,.jpeg,.gif) </label>
                    </div>
                    <div class="col-md-8">
                        <asp:Label ID="lblUploadedCodeofConduct" runat="server" style="padding-left:300px"></asp:Label>
                        <telerik:RadUpload Style="text-align: left !important; width: 250px !important;" ID="RaduploadCodeOfConduct" runat="server" ControlObjectsVisibility="None" MaxFileInputsCount="1" AllowedFileExtensions=".doc,.docx,.rtf,.pdf,.jpeg,.gif"></telerik:RadUpload><br />
                        <asp:CustomValidator ID="CustomValidator1" runat="server" Display="Dynamic" ClientValidationFunction="validateRadUpload" ForeColor="Red" ErrorMessage="Please select code of conduct file to upload"></asp:CustomValidator>
                    </div>
                </div>

                <div class="row spacedRow">
                    <div class="col-md-4">
                        <label class="LabelInput"><span style="color: red;">*</span>Select General Permission Slip file : </label>
                        <br /><asp:Label ID="lblPermissionSlip" runat="server" style="padding-left:300px"></asp:Label>
                    </div>
                    <div class="col-md-8">
                        <telerik:RadUpload Style="text-align: left !important; width: 250px !important;" ID="RaduploadPermissionSlip" runat="server" ControlObjectsVisibility="None" MaxFileInputsCount="1" AllowedFileExtensions=".doc,.docx,.rtf,.pdf,.jpeg,.gif"></telerik:RadUpload>
                    </div>
                </div>

                <div class="row spacedRow">
                    <div class="col-md-4">
                        <label style="font-size: smaller;">Allowed extensions (.doc,.docx,.rtf,.pdf,.jpeg,.gif) </label>
                        <br />
                        <asp:CustomValidator ID="CustomValidator2" runat="server" Display="Dynamic" ClientValidationFunction="validateRadUpload1" ForeColor="Red" ErrorMessage="Please select Permission slip file to upload"></asp:CustomValidator>
                    </div>
                </div>

                <div class="row spacedRow">
                    <div class="col-md-4">
                        <label class="LabelInput">Select Statement of parent/guardian Support file : </label>
                        <br /><asp:Label ID="lblParentGuardianSupport" runat="server" style="padding-left:300px"></asp:Label>
                    </div>
                    <div class="col-md-8">
                        <telerik:RadUpload Style="text-align: left !important; width: 250px !important;" ID="RaduploadParentGuardianSupport" runat="server" ControlObjectsVisibility="None" MaxFileInputsCount="1" AllowedFileExtensions=".doc,.docx,.rtf,.pdf,.jpeg,.gif"></telerik:RadUpload>
                    </div>
                </div>

                <div class="row spacedRow">
                    <div class="col-md-4">
                        <label style="font-size: smaller;">Allowed extensions (.doc,.docx,.rtf,.pdf,.jpeg,.gif) </label>
                    </div>
                    <div class="col-md-8">
                        <asp:CustomValidator ID="CustomValidator3" runat="server" Display="Dynamic" ClientValidationFunction="validateRadUpload" ForeColor="Red" ErrorMessage="Please select Transcript file to upload"></asp:CustomValidator>
                    </div>
                </div>

                <div class="row spacedRow">
                    <div class="col-md-4">
                        <label class="LabelInput">Select Medical Form : </label>
                        <br /><asp:Label ID="lblMedicalForm" runat="server" style="padding-left:300px"></asp:Label>
                    </div>
                    <div class="col-md-8">
                        <telerik:RadUpload Style="text-align: left !important; width: 250px !important;" ID="RaduploadMedical" runat="server" ControlObjectsVisibility="None" MaxFileInputsCount="1" AllowedFileExtensions=".doc,.docx,.rtf,.pdf,.jpeg,.gif"></telerik:RadUpload>
                    </div>
                </div>

                <div class="row spacedRow">
                    <div class="col-md-4">
                        <label style="font-size: smaller;">Allowed extensions (.doc,.docx,.rtf,.pdf,.jpeg,.gif) </label>
                    </div>
                    <div class="col-md-8">
                        <asp:CustomValidator ID="CustomValidator4" runat="server" Display="Dynamic" ClientValidationFunction="validateRadUpload" ForeColor="Red" ErrorMessage="Please select Transcript file to upload"></asp:CustomValidator>
        </td>
    </tr>
    <tr>
        <td style="text-align: left;">
            <label class="LabelInput">Select Copy of Insurance Form : </label>
            <br /><asp:Label ID="lblInsuranceForm" runat="server" style="padding-left:300px"></asp:Label><br />
            <telerik:RadUpload Style="text-align: left !important; width: 250px !important;" ID="RaduploadInsurance" runat="server" ControlObjectsVisibility="None" MaxFileInputsCount="1" AllowedFileExtensions=".doc,.docx,.rtf,.pdf,.jpeg,.gif"></telerik:RadUpload>
            <label style="font-size: smaller;">Allowed extensions (.doc,.docx,.rtf,.pdf,.jpeg,.gif) </label>
            <br />
            <asp:CustomValidator ID="CustomValidator5" runat="server" Display="Dynamic" ClientValidationFunction="validateRadUpload" ForeColor="Red" ErrorMessage="Please select Transcript file to upload"></asp:CustomValidator>
        </td>
    </tr>
    <tr>
        <td colspan="2" style="text-align: center">
            <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
        </td>
    </tr>
</table>
</asp:Panel>
<table border="0" align="center" style="text-align: center; width: 50%; padding-left: 20px; margin-top: 20px; border: 0px solid">
    <tr>
        <td style="text-align:center;padding-left:0px;">
            <telerik:RadButton ID="btnPrevious" runat="server" CausesValidation="false" ButtonType="StandardButton" Text="Previous" Width="20%" OnClick="btnPrevious_Click"></telerik:RadButton>
            <telerik:RadButton ID="btnSave" runat="server" CausesValidation="false" ButtonType="StandardButton" Text="SAVE SECTION" Width="20%" OnClick="btnSave_Click"></telerik:RadButton>
            <telerik:RadButton ID="btnSubmit" runat="server" CausesValidation="false" ButtonType="StandardButton" Text="SUBMIT" Width="20%" OnClientClicking="StandardConfirm" OnClick="btnSubmit_Click"></telerik:RadButton>
        </td>
    </tr>
    <tr>
            <td>
                <br />
                <label class="LabelInput">Step 2 of 2</label>
            </td>
        </tr>
    </table>

</asp:Content>
