<%@ Page Title="" Language="C#" MaintainScrollPositionOnPostback="true" MasterPageFile="~/studentMaster.Master" AutoEventWireup="true" CodeBehind="Registration5.aspx.cs" Inherits="yleana.Registration5" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        function ShowAlert(sender, args) {
            args.set_cancel(!window.confirm("Please Check all the details before submit!, Once submitted you can not change anything."));
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
    <table border="0" align="center" style="text-align: center; width: 50%; padding-left: 20px; margin-top: 20px; border: 0px solid">
        <tr>
            <td style="text-align: left;">
                <h1 style="font-weight: 600; font-style: italic;">Form to submit </h1>
            </td>
        </tr>
        <tr>
            <td style="text-align: left;">
                <label class="LabelInput">Select Transcript file : </label>
                <span style="color: red;">*</span><br />
                <telerik:RadUpload Style="text-align: left !important; width: 250px !important;" ID="RaduploadTranscript" runat="server" ControlObjectsVisibility="None" MaxFileInputsCount="1" AllowedFileExtensions=".doc,.docx,.rtf,.pdf,.jpeg,.gif"></telerik:RadUpload>
                <label style="font-size: smaller;">Allowed extensions (.doc,.docx,.rtf,.pdf,.jpeg,.gif) </label>
                <br />
                <asp:CustomValidator ID="CustomValidator1" runat="server" Display="Dynamic" ClientValidationFunction="validateRadUpload" ForeColor="Red" ErrorMessage="Please select Transcript file to upload"></asp:CustomValidator>
            </td>
        </tr>
        <tr>
            <td style="text-align: left;">
                <label class="LabelInput">Select Personal Statement : </label>
                <span style="color: red;">*</span><br />
                <telerik:RadUpload Style="text-align: left !important; width: 250px !important;" ID="RadUploadPersonalStatement" runat="server" ControlObjectsVisibility="None" MaxFileInputsCount="1" AllowedFileExtensions=".doc,.docx,.rtf,.pdf,.jpeg,.gif"></telerik:RadUpload>
                <label style="font-size: smaller;">Allowed extensions (.doc,.docx,.rtf,.pdf,.jpeg,.gif) </label>
                <br />
                <asp:CustomValidator ID="CustomValidator2" runat="server" Display="Dynamic" ClientValidationFunction="validateRadUpload1" ForeColor="Red" ErrorMessage="Please select Personal Statement file to upload"></asp:CustomValidator>
            </td>
        </tr>
        <tr>
            <td style="text-align: left;">
                <label class="LabelInput">Select Resume (Optional) : </label>
                <br />
                <telerik:RadUpload Style="text-align: left !important; width: 250px !important;" ID="RadUpload1" runat="server" ControlObjectsVisibility="None" MaxFileInputsCount="1" AllowedFileExtensions=".doc,.docx,.rtf,.pdf,.jpeg,.gif"></telerik:RadUpload>
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
                <telerik:RadButton ID="btnSaveNext" runat="server" CausesValidation="false" ButtonType="StandardButton" Text="SUBMIT" Width="20%" OnClick="btnSaveNext_Click"></telerik:RadButton>
            </td>
        </tr>
    </table>
</asp:Content>
