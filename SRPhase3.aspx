<%@ Page Title="" Language="C#" MasterPageFile="~/studentMaster.Master" AutoEventWireup="true" CodeBehind="SRPhase3.aspx.cs" Inherits="yleana.SRPhase3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        function validateRadUpload(source, e) {
            e.IsValid = false;
            var upload = $find("<%= RadUploadConduct.ClientID %>");
            var inputs = upload.getFileInputs();
            for (var i = 0; i < inputs.length; i++) {
                if (inputs[i].value != "" && upload.isExtensionValid(inputs[i].value)) {
                    e.IsValid = true;
                    break;
                }
            }
        }
        function validateRadUpload1(source, e) {
            e.IsValid = false;
            var upload = $find("<%= RadUploadPermissionSlip.ClientID %>");
            var inputs = upload.getFileInputs();
            for (var i = 0; i < inputs.length; i++) {
                if (inputs[i].value != "" && upload.isExtensionValid(inputs[i].value)) {
                    e.IsValid = true;
                    break;
                }
            }
        }
        function validateRadUpload2(source, e) {
            e.IsValid = false;
            var upload = $find("<%= RadUploadParentSupport.ClientID %>");
            var inputs = upload.getFileInputs();
            for (var i = 0; i < inputs.length; i++) {
                if (inputs[i].value != "" && upload.isExtensionValid(inputs[i].value)) {
                    e.IsValid = true;
                    break;
                }
            }
        }
        function validateRadUpload3(source, e) {
            e.IsValid = false;
            var upload = $find("<%= RadUploadMedicalForm.ClientID %>");
            var inputs = upload.getFileInputs();
            for (var i = 0; i < inputs.length; i++) {
                if (inputs[i].value != "" && upload.isExtensionValid(inputs[i].value)) {
                    e.IsValid = true;
                    break;
                }
            }
        }
        function validateRadUpload4(source, e) {
            e.IsValid = false;
            var upload = $find("<%= RadUploadInsurance.ClientID %>");
            var inputs = upload.getFileInputs();
            for (var i = 0; i < inputs.length; i++) {
                if (inputs[i].value != "" && upload.isExtensionValid(inputs[i].value)) {
                    e.IsValid = true;
                    break;
                }
            }
        }                
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="text-align: center; border: solid 0px;">
        <div style="text-align: right; width: 800px; height:400px; border: solid 0px;">
            <div>
                <h1 style="font-weight: 600; font-style: italic; ">Please upload the below required documents</h1>
                <table id="Table1" width="500px" border="0" align="right">
                    <tr>
                        <td style="width: 250px">
                            <label class="LabelInput">Select Code of Conduct Form: </label>
                        </td>
                        <td style="width: 250px !important;">
                            <telerik:RadUpload Style="text-align: right !important; width: 250px !important;" ID="RadUploadConduct" runat="server" ControlObjectsVisibility="None" MaxFileInputsCount="1" AllowedFileExtensions=".pdf,.jpeg,.gif"></telerik:RadUpload>
                            <asp:CustomValidator ID="CustomValidator1" runat="server" Display="Dynamic"  ClientValidationFunction="validateRadUpload" ForeColor="Red" ErrorMessage="Please select Code of Conduct Form to upload" ></asp:CustomValidator>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 250px">
                            <label class="LabelInput">Select Permision Slip Form : </label>
                        </td>
                        <td style="width: 250px !important;">
                            <telerik:RadUpload Style="text-align: right !important; width: 250px !important;" ID="RadUploadPermissionSlip" runat="server" ControlObjectsVisibility="None" MaxFileInputsCount="1" AllowedFileExtensions=".pdf,.jpeg,.gif"></telerik:RadUpload>
                            <asp:CustomValidator ID="CustomValidator2" runat="server"  Display="Dynamic" ClientValidationFunction="validateRadUpload1" ForeColor="Red" ErrorMessage="Please select Permission Slip Form to upload" ></asp:CustomValidator>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 250px">
                            <label class="LabelInput">Select Parent/Guardian Support Form : </label>
                        </td>
                        <td style="width: 250px !important;">
                            <telerik:RadUpload Style="text-align: right !important; width: 250px !important;" ID="RadUploadParentSupport" runat="server" ControlObjectsVisibility="None" MaxFileInputsCount="1" AllowedFileExtensions=".pdf,.jpeg,.gif"></telerik:RadUpload>
                            <asp:CustomValidator ID="CustomValidator3" runat="server"  Display="Dynamic" ClientValidationFunction="validateRadUpload2" ForeColor="Red" ErrorMessage="Please select Parent/Guardian Support Form to upload" ></asp:CustomValidator>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 250px">
                            <label class="LabelInput">Select Medical Form : </label>
                        </td>
                        <td style="width: 250px !important;">
                            <telerik:RadUpload Style="text-align: right !important; width: 250px !important;" ID="RadUploadMedicalForm" runat="server" ControlObjectsVisibility="None" MaxFileInputsCount="1" AllowedFileExtensions=".pdf,.jpeg,.gif"></telerik:RadUpload>
                            <asp:CustomValidator ID="CustomValidator4" runat="server" Display="Dynamic" ClientValidationFunction="validateRadUpload3" ForeColor="Red" ErrorMessage="Please select Medical Form to upload" ></asp:CustomValidator>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 250px">
                            <label class="LabelInput">Select Insurance Card : </label>
                        </td>
                        <td style="width: 250px !important;">
                            <telerik:RadUpload Style="text-align: right !important; width: 250px !important;" ID="RadUploadInsurance" runat="server" ControlObjectsVisibility="None" MaxFileInputsCount="1" AllowedFileExtensions=".pdf,.jpeg,.gif"></telerik:RadUpload>
                            <asp:CustomValidator ID="CustomValidator5" runat="server"  Display="Dynamic" ClientValidationFunction="validateRadUpload4" ForeColor="Red" ErrorMessage="Please select Insurance Card to upload" ></asp:CustomValidator>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="text-align: center">
                            <asp:Button runat="server" ID="Button2" Text="Upload" CausesValidation="true" OnClick="btnUpload_Click" />
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
    </div>
</asp:Content>
