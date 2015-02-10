<%@ Page Title="" Language="C#" MasterPageFile="~/studentMaster.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="yleana.Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
<div class="col-lg-12">
   <h4>Our application is open from March 1- April 1, 2015. <br /> You must be associated with one of the following partner organizations to apply for Yleana 2015</h4>

   <p><telerik:RadButton ID="btnRegister" class="btn btn-primary" runat="server" Text="First Time User" OnClick="btnRegister_Click"></telerik:RadButton></p>
   <p><telerik:RadButton ID="btnReturn" class="btn btn-primary" runat="server" Text="Returning Applicants" OnClick="btnReturn_Click" ></telerik:RadButton></p>
   <p><telerik:RadButton ID="btnNoPartnerAssociated" class="btn btn-primary" runat="server" Text="Not Associated with one of our partner orgs? Contact us here" OnClick="btnNoPartnerAssociated_Click"></telerik:RadButton></p>
</div>

</asp:Content>
