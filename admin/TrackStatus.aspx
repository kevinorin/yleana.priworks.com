<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="TrackStatus.aspx.cs" Inherits="YleanaAdmin.TrackStatus" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
	<h1>Track Status</h1>
	<telerik:RadGrid ID="grdTrackStatus" runat="server" AllowPaging="True" 
		AutoGenerateColumns="False" AllowSorting="True" PageSize="20" OnNeedDataSource="grdTrackStatus_NeedDataSource" AllowFilteringByColumn="true" MasterTableView-AllowPaging="true" MasterTableView-AllowSorting="true" MasterTableView-AllowFilteringByColumn="true">
		<GroupingSettings CaseSensitive="false" />
		<MasterTableView AutoGenerateColumns="False">
			<Columns>
				<telerik:GridBoundColumn UniqueName="FirstName" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
					SortExpression="FirstName" HeaderText="First Name" DataField="FirstName">
				</telerik:GridBoundColumn>											
				<telerik:GridBoundColumn UniqueName="LastName" AutoPostBackOnFilter="true"
					SortExpression="LastName" HeaderText="Last Name" DataField="LastName">
				</telerik:GridBoundColumn>								
				<telerik:GridBoundColumn UniqueName="EmailAddress" AutoPostBackOnFilter="true"
					SortExpression="EmailAddress" HeaderText="Email Address" DataField="EmailAddress">
				</telerik:GridBoundColumn>
				<telerik:GridBoundColumn UniqueName="FromStatus" AutoPostBackOnFilter="true"
					SortExpression="FromStatus" HeaderText="From Status" DataField="FromStatus">
				</telerik:GridBoundColumn>
					<telerik:GridBoundColumn UniqueName="ToStatus" AutoPostBackOnFilter="true"
					SortExpression="ToStatus" HeaderText="To Status" DataField="ToStatus">
				</telerik:GridBoundColumn>		
				<telerik:GridBoundColumn UniqueName="Contributor" AutoPostBackOnFilter="true"
					SortExpression="Contributor" HeaderText="Contributor" DataField="Contributor">
				</telerik:GridBoundColumn>	
				<telerik:GridDateTimeColumn UniqueName="dtAction" DataType="System.DateTime" AutoPostBackOnFilter="true" ItemStyle-Width="150"
					SortExpression="dtAction" HeaderText="Date/Time" DataField="dtAction" DataFormatString="{0:MMM dd, yyyy HH:mm}" PickerType="DatePicker">
				</telerik:GridDateTimeColumn>					
			</Columns>
		</MasterTableView>
	</telerik:RadGrid>	
</asp:Content>
