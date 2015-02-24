<%@ Page Title="" Language="C#" MaintainScrollPositionOnPostback="true" MasterPageFile="~/studentMaster.Master" AutoEventWireup="true" CodeBehind="StudentRegistration.aspx.cs" Inherits="yleana.StudentRegistration" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"> 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <div class="rspForms col-lg-12">
   <div class="row">
      <div class="col-md-8 col-md-offset-3">
         <h1>Student Registration</h1>          
         <div class="col-md-4">
            <label class="LabelInput"><span style="color:red;">*</span> First Name: </label>
         </div>

           <div class="col-md-8">
                <telerik:RadTextBox ID="txtFirstName" runat="server" MaxLength="50"></telerik:RadTextBox><br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ForeColor="Red" Display="Dynamic" ControlToValidate="txtFirstName" ErrorMessage="First Name is required"></asp:RequiredFieldValidator>
         </div>

          <div class="col-md-4">
            <label class="LabelInput"><span style="color:red;">*</span> Last Name: </label>
         </div>
         
          <div class="col-md-8">
                <telerik:RadTextBox ID="txtLastName" runat="server" MaxLength="50"></telerik:RadTextBox><br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ForeColor="Red" Display="Dynamic" ControlToValidate="txtLastName" ErrorMessage="Last Name is required"></asp:RequiredFieldValidator>
         </div>

          <div class="col-md-4">
            <label class="LabelInput"><span style="color:red;">*</span> Cell Phone: </label>
         </div>

          <div class="col-md-8">
                <telerik:RadMaskedTextBox ID="txtPhoneMasked" runat="server" Mask="(###)###-####"></telerik:RadMaskedTextBox><br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ForeColor="Red" Display="Dynamic" ControlToValidate="txtPhoneMasked" ErrorMessage="Contact Number is required"></asp:RequiredFieldValidator>
               <%-- <asp:RegularExpressionValidator Display="Dynamic" ForeColor="Red" ID="MaskedTextBoxRegularExpressionValidator"
                                runat="server" ErrorMessage="Please format your cell phone number like this: (###)###-####" ControlToValidate="txtPhoneMasked"
                                ValidationExpression="^[\( ][0-9X][1-9][0-9][\) ]?[0-9]{3}[\- ]?[0-9]{4}$"></asp:RegularExpressionValidator>--%>
         </div>

          <div class="col-md-4">
            <label class="LabelInput"><span style="color:red;">*</span> Email: </label>
         </div>
         
          <div class="col-md-8">
                <telerik:RadTextBox ID="txtEmail" runat="server" MaxLength="100"></telerik:RadTextBox><br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ForeColor="Red" Display="Dynamic" ControlToValidate="txtEmail" ErrorMessage="Contact Email is required"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="emailValidator" runat="server" ForeColor="Red" Display="Dynamic" ErrorMessage="Please, enter valid e-mail address." ValidationExpression="^[\w\.\-]+@[a-zA-Z0-9\-]+(\.[a-zA-Z0-9\-]{1,})*(\.[a-zA-Z]{2,3}){1,2}$" ControlToValidate="txtEmail">
                </asp:RegularExpressionValidator>
          </div>
                
          <div class="col-md-4">
            <label class="LabelInput control-label"><span style="color: red;">*</span> Partner Organization: </label>
         </div>

         <div class="col-md-8">
                <telerik:RadDropDownList ID="ddlPartner" runat="server" DataTextField="PartnerOrgName" DataValueField="idPartner" DefaultMessage="Select Partner"/>
                  <footnote class="footnote">If your organization is not listed, please <a href="ContactUs.aspx">contact us</a>.</footnote>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ForeColor="Red" Display="Dynamic" ControlToValidate="ddlPartner" InitialValue="" ErrorMessage="Partner is required"></asp:RequiredFieldValidator>
         </div>

         <div class="col-md-4">
            <label class="LabelInput"><span style="color:red;">*</span> Location: </label>
         </div>
         <div class="col-md-8">
                <telerik:RadDropDownList ID="ddlLocation" runat="server" DataTextField="Location" DataValueField="id" DefaultMessage="Select Location" /><br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ForeColor="Red" Display="Dynamic" ControlToValidate="ddlLocation" InitialValue=""  ErrorMessage="Location is required"></asp:RequiredFieldValidator>
         </div>

          <div class="col-md-4">    
            <label class="LabelInput">Enter the code you see below:</label>
         </div>
         <div class="col-md-8">
                <telerik:RadTextBox ID="RadTextBox1" runat="server" EnableViewState="true" MaxLength="5" AutoCompleteType="Disabled">
                </telerik:RadTextBox><br />
                <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" Display="Dynamic" ErrorMessage="Please enter Captcha text"
                    ForeColor="Red" ControlToValidate="RadTextBox1" ValidateRequestMode="Inherit"></asp:RequiredFieldValidator>--%>
                  <telerik:RadCaptcha ID="RadCaptcha1" runat="server" ErrorMessage="Invalid Captcha" ForeColor="Red" CssClass="captcha" CaptchaImage-BackgroundColor="#66ff66"
             CaptchaImage-RenderImageOnly="true" ValidatedTextBoxID="RadTextBox1" EnableViewState="true" EnableRefreshImage="true" >
            </telerik:RadCaptcha>
         </div>
      </div>

      <div class="col-md-12" style="padding-top: 30px">
           <center>
                <telerik:RadButton ID="btnRegister" runat="server" ButtonType="StandardButton" Text="Register" OnClick="btnRegister_Click"></telerik:RadButton>
               <br />
               <br />            
                <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
           </center>
      </div>
   </div>
</div> 
</asp:Content>
