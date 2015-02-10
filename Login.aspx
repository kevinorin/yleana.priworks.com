<%@ Page Title="" Language="C#" MasterPageFile="~/studentMaster.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="yleana.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div  >
        <div>
            <table border="0"  align="center"  style="text-align:center;width:25%;padding-left:20px;margin-top:20px; border:0px solid">
                <tr>
                    <td colspan="2">
                        <h1 style="font-weight: 600; font-style: italic; text-align: center; margin: 10px 0 20px;">Login</h1>
                    </td>
                </tr>
                <tr>
                    <td style="text-align:left;">
                        <label class="TextBoxInput">User ID</label><span style="color: red;">*</span><br />
                        <telerik:RadTextBox ID="txtUserId" runat="server"></telerik:RadTextBox><br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Display="Dynamic" ControlToValidate="txtUserId" ForeColor="Red" ErrorMessage="The User ID can not be empty!"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td style="text-align:left;">
                         <label class="TextBoxInput" style="margin-top: 20px;">Password</label><span style="color:red;">*</span><br />
                         <telerik:RadTextBox ID="txtPassword" runat="server" TextMode="Password"></telerik:RadTextBox><br />
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" Display="Dynamic" ControlToValidate="txtPassword" ForeColor="Red" ErrorMessage="The Password can not be empty!"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <telerik:RadButton ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click"></telerik:RadButton>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
                    </td>
                </tr>
            </table>
            <%--<h1 style="font-weight: 600; font-style: italic; text-align: center; margin: 10px 0 20px;">Login</h1>
            <label class="TextBoxInput">User ID</label><span style="color:red;">*</span>
            <div class="ui-input-text ui-body-inherit ui-corner-all ui-shadow-inset">
                <telerik:RadTextBox ID="txtUserId" runat="server" ></telerik:RadTextBox><br />
                <asp:RequiredFieldValidator ID="TextBoxRequiredFieldValidator" runat="server" Display="Dynamic" ControlToValidate="txtUserId" ForeColor="Red" ErrorMessage="The User ID can not be empty!"></asp:RequiredFieldValidator>   
            </div>
            <label class="TextBoxInput" style="margin-top: 20px;">Password</label><span style="color:red;">*</span>
            <div class="ui-input-text ui-body-inherit ui-corner-all ui-shadow-inset">
            <telerik:RadTextBox ID="txtPassword" runat="server" TextMode="Password"></telerik:RadTextBox><br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="Dynamic" ControlToValidate="txtPassword" ForeColor="Red" ErrorMessage="The Password can not be empty!"></asp:RequiredFieldValidator>   
            </div>
            <telerik:RadButton ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click"></telerik:RadButton>
            <br />				
            <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>--%>
        </div>        
    </div>
</asp:Content>
