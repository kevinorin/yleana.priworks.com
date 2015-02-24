<%@ Page Title="" Language="C#" MasterPageFile="~/studentMaster.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="yleana.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
	<div class="col-lg-12" id="hp-content">
		<h4>Application</h4>
		<asp:Literal ID="ltrlMessage" runat="server"></asp:Literal>
		<div class="row">
			<telerik:RadButton ID="btnRegister" runat="server" Text="First-Time User" OnClick="btnRegister_Click"></telerik:RadButton>
		</div>

		<div class="row">
			<telerik:RadButton ID="btnReturn" runat="server" Text="Returning Applicants" OnClick="btnReturn_Click"></telerik:RadButton>
		</div>

		<div class="row">
			<telerik:RadButton ID="btnNoPartnerAssociated" runat="server" Text="Not associated with one of our partner orgs? Contact us here" OnClick="btnNoPartnerAssociated_Click"></telerik:RadButton>
		</div>
		<div class="row">
			<asp:Label ID="lblMsg" runat="server"></asp:Label>
		</div>
	</div>
</asp:Content>
