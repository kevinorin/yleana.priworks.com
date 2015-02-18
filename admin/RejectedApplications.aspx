<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="RejectedApplications.aspx.cs" Inherits="YleanaAdmin.RejectedApplications" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Rejected Applications</h1>
	<%--<telerik:RadButton ID="btnAddUser" ButtonType="LinkButton" runat="server" Text="Add New User" NavigateUrl="AddUser.aspx"></telerik:RadButton>&nbsp;--%> 
    <telerik:RadButton ID="btnExportAll" ButtonType="LinkButton" runat="server" Text="Export Data" OnClick="btnExportAll_Click" ></telerik:RadButton>&nbsp;   
	<br /><br />
	<telerik:RadGrid ID="grdRejectedApplication" runat="server" AllowPaging="True" 
		AutoGenerateColumns="False" AllowSorting="True" PageSize="100" OnNeedDataSource="grdManageUser_NeedDataSource" AllowFilteringByColumn="true" MasterTableView-AllowPaging="true" MasterTableView-AllowSorting="true" MasterTableView-AllowFilteringByColumn="true">
		<GroupingSettings CaseSensitive="false" />
		<MasterTableView AutoGenerateColumns="False" DataKeyNames="idApplication" >
			<Columns>
				<telerik:GridBoundColumn UniqueName="Name" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
					SortExpression="Name" HeaderText="Name" DataField="Name">
				</telerik:GridBoundColumn>
				<telerik:GridBoundColumn UniqueName="ApplicationYear" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
					SortExpression="ApplicationYear" HeaderText="Application Year" DataField="ApplicationYear">
			    </telerik:GridBoundColumn>			
				<telerik:GridBoundColumn UniqueName="PartnerOrgName" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
					SortExpression="PartnerOrgName" HeaderText="Partner Organization Name" DataField="PartnerOrgName">
				</telerik:GridBoundColumn>
                <telerik:GridBoundColumn UniqueName="Location" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
					SortExpression="Location" HeaderText="Partner Organization Location" DataField="Location">
				</telerik:GridBoundColumn>
                <telerik:GridBoundColumn UniqueName="Gender" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
					SortExpression="Gender" HeaderText="Gender" DataField="Gender">
				</telerik:GridBoundColumn>
                <telerik:GridBoundColumn UniqueName="FirstGenerationCollege" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
					SortExpression="FirstGenerationCollege" HeaderText="First Generation" DataField="FirstGenerationCollege">
				</telerik:GridBoundColumn>
                <telerik:GridBoundColumn UniqueName="HaveSessionConflict" AutoPostBackOnFilter="true"
					SortExpression="HaveSessionConflict" HeaderText="Conflicts" DataField="HaveSessionConflict">
				</telerik:GridBoundColumn>
                <telerik:GridBoundColumn UniqueName="PreferSession" AutoPostBackOnFilter="true"
					SortExpression="PreferSession" HeaderText="Preference" DataField="PreferSession">
				</telerik:GridBoundColumn>											
				<telerik:GridBoundColumn UniqueName="ApplicationStatus" AutoPostBackOnFilter="true"
					SortExpression="ApplicationStatus" HeaderText="AppStatus" DataField="ApplicationStatus">
				</telerik:GridBoundColumn>
                <telerik:GridBoundColumn UniqueName="Tags" AutoPostBackOnFilter="true"
					SortExpression="Tags" HeaderText="Tags" DataField="Tags">
				</telerik:GridBoundColumn>                
				<telerik:GridHyperLinkColumn HeaderText="Edit" UniqueName="Edit" DataNavigateUrlFormatString="EditApplication.aspx?uid={0}" DataNavigateUrlFields="idApplication" AllowFiltering="false" AllowSorting="false" ItemStyle-Font-Underline="true" Text="Edit"></telerik:GridHyperLinkColumn>				
			</Columns>
		</MasterTableView>
	</telerik:RadGrid>
</asp:Content>
