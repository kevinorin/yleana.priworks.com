<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="ManageDates.aspx.cs" Inherits="YleanaAdmin.ManageDates" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
	<h1>Application Dates Management</h1>
	<table>
		<tr>
			<td>
				Application Open
			</td>
			<td>
				<telerik:RadDatePicker ID="dtAppOpen" runat="server"></telerik:RadDatePicker>
			</td>
		</tr>
		<tr>
			<td>
				Application Close
			</td>
			<td>
				<telerik:RadDatePicker ID="dtAppClose" runat="server"></telerik:RadDatePicker>
			</td>
		</tr>
		<tr>
			<td>
				Normal Student Notification
			</td>
			<td>
				<telerik:RadDatePicker ID="dtNormalNotification" runat="server"></telerik:RadDatePicker>
			</td>
		</tr>
		<tr>
			<td>
				Phase3 Open
			</td>
			<td>
				<telerik:RadDatePicker ID="dtPhase3Open" runat="server"></telerik:RadDatePicker>
			</td>
		</tr>
		<tr>
			<td>
				Normal Student Response
			</td>
			<td>
				<telerik:RadDatePicker ID="dtNormalResponse" runat="server"></telerik:RadDatePicker>
			</td>
		</tr>
		<tr>
			<td>
				Waitlist Student Notification
			</td>
			<td>
				<telerik:RadDatePicker ID="dtWaitlistNotification" runat="server"></telerik:RadDatePicker>
			</td>
		</tr>
		<tr>
			<td>
				Waitlist Student Response
			</td>
			<td>
				<telerik:RadDatePicker ID="dtWaitlistResponse" runat="server"></telerik:RadDatePicker>
			</td>
		</tr>
		<tr>
			<td>
				Phase3 Close
			</td>
			<td>
				<telerik:RadDatePicker ID="dtPhase3Close" runat="server"></telerik:RadDatePicker>
			</td>
		</tr>
		<tr>
			<td>
				Session One Start Date
			</td>
			<td>
				<telerik:RadDatePicker ID="dtSession1Start" runat="server"></telerik:RadDatePicker>
			</td>
		</tr>
		<tr>
			<td>
				Session One End Date
			</td>
			<td>
				<telerik:RadDatePicker ID="dtSession1End" runat="server"></telerik:RadDatePicker>
			</td>
		</tr>
		<tr>
			<td>
				Session Two Start Date
			</td>
			<td>
				<telerik:RadDatePicker ID="dtSession2Start" runat="server"></telerik:RadDatePicker>
			</td>
		</tr>
		<tr>
			<td>
				Session Two End Date
			</td>
			<td>
				<telerik:RadDatePicker ID="dtSession2End" runat="server"></telerik:RadDatePicker>
			</td>
		</tr>
	</table>
		<br />
	<br />
	<telerik:RadButton ID="btnUpdate" ButtonType="StandardButton" runat="server" Text="Update" OnClick="btnUpdate_Click"></telerik:RadButton>
	<br />
	<br />
	<asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
	<br />
	<br /> 
</asp:Content>
