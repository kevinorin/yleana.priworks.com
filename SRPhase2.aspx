<%@ Page Title="" Language="C#" MasterPageFile="~/studentMaster.Master" AutoEventWireup="true" CodeBehind="SRPhase2.aspx.cs" Inherits="yleana.SRPhase2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        function EmailEdit() {
            document.getElementById('<%=txtEmail.ClientID%>').readOnly = false;
        }
    </script>
    <style>
        .captcha img
        {
             display: inline !important;
             height: 40px !important;
             width: 160px !important;
             padding-left: 141px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="text-align:center;border:solid 0px;">
            <div style="text-align:right;width:800px; border:solid 0px;">
                <div>
                <h1 style="font-weight: 600; font-style: italic; ">Student Basic Demographic Info</h1>            
                    <label class="LabelInput">Partner Organization : </label><span style="color:red;">*</span>
                    <telerik:RadDropDownList ID="ddlPartner" runat="server" DataTextField="PartnerOrgname" DataValueField="idPartner" DefaultMessage="Select Partner" /><br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ForeColor="Red" Display="Dynamic" ControlToValidate="ddlPartner" InitialValue=""  ErrorMessage="Partner is required!"></asp:RequiredFieldValidator>
                </div>
                <br />
                <div>
                    <label class="LabelInput">Location : </label><span style="color:red;">*</span>
                    <telerik:RadDropDownList ID="ddlLocation" runat="server" DataTextField="Location" DataValueField="id" DefaultMessage="Select Location" /><br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ForeColor="Red" Display="Dynamic" ControlToValidate="ddlLocation" InitialValue=""  ErrorMessage="Partner Location is required!"></asp:RequiredFieldValidator>
                </div>
                <br />
                <div>
                    <label class="LabelInput" style="margin-top: 20px;">First Name : </label><span style="color:red;">*</span>
                    <telerik:RadTextBox ID="txtFirstName" runat="server"></telerik:RadTextBox><br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ForeColor="Red" Display="Dynamic" ControlToValidate="txtFirstName" ErrorMessage="The First Name can not be empty!"></asp:RequiredFieldValidator>
                </div>
                <br />
                <div>
                    <label class="LabelInput" style="margin-top: 20px;">Last Name : </label><span style="color:red;">*</span>
                    <telerik:RadTextBox ID="txtLastName" runat="server"></telerik:RadTextBox><br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ForeColor="Red" Display="Dynamic" ControlToValidate="txtLastName" ErrorMessage="The Last Name can not be empty!"></asp:RequiredFieldValidator>
                </div>
                <br />            
                <div>
                    <label class="TextBoxInput" style="margin-top: 20px;">Contact Number(CellPhone) : </label><span style="color:red;">*</span>
                    <telerik:RadTextBox ID="txtPhone" runat="server"></telerik:RadTextBox><br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ForeColor="Red" Display="Dynamic" ControlToValidate="txtPhone" ErrorMessage="The Contact Number can not be empty!"></asp:RequiredFieldValidator>
                </div>
                <br />  
                <div>
                    <label class="TextBoxInput" style="margin-top: 20px;">Contact Email : </label><span style="color:red;">*</span>
                    <telerik:RadTextBox ID="txtEmail" runat="server" ReadOnly="true"></telerik:RadTextBox><asp:LinkButton ID="lbt" runat="server" OnClientClick="javascript:EmailEdit();">Update</asp:LinkButton><br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ForeColor="Red" Display="Dynamic" ControlToValidate="txtEmail" ErrorMessage="The Contact Email can not be empty!"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="emailValidator" runat="server" ForeColor="Red" Display="Dynamic" ErrorMessage="Please, enter valid e-mail address." ValidationExpression="^[\w\.\-]+@[a-zA-Z0-9\-]+(\.[a-zA-Z0-9\-]{1,})*(\.[a-zA-Z]{2,3}){1,2}$" ControlToValidate="txtEmail">
                    </asp:RegularExpressionValidator>
                </div>
                <br /> 
                <div>
                    <label>Age : </label><span style="color:red;">*</span>
                    <telerik:RadDropDownList ID="ddlAge" runat="server" DefaultMessage="Select Age" DropDownHeight="100px"></telerik:RadDropDownList><br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ForeColor="Red" Display="Dynamic" ControlToValidate="ddlAge" InitialValue=""  ErrorMessage="Age is required!"></asp:RequiredFieldValidator>
                </div>
                <br /> 
                <div>
                    <label>Gender : </label><span style="color:red;">*</span>
                    <telerik:RadDropDownList runat="server" ID="ddlGender" EmptyMessage="Select Gender">
                        <Items>
                            <telerik:DropDownListItem runat="server" Text="Male" Value="Male" />
                            <telerik:DropDownListItem runat="server" Text="Female" Value="Female" />                        
                        </Items>
                    </telerik:RadDropDownList><br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ForeColor="Red" Display="Dynamic" ControlToValidate="ddlGender" InitialValue=""  ErrorMessage="Gender is required!"></asp:RequiredFieldValidator>
                </div>
                <br /> 
                <div>
                    <label>Birth Place : </label>
                    <telerik:RadTextBox ID="txtBirthPlace" runat="server"></telerik:RadTextBox><br />
                </div>
                <br /> 
                <div>
                    <label>Home Address : </label><span style="color:red;">*</span>
                    <telerik:RadTextBox ID="txtHomeAddress1" runat="server" EmptyMessage="Address1"></telerik:RadTextBox><br />
                    <telerik:RadTextBox ID="txtHomeAddress2" runat="server" EmptyMessage="Address2"></telerik:RadTextBox><br />
                    <telerik:RadTextBox ID="txtHomeCity" runat="server" EmptyMessage="City"></telerik:RadTextBox><br />
                    <telerik:RadTextBox ID="txtHomeState" runat="server" EmptyMessage="State"></telerik:RadTextBox><br />
                    <telerik:RadTextBox ID="txtHomeZip" runat="server" EmptyMessage="Zip"></telerik:RadTextBox><br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ForeColor="Red" Display="Dynamic" ControlToValidate="txtHomeAddress1" InitialValue="Address1"  ErrorMessage="Home Address is required!"></asp:RequiredFieldValidator>
                </div>
                <br /> 
                <div>
                    <label>Parent/Guardian Name : </label><span style="color:red;">*</span>
                    <telerik:RadTextBox ID="txtParentName" runat="server"></telerik:RadTextBox><br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ForeColor="Red" Display="Dynamic" ControlToValidate="txtParentName"  ErrorMessage="Parent/Guardian Name is required!"></asp:RequiredFieldValidator>

                </div>
                <br />
                <div>
                    <label>Parent/Guardian RelationShip : </label>
                    <telerik:RadTextBox ID="txtParentRelation" runat="server"></telerik:RadTextBox><br />
                </div>
                <br /> 
                <div>
                    <label>Parent/Guardian Contact # : </label>
                    <telerik:RadTextBox ID="txtParentContact" runat="server"></telerik:RadTextBox><br />
                </div>
                <br /> 
                <div>
                    <label>Parent/Guardian Contact Email : </label>
                    <telerik:RadTextBox ID="txtParentEmail" runat="server"></telerik:RadTextBox><br />
                </div>
                <br /> 
                <div>
                    <label>Parent/Guardian Address : </label>
                    <telerik:RadTextBox ID="txtParentAddress1" runat="server" EmptyMessage="Address1"></telerik:RadTextBox><br />
                    <telerik:RadTextBox ID="txtParentAddress2" runat="server" EmptyMessage="Address2"></telerik:RadTextBox><br />
                    <telerik:RadTextBox ID="txtParentCity" runat="server" EmptyMessage="City"></telerik:RadTextBox><br />
                    <telerik:RadTextBox ID="txtParentState" runat="server" EmptyMessage="State"></telerik:RadTextBox><br />
                    <telerik:RadTextBox ID="txtParentZip" runat="server" EmptyMessage="Zip"></telerik:RadTextBox><br />
                </div> 
                <br /> 
                <div>
                    <label>Emergency Contact # : </label>
                    <telerik:RadTextBox ID="txtEmergencyContact" runat="server"></telerik:RadTextBox><br />
                </div>
                <h1 style="font-weight: 600; font-style: italic; ">Student Educational Info</h1>
                <div>
                    <label>School Name : </label>
                    <telerik:RadTextBox ID="txtSchoolName" runat="server"></telerik:RadTextBox><br />
                </div>
                <br />
                <div>
                    <label>Year of Graduation : </label>
                    <telerik:RadDropDownList runat="server" ID="ddlGraduationYear" DefaultMessage="Select Year">                    
                    </telerik:RadDropDownList>
                </div>
                <br />
                <div>
                    <label>Are you Free/Reduced Lunch? : </label>
                    <asp:RadioButton runat="server" ID="rbtLunch1" Text="Yes" GroupName="rbtLunch" />
                    <asp:RadioButton runat="server" ID="rbtLunch2" Text="No" GroupName="rbtLunch" />
                    <%--<asp:RadioButtonList runat="server" ID="rboLunch" TextAlign="Right" RepeatDirection="Horizontal">
                        <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                        <asp:ListItem Text="No" Value="0"></asp:ListItem>
                    </asp:RadioButtonList>--%>
                </div>
                <br />
                <div>
                    <label>Current GPA : </label>
                    <telerik:RadTextBox ID="txtGPA" runat="server"></telerik:RadTextBox>
                </div>
                <br />
                <div>
                    <label>Do you currently have extended time or any accommodations : </label>
                    <asp:CheckBox ID="chk1" runat="server" Text="SAT" />
                    <asp:CheckBox ID="chk2" runat="server" Text="ACT" />
                    <%--<telerik:RadDropDownList runat="server" ID="ddlAcco" DefaultMessage="Select Test">
                        <Items>
                            <telerik:DropDownListItem runat="server" Text="SAT" />
                            <telerik:DropDownListItem runat="server" Text="ACT" />                        
                        </Items>
                    </telerik:RadDropDownList><br />--%>
                </div>
                <br />
                <div>
                    <label>Describe your current accommodations : </label>
                    <telerik:RadTextBox ID="txtDescAcc" runat="server"></telerik:RadTextBox>
                </div>
                <br /> 
                <div>
                    <label>Do you get extra time in school tests? : </label>
                    <asp:RadioButton runat="server" ID="rbtExtraTime1" Text="Yes" GroupName="rbtExtraTime" />
                    <asp:RadioButton runat="server" ID="rbtExtraTime2" Text="No" GroupName="rbtExtraTime" />
                    <%--<asp:RadioButtonList runat="server" ID="rbtExtraTime" TextAlign="Right" RepeatDirection="Horizontal">
                        <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                        <asp:ListItem Text="No" Value="0"></asp:ListItem>
                    </asp:RadioButtonList>--%>
                </div>
                <br />
                <div>
                    <label>Do you ever have anyone read/Write your answers for you in Tests? : </label>
                    <asp:RadioButton runat="server" ID="rbtExamHelper1" Text="Yes" GroupName="rbtExamHelper" />
                    <asp:RadioButton runat="server" ID="rbtExamHelper2" Text="No" GroupName="rbtExamHelper" />
                    <%--<asp:RadioButtonList runat="server" ID="rbtExamHelper" TextAlign="Right" RepeatDirection="Horizontal">
                        <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                        <asp:ListItem Text="No" Value="0"></asp:ListItem>
                    </asp:RadioButtonList>--%>
                </div>
                <br />
                <div>
                    <label>Official SAT exam score (If you taken any) : </label>
                    <telerik:RadTextBox ID="txtSATScore" runat="server"></telerik:RadTextBox>
                </div>
                <br />
                <div>
                    <label>Official SAT exam score (Individual) : </label>
                    <telerik:RadTextBox ID="txtSATReading" runat="server" EmptyMessage="Reading Score"></telerik:RadTextBox><br />
                    <telerik:RadTextBox ID="txtSATWriting" runat="server" EmptyMessage="Writing Score"></telerik:RadTextBox><br />
                    <telerik:RadTextBox ID="txtSATMath" runat="server" EmptyMessage="Math Score"></telerik:RadTextBox><br />
                    <telerik:RadTextBox ID="txtSATEssay" runat="server" EmptyMessage="Essay Score"></telerik:RadTextBox><br />
                </div>
                <br />
                <div>
                    <label>Practice SAT exam score (If you taken any) : </label>
                    <telerik:RadTextBox ID="txtPracticeSATScore" runat="server"></telerik:RadTextBox>
                </div>
                <br />
                <div>
                    <label>Practice SAT exam score (Individual): </label>
                    <telerik:RadTextBox ID="txtPracticeSATReading" runat="server" EmptyMessage="Reading Score"></telerik:RadTextBox><br />
                    <telerik:RadTextBox ID="txtPracticeSATWriting" runat="server" EmptyMessage="Writing Score"></telerik:RadTextBox><br />
                    <telerik:RadTextBox ID="txtPracticeSATMath" runat="server" EmptyMessage="Math Score"></telerik:RadTextBox><br />
                    <telerik:RadTextBox ID="txtPracticeSATEssay" runat="server" EmptyMessage="Essay Score"></telerik:RadTextBox><br />
                </div>
                <br />
                <div>
                    <label>Describe any other standardized test you have taken : </label>
                    <telerik:RadTextBox ID="txtOtherTests" runat="server"></telerik:RadTextBox>
                </div>
                <br />
                <h1 style="font-weight: 600; font-style: italic; ">Student Family Info</h1>
                <div>
                    <label>Family Income Level : </label>
                    <telerik:RadDropDownList runat="server" ID="ddlIncome" EnableViewState="true" DefaultMessage="Select Income">
                        <Items>
                            <telerik:DropDownListItem runat="server" Text="Less than $20k" Value="Less than $20k" /> 
                            <telerik:DropDownListItem runat="server" Text="$20k-$30k" Value="$20k-$30k" />
                            <telerik:DropDownListItem runat="server" Text="$30k-$40k" Value="$30k-$40k" /> 
                            <telerik:DropDownListItem runat="server" Text="Greater than $40k" Value="Greater than $40k" />                                                
                        </Items>
                    </telerik:RadDropDownList><br />
                </div>
                <br />
                <div>
                    <label>Income Contributed by : </label>
                    <telerik:RadDropDownList runat="server" ID="ddlIncomeContribution" ViewStateMode="Enabled" DefaultMessage="Select Contribution">
                        <Items>
                            <telerik:DropDownListItem runat="server" Text="Father"  Value="Father"/> 
                            <telerik:DropDownListItem runat="server" Text="Mother" Value="Mother" />
                            <telerik:DropDownListItem runat="server" Text="Others" Value="Others" /> 
                        </Items>
                    </telerik:RadDropDownList><br />
                </div>
                <br />
                <div>
                    <label>Do your parents have taken SAT? : </label>
                    <asp:RadioButton runat="server" ID="rbtParentSat1" Text="Yes" GroupName="rbtParentSat" />
                    <asp:RadioButton runat="server" ID="rbtParentSat2" Text="No" GroupName="rbtParentSat" />
                </div>
                <br />
                <div>
                    <label>Does your parents familiar with US education system? : </label>
                    <asp:RadioButton runat="server" ID="rbtUSEducationSystem1" Text="Yes" GroupName="rbtUSEducationSystem" />
                    <asp:RadioButton runat="server" ID="rbtUSEducationSystem2" Text="No" GroupName="rbtUSEducationSystem" />
                </div>
                <br />
                <div>
                    <label>Parents Education : </label>
                    <telerik:RadDropDownList runat="server" ID="ddlParentEducation" DefaultMessage="Select Parent Education" EnableViewState="true">
                        <Items>
                            <telerik:DropDownListItem runat="server" Text="High School" Value="High School" /> 
                            <telerik:DropDownListItem runat="server" Text="College" Value="College" />
                            <telerik:DropDownListItem runat="server" Text="Master" Value="Master" /> 
                            <telerik:DropDownListItem runat="server" Text="PHD" Value="PHD" /> 
                        </Items>
                    </telerik:RadDropDownList>
                </div>
                <br />
                <div>
                    <label>Parents last studied place : </label>
                    <%--<telerik:RadTextBox ID="txtparentEduLocation" runat="server"></telerik:RadTextBox>--%>
                    <telerik:RadTextBox ID="txtparentEduAddress1" runat="server" EmptyMessage="Address1"></telerik:RadTextBox><br />
                    <telerik:RadTextBox ID="txtparentEduAddress2" runat="server" EmptyMessage="Address2"></telerik:RadTextBox><br />
                    <telerik:RadTextBox ID="txtparentEduCity" runat="server" EmptyMessage="City"></telerik:RadTextBox><br />
                    <telerik:RadTextBox ID="txtparentEduState" runat="server" EmptyMessage="State"></telerik:RadTextBox><br />
                    <telerik:RadTextBox ID="txtparentEduZip" runat="server" EmptyMessage="Zip"></telerik:RadTextBox><br />
                </div>
                <br />
                <div>
                    <label>Describe previous travel Experience : </label>
                    <telerik:RadTextBox ID="txtPreTravelExp" runat="server" TextMode="MultiLine"></telerik:RadTextBox>
                </div>
                <br />
                <div>
                    <label>Describe previous travel details : </label>
                    <telerik:RadTextBox ID="txtPreTravelDetails" runat="server" TextMode="MultiLine"></telerik:RadTextBox>
                </div>
                <br />
                <div>
                    <label>Do you like to stay close to Home? : </label>
                    <asp:RadioButton runat="server" ID="rbtStayCloseToHome1" Text="Yes" GroupName="rbtStayCloseToHome" />
                    <asp:RadioButton runat="server" ID="rbtStayCloseToHome2" Text="No" GroupName="rbtStayCloseToHome" />
                </div>
                <br />
                <div>
                    <label>Select the School size : </label>
                    <asp:RadioButton runat="server" ID="rbtSchoolSize1" Text="Big" GroupName="rbtSchoolSize" />
                    <asp:RadioButton runat="server" ID="rbtSchoolSize2" Text="Small" GroupName="rbtSchoolSize" />
                </div>
                <br />
                <div>
                    <label>Preferred Major : </label>
                    <telerik:RadDropDownList runat="server" ID="ddlMajor" DefaultMessage="Select Major">
                        <Items>
                            <telerik:DropDownListItem runat="server" Text="Science" Value="Science" /> 
                            <telerik:DropDownListItem runat="server" Text="Liberal arts" Value="Liberal arts" />
                            <telerik:DropDownListItem runat="server" Text="Technical" Value="Technical" /> 
                            <telerik:DropDownListItem runat="server" Text="Others" Value="Others" /> 
                        </Items>
                    </telerik:RadDropDownList>
                </div>
                <br />
                <div>
                    <label>List down Preferred schools : </label>
                    <telerik:RadTextBox ID="txtPreferedSchools" runat="server"></telerik:RadTextBox>
                </div>
                <br />
                <div>
                    <h1 style="font-weight: 600; font-style: italic; ">Upload the required documents</h1>
                    <table id="Table1" width="500px" border="0" align="right">
                        <tr>
                            <td style="width: 250px">
                                <label class="LabelInput">Select Transcript file : </label>
                            </td>
                            <td style="width: 250px !important;">
                                <telerik:RadUpload Style="text-align: right !important; width: 250px !important;" ID="RadUploadTranscript" runat="server" ControlObjectsVisibility="None" MaxFileInputsCount="1" AllowedFileExtensions=".doc,.docx,.rtf,.pdf,.jpeg,.gif" ></telerik:RadUpload>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 250px">
                                <label class="LabelInput">Select Personal Statement : </label>
                            </td>
                            <td style="width: 250px !important;">
                                <telerik:RadUpload Style="text-align: right !important; width: 250px !important;" ID="RadUploadEssay" runat="server" ControlObjectsVisibility="None" MaxFileInputsCount="1" AllowedFileExtensions=".doc,.docx,.rtf,.pdf,.jpeg,.gif"></telerik:RadUpload>
                            </td>
                        </tr>
                    </table>
                </div>
                <br />
                <div>
                    <%--<telerik:RadCaptcha ID="captcha" runat="server" CaptchaImage-TextLength="5" Display="Static" CaptchaImage-BackgroundNoise="None"  ForeColor="Violet" ></telerik:RadCaptcha>--%>
                
                    <telerik:RadCaptcha ID="RadCaptcha1" runat="server" ErrorMessage="Invalid Captcha" ForeColor="Red" CssClass="captcha" CaptchaImage-BackgroundColor="#66ff66"
                         CaptchaImage-RenderImageOnly="true" ValidatedTextBoxID="RadTextBox1" EnableViewState="true" EnableRefreshImage="true" >
                    </telerik:RadCaptcha>
                    <label>Type the code from the image</label>
                    <telerik:RadTextBox ID="RadTextBox1" runat="server" ClientEvents-OnLoad="" EnableViewState="true" >
                    </telerik:RadTextBox><br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" InitialValue=""  runat="server" Display="Dynamic" ErrorMessage="Please enter Captcha text"
                        ForeColor="Red" ControlToValidate="RadTextBox1" ValidateRequestMode="Inherit"></asp:RequiredFieldValidator>
                    <br />
                </div>
                   
                <telerik:RadButton ID="btnsave" runat="server" ButtonType="StandardButton" Text="Save" OnClick="btnsave_Click" ></telerik:RadButton>
                <telerik:RadButton ID="btnSubmit" runat="server" ButtonType="StandardButton" Text="Submit" OnClick="btnSubmit_Click" ></telerik:RadButton>
            </div>
        <%--<asp:Panel ID="pnlUpload" runat="server" Visible="true">
            <div style="text-align: center; width: 800px; border: solid 0px;">
                <table id="tblupload" width="500px" border="0" align="center">
                    <tr>
                        <td style="width:250px">
                            <label class="LabelInput">Select Transcript file : </label>
                        </td>
                        <td style="width:250px !important;">
                            <telerik:RadUpload Style="text-align: right !important;width:250px !important;" ID="uploadconduct" runat="server" ControlObjectsVisibility="None" MaxFileInputsCount="1" AllowedFileExtensions=".doc,.docx,.rtf,.pdf,.jpeg,.gif"></telerik:RadUpload>
                        </td>
                    </tr>
                    <tr>
                        <td style="width:250px">
                            <label class="LabelInput">Select Personal Statement : </label>
                        </td>
                        <td style="width:250px !important;">
                            <telerik:RadUpload Style="text-align: right !important;width:250px !important;" ID="RadUploadPersonalStatement" runat="server" ControlObjectsVisibility="None" MaxFileInputsCount="1" AllowedFileExtensions=".doc,.docx,.rtf,.pdf,.jpeg,.gif"></telerik:RadUpload>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="text-align:center">
                            <asp:Button runat="server" ID="Button2" Text="Upload" CausesValidation="false" OnClick="btnUpload_Click" /></td>
                    </tr>
                </table>
            </div>            
        </asp:Panel>--%>
        <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
    </div>
</asp:Content>
