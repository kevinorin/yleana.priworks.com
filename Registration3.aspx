<%@ Page Title="" Language="C#" MaintainScrollPositionOnPostback="true" MasterPageFile="~/studentMaster.Master" AutoEventWireup="true" CodeBehind="Registration3.aspx.cs" Inherits="yleana.Registration3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        window.onload = function () {
            ShowGraduationYear();
            ShowGPA();
            ShowTest();
            ShowExtendedSchool();
            ShowSATPrepare();
            ShowOfficialSATScore();
            ShowPracticeSATScore();
        };
        function ShowGraduationYear() {
            var raddropdownlist = $find('<%=ddlGraduationYear.ClientID %>');
            var selecteditem = raddropdownlist.get_selectedItem().get_value();
            if (selecteditem == "Other") {
                $('#divGraduYear').show();
            }
            else {
                $('#divGraduYear').hide();
            }
            
        }
        function ShowGPA() {
            var raddropdownlist = $find('<%=ddlGPA.ClientID %>');
            var selecteditem = raddropdownlist.get_selectedItem().get_value();
            if (selecteditem == "Other") {
                $('#divGPA').show();
            }
            else {
                $('#divGPA').hide();
            }
        }
        function ShowTest() {
            //alert($('#<%=rbtExtendedTimeStandardised.ClientID %> input:checked').val());
            if ($('#<%=rbtExtendedTimeStandardised.ClientID %> input:checked').val() == "Yes") {
                $('#divExtendedTest').show();
            }
            else {
                $('#divExtendedTest').hide();
            }           
        }
        function ShowExtendedSchool() {
            if ($('#<%=rbtExtendedSchool.ClientID %> input:checked').val() == "Yes") {
                $('#divExtendedSchool').show();
            }
            else {
                $('#divExtendedSchool').hide();
            }
        }
        function ShowSATPrepare() {
            if ($('#<%=rbtSATPreparation.ClientID %> input:checked').val() == "Yes") {
                $('#divSATPrepare').show();
            }
            else {
                $('#divSATPrepare').hide();
            }
        }
        function ShowOfficialSATScore() {
            if ($('#<%=rbtOfficialSAT.ClientID %> input:checked').val() == "Yes") {
                $('#divOfficialSATScore').show();
            }
            else {
                $('#divOfficialSATScore').hide();
            }
        }
        function ShowPracticeSATScore() {
            if ($('#<%=rbtPracticeSAT.ClientID %> input:checked').val() == "Yes") {
                $('#divPracticeSATScore').show();
            }
            else {
                $('#divPracticeSATScore').hide();
            }
        }
        
        
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="panl1" runat="server">
     <table border="0" align="center" style="text-align: center; width: 50%; padding-left: 20px; margin-top: 20px; border: 0px solid">         
        <tr>
            <td style="text-align:left;">
                <h1 style="font-weight: 600; font-style: italic;">Educational Info </h1>
            </td>
        </tr>
        <tr>
            <td style="text-align:left;">
                <label class="LabelInput" style="margin-top: 20px;">What is the name of the high school that you currently attend? </label>
                <span style="color:red;">*</span><br />
                <telerik:RadTextBox ID="txtSchoolName" runat="server"></telerik:RadTextBox><br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ForeColor="Red" Display="Dynamic" ControlToValidate="txtSchoolName" ErrorMessage="The School Name can not be empty!"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="text-align:left;">
                <label class="LabelInput" style="margin-top: 20px;">In what year do you expect to graduate? </label>
                <span style="color:red;">*</span><br />
                <telerik:RadDropDownList runat="server" ID="ddlGraduationYear" DefaultMessage="Select Year" OnClientSelectedIndexChanged="ShowGraduationYear">                                      
                    </telerik:RadDropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ForeColor="Red" Display="Dynamic" ControlToValidate="ddlGraduationYear" ErrorMessage="The Graduation Year can not be empty!"></asp:RequiredFieldValidator>
                <div id="divGraduYear" style="display:none;">
                    <label class="LabelInput">Fill your Graduation Year :</label><br />
                    <telerik:RadTextBox ID="txtGraduationYear" runat="server"></telerik:RadTextBox><br />
                </div>
            </td>
        </tr>
         <tr>
             <td style="text-align:left;">
                 <label>Do you qualify for free/reduced lunch? </label>
                 <span style="color:red;">*</span><br />
                <asp:RadioButtonList runat="server" ID="rboLunch" TextAlign="Right" RepeatDirection="Vertical">
                    <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                    <asp:ListItem Text="No" Value="No"></asp:ListItem>
                </asp:RadioButtonList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ForeColor="Red" Display="Dynamic" ControlToValidate="rboLunch" ErrorMessage="Please select the Free/Reduced lunch options!"></asp:RequiredFieldValidator>
             </td>
         </tr>
         <tr>
             <td style="text-align:left;">
                 <label>What is your current GPA? </label>
                 <span style="color:red;">*</span><br />
                 (Please select "Other" if you attend an IB school and enter it in the box below.)<br />
                 <telerik:RadDropDownList runat="server" ID="ddlGPA" DefaultMessage="Select GPA" OnClientSelectedIndexChanged="ShowGPA">
                     <Items>
                         <telerik:DropDownListItem Text="Less than 1.0" Value="Less than 1.0" />
                         <telerik:DropDownListItem Text="1.1-2.0" Value="1.1-2.0" />
                         <telerik:DropDownListItem Text="2.1-3.0" Value="2.1-3.0" />
                         <telerik:DropDownListItem Text="3.1-4.0" Value="3.1-4.0" />
                         <telerik:DropDownListItem Text="Greater than 4.0" Value="Greater than 4.0" />
                         <telerik:DropDownListItem Text="Other" Value="Other" />
                     </Items>                                       
                    </telerik:RadDropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ForeColor="Red" Display="Dynamic" ControlToValidate="ddlGPA" ErrorMessage="Please select your GPA!"></asp:RequiredFieldValidator>
                <div id="divGPA" style="display:none;">
                    <label class="LabelInput">Fill your GPA : </label><br />
                    <telerik:RadTextBox ID="txtGPA" runat="server"></telerik:RadTextBox><br />
                </div>
             </td>
        </tr>
         <tr>
             <td style="text-align:left;">
                 <label>Do you currently have extended time or any accommodations on any standardized test? </label><br />
                <asp:RadioButtonList runat="server" ID="rbtExtendedTimeStandardised" TextAlign="Right" RepeatDirection="Vertical" onchange="ShowTest();">
                    <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                    <asp:ListItem Text="No" Value="No"></asp:ListItem>
                </asp:RadioButtonList>
                <div id="divExtendedTest" style="display:none;">
                    <label class="LabelInput">Select the test : </label><br />                    
                    <telerik:RadDropDownList ID="ddlextendedtest" runat="server">
                        <Items>
                            <telerik:DropDownListItem Text="ACT" Value="ACT" />
                            <telerik:DropDownListItem Text="SAT" Value="SAT" />
                            <telerik:DropDownListItem Text="Both" Value="Both" />
                        </Items>
                    </telerik:RadDropDownList><br />
                    <label class="LabelInput">Please describe these accommodations : </label><br />
                    <telerik:RadTextBox ID="txtExtendedTimeStandardisedText" runat="server"></telerik:RadTextBox><br />
                </div>
            </td>
        </tr>
         <tr>
             <td style="text-align:left;">
                 <label>Do you currently have extended time or any accommodations while at school?  </label><br />
                 <asp:RadioButtonList runat="server" ID="rbtExtendedSchool" TextAlign="Right" RepeatDirection="Vertical" onchange="ShowExtendedSchool();">
                    <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                    <asp:ListItem Text="No" Value="No"></asp:ListItem>
                </asp:RadioButtonList>
                 <div id="divExtendedSchool" style="display:none;">
                     <label class="LabelInput">Please describe these accommodations : </label><br />
                    <telerik:RadTextBox ID="txtExtendedSchoolText" runat="server"></telerik:RadTextBox><br />
                 </div>
            </td>
        </tr>
         <tr>
             <td style="text-align:left;">
                 <label>Does anyone ever read your tests out loud to you in school or write down your answers for you? </label><br />
                 <asp:RadioButtonList runat="server" ID="rbtExamHelper" TextAlign="Right" RepeatDirection="Vertical">
                    <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                    <asp:ListItem Text="No" Value="No"></asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
         <tr>
             <td style="text-align:left;">
                 <h2>SAT Info</h2>
                 <label>Have you studied or prepared for the SAT in any way before? </label>
                 <span style="color:red;">*</span><br />
                 <asp:RadioButtonList runat="server" ID="rbtSATPreparation" TextAlign="Right" RepeatDirection="Vertical" onchange="ShowSATPrepare();">
                    <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                    <asp:ListItem Text="No" Value="No"></asp:ListItem>
                </asp:RadioButtonList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ForeColor="Red" Display="Dynamic" ControlToValidate="rbtSATPreparation" ErrorMessage="Please select your SAT preparation option!"></asp:RequiredFieldValidator>
                 <div id="divSATPrepare" style="display:none;">
                    <label class="LabelInput">Fill your SAT Preparation details : </label><br />
                    <telerik:RadTextBox ID="txtSATPrepare" runat="server"></telerik:RadTextBox><br />
                </div>
            </td>
        </tr>
         <tr>
             <td style="text-align:left;">
                 <label>Have you taken an official (College Board administered) SAT exam? </label>
                 <span style="color:red;">*</span><br />
                 <asp:RadioButtonList runat="server" ID="rbtOfficialSAT" TextAlign="Right" RepeatDirection="Vertical" onchange="ShowOfficialSATScore();">
                    <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                    <asp:ListItem Text="No" Value="No"></asp:ListItem>
                </asp:RadioButtonList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ForeColor="Red" Display="Dynamic" ControlToValidate="rbtOfficialSAT" ErrorMessage="Please select your Official SAT details!"></asp:RequiredFieldValidator>
                 <div id="divOfficialSATScore" style="display:none;">
                    <label class="LabelInput">Fill your SAT score : </label><br />
                    <telerik:RadTextBox ID="txtSATTotal" runat="server" EmptyMessage="SAT Total Score"></telerik:RadTextBox><br />
                    <telerik:RadTextBox ID="txtSATReading" runat="server" EmptyMessage="Reading Score"></telerik:RadTextBox><br />
                    <telerik:RadTextBox ID="txtSATWriting" runat="server" EmptyMessage="Writing Score"></telerik:RadTextBox><br />
                    <telerik:RadTextBox ID="txtSATMath" runat="server" EmptyMessage="Math Score"></telerik:RadTextBox><br />
                    <%--<telerik:RadTextBox ID="txtSATEssay" runat="server" EmptyMessage="Essay Score"></telerik:RadTextBox><br />--%>
                </div>
            </td>
        </tr>
         <tr>
             <td style="text-align:left;">
                 <label>Have you taken a practice SAT exam, either at your school, at home or somewhere else? </label><br />
                 <asp:RadioButtonList runat="server" ID="rbtPracticeSAT" TextAlign="Right" RepeatDirection="Vertical" onchange="ShowPracticeSATScore();">
                    <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                    <asp:ListItem Text="No" Value="No"></asp:ListItem>
                </asp:RadioButtonList>
                 <div id="divPracticeSATScore" style="display:none;">
                    <label class="LabelInput">Fill your SAT score : </label><br />
                    <telerik:RadTextBox ID="txtPracticeSATScore" runat="server" EmptyMessage="SAT Total Score"></telerik:RadTextBox><br />
                    <telerik:RadTextBox ID="txtPracticeSATReading" runat="server" EmptyMessage="Reading Score"></telerik:RadTextBox><br />
                    <telerik:RadTextBox ID="txtPracticeSATWriting" runat="server" EmptyMessage="Writing Score"></telerik:RadTextBox><br />
                    <telerik:RadTextBox ID="txtPracticeSATMath" runat="server" EmptyMessage="Math Score"></telerik:RadTextBox><br />
                    <%--<telerik:RadTextBox ID="txtPracticeSATEssay" runat="server" EmptyMessage="Essay Score"></telerik:RadTextBox><br />--%>
                </div>
            </td>
        </tr>
         <tr>
             <td style="text-align:left;">
                <label>Have you taken any other type of standardized test? If so, please list here </label><br />
                 <telerik:RadTextBox ID="txtOtherStandardTests" runat="server"></telerik:RadTextBox><br />
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
                <telerik:RadButton ID="btnSaveNext" runat="server" CausesValidation="false"  ButtonType="StandardButton" Text="SAVE & NEXT" Width="20%" OnClick="btnSaveNext_Click"></telerik:RadButton>
                <telerik:RadButton ID="btnNext" runat="server" CausesValidation="false" ButtonType="StandardButton" Text="NEXT" Width="20%" OnClick="btnNext_Click"></telerik:RadButton><br /><br />
            </td>
        </tr>
    </table>
</asp:Content>
