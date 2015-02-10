<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="ManageUser.aspx.cs" Inherits="YleanaAdmin.ManageUser" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
		<h1>Manage Users</h1>
	<telerik:RadButton ID="btnAddUser" ButtonType="LinkButton" runat="server" Text="Add New User" NavigateUrl="AddUser.aspx"></telerik:RadButton>&nbsp;    
	<br /><br />
	<telerik:RadGrid ID="grdManageUser" runat="server" AllowPaging="True" 
		AutoGenerateColumns="False" AllowSorting="True" PageSize="20" OnNeedDataSource="grdManageUser_NeedDataSource" AllowFilteringByColumn="true" MasterTableView-AllowPaging="true" MasterTableView-AllowSorting="true" MasterTableView-AllowFilteringByColumn="true">
		<GroupingSettings CaseSensitive="false" />
		<MasterTableView AutoGenerateColumns="False" DataKeyNames="idUser" >
			<Columns>
					<telerik:GridBoundColumn UniqueName="LastName" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
					SortExpression="LastName" HeaderText="Last Name" DataField="LastName">
				</telerik:GridBoundColumn>
					<telerik:GridBoundColumn UniqueName="FirstName" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
					SortExpression="FirstName" HeaderText="First Name" DataField="FirstName">
			</telerik:GridBoundColumn>			
				<telerik:GridBoundColumn UniqueName="EmailAddress" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
					SortExpression="EmailAddress" HeaderText="Email Address" DataField="EmailAddress">
				</telerik:GridBoundColumn>
				<telerik:GridBoundColumn UniqueName="OrgName" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
					SortExpression="ClientName" HeaderText="Organization Name" DataField="OrgName">
				</telerik:GridBoundColumn>									
				<telerik:GridBoundColumn UniqueName="IsActive" AutoPostBackOnFilter="true"
					SortExpression="IsActive" HeaderText="Active" DataField="IsActive">
				</telerik:GridBoundColumn>				
				<telerik:GridDateTimeColumn UniqueName="DtLastLogin" DataType="System.DateTime" AutoPostBackOnFilter="true" ItemStyle-Width="150"
					SortExpression="DtLastLogin" HeaderText="Last Login" DataField="DtLastLogin" DataFormatString="{0:MMM dd, yyyy HH:mm}" PickerType="DatePicker">
				</telerik:GridDateTimeColumn>				
				<telerik:GridHyperLinkColumn UniqueName="Edit" DataNavigateUrlFormatString="EditUser.aspx?uid={0}" DataNavigateUrlFields="idUser" AllowFiltering="false" AllowSorting="false" ItemStyle-Font-Underline="true" Text="Edit"></telerik:GridHyperLinkColumn>				
			<%--	<telerik:GridButtonColumn UniqueName="UnLock" ButtonType="PushButton" CommandName="UnLockUser" Text="UnLock" >
				</telerik:GridButtonColumn>
				<telerik:GridButtonColumn UniqueName="DisableUser" ConfirmText="Disable User?" CommandName="DisableUser" ButtonType="PushButton" Text="Disable">
				</telerik:GridButtonColumn>--%>
			</Columns>
		</MasterTableView>
	</telerik:RadGrid>	
</asp:Content>
