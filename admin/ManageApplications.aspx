<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="ManageApplications.aspx.cs" Inherits="YleanaAdmin.ManageApplications" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Manage Applications</h1>
	<%--<telerik:RadButton ID="btnAddUser" ButtonType="LinkButton" runat="server" Text="Add New User" NavigateUrl="AddUser.aspx"></telerik:RadButton>&nbsp;--%> 
    <telerik:RadButton ID="btnExportAll" ButtonType="LinkButton" runat="server" Text="Export Data" OnClick="btnExportAll_Click" ></telerik:RadButton>&nbsp;   
	<br /><br />
	<telerik:RadGrid ID="grdManageApplication" runat="server" AllowPaging="True" 
		AutoGenerateColumns="False" AllowSorting="True" PageSize="100" OnNeedDataSource="grdManageApplication_NeedDataSource" AllowFilteringByColumn="true" MasterTableView-AllowPaging="true" MasterTableView-AllowSorting="true" MasterTableView-AllowFilteringByColumn="true">
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
                <telerik:GridHyperLinkColumn HeaderText="Score" UniqueName="Score" DataNavigateUrlFormatString="Updatescore.aspx?Appid={0}" DataNavigateUrlFields="idApplication" AllowFiltering="false" AllowSorting="false" ItemStyle-Font-Underline="true" Text="Score"></telerik:GridHyperLinkColumn>				
				<telerik:GridHyperLinkColumn HeaderText="Edit" UniqueName="Edit" DataNavigateUrlFormatString="EditApplication.aspx?Appid={0}" DataNavigateUrlFields="idApplication" AllowFiltering="false" AllowSorting="false" ItemStyle-Font-Underline="true" Text="Edit"></telerik:GridHyperLinkColumn>				
				<telerik:GridHyperLinkColumn HeaderText="Manage" UniqueName="Manage" DataNavigateUrlFormatString="ApplicationManagement.aspx?Appid={0}" DataNavigateUrlFields="idApplication" AllowFiltering="false" AllowSorting="false" ItemStyle-Font-Underline="true" Text="Manage"></telerik:GridHyperLinkColumn>
                <telerik:GridHyperLinkColumn HeaderText="Forms" UniqueName="Forms" Target="_blank" DataNavigateUrlFormatString="Download.aspx?Appid={0}" DataNavigateUrlFields="idApplication" AllowFiltering="false" AllowSorting="false" ItemStyle-Font-Underline="true" Text="Download">
                </telerik:GridHyperLinkColumn>				
                <telerik:GridBoundColumn UniqueName="AllForms" AutoPostBackOnFilter="true"
					SortExpression="Completed" HeaderText="AllForms" DataField="Completed">
				</telerik:GridBoundColumn>		
			</Columns>
		</MasterTableView>
	</telerik:RadGrid>
</asp:Content>
