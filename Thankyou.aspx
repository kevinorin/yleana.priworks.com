<%@ Page Title="" Language="C#" MasterPageFile="~/StudentMaster.Master" AutoEventWireup="true" CodeBehind="Thankyou.aspx.cs" Inherits="yleana.Thankyou" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="rspForms col-lg-12">
            <div class="row">
                <div class="col-md-8 col-md-offset-3">
                    <h1>Student Registration</h1>
                    <div class="col-md-8">
                        <label class="LabelInput control-label">    Thank you for completing the first phase of the Yleana Leadership Academy's application for Summer <%= DateTime.Today.Year.ToString() %>!  You should receive a text message to the cell phone number you just provided with a username and password for the next step of the application.
                            <br /><br />
Please use the username and password to log into the form at <a href="/"><%= Request.Url.Scheme + "://" + Request.Url.Authority + Request.ApplicationPath.TrimEnd('/') + "/" %></a> to complete the application.
                            <br /><br />
If you do NOT receive a text message to your phone with a username and password within 2 hours, please contact your partner organization (the people who told you about Yleana in the first place).  They will be able to help you get your login information so you can continue the application. You can also email Robyn at robyn@yleana.org </label>
                    </div>
                </div>
            </div>
        </div>
</asp:Content>
