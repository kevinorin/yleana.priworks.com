<%@ Page Title="" Language="C#" MasterPageFile="~/studentMaster.Master" AutoEventWireup="true" CodeBehind="StudentRegistration.aspx.cs" Inherits="yleana.StudentRegistration" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .LabelInput
        {
            text-align:left;
            width:400px;
        }
        .TextBoxInput
        {
             text-align:right;
            width:400px;
        }
        .captcha img
        {
             display: inline !important;
             height: 40px !important;
             width: 160px !important;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table border="0" align="center" style="text-align: center; width: 50%; padding-left: 20px; margin-top: 20px; border: 0px solid">
        <tr>
            <td style="text-align:left;">
                <h1 style="font-weight: 600; font-style: italic;">Student Registration</h1>
            </td>
        </tr>
        <tr>
            <td style="text-align:left;">
                <label class="LabelInput">Partner Organization : </label>
                <span style="color: red;">*</span><br />
                <telerik:RadDropDownList ID="ddlPartner" runat="server" DataTextField="PartnerOrgName" DataValueField="idPartner" DefaultMessage="Select Partner"/><br />
                If you do not see the name of your organization on this list, To send an email <a href="ContactUs.aspx">click here </a>
                <br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ForeColor="Red" Display="Dynamic" ControlToValidate="ddlPartner" InitialValue="" ErrorMessage="Partner is required!"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="text-align:left;">
                <label class="LabelInput">Location : </label>
                <span style="color:red;">*</span><br />
                <telerik:RadDropDownList ID="ddlLocation" runat="server" DataTextField="Location" DataValueField="id" DefaultMessage="Select Location" /><br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ForeColor="Red" Display="Dynamic" ControlToValidate="ddlLocation" InitialValue=""  ErrorMessage="Partner Location is required!"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="text-align:left;">
                <label class="LabelInput" style="margin-top: 20px;">First Name : </label>
                <span style="color:red;">*</span><br />
                <telerik:RadTextBox ID="txtFirstName" runat="server"></telerik:RadTextBox><br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ForeColor="Red" Display="Dynamic" ControlToValidate="txtFirstName" ErrorMessage="The First Name can not be empty!"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="text-align:left;">
                <label class="LabelInput" style="margin-top: 20px;">Last Name : </label>
                <span style="color:red;">*</span><br />
                <telerik:RadTextBox ID="txtLastName" runat="server"></telerik:RadTextBox><br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ForeColor="Red" Display="Dynamic" ControlToValidate="txtLastName" ErrorMessage="The Last Name can not be empty!"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="text-align:left;">
                <label class="TextBoxInput" style="margin-top: 20px;">Contact Number(CellPhone) : </label>
                <span style="color:red;">*</span><br />
                <telerik:RadMaskedTextBox ID="txtPhoneMasked" runat="server" Mask="(###) ### - ####"></telerik:RadMaskedTextBox><br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ForeColor="Red" Display="Dynamic" ControlToValidate="txtPhoneMasked" ErrorMessage="The Contact Number can not be empty!"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="text-align:left;">
                <label class="TextBoxInput" style="margin-top: 20px;">Contact Email : </label>
                <span style="color:red;">*</span><br />
                <telerik:RadTextBox ID="txtEmail" runat="server"></telerik:RadTextBox><br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ForeColor="Red" Display="Dynamic" ControlToValidate="txtEmail" ErrorMessage="The Contact Email can not be empty!"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="emailValidator" runat="server" ForeColor="Red" Display="Dynamic" ErrorMessage="Please, enter valid e-mail address." ValidationExpression="^[\w\.\-]+@[a-zA-Z0-9\-]+(\.[a-zA-Z0-9\-]{1,})*(\.[a-zA-Z]{2,3}){1,2}$" ControlToValidate="txtEmail">
                </asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td style="text-align:left;">
                <telerik:RadCaptcha ID="RadCaptcha1" runat="server" ErrorMessage="Invalid Captcha" ForeColor="Red" CssClass="captcha" CaptchaImage-BackgroundColor="#66ff66"
                     CaptchaImage-RenderImageOnly="true" ValidatedTextBoxID="RadTextBox1" EnableViewState="true" EnableRefreshImage="true" >
                </telerik:RadCaptcha><br />
                <label>Type the code from the image</label><br />
                <telerik:RadTextBox ID="RadTextBox1" runat="server" EnableViewState="true">
                </telerik:RadTextBox><br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" Display="Dynamic" ErrorMessage="Please enter Captcha text"
                    ForeColor="Red" ControlToValidate="RadTextBox1" ValidateRequestMode="Inherit"></asp:RequiredFieldValidator>
                <br />
            </td>
        </tr>
        <tr>
            <td style="text-align:center;">
                <telerik:RadButton ID="btnRegister" runat="server" ButtonType="StandardButton" Text="Register" OnClick="btnRegister_Click"></telerik:RadButton>
            </td>
        </tr>
        <tr>
            <td style="text-align:left;">
                <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
            </td>
        </tr>
    </table>    
</asp:Content>
