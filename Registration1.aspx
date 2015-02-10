<%@ Page Title="" Language="C#" MaintainScrollPositionOnPostback="true" MasterPageFile="~/studentMaster.Master"  AutoEventWireup="true" CodeBehind="Registration1.aspx.cs" Inherits="yleana.Registration1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        window.onload = function () {
            ShowGenderText();
            ShowRaceText();
            ShowCountryText();            
            showLanguageText();
            ShowSessionConflictsText();
            ShowSessionReasonText();
        };

        function ShowGenderText() {
            var raddropdownlist = $find('<%=ddlGender.ClientID %>');
            var selecteditem = raddropdownlist.get_selectedItem().get_value();
            if (selecteditem == "Others") {
                $('#divGenderText').show();
            }
            else {
                $('#divGenderText').hide();
            }
        }

        function ShowCountryText() {
            var raddropdownlist = $find('<%=ddlCountry.ClientID %>');
            var selecteditem = raddropdownlist.get_selectedItem().get_value();
            if (selecteditem == "Others") {
                $('#divCountryText').show();
            }
            else {
                $('#divCountryText').hide();
            }            
        }

        function ShowRaceText() {

            if ($('#<%=rbtRace.ClientID %> input:checked').val() == "Other") {
                $('#divRaceText').show();
            }
            else {
                $('#divRaceText').hide();
            }
        }          

        function showLanguageText() {
            if ($('#<%=rbtLanguage.ClientID %> input:checked').val() == "No") {
                $('#divLangText').show();
            }
            else {
                $('#divLangText').hide();
            }            
        }
        
        function ShowSessionConflictsText() {
            if ($('#<%=rboSessionConflicts.ClientID %> input:checked').val() == "Yes") {
                $('#divSessionConflictsText').show();
            }
            else {
                $('#divSessionConflictsText').hide();
            }
        }

        function ShowSessionReasonText() {
            if ($('#<%=rboSessionPrefReason.ClientID %> input:checked').val() == "Yes") {
                $('#divSessionPrefReasonText').show();
            }
            else {
                $('#divSessionPrefReasonText').hide();
            }
        }  
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="panl1" runat="server">
    <table border="0" align="center" style="text-align: center; width: 50%; padding-left: 20px; margin-top: 20px; border: 0px solid">
        <tr>
            <td style="text-align:left;">
                <h1 style="font-weight: 600; font-style: italic;">Demographic Info</h1>
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
                <label class="LabelInput">Partner Org Association : </label>
                <span style="color: red;">*</span><br />
                <telerik:RadDropDownList ID="ddlPartner" runat="server" DataTextField="PartnerOrgName" DataValueField="idPartner" DefaultMessage="Select Partner"/><br />
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
                <label class="LabelInput">What is your date of birth? </label>
                <span style="color:red;">*</span><br />
                <telerik:RadDatePicker runat="server" ID="dpDOB" Width="30%" MinDate="<%# DateTime.Today.AddYears(-20)%>" MaxDate="<%# DateTime.Today.AddYears(-5) %>">
                    <Calendar ID="Calendar1" runat="server" CalendarCaption="Select Your Date of Birth" EnableKeyboardNavigation="true" RangeMinDate="<%# DateTime.Today.AddYears(-20)%>"  RangeMaxDate="<%# DateTime.Today.AddYears(-5) %>" >
                    </Calendar>
                </telerik:RadDatePicker>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ForeColor="Red" Display="Dynamic" ControlToValidate="dpDOB" InitialValue=""  ErrorMessage="Date of Birth is required!"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="text-align:left;">
                <label class="LabelInput">What is your gender? </label>
                <span style="color:red;">*</span><br />
                <telerik:RadDropDownList runat="server" ID="ddlGender" EmptyMessage="Select Gender" OnClientSelectedIndexChanged="ShowGenderText" >
                    <Items>
                        <telerik:DropDownListItem runat="server" Text="Male" Value="Male" />
                        <telerik:DropDownListItem runat="server" Text="Female" Value="Female" />
                        <telerik:DropDownListItem runat="server" Text="Others" Value="Others" />                       
                    </Items>
                </telerik:RadDropDownList><br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ForeColor="Red" Display="Dynamic" ControlToValidate="ddlGender" InitialValue=""  ErrorMessage="Gender is required!"></asp:RequiredFieldValidator>
                <div id="divGenderText" style="display:none;">
                    <label class="LabelInput">Fill your gender? </label><br />
                    <telerik:RadTextBox ID="txtGender" runat="server"></telerik:RadTextBox>
                </div>
            </td>
        </tr>
        <tr>
            <td style="text-align:left;">
                <label class="LabelInput">Please indicate how you identify yourself ethnically? </label><br />
                <telerik:RadDropDownList runat="server" ID="ddlEthnical" EmptyMessage="Select Ethnicity">
                    <Items>
                        <telerik:DropDownListItem runat="server" Text="Hispanic or Latino" Value="Hispanic or Latino" />
                        <telerik:DropDownListItem runat="server" Text="Not Hispanic or Latino" Value="Not Hispanic or Latino" />
                        <%--<telerik:DropDownListItem runat="server" Text="Others" Value="Others" /> --%>                      
                    </Items>
                </telerik:RadDropDownList><br />
            </td>
        </tr>
        <tr>
            <td style="text-align:left;">
                <label class="LabelInput">Please indicate how you identify yourself racially? </label> <br /> 
                <asp:RadioButtonList ID="rbtRace" runat="server" onchange="ShowRaceText();">
                    <asp:ListItem>American Indian or Alaska Native</asp:ListItem>
                    <asp:ListItem>Asian</asp:ListItem>
                    <asp:ListItem>Black or African American</asp:ListItem>
                    <asp:ListItem>Native Hawaiian or Other Pacific Islander</asp:ListItem>
                    <asp:ListItem>White</asp:ListItem>
                    <asp:ListItem>Other</asp:ListItem>
                </asp:RadioButtonList>
                <div id="divRaceText" style="display:none;">
                    <label class="LabelInput">Fill your identify racially? </label><br />
                    <telerik:RadTextBox ID="txtRace" runat="server"></telerik:RadTextBox>
                </div>
            </td>
        </tr>
        <tr>
            <td style="text-align:left;">
                <label class="LabelInput">We administer practice tests every Saturday morning while you are at camp. Is there any legitimate reason you would not be able to take a test on a Saturday? </label>
                <span style="color:red;">*</span><br />
                <asp:RadioButtonList ID="rbtPracticeTest" runat="server">
                    <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                    <asp:ListItem Text="No" Value="0"></asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td style="text-align:left;">
                <label class="LabelInput">Which country were you born in? </label><br />
                <telerik:RadDropDownList runat="server" ID="ddlCountry" EmptyMessage="Select Country" OnClientSelectedIndexChanged="ShowCountryText">
                    <Items>
                        <telerik:DropDownListItem runat="server" Text="United States" Value="United States" />
                        <telerik:DropDownListItem runat="server" Text="Others" Value="Others" />
                    </Items>
                </telerik:RadDropDownList><br />
                <div id="divCountryText" style="display:none;">
                    <label class="LabelInput">Fill your Country : </label><br />
                    <telerik:RadTextBox ID="txtCountry" runat="server"></telerik:RadTextBox>
                </div>
            </td>
        </tr>
        <tr>
            <td style="text-align:left;">
                <label class="LabelInput">Is English your first language? </label>
                <span style="color:red;">*</span><br />
                <asp:RadioButtonList ID="rbtLanguage" runat="server" onchange="showLanguageText();">
                    <asp:ListItem>Yes</asp:ListItem>
                    <asp:ListItem>No</asp:ListItem>
                </asp:RadioButtonList>
                <div id="divLangText" style="display:none;">
                    <label class="LabelInput">Fill your Language : </label><br />
                    <telerik:RadTextBox ID="txtLanguage" runat="server"></telerik:RadTextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ForeColor="Red" Display="Dynamic" ControlToValidate="txtLanguage" InitialValue=""  ErrorMessage="Other Language is required!"></asp:RequiredFieldValidator>
                </div>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ForeColor="Red" Display="Dynamic" ControlToValidate="rbtLanguage" InitialValue=""  ErrorMessage="Language is required!"></asp:RequiredFieldValidator>
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
                <label>What is your home address? </label><span style="color:red;">*</span><br />
                <telerik:RadTextBox ID="txtHomeAddress1" runat="server" EmptyMessage="Address1"></telerik:RadTextBox><br />
                <telerik:RadTextBox ID="txtHomeAddress2" runat="server" EmptyMessage="Address2"></telerik:RadTextBox><br />
                <telerik:RadTextBox ID="txtHomeCity" runat="server" EmptyMessage="City"></telerik:RadTextBox><br />
                <telerik:RadComboBox ID="cboHomeState" runat="server" EmptyMessage="Select State" Height="100px">
	                <Items>
                        <telerik:RadComboBoxItem Value="" Text="Select State" />
		                <telerik:RadComboBoxItem Value="AL" Text="Alabama" />
		                <telerik:RadComboBoxItem Value="AK" Text="Alaska" />
		                <telerik:RadComboBoxItem Value="AZ" Text="Arizona" />
		                <telerik:RadComboBoxItem Value="AR" Text="Arkansas" />
		                <telerik:RadComboBoxItem Value="CA" Text="California" />
		                <telerik:RadComboBoxItem Value="CO" Text="Colorado" />
		                <telerik:RadComboBoxItem Value="CT" Text="Connecticut" />
		                <telerik:RadComboBoxItem Value="DC" Text="District of Columbia" />
		                <telerik:RadComboBoxItem Value="DE" Text="Delaware" />
		                <telerik:RadComboBoxItem Value="FL" Text="Florida" />
		                <telerik:RadComboBoxItem Value="GA" Text="Georgia" />
		                <telerik:RadComboBoxItem Value="HI" Text="Hawaii" />
		                <telerik:RadComboBoxItem Value="ID" Text="Idaho" />
		                <telerik:RadComboBoxItem Value="IL" Text="Illinois" />
		                <telerik:RadComboBoxItem Value="IN" Text="Indiana" />
		                <telerik:RadComboBoxItem Value="IA" Text="Iowa" />
		                <telerik:RadComboBoxItem Value="KS" Text="Kansas" />
		                <telerik:RadComboBoxItem Value="KY" Text="Kentucky" />
		                <telerik:RadComboBoxItem Value="LA" Text="Louisiana" />
		                <telerik:RadComboBoxItem Value="ME" Text="Maine" />
		                <telerik:RadComboBoxItem Value="MD" Text="Maryland" />
		                <telerik:RadComboBoxItem Value="MA" Text="Massachusetts" />
		                <telerik:RadComboBoxItem Value="MI" Text="Michigan" />
		                <telerik:RadComboBoxItem Value="MN" Text="Minnesota" />
		                <telerik:RadComboBoxItem Value="MS" Text="Mississippi" />
		                <telerik:RadComboBoxItem Value="MO" Text="Missouri" />
		                <telerik:RadComboBoxItem Value="MT" Text="Montana" />
		                <telerik:RadComboBoxItem Value="NE" Text="Nebraska" />
		                <telerik:RadComboBoxItem Value="NV" Text="Nevada" />
		                <telerik:RadComboBoxItem Value="NH" Text="New Hampshire" />
		                <telerik:RadComboBoxItem Value="NJ" Text="New Jersey" />
		                <telerik:RadComboBoxItem Value="NM" Text="New Mexico" />
		                <telerik:RadComboBoxItem Value="NY" Text="New York" />
		                <telerik:RadComboBoxItem Value="NC" Text="North Carolina" />
		                <telerik:RadComboBoxItem Value="ND" Text="North Dakota" />
		                <telerik:RadComboBoxItem Value="OH" Text="Ohio" />
		                <telerik:RadComboBoxItem Value="OK" Text="Oklahoma" />
		                <telerik:RadComboBoxItem Value="OR" Text="Oregon" />
		                <telerik:RadComboBoxItem Value="PA" Text="Pennsylvania" />
		                <telerik:RadComboBoxItem Value="RI" Text="Rhode Island" />
		                <telerik:RadComboBoxItem Value="SC" Text="South Carolina" />
		                <telerik:RadComboBoxItem Value="SD" Text="South Dakota" />
		                <telerik:RadComboBoxItem Value="TN" Text="Tennessee" />
		                <telerik:RadComboBoxItem Value="TX" Text="Texas" />
		                <telerik:RadComboBoxItem Value="UT" Text="Utah" />
		                <telerik:RadComboBoxItem Value="VT" Text="Vermont" />
		                <telerik:RadComboBoxItem Value="VA" Text="Virginia" />
		                <telerik:RadComboBoxItem Value="WA" Text="Washington" />
		                <telerik:RadComboBoxItem Value="WV" Text="West Virginia" />
		                <telerik:RadComboBoxItem Value="WI" Text="Wisconsin" />
		                <telerik:RadComboBoxItem Value="WY" Text="Wyoming" />
	                </Items>
                </telerik:RadComboBox><br />
                <telerik:RadTextBox ID="txtHomeZip" runat="server" EmptyMessage="Zip"></telerik:RadTextBox><br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ForeColor="Red" Display="Dynamic" ControlToValidate="txtHomeAddress1" InitialValue=""  ErrorMessage="Home Address is required!"></asp:RequiredFieldValidator><br />
            </td>
        </tr>
        <%--<tr>
             <td style="text-align:left;">
                <h1 style="font-weight: 600; font-style: italic;">Session Info</h1>
            </td>
        </tr>--%>
        <tr>
             <td style="text-align:left;">
                 <h2>Session Info</h2>
               <label>
                  <p>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Yleana runs two separate three-week sessions during the summer. Please be advised that in order to attend Yleana you must be able to attend a complete session.  No absences or early dismissals will be allowed; inability to attend the entire session means you forfeit your opportunity to attend Yleana. An accepted pool of 72 students will be chosen before session conflicts and preferences are considered; after students are accepted into the program, conflicts and scheduling will be addressed. The 2015 session dates are as follows: </p>
<p>- Session 1: June 27 - July 18, 2015 at Colgate University in Hamilton, NY</p>
<p>- Session 2: July 20 - August 10, 2015 at Colgate University and College</p>
<p>If you can attend either session, please choose "No" on the following two questions - we’d love to have you at either session, and your flexibility to move between sessions is really appreciated.</p>

               </label>
            </td>
        </tr>
        <tr>
             <td style="text-align:left;">
                 <label>Do you have any conflicts that prevent you from attending either session? </label>
                 <span style="color: red;">*</span><br />
                 <asp:RadioButtonList runat="server" ID="rboSessionConflicts" TextAlign="Right" RepeatDirection="Vertical" onchange="ShowSessionConflictsText();">
                     <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                     <asp:ListItem Text="No" Value="No"></asp:ListItem>
                 </asp:RadioButtonList>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ForeColor="Red" Display="Dynamic" ControlToValidate="rboSessionConflicts" InitialValue="" ErrorMessage="Select Your Session Conflicts options!"></asp:RequiredFieldValidator>
                 <div id="divSessionConflictsText" style="display: none;">
                     <label class="LabelInput">which session CAN you attend? </label>
                     <br />
                     <telerik:RadDropDownList runat="server" ID="ddlSession" EmptyMessage="Select Session">
                         <Items>
                             <telerik:DropDownListItem runat="server" Text="Select Session" Value="" />
                             <telerik:DropDownListItem runat="server" Text="Session 1" Value="Session 1" />
                             <telerik:DropDownListItem runat="server" Text="Session 2" Value="Session 2" />
                         </Items>
                     </telerik:RadDropDownList>
                     <br />
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ForeColor="Red" Display="Dynamic" ControlToValidate="ddlSession" InitialValue="" ErrorMessage="Select your Session!"></asp:RequiredFieldValidator>
                 </div>
            </td>
        </tr>
        <tr>
             <td style="text-align:left;">
                 <label>Do you prefer a particular session for any reason? </label>
                 <span style="color: red;">*</span><br />
                 <asp:RadioButtonList runat="server" ID="rboSessionPrefReason" TextAlign="Right" RepeatDirection="Vertical" onchange="ShowSessionReasonText();">
                     <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                     <asp:ListItem Text="No" Value="No"></asp:ListItem>
                 </asp:RadioButtonList>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ForeColor="Red" Display="Dynamic" ControlToValidate="rboSessionConflicts" InitialValue="" ErrorMessage="Select Your Session Conflicts options!"></asp:RequiredFieldValidator>
                 <div id="divSessionPrefReasonText" style="display: none;">
                     <label class="LabelInput">please tell us why you prefer this session?</label><br />
                     <telerik:RadTextBox ID="txtSessionPrefReason" runat="server"></telerik:RadTextBox><br />
                     <label class="LabelInput">Please select the session you would prefer to attend ? </label>
                     <br />
                     <telerik:RadDropDownList runat="server" ID="ddlPreferedSession" EmptyMessage="Select Session">
                         <Items>
                             <telerik:DropDownListItem runat="server" Text="Select Session" Value="" />
                             <telerik:DropDownListItem runat="server" Text="Session 1" Value="Session 1" />
                             <telerik:DropDownListItem runat="server" Text="Session 2" Value="Session 2" />
                         </Items>
                     </telerik:RadDropDownList>
                     <br />
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ForeColor="Red" Display="Dynamic" ControlToValidate="ddlPreferedSession" InitialValue="" ErrorMessage="Select your prefered Session!"></asp:RequiredFieldValidator>
                 </div>
            </td>
        </tr>
        <tr>
             <td style="text-align:left;">

            </td>
        </tr>
        <tr>
            <td style="text-align:left;">
                <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
            </td>
        </tr>
        </table>
        </asp:Panel>
    <table border="0" align="center" style="text-align: center; width: 50%; padding-left: 20px; margin-top: 20px; border: 0px solid">
        <tr>
            <td style="text-align: center; padding-left: 30px;">
                <telerik:RadButton ID="btnSave" runat="server" CausesValidation="false" ButtonType="StandardButton" Text="SAVE SECTION" Width="20%" OnClick="btnSave_Click"></telerik:RadButton>
                <telerik:RadButton ID="btnSaveNext" runat="server" CausesValidation="false" ButtonType="StandardButton" Text="SAVE & NEXT" Width="30%" OnClick="btnSaveNext_Click"></telerik:RadButton>
                <telerik:RadButton ID="btnNext" runat="server" CausesValidation="false" ButtonType="StandardButton" Text="NEXT" Width="20%" OnClick="btnNext_Click"></telerik:RadButton>
                <br />
                <br />
            </td>
        </tr>
    </table>
</asp:Content>
