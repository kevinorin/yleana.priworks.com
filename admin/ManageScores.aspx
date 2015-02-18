<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="ManageScores.aspx.cs" Inherits="YleanaAdmin.ManageScores" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
		<h1>Manage Scores</h1>
	<telerik:RadGrid ID="grdManageScore" runat="server" AllowPaging="True" ClientSettings-Scrolling-UseStaticHeaders="true" ClientSettings-Scrolling-FrozenColumnsCount="4"
		AutoGenerateColumns="False" AllowSorting="True" PageSize="50" OnNeedDataSource="grdManageScore_NeedDataSource" AllowFilteringByColumn="true" MasterTableView-AllowPaging="true" MasterTableView-AllowSorting="true" MasterTableView-AllowFilteringByColumn="true">
		<GroupingSettings CaseSensitive="false" />
		 <ClientSettings>
		<Scrolling AllowScroll="True" UseStaticHeaders="true" /></ClientSettings>      
		<MasterTableView AutoGenerateColumns="False" DataKeyNames="idApplication" >
			<Columns>
					<telerik:GridBoundColumn UniqueName="StudentName" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
					SortExpression="StudentName" HeaderText="Name" DataField="StudentName">
				</telerik:GridBoundColumn>											
				<telerik:GridBoundColumn UniqueName="AppStatus" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
					SortExpression="AppStatus" HeaderText="Session" DataField="AppStatus">
				</telerik:GridBoundColumn>
				<telerik:GridBoundColumn UniqueName="Tags" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
					SortExpression="Tags" HeaderText="Tags" DataField="Tags">
				</telerik:GridBoundColumn>								
				<telerik:GridHyperLinkColumn UniqueName="Edit" DataNavigateUrlFormatString="UpdateScore.aspx?Appid={0}" DataNavigateUrlFields="idApplication" AllowFiltering="false" AllowSorting="false" ItemStyle-Font-Underline="true" Text="Edit"></telerik:GridHyperLinkColumn>		
				<telerik:GridBoundColumn UniqueName="TestScore1Total" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
					SortExpression="TestScore1Total" HeaderText="Test1 Total" DataField="TestScore1Total">
				</telerik:GridBoundColumn>
				<telerik:GridBoundColumn UniqueName="TestScore1WR" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
					SortExpression="TestScore1WR" HeaderText="Test1 WR" DataField="TestScore1WR">
				</telerik:GridBoundColumn>
				<telerik:GridBoundColumn UniqueName="TestScore1Math" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
					SortExpression="TestScore1Math" HeaderText="Test1 Math" DataField="TestScore1Math">
				</telerik:GridBoundColumn>
				<telerik:GridBoundColumn UniqueName="TestScore1CR" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
					SortExpression="TestScore1CR" HeaderText="Test1 CR" DataField="TestScore1CR">
				</telerik:GridBoundColumn>
				<telerik:GridBoundColumn UniqueName="TestScore1Essay" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
					SortExpression="TestScore1Essay" HeaderText="Test1 Essay" DataField="TestScore1Essay">
				</telerik:GridBoundColumn>
				<telerik:GridBoundColumn UniqueName="TestScore2Total" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
					SortExpression="TestScore2Total" HeaderText="Test2 Total" DataField="TestScore2Total">
				</telerik:GridBoundColumn>
				<telerik:GridBoundColumn UniqueName="TestScore2WR" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
					SortExpression="TestScore2WR" HeaderText="Test2 WR" DataField="TestScore2WR">
				</telerik:GridBoundColumn>
				<telerik:GridBoundColumn UniqueName="TestScore2Math" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
					SortExpression="TestScore2Math" HeaderText="Test2 Math" DataField="TestScore2Math">
				</telerik:GridBoundColumn>
				<telerik:GridBoundColumn UniqueName="TestScore2CR" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
					SortExpression="TestScore2CR" HeaderText="Test2 CR" DataField="TestScore2CR">
				</telerik:GridBoundColumn>
				<telerik:GridBoundColumn UniqueName="TestScore2Essay" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
					SortExpression="TestScore2Essay" HeaderText="Test2 Essay" DataField="TestScore2Essay">
				</telerik:GridBoundColumn>
				<telerik:GridBoundColumn UniqueName="TestScore3Total" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
					SortExpression="TestScore3Total" HeaderText="Test3 Total" DataField="TestScore3Total">
				</telerik:GridBoundColumn>
				<telerik:GridBoundColumn UniqueName="TestScore3WR" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
					SortExpression="TestScore3WR" HeaderText="Test3 WR" DataField="TestScore3WR">
				</telerik:GridBoundColumn>
				<telerik:GridBoundColumn UniqueName="TestScore3Math" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
					SortExpression="TestScore3Math" HeaderText="Test3 Math" DataField="TestScore3Math">
				</telerik:GridBoundColumn>
				<telerik:GridBoundColumn UniqueName="TestScore3CR" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
					SortExpression="TestScore3CR" HeaderText="Test3 CR" DataField="TestScore3CR">
				</telerik:GridBoundColumn>
				<telerik:GridBoundColumn UniqueName="TestScore3Essay" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
					SortExpression="TestScore3Essay" HeaderText="Test3 Essay" DataField="TestScore3Essay">
				</telerik:GridBoundColumn>
				<telerik:GridBoundColumn UniqueName="TestScore4Total" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
					SortExpression="TestScore4Total" HeaderText="Test4 Total" DataField="TestScore4Total">
				</telerik:GridBoundColumn>
				<telerik:GridBoundColumn UniqueName="TestScore4WR" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
					SortExpression="TestScore4WR" HeaderText="Test4 WR" DataField="TestScore4WR">
				</telerik:GridBoundColumn>
				<telerik:GridBoundColumn UniqueName="TestScore4Math" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
					SortExpression="TestScore4Math" HeaderText="Test4 Math" DataField="TestScore4Math">
				</telerik:GridBoundColumn>
				<telerik:GridBoundColumn UniqueName="TestScore4CR" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
					SortExpression="TestScore4CR" HeaderText="Test4 CR" DataField="TestScore4CR">
				</telerik:GridBoundColumn>
				<telerik:GridBoundColumn UniqueName="TestScore4Essay" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
					SortExpression="TestScore4Essay" HeaderText="Test5 Essay" DataField="TestScore4Essay">
				</telerik:GridBoundColumn>
				<telerik:GridBoundColumn UniqueName="TestScore5Total" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
					SortExpression="TestScore5Total" HeaderText="Test5 Total" DataField="TestScore5Total">
				</telerik:GridBoundColumn>
				<telerik:GridBoundColumn UniqueName="TestScore5WR" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
					SortExpression="TestScore5WR" HeaderText="Test5 WR" DataField="TestScore5WR">
				</telerik:GridBoundColumn>
				<telerik:GridBoundColumn UniqueName="TestScore5Math" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
					SortExpression="TestScore5Math" HeaderText="Test5 Math" DataField="TestScore5Math">
				</telerik:GridBoundColumn>
				<telerik:GridBoundColumn UniqueName="TestScore5CR" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
					SortExpression="TestScore5CR" HeaderText="Test5 CR" DataField="TestScore5CR">
				</telerik:GridBoundColumn>
				<telerik:GridBoundColumn UniqueName="TestScore5Essay" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
					SortExpression="TestScore5Essay" HeaderText="Test5 Essay" DataField="TestScore5Essay">
				</telerik:GridBoundColumn>
				<telerik:GridBoundColumn UniqueName="TestScore6Total" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
					SortExpression="TestScore6Total" HeaderText="Test6 Total" DataField="TestScore6Total">
				</telerik:GridBoundColumn>
				<telerik:GridBoundColumn UniqueName="TestScore6WR" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
					SortExpression="TestScore6WR" HeaderText="Test6 WR" DataField="TestScore6WR">
				</telerik:GridBoundColumn>
				<telerik:GridBoundColumn UniqueName="TestScore6Math" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
					SortExpression="TestScore6Math" HeaderText="Test6 Math" DataField="TestScore6Math">
				</telerik:GridBoundColumn>
				<telerik:GridBoundColumn UniqueName="TestScore6CR" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
					SortExpression="TestScore5CR" HeaderText="Test6 CR" DataField="TestScore6CR">
				</telerik:GridBoundColumn>
				<telerik:GridBoundColumn UniqueName="TestScore6Essay" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
					SortExpression="TestScore6Essay" HeaderText="Test6 Essay" DataField="TestScore6Essay">
				</telerik:GridBoundColumn>
				<telerik:GridBoundColumn UniqueName="TestScore7Total" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
					SortExpression="TestScore7Total" HeaderText="Test5 Total" DataField="TestScore5Total">
				</telerik:GridBoundColumn>
				<telerik:GridBoundColumn UniqueName="TestScore7WR" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
					SortExpression="TestScore7WR" HeaderText="Test7 WR" DataField="TestScore7WR">
				</telerik:GridBoundColumn>
				<telerik:GridBoundColumn UniqueName="TestScore7Math" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
					SortExpression="TestScore7Math" HeaderText="Test7 Math" DataField="TestScore7Math">
				</telerik:GridBoundColumn>
				<telerik:GridBoundColumn UniqueName="TestScore7CR" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
					SortExpression="TestScore7CR" HeaderText="Test7 CR" DataField="TestScore7CR">
				</telerik:GridBoundColumn>
				<telerik:GridBoundColumn UniqueName="TestScore7Essay" CurrentFilterFunction="Contains" AutoPostBackOnFilter="true"
					SortExpression="TestScore7Essay" HeaderText="Test7 Essay" DataField="TestScore7Essay">
				</telerik:GridBoundColumn>
			</Columns>
		</MasterTableView>
	</telerik:RadGrid>
</asp:Content>
