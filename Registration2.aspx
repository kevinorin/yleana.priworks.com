<%@ Page Title="" Language="C#" MaintainScrollPositionOnPostback="true" MasterPageFile="~/studentMaster.Master" AutoEventWireup="true" CodeBehind="Registration2.aspx.cs" Inherits="yleana.Registration2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<script type="text/javascript">
    window.onload = function () {
        ShowRelationshipText();
        ShowParentAddressText();
        showStayHomeWithText();
        showIncomeContributionText();
        ShowFirstGenerationText();
        ShowParentHighSchoolText();
        ShowSiblingText();
    };
    function ShowRelationshipText() {
        var raddropdownlist = $find('<%=ddlRelation.ClientID %>');
        var selecteditem = raddropdownlist.get_selectedItem().get_value();
        if (selecteditem == "Other") {
                $('#divRelationText').show();
           }
        else {
                $('#divRelationText').hide();
            }
    }
    function ShowParentAddressText() {
        var raddropdownlist = $find('<%=ddlParentAddress.ClientID %>');
        var selecteditem = raddropdownlist.get_selectedItem().get_value();
        if (selecteditem == "Other") {
            $('#divAddressText').show();
        }
        else {
            $('#divAddressText').hide();
        }
    }
    
    function showStayHomeWithText() {
        var rb = document.getElementById("<%=rbtStayHomeWith.ClientID%>");
            var inputs = rb.getElementsByTagName('input');
            var selected;
            var ShowTextbox = false;
            for (var i = 0; i < inputs.length; i++) {
                if (inputs[i].checked) {
                    selected = inputs[i];
                    if (selected.value == "Other") {
                        ShowTextbox = true;
                    }
                }
            }
            if (ShowTextbox == true) {
                $('#<%=divStayHomeText.ClientID %>').show();
            }
            else {
                $('#<%=divStayHomeText.ClientID %>').hide();
            }
    }

    function showIncomeContributionText() {

        var rb = document.getElementById("<%=cboIncomeContribution.ClientID%>");
        var inputs = rb.getElementsByTagName('input');
        var selected;
        var ShowTextbox = false;
        for (var i = 0; i < inputs.length; i++) {
            if (inputs[i].checked) {
                selected = inputs[i];
                if (selected.value == "Other") {
                    ShowTextbox = true;
                }
            }
        }
        if (ShowTextbox == true) {
            $('#divContrubutionText').show();
        }
        else {
            $('#divContrubutionText').hide();
        }
    }

    function ShowFirstGenerationText() {
        if ($('#<%=rboFirstGeneration.ClientID %> input:checked').val() == "No") {
            $('#divFirstGenerationText').show();
        }
        else {
            $('#divFirstGenerationText').hide();
        }
    }

    function ShowParentHighSchoolText() {
        if ($('#<%=rboParentHighSchool.ClientID %> input:checked').val() == "No") {
            $('#divParentHighSchoolText').show();
        }
        else {
            $('#divParentHighSchoolText').hide();
        }
    }

    function ShowSiblingText() {
        if ($('#<%=rboSiblings.ClientID %> input:checked').val() == "Yes") {
            $('#divSiblingTest').show();
        }
        else {
            $('#divSiblingTest').hide();
        }
    }
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="panl1" runat="server">
    <table border="0" align="center" style="text-align: center; width: 50%; padding-left: 20px; margin-top: 20px; border: 0px solid">
        <tr>
            <td style="text-align:left;">
                <h1 style="font-weight: 600; font-style: italic;">Parent Info </h1>
            </td>
        </tr>
        <tr>
            <td style="text-align:left;">
                <label class="TextBoxInput" style="margin-top: 20px;">With whom do you make your permanent home?  </label>
                <asp:CheckBoxList ID="rbtStayHomeWith" runat="server" onchange="showStayHomeWithText();">
                    <asp:ListItem>Both parents</asp:ListItem>
                    <asp:ListItem>Mother</asp:ListItem>
                    <asp:ListItem>Father</asp:ListItem>
                    <asp:ListItem>Other Legal Guardian (that is not your mother/father)</asp:ListItem>
                    <asp:ListItem>Siblings</asp:ListItem>
                    <asp:ListItem>Grandparent(s)</asp:ListItem>
                    <asp:ListItem>Aunt/Uncle</asp:ListItem>
                    <asp:ListItem>Cousins</asp:ListItem>
                    <asp:ListItem>Step-parents</asp:ListItem>
                    <asp:ListItem>Foster parents</asp:ListItem>
                    <asp:ListItem>Step siblings</asp:ListItem>
                    <asp:ListItem>Half siblings</asp:ListItem>
                    <asp:ListItem>Friend</asp:ListItem>
                    <asp:ListItem>Other relative</asp:ListItem>
                    <asp:ListItem>Other</asp:ListItem>
                </asp:CheckBoxList>
                <div id="divStayHomeText" runat="server" style="display:none;">
                    <label class="LabelInput">Enter details of Others: </label><br />
                    <telerik:RadTextBox ID="txtStayHomeWithText" runat="server"></telerik:RadTextBox>
                </div>
            </td>
        </tr>
        <tr>
            <td style="text-align:left;">
                <label class="TextBoxInput" style="margin-top: 20px;">Please provide the name of one of your parents or legal guardian as an emergency contact :</label>
                <span style="color:red;">*</span><br />
                (This must be information about your parent or legal guardian. Please provide a contact number and email that you know can and will be answered.)<br />
                <telerik:RadTextBox ID="txtEmergencyContactName" runat="server"></telerik:RadTextBox><br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ForeColor="Red" Display="Dynamic" ControlToValidate="txtEmergencyContactName" ErrorMessage="The Emergency Contact Name can not be empty!"></asp:RequiredFieldValidator>
            </td>
        </tr>
         <tr>
            <td style="text-align:left;">
                <label class="LabelInput">What is your relationship to this individual? </label>
                <span style="color:red;">*</span><br />
                <telerik:RadDropDownList runat="server" ID="ddlRelation" EmptyMessage="Select Relationhip" OnClientSelectedIndexChanged="ShowRelationshipText">
                    <Items>
                        <telerik:DropDownListItem runat="server" Text="Mother" Value="Mother" />
                        <telerik:DropDownListItem runat="server" Text="Father" Value="Father" />
                        <telerik:DropDownListItem runat="server" Text="Legal Guardian" Value="Legal Guardian" />
                        <telerik:DropDownListItem runat="server" Text="Other" Value="Other" />
                    </Items>
                </telerik:RadDropDownList><br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ForeColor="Red" Display="Dynamic" ControlToValidate="ddlRelation" ErrorMessage="The relationship can not be empty!"></asp:RequiredFieldValidator>
                <div id="divRelationText" style="display:none;">
                    <label class="LabelInput">Fill your other relationship : </label><br />
                    <telerik:RadTextBox ID="txtRelationshipText" runat="server"></telerik:RadTextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ForeColor="Red" Display="Dynamic" ControlToValidate="txtRelationshipText" ErrorMessage="The other relationship can not be empty!"></asp:RequiredFieldValidator>
                </div>
            </td>
        </tr>
         <tr>
            <td style="text-align:left;">
                <label class="LabelInput">What is a working cell phone/mobile number for us to contact this individual? </label>
                <span style="color:red;">*</span><br />
                <telerik:RadMaskedTextBox ID="txtparentContactNumber" runat="server" Mask="(###) ### - ####"></telerik:RadMaskedTextBox><br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ForeColor="Red" Display="Dynamic" ControlToValidate="txtparentContactNumber" ErrorMessage="The Parent/Guardian Contact Number can not be empty!"></asp:RequiredFieldValidator>
            </td>
        </tr>
         <tr>
            <td style="text-align:left;">
                <label class="LabelInput">Please provide a valid email address for this individual : </label>
                <span style="color:red;">*</span><br />
                <telerik:RadTextBox ID="txtParentEmail" runat="server"></telerik:RadTextBox><br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ForeColor="Red" Display="Dynamic" ControlToValidate="txtParentEmail" ErrorMessage="The parent Contact Email can not be empty!"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ForeColor="Red" Display="Dynamic" ErrorMessage="Please, enter valid e-mail address." ValidationExpression="^[\w\.\-]+@[a-zA-Z0-9\-]+(\.[a-zA-Z0-9\-]{1,})*(\.[a-zA-Z]{2,3}){1,2}$" ControlToValidate="txtParentEmail">
                </asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td style="text-align:left;">
                <label class="LabelInput">Parent or Legal Guardian Address : </label><br />
                <telerik:RadDropDownList runat="server" ID="ddlParentAddress" EmptyMessage="Select Relationhip" OnClientSelectedIndexChanged="ShowParentAddressText">
                    <Items>
                        <telerik:DropDownListItem runat="server" Text="Same as mine" Value="Same as mine" />
                        <telerik:DropDownListItem runat="server" Text="Other" Value="Other" />
                    </Items>
                </telerik:RadDropDownList><br />
                <div id="divAddressText" style="display:none;">
                    <label class="LabelInput">Fill your Parent or Legal Guardian Address : </label><br />
                    <telerik:RadTextBox ID="txtParentAddress1" runat="server" EmptyMessage="Address1"></telerik:RadTextBox><br />
                    <telerik:RadTextBox ID="txtParentAddress2" runat="server" EmptyMessage="Address2"></telerik:RadTextBox><br />
                    <telerik:RadTextBox ID="txtParentCity" runat="server" EmptyMessage="City"></telerik:RadTextBox><br />
                    <telerik:RadComboBox ID="cboParentState" runat="server" EmptyMessage="Select State" Height="100px">
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
                    <telerik:RadTextBox ID="txtParentZip" runat="server" EmptyMessage="Zip"></telerik:RadTextBox><br />
                </div>
            </td>
        </tr>
        <tr>
             <td style="text-align:left;">
                  <h2>Family Info</h2>
                <label class="LabelInput">Who contributes to your family income ? </label><br />
                <asp:CheckBoxList ID="cboIncomeContribution" runat="server" onchange="showIncomeContributionText();">
                    <asp:ListItem>Me</asp:ListItem>
                    <asp:ListItem>One parent</asp:ListItem>
                    <asp:ListItem>Both parents</asp:ListItem>
                    <asp:ListItem>Legal guardian</asp:ListItem>
                    <asp:ListItem>Siblings</asp:ListItem>
                    <asp:ListItem>Other</asp:ListItem>                    
                </asp:CheckBoxList>
                <div id="divContrubutionText" style="display:none;">
                    <label class="LabelInput">Enter details of Others: </label><br />
                    <telerik:RadTextBox ID="txtIncomeContributionText" runat="server"></telerik:RadTextBox>
                </div>
            </td>
        </tr>
        <tr>
             <td style="text-align:left;">
                <label class="LabelInput">What is the approximate level of your annual family income ? </label><br />
                 <telerik:RadDropDownList runat="server" ID="ddlIncome" EmptyMessage="Select Relationhip" >
                    <Items>
                        <telerik:DropDownListItem runat="server" Text="Less than $10,000" Value="Less than $10,000" /> 
                        <telerik:DropDownListItem runat="server" Text="$10,000-$20,000" Value="$10,000-$20,000" />
                        <telerik:DropDownListItem runat="server" Text="$20,000 -$30,000" Value="$20,000 -$30,000" />
                        <telerik:DropDownListItem runat="server" Text="$30,000 - $40,000" Value="$30,000 - $40,000" /> 
                        <telerik:DropDownListItem runat="server" Text="$40,000-$50,000" Value="$40,000-$50,000" /> 
                        <telerik:DropDownListItem runat="server" Text="$50,0000-$60,000" Value="$50,0000-$60,000" />  
                        <telerik:DropDownListItem runat="server" Text="More than $60,000" Value="More than $60,000" />
                        <telerik:DropDownListItem runat="server" Text="I don’t know" Value="I don’t know" />
                        <telerik:DropDownListItem runat="server" Text="I prefer not to say" Value="I prefer not to say" />
                    </Items>
                </telerik:RadDropDownList><br />
            </td>
        </tr>
        <tr>
             <td style="text-align:left;">
                <label class="LabelInput">Will you be a first-generation college student ? </label>
                <span style="color:red;">*</span><br />
                <asp:RadioButtonList runat="server" ID="rboFirstGeneration" TextAlign="Right" RepeatDirection="Vertical" onchange="ShowFirstGenerationText();">
                    <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                    <asp:ListItem Text="No" Value="No"></asp:ListItem>
                </asp:RadioButtonList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ForeColor="Red" Display="Dynamic" ControlToValidate="rboFirstGeneration" ErrorMessage="Please select the first-generation college student options!"></asp:RequiredFieldValidator>
                 <div id="divFirstGenerationText" style="display:none;">
                    <label class="LabelInput">If not, who in your family has gone to college before you ? </label><br />
                    <telerik:RadTextBox ID="txtFirstGraduationText" runat="server"></telerik:RadTextBox><br />
                     <label class="LabelInput">Has anyone in your family gone to graduate school or any other type of higher education? </label><br />
                    <asp:RadioButtonList runat="server" ID="rboAnyoneGraduateHigherEducation" TextAlign="Right" RepeatDirection="Vertical">
                        <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                        <asp:ListItem Text="No" Value="No"></asp:ListItem>
                    </asp:RadioButtonList>
                </div>
            </td>
        </tr>
        <tr>
             <td style="text-align:left;">
                <label class="LabelInput">Did your parents/ legal guardian attend high school in the United States ? </label><br />
                <asp:RadioButtonList runat="server" ID="rboParentHighSchool" TextAlign="Right" RepeatDirection="Vertical" onchange="ShowParentHighSchoolText();">
                    <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                    <asp:ListItem Text="No" Value="No"></asp:ListItem>
                </asp:RadioButtonList>
                 <div id="divParentHighSchoolText" style="display:none;">
                    <label class="LabelInput">Are they familiar with American system and processes, such as the K-12 educational system, college application process, etc? </label><br />
                    <asp:RadioButtonList runat="server" ID="rboParentFamilierUSEducation" TextAlign="Right" RepeatDirection="Vertical">
                        <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                        <asp:ListItem Text="No" Value="No"></asp:ListItem>
                    </asp:RadioButtonList>
                </div>
            </td>
        </tr>
        <tr>
             <td style="text-align:left;">
                <label class="LabelInput">Has your parent or legal guardian taken the SAT or any other standardized test before ? </label><br />
                <asp:RadioButtonList runat="server" ID="rboParentSAT" TextAlign="Right" RepeatDirection="Vertical">
                    <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                    <asp:ListItem Text="No" Value="No"></asp:ListItem>
                </asp:RadioButtonList>                 
            </td>
        </tr>
        <tr>
             <td style="text-align:left;">
                <label class="LabelInput">Do you have any siblings ? </label><br />
                <asp:RadioButtonList runat="server" ID="rboSiblings" TextAlign="Right" RepeatDirection="Vertical" onchange="ShowSiblingText();">
                    <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                    <asp:ListItem Text="No" Value="No"></asp:ListItem>
                </asp:RadioButtonList> 
                 <div id="divSiblingTest" style="display:none;">
                    <label class="LabelInput">What gender are your siblings ? </label><br />
                    <telerik:RadDropDownList runat="server" ID="ddlSiblingGender" EmptyMessage="Select Relationhip" >
                        <Items>
                            <telerik:DropDownListItem runat="server" Text="Male" Value="Male" />
                            <telerik:DropDownListItem runat="server" Text="Female" Value="Female" />
                            <telerik:DropDownListItem runat="server" Text="Both" Value="Both" />
                        </Items>
                    </telerik:RadDropDownList><br />
                     <label class="LabelInput">Are your siblings older or younger than you ? </label><br />
                    <telerik:RadDropDownList runat="server" ID="ddlsiblingOlderYounger" EmptyMessage="Select Relationhip" >
                        <Items>
                            <telerik:DropDownListItem runat="server" Text="Older" Value="Older" />
                            <telerik:DropDownListItem runat="server" Text="Younger" Value="Younger" />
                            <telerik:DropDownListItem runat="server" Text="Both" Value="Both" />
                        </Items>
                    </telerik:RadDropDownList><br />
                     <label class="LabelInput">Have any of your siblings attended college before or are currently attending college ? </label><br />
                    <asp:RadioButtonList runat="server" ID="rboSiblingAttendedCollege" TextAlign="Right" RepeatDirection="Vertical">
                        <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                        <asp:ListItem Text="No" Value="No"></asp:ListItem>
                    </asp:RadioButtonList>
                 </div>                
            </td>
        </tr>        
        <tr>
             <td style="text-align:left;">
                <br />
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
            <td style="text-align:center;padding-left:0px;">
                <telerik:RadButton ID="btnPrevious" runat="server" CausesValidation="false" ButtonType="StandardButton" Text="Previous" Width="20%" OnClick="btnPrevious_Click"></telerik:RadButton>
                <telerik:RadButton ID="btnSave" runat="server" CausesValidation="false" ButtonType="StandardButton" Text="SAVE SECTION" Width="20%" OnClick="btnSave_Click"></telerik:RadButton>
                <telerik:RadButton ID="btnSaveAndNext" runat="server" CausesValidation="false" ButtonType="StandardButton" Text="SAVE & NEXT" Width="20%" OnClick="btnSaveAndNext_Click"></telerik:RadButton>
                <telerik:RadButton ID="btnNext" runat="server" CausesValidation="false" ButtonType="StandardButton" Text="NEXT" Width="20%" OnClick="btnNext_Click"></telerik:RadButton><br /><br />
            </td>
        </tr>
    </table>
</asp:Content>
