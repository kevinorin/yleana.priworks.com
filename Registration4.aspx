<%@ Page Title="" Language="C#" MaintainScrollPositionOnPostback="true" MasterPageFile="~/studentMaster.Master" AutoEventWireup="true" CodeBehind="Registration4.aspx.cs" Inherits="yleana.Registration4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">

        window.onload = function () {
            ShowAwayHomeText();
            ShowAwayHomeOtherText();            
        };

        function ShowAwayHomeText()
        {
            if ($('#<%=rboAwayHomeOneWeek.ClientID %> input:checked').val() == "Yes") {
                $('#divAwayFromHomeText').show();
            }
            else {
                $('#divAwayFromHomeText').hide();
            }
        }

        function ShowAwayHomeOtherText() {
            var raddropdownlist = $find('<%=ddlAwayHome.ClientID %>');
            var selecteditem = raddropdownlist.get_selectedItem().get_value();
            if (selecteditem == "Other") {
                $('#divAwayHomeOther').show();
            }
            else {
                $('#divAwayHomeOther').hide();
            }
        }

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="panl1" runat="server">
    <table border="0" align="center" style="text-align: center; width: 50%; padding-left: 20px; margin-top: 20px; border: 0px solid">
        <tr>
            <td style="text-align: left;">
                <h1 style="font-weight: 600; font-style: italic;">Previous Travel Info </h1>
            </td>
        </tr>
        <tr>
            <td style="text-align: left;">
                <label>Have you ever traveled out of state before ? </label>
                <span style="color: red;">*</span><br />
                <asp:RadioButtonList runat="server" ID="rbotravelledOutOfState" TextAlign="Right" RepeatDirection="Vertical">
                    <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                    <asp:ListItem Text="No" Value="No"></asp:ListItem>
                </asp:RadioButtonList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ForeColor="Red" Display="Dynamic" ControlToValidate="rbotravelledOutOfState" ErrorMessage="Please select the traveled out of state options!"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="text-align: left;">
                <label>Have you ever spent more than a week away from home before ? </label>
                <span style="color: red;">*</span><br />
                <asp:RadioButtonList runat="server" ID="rboAwayHomeOneWeek" TextAlign="Right" RepeatDirection="Vertical" onchange="ShowAwayHomeText();">
                    <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                    <asp:ListItem Text="No" Value="No"></asp:ListItem>
                </asp:RadioButtonList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ForeColor="Red" Display="Dynamic" ControlToValidate="rboAwayHomeOneWeek" ErrorMessage="Please select the away from home options!"></asp:RequiredFieldValidator>
                <div id="divAwayFromHomeText" style="display: none;">
                    <label class="LabelInput">In what context were you away from home? </label>
                    <br />
                    <telerik:RadDropDownList ID="ddlAwayHome" runat="server" OnClientSelectedIndexChanged="ShowAwayHomeOtherText">
                        <Items>
                            <telerik:DropDownListItem Text="Vacation" Value="Vacation" />
                            <telerik:DropDownListItem Text="Extracurricular camp or program" Value="Extracurricular camp or program" />
                            <telerik:DropDownListItem Text="School trip or program" Value="School trip or program" />
                            <telerik:DropDownListItem Text="Other" Value="Other" />
                        </Items>
                    </telerik:RadDropDownList>
                    <br />
                    <div id="divAwayHomeOther" style="display: none;">
                        <label class="LabelInput">Please describe the Other context of Away from Home : </label>
                        <br />
                        <telerik:RadTextBox ID="txtAwayHomeContext" runat="server"></telerik:RadTextBox><br />
                    </div>
                </div>
            </td>
        </tr>
        <tr>
            <td style="text-align: left;">
                <h2>College Interests</h2>
                <label>Will you need financial aid in order to go to college ? </label>
                <span style="color: red;">*</span><br />
                <asp:RadioButtonList runat="server" ID="rboFinancialAid" TextAlign="Right" RepeatDirection="Vertical">
                    <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                    <asp:ListItem Text="No" Value="No"></asp:ListItem>
                </asp:RadioButtonList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ForeColor="Red" Display="Dynamic" ControlToValidate="rboFinancialAid" ErrorMessage="Please select the financial aid options!"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="text-align: left;">
                <label class="LabelInput">Do you have a college counselor/adviser through either your school or a community-based organization ? </label>
                <span style="color: red;">*</span><br />
                <telerik:RadDropDownList runat="server" ID="ddlCounselor" EmptyMessage="Select Relationhip">
                    <Items>
                        <telerik:DropDownListItem runat="server" Text="Select" Value="" />
                        <telerik:DropDownListItem runat="server" Text="Yes" Value="Yes" />
                        <telerik:DropDownListItem runat="server" Text="No" Value="No" />
                        <telerik:DropDownListItem runat="server" Text="I’m not sure" Value="I’m not sure" />
                    </Items>
                </telerik:RadDropDownList>
                <br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ForeColor="Red" InitialValue="Select" Display="Dynamic" ControlToValidate="ddlCounselor" ErrorMessage="Please select college counselor/adviser options!"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="text-align: left;">
                <label class="LabelInput">Do you plan to apply to colleges that are in-state or out of state ? </label>
                <br />
                <telerik:RadDropDownList runat="server" ID="ddlCollegeState" EmptyMessage="Select">
                    <Items>
                        <telerik:DropDownListItem runat="server" Text="Select" Value="" />
                        <telerik:DropDownListItem runat="server" Text="In state" Value="In state" />
                        <telerik:DropDownListItem runat="server" Text="Out of state" Value="Out of state" />
                        <telerik:DropDownListItem runat="server" Text="Both " Value="Both " />
                    </Items>
                </telerik:RadDropDownList>
                <br />
            </td>
        </tr>
        <tr>
            <td style="text-align: left;">
                <label class="LabelInput">Do you plan to apply to schools with educational opportunity programs or special support programs ? </label>
                <br />
                <telerik:RadDropDownList runat="server" ID="ddlSpecialProgram" EmptyMessage="Select">
                    <Items>
                        <telerik:DropDownListItem runat="server" Text="Select" Value="" />
                        <telerik:DropDownListItem runat="server" Text="Yes" Value="Yes" />
                        <telerik:DropDownListItem runat="server" Text="No" Value="No" />
                        <telerik:DropDownListItem runat="server" Text="I’m not sure" Value="I’m not sure" />
                    </Items>
                </telerik:RadDropDownList>
                <br />
            </td>
        </tr>
        <tr>
            <td style="text-align: left;">
                <label class="TextBoxInput" style="margin-top: 20px;">What type of schools are you interested in? Select all that apply  </label>
                <asp:CheckBoxList ID="rbtSchoolType" runat="server">
                    <asp:ListItem Text="Small (less than 2,000 students)" Value="Small"></asp:ListItem>
                    <asp:ListItem Text="Medium (2,000-15,000 students)" Value="Medium"></asp:ListItem>
                    <asp:ListItem Text="Big (more than 15,000 students)" Value="Big"></asp:ListItem>
                    <asp:ListItem Text="Community college" Value="Community college"></asp:ListItem>
                    <asp:ListItem Text="Public/State university" Value="Public/State university"></asp:ListItem>
                    <asp:ListItem Text="Private university" Value="Private university"></asp:ListItem>
                    <asp:ListItem Text="Technical institute" Value="Technical institute"></asp:ListItem>
                    <asp:ListItem Text="Liberal arts school" Value="Liberal arts school"></asp:ListItem>
                </asp:CheckBoxList>
            </td>
        </tr>
        <tr>
            <td style="text-align: left;">
                <h2>Work experience & Extracurriculars</h2>
                <label class="TextBoxInput" style="margin-top: 20px;">
                    <p>If you have a resume and would prefer to upload that, you can do so on the next page. </p>
                    <p>If you do not have one, use the text box below to list any extracurricular activities you have participated in or any work experience you have in order of their importance to you. </p>
                    <p>Please feel free to list any awards or honors you may have received in the course of these activities. Yleana emphasizes that work experience is just as valuable and formative as extra-curricular activities, and students should be encouraged to disclose it.</p>
                </label>
                <br />
                <telerik:RadTextBox ID="txtExperience" TextMode="MultiLine" Rows="10" Width="90%" runat="server"></telerik:RadTextBox><br />
            </td>
        </tr>
        <tr>
            <td style="text-align: left;">
                <br />
            </td>
        </tr>
        
        <tr>
            <td style="text-align: left;">
                <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
            </td>
        </tr>
    </table>
        </asp:Panel>
<table border="0" align="center" style="text-align: center; width: 50%; padding-left: 20px; margin-top: 20px; border: 0px solid">
        <tr>
            <td style="text-align:center;padding-left:0px;">
                <telerik:RadButton ID="btnPrevious" runat="server" CausesValidation="false" ButtonType="StandardButton" Text="Previous" Width="20%" OnClick="btnPrevious_Click"></telerik:RadButton>
                <telerik:RadButton ID="btnSave" runat="server" CausesValidation="false" ButtonType="StandardButton" Text="SAVE SECTION" Width="20%" OnClick="btnSave_Click"></telerik:RadButton>
                <telerik:RadButton ID="btnSaveNext" runat="server" CausesValidation="false" ButtonType="StandardButton" Text="SAVE & NEXT" Width="20%" OnClick="btnSaveNext_Click"></telerik:RadButton>
                <telerik:RadButton ID="btnNext" runat="server" CausesValidation="false" ButtonType="StandardButton" Text="NEXT" Width="20%" OnClick="btnNext_Click"></telerik:RadButton><br /><br />
            </td>
        </tr>
    </table>
</asp:Content>
