<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="ApplicationManagement.aspx.cs" Inherits="YleanaAdmin.ApplicationManagement" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
	<h1>Application Management</h1>	
	<br />
	Name: <asp:Label ID="lblName" runat="server"></asp:Label>	
	<br />
	Email Address: <asp:Label ID="lblEmailAddress" runat="server"></asp:Label>&nbsp;&nbsp;&nbsp;<telerik:RadButton ID="btnReset" ButtonType="StandardButton" runat="server" Text="Reset Password" OnClick="btnReset_Click"></telerik:RadButton>
	<br /><br />
	<asp:Label ID="lblStatus" runat="server" Text="Application Status"></asp:Label>
	<br />
	<telerik:RadDropDownList ID="ddlStatus" runat="server" DataTextField="ApplicationStatus" DataValueField="idApplicationStatus" DefaultMessage="Select"/>
	<br />
	<br />
	    <table>
        <tr>
            <td>Assigned Tags</td>
            <td>Available Tags</td>
        </tr>
	    <tr>
            <td>
	            <telerik:RadListBox ID="lstAssignedTags" ToolTip="Assigned Tags"  runat="server"  Height="200" Width="300" SelectionMode="Multiple" AllowTransfer="true" TransferToID="lstNonAssignedTags">		
	            </telerik:RadListBox>
            </td>
            <td>
	            <telerik:RadListBox ID="lstNonAssignedTags" ToolTip="Tags List" runat="server" Height="200" Width="300"  SelectionMode="Multiple">		
	            </telerik:RadListBox>
            </td>
        </tr>
    </table>
	<br />
	<br />
	<asp:Label ID="lblColor" runat="server" Text="Color Code"></asp:Label>
	<br />
	<telerik:RadDropDownList ID="ddlColor" runat="server" DefaultMessage="Select">
	<Items>
	<telerik:DropDownListItem Text="Red" Value="Red" />
	<telerik:DropDownListItem Text="Green" Value="Green" />
	<telerik:DropDownListItem Text="Yellow" Value="Yellow" />
	</Items>
	</telerik:RadDropDownList>
	<br />
	<br />
	<telerik:RadButton ID="btnUpdate" ButtonType="StandardButton" runat="server" Text="Update" OnClick="btnUpdate_Click"></telerik:RadButton>	
	<br />
	<br />
	<asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
	<br />
	<br />
</asp:Content>
