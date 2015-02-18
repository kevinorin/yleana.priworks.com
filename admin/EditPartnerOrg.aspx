<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="EditPartnerOrg.aspx.cs" Inherits="YleanaAdmin.EditPartnerOrg" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
	<h1>Update Partner Organization</h1>	
	<br />
	<asp:Label ID="lblOrgName" runat="server" Text="Name:"></asp:Label>	
	<asp:Label ID="lblName" runat="server" Text="Name"></asp:Label>
	<br /><br />
	<asp:Label ID="lblLocation" runat="server" Text="Location"></asp:Label>
	<br />
	<telerik:RadTextBox ID="txtLocation" runat="server" Width="600"></telerik:RadTextBox>
	<br />
	<asp:Label ID="lblAddress1" runat="server" Text="Address 1"></asp:Label>
	<br />
	<telerik:RadTextBox ID="txtAddress1" runat="server" Width="600"></telerik:RadTextBox>
	<br />
	<asp:Label ID="lblAddress2" runat="server" Text="Address 2"></asp:Label>
	<br />
	<telerik:RadTextBox ID="txtAddress2" runat="server" Width="600"></telerik:RadTextBox>
	<br />
	<asp:Label ID="lblCity" runat="server" Text="City"></asp:Label>
	<br />
	<telerik:RadTextBox ID="txtCity" runat="server" Width="600"></telerik:RadTextBox>
	<br />
	<asp:Label ID="lblState" runat="server" Text="State"></asp:Label>
	<br />
	<telerik:RadComboBox ID="ddlState" runat="server" EmptyMessage="Select State" Height="100px">
		<Items>
			<telerik:RadComboBoxItem Value="" Text="Select State" />
			<telerik:RadComboBoxItem Value="AL" Text="Alabama" />
			<telerik:RadComboBoxItem Value="AK" Text="Alaska" />
			<telerik:RadComboBoxItem Value="AZ" Text="Arizona" />
			<telerik:RadComboBoxItem Value="AR" Text="Arkansas" />
			<telerik:RadComboBoxItem Value="CA" Text="California" />
			<telerik:RadComboBoxItem Value="CO" Text="Colorado" />
			<telerik:RadComboBoxItem Value="CT" Text="Connecticut" />
			<telerik:RadComboBoxItem Value="DC" Text="District of Columbia" />
			<telerik:RadComboBoxItem Value="DE" Text="Delaware" />
			<telerik:RadComboBoxItem Value="FL" Text="Florida" />
			<telerik:RadComboBoxItem Value="GA" Text="Georgia" />
			<telerik:RadComboBoxItem Value="HI" Text="Hawaii" />
			<telerik:RadComboBoxItem Value="ID" Text="Idaho" />
			<telerik:RadComboBoxItem Value="IL" Text="Illinois" />
			<telerik:RadComboBoxItem Value="IN" Text="Indiana" />
			<telerik:RadComboBoxItem Value="IA" Text="Iowa" />
			<telerik:RadComboBoxItem Value="KS" Text="Kansas" />
			<telerik:RadComboBoxItem Value="KY" Text="Kentucky" />
			<telerik:RadComboBoxItem Value="LA" Text="Louisiana" />
			<telerik:RadComboBoxItem Value="ME" Text="Maine" />
			<telerik:RadComboBoxItem Value="MD" Text="Maryland" />
			<telerik:RadComboBoxItem Value="MA" Text="Massachusetts" />
			<telerik:RadComboBoxItem Value="MI" Text="Michigan" />
			<telerik:RadComboBoxItem Value="MN" Text="Minnesota" />
			<telerik:RadComboBoxItem Value="MS" Text="Mississippi" />
			<telerik:RadComboBoxItem Value="MO" Text="Missouri" />
			<telerik:RadComboBoxItem Value="MT" Text="Montana" />
			<telerik:RadComboBoxItem Value="NE" Text="Nebraska" />
			<telerik:RadComboBoxItem Value="NV" Text="Nevada" />
			<telerik:RadComboBoxItem Value="NH" Text="New Hampshire" />
			<telerik:RadComboBoxItem Value="NJ" Text="New Jersey" />
			<telerik:RadComboBoxItem Value="NM" Text="New Mexico" />
			<telerik:RadComboBoxItem Value="NY" Text="New York" />
			<telerik:RadComboBoxItem Value="NC" Text="North Carolina" />
			<telerik:RadComboBoxItem Value="ND" Text="North Dakota" />
			<telerik:RadComboBoxItem Value="OH" Text="Ohio" />
			<telerik:RadComboBoxItem Value="OK" Text="Oklahoma" />
			<telerik:RadComboBoxItem Value="OR" Text="Oregon" />
			<telerik:RadComboBoxItem Value="PA" Text="Pennsylvania" />
			<telerik:RadComboBoxItem Value="RI" Text="Rhode Island" />
			<telerik:RadComboBoxItem Value="SC" Text="South Carolina" />
			<telerik:RadComboBoxItem Value="SD" Text="South Dakota" />
			<telerik:RadComboBoxItem Value="TN" Text="Tennessee" />
			<telerik:RadComboBoxItem Value="TX" Text="Texas" />
			<telerik:RadComboBoxItem Value="UT" Text="Utah" />
			<telerik:RadComboBoxItem Value="VT" Text="Vermont" />
			<telerik:RadComboBoxItem Value="VA" Text="Virginia" />
			<telerik:RadComboBoxItem Value="WA" Text="Washington" />
			<telerik:RadComboBoxItem Value="WV" Text="West Virginia" />
			<telerik:RadComboBoxItem Value="WI" Text="Wisconsin" />
			<telerik:RadComboBoxItem Value="WY" Text="Wyoming" />
		</Items>
	</telerik:RadComboBox>
	<br /><br />
	<asp:Label ID="lblZip" runat="server" Text="Zip"></asp:Label>
	<br />
	<telerik:RadTextBox ID="txtZip" runat="server" Width="200"></telerik:RadTextBox>
	<br />
	<asp:Label ID="lblContact1Name" runat="server" Text="Contact One Name"></asp:Label>
	<br />
	<telerik:RadTextBox ID="txtContact1Name" runat="server" Width="600"></telerik:RadTextBox>
	<br />		
	<asp:Label ID="lblContact1Email" runat="server" Text="Contact One Email"></asp:Label>
	<br />
	<telerik:RadTextBox ID="txtContactOneEmail" runat="server" Width="600"></telerik:RadTextBox>
	<br />
	<asp:Label ID="lblContactOnePhone" runat="server" Text="Contact One Mobile Phone"></asp:Label>
	<br />
	<telerik:RadMaskedTextBox ID="txtContactOnePhone" runat="server" Mask="(###) ### - ####"></telerik:RadMaskedTextBox>
	<br />	
	<asp:Label ID="lblContact1WorkPhone" runat="server" Text="Contact One Work Phone"></asp:Label>
	<br />
	<telerik:RadMaskedTextBox ID="txtContactOneWorkPhone" runat="server" Mask="(###) ### - ####"></telerik:RadMaskedTextBox>
	<br />
	<asp:Label ID="lblContact2Name" runat="server" Text="Contact Two Name"></asp:Label>
	<br />
	<telerik:RadTextBox ID="txtContact2Name" runat="server" Width="600"></telerik:RadTextBox>
	<br />			
	<asp:Label ID="lblContact2Email" runat="server" Text="Contact Two Email"></asp:Label>
	<br />
	<telerik:RadTextBox ID="txtContactTwoEmail" runat="server" Width="600"></telerik:RadTextBox>
	<br />	
	<asp:Label ID="lblContactTwoPhone" runat="server" Text="Contact Two Mobile Phone"></asp:Label>
	<br />
	<telerik:RadMaskedTextBox ID="txtContactTwoPhone" runat="server" Mask="(###) ### - ####"></telerik:RadMaskedTextBox>
	<br />	
	<asp:Label ID="lblContact2WorkPhone" runat="server" Text="Contact Two Work Phone"></asp:Label>
	<br />
	<telerik:RadMaskedTextBox ID="txtContactTwoWorkPhone" runat="server" Mask="(###) ### - ####"></telerik:RadMaskedTextBox>
	<br />
	<br />
	<asp:Label ID="lblNotes" runat="server" Text="Notes"></asp:Label>
	<br />
	<telerik:RadTextBox ID="txtNotes" runat="server" TextMode="MultiLine" Rows="10" Width="600"></telerik:RadTextBox>
	<br />
	<br />
	<asp:CheckBox ID="chkActive" runat="server" Text="Active" />
	<br />
	<br />
	<telerik:RadButton ID="btnUpdateOrg" ButtonType="StandardButton" runat="server" Text="Update" OnClick="btnUpdateOrg_Click"></telerik:RadButton>
	<br />
	<br />
	<asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
	<br />
	<br />
</asp:Content>
