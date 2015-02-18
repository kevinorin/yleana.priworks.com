<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="ManageTag.aspx.cs" Inherits="YleanaAdmin.ManageTag" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
		<h1>Manage Tags</h1>
	<telerik:RadGrid ID="grdManageTag" runat="server" AllowPaging="True" 
		AutoGenerateColumns="False" AllowSorting="True" PageSize="20" OnNeedDataSource="grdManageTag_NeedDataSource" AllowFilteringByColumn="true" MasterTableView-AllowPaging="true" MasterTableView-AllowSorting="true" MasterTableView-AllowFilteringByColumn="true">
		<GroupingSettings CaseSensitive="false" />
		<MasterTableView AutoGenerateColumns="False" DataKeyNames="idTag" >
			<Columns>
					<telerik:GridBoundColumn UniqueName="TagName" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
					SortExpression="TagName" HeaderText="Tag Name" DataField="TagName">
				</telerik:GridBoundColumn>											
				<telerik:GridBoundColumn UniqueName="IsActive" AutoPostBackOnFilter="true"
					SortExpression="IsActive" HeaderText="Active" DataField="IsActive">
				</telerik:GridBoundColumn>								
				<telerik:GridHyperLinkColumn UniqueName="Edit" DataNavigateUrlFormatString="EditTag.aspx?tid={0}" DataNavigateUrlFields="idTag" AllowFiltering="false" AllowSorting="false" ItemStyle-Font-Underline="true" Text="Edit"></telerik:GridHyperLinkColumn>		
			</Columns>
		</MasterTableView>
	</telerik:RadGrid>	
</asp:Content>
