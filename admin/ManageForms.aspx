<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="ManageForms.aspx.cs" Inherits="YleanaAdmin.ManageForms" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
	<h1>Application Forms Management</h1>
	<br />
	<br />
	<asp:Label ID="lblPersonalStatement" runat="server" Text="Student Personal Statement"></asp:Label>
	<br />
	<telerik:RadUpload ID="RaduploadPersonalStatement" runat="server" ControlObjectsVisibility="None" MaxFileInputsCount="1" AllowedFileExtensions=".doc,.docx,.rtf,.pdf,.jpeg,.gif"></telerik:RadUpload>
	<br />
	<br />
	<asp:Label ID="lblCodeConduct" runat="server" Text="Code of Conduct"></asp:Label>
	<br />
	<telerik:RadUpload ID="RaduploadCodeConduct" runat="server" ControlObjectsVisibility="None" MaxFileInputsCount="1" AllowedFileExtensions=".doc,.docx,.rtf,.pdf,.jpeg,.gif"></telerik:RadUpload>
	<br />
	<br />
	<asp:Label ID="lblPermissionSlip" runat="server" Text="General Permission Slip"></asp:Label>
	<br />
	<telerik:RadUpload ID="RaduploadPermissionSlip" runat="server" ControlObjectsVisibility="None" MaxFileInputsCount="1" AllowedFileExtensions=".doc,.docx,.rtf,.pdf,.jpeg,.gif"></telerik:RadUpload>
	<br />
	<br />
	<asp:Label ID="lblParentSupport" runat="server" Text="Statement of Guardian/Parent Support"></asp:Label>
	<br />
	<telerik:RadUpload ID="RaduploadParentSupport" runat="server" ControlObjectsVisibility="None" MaxFileInputsCount="1" AllowedFileExtensions=".doc,.docx,.rtf,.pdf,.jpeg,.gif"></telerik:RadUpload>
	<br />
	<br />
	<asp:Label ID="lblMedicalForm" runat="server" Text="Medical Form"></asp:Label>
	<br />
	<telerik:RadUpload ID="RaduploadMedicalForm" runat="server" ControlObjectsVisibility="None" MaxFileInputsCount="1" AllowedFileExtensions=".doc,.docx,.rtf,.pdf,.jpeg,.gif"></telerik:RadUpload>
	<br />
	<br />
	<asp:Label ID="lblPartnerReco" runat="server" Text="Partner Org Letter of Recommendation"></asp:Label>
	<br />
	<telerik:RadUpload ID="RaduploadPartnerReco" runat="server" ControlObjectsVisibility="None" MaxFileInputsCount="1" AllowedFileExtensions=".doc,.docx,.rtf,.pdf,.jpeg,.gif"></telerik:RadUpload>
	<br />
	<br />
	<telerik:RadButton ID="btnUpdate" ButtonType="StandardButton" runat="server" Text="Update" OnClick="btnUpdate_Click"></telerik:RadButton>
	<br />
	<br />
	<asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
	<br />
	<br />
</asp:Content>
