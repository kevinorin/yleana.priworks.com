<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="ManagePartnerOrg.aspx.cs" Inherits="YleanaAdmin.ManagePartnerOrg" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
		<h1>Manage Partner Organization</h1>
	<telerik:RadGrid ID="grdManageOrg" runat="server" AllowPaging="True" 
		AutoGenerateColumns="False" AllowSorting="True" PageSize="20" OnNeedDataSource="grdManageOrg_NeedDataSource" AllowFilteringByColumn="true" MasterTableView-AllowPaging="true" MasterTableView-AllowSorting="true" MasterTableView-AllowFilteringByColumn="true">
		<GroupingSettings CaseSensitive="false" />
		<MasterTableView AutoGenerateColumns="False" DataKeyNames="idPartner" >
			<Columns>
				<telerik:GridBoundColumn UniqueName="PartnerOrgName" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
					SortExpression="PartnerOrgName" HeaderText="Name" DataField="PartnerOrgName">
				</telerik:GridBoundColumn>											
				<telerik:GridBoundColumn UniqueName="Location" AutoPostBackOnFilter="true"
					SortExpression="Location" HeaderText="Location" DataField="Location">
				</telerik:GridBoundColumn>
				<telerik:GridBoundColumn UniqueName="ContactOneName" AutoPostBackOnFilter="true"
					SortExpression="ContactOneName" HeaderText="Contact One Name" DataField="ContactOneName">
				</telerik:GridBoundColumn>
				<telerik:GridBoundColumn UniqueName="ContactOneMobilePhone" AutoPostBackOnFilter="true"
					SortExpression="ContactOneMobilePhone" HeaderText="Contact One Mobile Phone" DataField="ContactOneMobilePhone">
				</telerik:GridBoundColumn>
				<telerik:GridBoundColumn UniqueName="ContactOneWorkPhone" AutoPostBackOnFilter="true"
					SortExpression="ContactOneWorkPhone" HeaderText="Contact One Work Phone" DataField="ContactOneWorkPhone">
				</telerik:GridBoundColumn>							
				<telerik:GridHyperLinkColumn UniqueName="Edit" DataNavigateUrlFormatString="EditPartnerOrg.aspx?id={0}" DataNavigateUrlFields="idPartner" AllowFiltering="false" AllowSorting="false" ItemStyle-Font-Underline="true" Text="Edit"></telerik:GridHyperLinkColumn>		
			</Columns>
		</MasterTableView>
	</telerik:RadGrid>	
</asp:Content>
