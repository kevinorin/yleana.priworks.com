<%@ Page Title="" Language="C#" MasterPageFile="~/StudentMaster.Master" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeBehind="Registration6.aspx.cs" Inherits="yleana.Registration6" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        window.onload = function () {
            showRoommateRequestNameText();
            showFastingDuringCampText();
            showDietOptionText();
            ShowOtherDieatOptionText();
        };

        function showRoommateRequestNameText() {
            if ($('#<%=rboRoommateRequest.ClientID %> input:checked').val() == "Yes") {
                $('#divRoommateRequestNameText').show();
            }
            else {
                $('#divRoommateRequestNameText').hide();
            }
        }

        function showFastingDuringCampText() {
            if ($('#<%=rboFastingDuringCamp.ClientID %> input:checked').val() == "Yes") {
                $('#divFastingDuringCampText').show();
            }
            else {
                $('#divFastingDuringCampText').hide();
            }
        }

        function showDietOptionText() {
            if ($('#<%=rboFollowAnyDiet.ClientID %> input:checked').val() == "Yes") {
                $('#divDietOptionText').show();
            }
            else {
                $('#divDietOptionText').hide();
            }
        }
        function ShowOtherDieatOptionText() {
            var rb = document.getElementById("<%=rbtDietOptions.ClientID%>");
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
                $('#divOtherDietOptionText').show();
            }
            else {
                $('#divOtherDietOptionText').hide();
            }
        }

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="panl1" runat="server">
        <div class="rspForms col-lg-12">
            <div class="row">
                <div class="col-md-8 col-md-offset-3">
                    <div class="row spacedRow">
                        <div class="col-md-12">
                            <h1>Roommate info</h1>
                            <p>Please fill out this information about yourself as honestly as possible in order for us to place you with a compatible roommate! </p>
                            <p>All rooms will be single sex. In some situations, there might be an odd number of students and someone might have to live alone. </p>
                            <p>Please indicate below whether or not you would be willing to live in a single room, if necessary. </p>
                        </div>
                    </div>

                    <div class="row spacedRow">
                        <div class="col-md-4">
                            <label><span style="color: red;">*</span> Would you be willing to live in a room by yourself if necessary?  </label>
                        </div>
                        <div class="col-md-8">
                            <asp:RadioButtonList runat="server" ID="rboLiveInRoomYourSelf" TextAlign="Right" RepeatDirection="Vertical">
                            <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                            <asp:ListItem Text="No" Value="No"></asp:ListItem>
                            </asp:RadioButtonList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ForeColor="Red" Display="Dynamic" ControlToValidate="rboLiveInRoomYourSelf" ErrorMessage="Please select the willing to live in a room by yourself options!"></asp:RequiredFieldValidator>
                        </div>
                    </div>

                    <div class="row spacedRow">
                        <div class="col-md-4">
                            <label><span style="color: red;">*</span> Is there anyone specific that you would like to request as a roommate? Please only provide the name of someone who is in the same session as you.</label>
                        </div>
                        <div class="col-md-8">
                            <asp:RadioButtonList runat="server" ID="rboRoommateRequest" TextAlign="Right" RepeatDirection="Vertical" onchange="showRoommateRequestNameText();">
                            <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                            <asp:ListItem Text="No" Value="No"></asp:ListItem>
                            </asp:RadioButtonList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ForeColor="Red" Display="Dynamic" ControlToValidate="rboRoommateRequest" ErrorMessage="Please select the roommate request options!"></asp:RequiredFieldValidator>
                        </div>  

                        
                        <div id="divRoommateRequestNameText" style="display:none;">
                            <div class="col-md-4">
                                <label class="col-md-9">If yes, please provide their first and last name below </label>
                            </div>
                            <div class="col-md-8">
                                <telerik:RadTextBox ID="txtRoommateRequestName" runat="server" MaxLength="50"></telerik:RadTextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ForeColor="Red" Display="Dynamic" ControlToValidate="txtRoommateRequestName" InitialValue=""  ErrorMessage="Please enter the roommate name!"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                    </div>

                    <div class="row spacedRow">
                        <div class="col-md-4">
                            <label class="col-md-9"><span style="color:red;">*</span> How do you keep your room at home? </label>
                        </div>
                        <div class="col-md-8">
                            <telerik:RadDropDownList runat="server" ID="ddlRoomClean" DefaultMessage="Select" >
                                <Items>
                                    <telerik:DropDownListItem runat="server" Text="Clean" Value="Clean" />
                                    <telerik:DropDownListItem runat="server" Text="Extremely clean" Value="Extremely clean" />
                                    <telerik:DropDownListItem runat="server" Text="Dirty" Value="Dirty" />
                                    <telerik:DropDownListItem runat="server" Text="Extremely dirty" Value="Extremely dirty" /> 
                                    <telerik:DropDownListItem runat="server" Text="Neither clean nor dirty" Value="Neither clean nor dirty" />                       
                                </Items>
                            </telerik:RadDropDownList><br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ForeColor="Red" Display="Dynamic" ControlToValidate="ddlRoomClean" InitialValue=""  ErrorMessage="Select your Room clean at Home option!"></asp:RequiredFieldValidator>
                        </div>
                    </div>

                    <div class="row spacedRow">
                        <div class="col-md-4">
                            <label><span style="color: red;">*</span> Do you like to listen to music while you study?</label>
                        </div>
                        <div class="col-md-8">
                            <asp:RadioButtonList runat="server" ID="rboMusicWhileStudy" TextAlign="Right" RepeatDirection="Vertical">
                            <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                            <asp:ListItem Text="No" Value="No"></asp:ListItem>
                            </asp:RadioButtonList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ForeColor="Red" Display="Dynamic" ControlToValidate="rboMusicWhileStudy" ErrorMessage="Please select the music while study options!"></asp:RequiredFieldValidator>
                        </div>
                    </div>

                    <div class="row spacedRow">
                        <div class="col-md-4">
                            <label><span style="color: red;">*</span> What type of music do you listen to?  </label>
                        </div>
                        <div class="col-md-8">
                            <telerik:RadTextBox ID="txtMusicType" runat="server" MaxLength="250" Resize="Both" TextMode="MultiLine" Width="75%" Rows="5" ></telerik:RadTextBox><br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ForeColor="Red" Display="Dynamic" ControlToValidate="txtMusicType" ErrorMessage="Please enter the music type while study options!"></asp:RequiredFieldValidator>
                        </div>
                    </div>

                    <div class="row spacedRow">
                        <div class="col-md-4">
                            <label><span style="color: red;">*</span> What are your three favorite hobbies?</label>
                        </div>
                        <div class="col-md-8">
                            <telerik:RadTextBox ID="txtHobbies" runat="server" MaxLength="250" Resize="Both" TextMode="MultiLine" Width="75%" Rows="5" ></telerik:RadTextBox><br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ForeColor="Red" Display="Dynamic" ControlToValidate="txtHobbies" ErrorMessage="Please enter your favorite Hobbies options!"></asp:RequiredFieldValidator>
                        </div>
                    </div>

                    <div class="row spacedRow">
                        <div class="col-md-4">
                            <label><span style="color: red;">*</span> Please list three of your favorite movies  </label>
                        </div>
                        <div class="col-md-8">
                            <telerik:RadTextBox ID="txtFavoriteMovies" runat="server" MaxLength="250" Resize="Both" TextMode="MultiLine" Width="75%" Rows="5" ></telerik:RadTextBox><br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ForeColor="Red" Display="Dynamic" ControlToValidate="txtFavoriteMovies" ErrorMessage="Please enter the favorite movies options!"></asp:RequiredFieldValidator>
                        </div>
                    </div>

                    <div class="row spacedRow">
                        <div class="col-md-4">
                            <label><span style="color: red;">*</span> Please list the last three books that you read NOT for school  </label>
                        </div>
                        <div class="col-md-8">
                            <telerik:RadTextBox ID="txtLastBookRead" runat="server" MaxLength="250" Resize="Both" TextMode="MultiLine" Width="75%" Rows="5" ></telerik:RadTextBox><br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ForeColor="Red" Display="Dynamic" ControlToValidate="txtLastBookRead" ErrorMessage="Please enter the last three books you read options!"></asp:RequiredFieldValidator>
                        </div>
                    </div>

                    <div class="row spacedRow">
                        <div class="col-md-4">
                            <label><span style="color: red;">*</span> What is your favorite board or card game?  </label>
                        </div>
                        <div class="col-md-8">
                            <telerik:RadTextBox ID="txtFavoriteBoardGame" runat="server" MaxLength="250" Resize="Both" TextMode="MultiLine" Width="75%" Rows="5" ></telerik:RadTextBox><br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ForeColor="Red" Display="Dynamic" ControlToValidate="txtFavoriteBoardGame" ErrorMessage="Please enter your favorite Board or card game options!"></asp:RequiredFieldValidator>
                        </div>
                    </div>

                    <div class="row spacedRow">
                        <div class="col-md-4">
                            <label><span style="color: red;">*</span> What is your favorite sport to play? If you don’t like playing sports, what is your favorite sport to watch?  </label>
                        </div>
                        <div class="col-md-8">
                            <telerik:RadTextBox ID="txtFavoriteSports" runat="server" MaxLength="250" Resize="Both" TextMode="MultiLine" Width="75%" Rows="5" ></telerik:RadTextBox><br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ForeColor="Red" Display="Dynamic" ControlToValidate="txtFavoriteSports" ErrorMessage="Please enter your favorite Sports options!"></asp:RequiredFieldValidator>
                        </div>
                    </div>

                    <div class="row spacedRow">
                        <div class="col-md-4">
                            <label class="col-md-9"><span style="color:red;">*</span> At Yleana, we get up to start our day at 7:30am. Knowing this, what time do you imagine you’ll go to bed? </label>
                        </div>
                        <div class="col-md-8">
                            <telerik:RadDropDownList runat="server" ID="ddlBedTime" DefaultMessage="Select" >
                            <Items>
                                <telerik:DropDownListItem runat="server" Text="Before 9:30pm" Value="Before 9:30pm" />
                                <telerik:DropDownListItem runat="server" Text="Between 9:30-10:30pm" Value="Between 9:30-10:30pm" />
                                <telerik:DropDownListItem runat="server" Text="Between 10:30-11:30pm" Value="Between 10:30-11:30pm" />
                                <telerik:DropDownListItem runat="server" Text="Between 11:30pm-12:30am" Value="Between 11:30pm-12:30am" /> 
                                <telerik:DropDownListItem runat="server" Text="After 12:30am" Value="After 12:30am" />                       
                            </Items>
                            </telerik:RadDropDownList><br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ForeColor="Red" Display="Dynamic" ControlToValidate="ddlBedTime" InitialValue=""  ErrorMessage="Select your go to bed time option!"></asp:RequiredFieldValidator>
                        </div>
                    </div>

                    <div class="row spacedRow">
                        <div class="col-md-4">
                            <label><span style="color: red;">*</span> Do you sleep with the lights on?  </label>
                        </div>
                        <div class="col-md-8">
                            <asp:RadioButtonList runat="server" ID="rboSleepWithLight" TextAlign="Right" RepeatDirection="Vertical">
                            <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                            <asp:ListItem Text="No" Value="No"></asp:ListItem>
                            </asp:RadioButtonList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ForeColor="Red" Display="Dynamic" ControlToValidate="rboSleepWithLight" ErrorMessage="Please select the Sleep with light options!"></asp:RequiredFieldValidator>
                        </div>
                    </div>

                    <div class="row spacedRow">
                        <div class="col-md-4">
                            <label><span style="color: red;">*</span> Can you sleep with the lights on?  </label>
                        </div>
                        <div class="col-md-8">
                            <asp:RadioButtonList runat="server" ID="rboCanYouSleepWithLight" TextAlign="Right" RepeatDirection="Vertical">
                            <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                            <asp:ListItem Text="No" Value="No"></asp:ListItem>
                            </asp:RadioButtonList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ForeColor="Red" Display="Dynamic" ControlToValidate="rboCanYouSleepWithLight" ErrorMessage="Please select the Sleep with light options!"></asp:RequiredFieldValidator>
                        </div>
                    </div>

                    <div class="row spacedRow">
                        <div class="col-md-4">
                            <label><span style="color: red;">*</span> Are you a heavy sleeper (this means that things like noise and distractions would NOT wake you up in the middle of the night) ?  </label>
                        </div>
                        <div class="col-md-8">
                            <asp:RadioButtonList runat="server" ID="rboHeavySleeper" TextAlign="Right" RepeatDirection="Vertical">
                            <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                            <asp:ListItem Text="No" Value="No"></asp:ListItem>
                            </asp:RadioButtonList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ForeColor="Red" Display="Dynamic" ControlToValidate="rboHeavySleeper" ErrorMessage="Please select the Heavy Sleeper options!"></asp:RequiredFieldValidator>
                        </div>
                    </div>

                    <div class="row spacedRow">
                        <div class="col-md-4">
                            <label><span style="color: red;">*</span> Is there anything else we need to know about your sleeping habits, i.e. sleep walking, snoring, sleep talking, etc.?  </label>
                        </div>
                        <div class="col-md-8">
                            <telerik:RadTextBox ID="txtSleeplingHabit" runat="server" MaxLength="250" Resize="Both" TextMode="MultiLine" Width="75%" Rows="5" ></telerik:RadTextBox><br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ForeColor="Red" Display="Dynamic" ControlToValidate="txtSleeplingHabit" ErrorMessage="Please enter your Sleeping habits options!"></asp:RequiredFieldValidator>
                        </div>
                    </div>

                    <div class="row spacedRow">
                        <div class="col-md-12">
                            <h1>Dietary info</h1>
                        </div>
                    </div>

                    <div class="row spacedRow">
                        <div class="col-md-4">
                            <label><span style="color: red;">*</span> Are you allergic to anything? Foods, pets, pollen, medication, etc. Please tell us below (if you don’t have any allergies, please type N/A)?  </label>
                        </div>
                        <div class="col-md-8">
                            <telerik:RadTextBox ID="txtAllergic" runat="server" MaxLength="250" Resize="Both" TextMode="MultiLine" Width="75%" Rows="5" ></telerik:RadTextBox><br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" ForeColor="Red" Display="Dynamic" ControlToValidate="txtAllergic" ErrorMessage="Please enter your allergic options!"></asp:RequiredFieldValidator>
                        </div>
                    </div>

                    <div class="row spacedRow">
                        <div class="col-md-4">
                            <label><span style="color: red;">*</span> Do you have any religious restrictions that keep you from eating certain foods? Pork, beef, etc. Please let us know what you can’t eat due to religious reasons below  </label>
                        </div>
                        <div class="col-md-8">
                            <telerik:RadTextBox ID="txtReligiousFoodRestrictions" runat="server" MaxLength="250" Resize="Both" TextMode="MultiLine" Width="75%" Rows="5" ></telerik:RadTextBox><br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" ForeColor="Red" Display="Dynamic" ControlToValidate="txtReligiousFoodRestrictions" ErrorMessage="Please enter your religious restrictions options!"></asp:RequiredFieldValidator>
                        </div>
                    </div>

                    <div class="row spacedRow">
                        <div class="col-md-4">
                            <label><span style="color: red;">*</span> Is there any reason that you would be fasting during camp?  </label>
                        </div>
                        <div class="col-md-8">
                            <asp:RadioButtonList runat="server" ID="rboFastingDuringCamp" TextAlign="Right" RepeatDirection="Vertical" onchange="showFastingDuringCampText();">
                            <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                            <asp:ListItem Text="No" Value="No"></asp:ListItem>
                            </asp:RadioButtonList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator19" runat="server" ForeColor="Red" Display="Dynamic" ControlToValidate="rboFastingDuringCamp" ErrorMessage="Please select the reason for fasting during camp options!"></asp:RequiredFieldValidator>
                        </div>

                        <div id="divFastingDuringCampText" style="display:none;">
                        <div class="col-md-4">
                            <label class="col-md-9"> If yes, please let us know for how long you would be fasting and on what dates  </label>
                        </div>
                        
                        <div class="col-md-8">
                            <telerik:RadTextBox ID="txtFastingDuringCamp" runat="server" MaxLength="50" Resize="Both" TextMode="MultiLine" Width="75%" Rows="5"></telerik:RadTextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator20" runat="server" ForeColor="Red" Display="Dynamic" ControlToValidate="txtFastingDuringCamp" InitialValue=""  ErrorMessage="Please enter the fasting details!"></asp:RequiredFieldValidator>
                        </div>
                    </div>

                    <div class="row spacedRow">
                        <div class="col-md-4">
                            <label><span style="color: red;">*</span> Do you follow any diet in particular or are there certain foods that you can’t eat?  </label>
                        </div>
                        
                        <div class="col-md-8">
                            <asp:RadioButtonList runat="server" ID="rboFollowAnyDiet" TextAlign="Right" RepeatDirection="Vertical" onchange="showDietOptionText();">
                            <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                            <asp:ListItem Text="No" Value="No"></asp:ListItem>
                            </asp:RadioButtonList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator21" runat="server" ForeColor="Red" Display="Dynamic" ControlToValidate="rboFollowAnyDiet" ErrorMessage="Please select the particular diet options!"></asp:RequiredFieldValidator>
                        </div>

                        <div id="divDietOptionText" style="display:none;">
                            <div class="col-md-4">
                                <label class="col-md-9"> If yes, please select as many of the options as apply  </label>
                            </div>
                            <div class="col-md-8">
                                <asp:CheckBoxList ID="rbtDietOptions" runat="server" onchange="ShowOtherDieatOptionText();">
                                <asp:ListItem Text="Vegetarian" Value="Vegetarian"></asp:ListItem>
                                <asp:ListItem Text="Vegan" Value="Vegan"></asp:ListItem>
                                <asp:ListItem Text="Kosher" Value="Kosher"></asp:ListItem>
                                <asp:ListItem Text="Gluten free" Value="Gluten free"></asp:ListItem>
                                <asp:ListItem Text="Paleo" Value="Paleo"></asp:ListItem>
                                <asp:ListItem Text="Diabetic" Value="Diabetic"></asp:ListItem>
                                <asp:ListItem Text="Low-fat" Value="Low-fat"></asp:ListItem>
                                <asp:ListItem Text="Lactose intolerant" Value="Lactose intolerant"></asp:ListItem>
                                <asp:ListItem Text="Other" Value="Other"></asp:ListItem>
                                <asp:ListItem Text="None " Value="None "></asp:ListItem>
                                </asp:CheckBoxList>
                                <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator23" runat="server" ForeColor="Red" Display="Dynamic" ControlToValidate="rbtDietOptions" InitialValue=""  ErrorMessage="Please select the Diet options!"></asp:RequiredFieldValidator>--%>
                            </div>
                        </div>
                        <div id="divOtherDietOptionText" style="display:none;">
                            <div class="col-md-12">
                                <telerik:RadTextBox ID="txtDietOptionText" runat="server" MaxLength="50" Resize="Both" TextMode="MultiLine" Width="75%" Rows="5"></telerik:RadTextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator22" runat="server" ForeColor="Red" Display="Dynamic" ControlToValidate="txtDietOptionText" InitialValue=""  ErrorMessage="Please enter the other Diet details!"></asp:RequiredFieldValidator>
                        </div>
                    </div>

                    <div class="row spacedRow">
                        <div class="col-md-4">
                            <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
                            </asp:Panel>
                        </div>
                        <div class="col-md-8">
                            <telerik:RadButton ID="btnPrevious" runat="server" CausesValidation="false" ButtonType="StandardButton" Text="Previous" Width="20%" OnClick="btnPrevious_Click"></telerik:RadButton>
                            <telerik:RadButton ID="btnSave" runat="server" CausesValidation="false" ButtonType="StandardButton" Text="SAVE SECTION" Width="20%" OnClick="btnSave_Click"></telerik:RadButton>
                            <telerik:RadButton ID="btnSaveNext" runat="server" CausesValidation="false" ButtonType="StandardButton" Text="SAVE & NEXT" Width="30%" OnClick="btnSaveNext_Click"></telerik:RadButton>
                            <telerik:RadButton ID="btnNext" runat="server" CausesValidation="false" ButtonType="StandardButton" Text="NEXT" Width="20%" OnClick="btnNext_Click"></telerik:RadButton>
                        </div>
                    </div>

                    <div class="row spacedRow">
                        <div class="col-md-12">
                            <label class="col-md-9">Step 1 of 2</label>
                        </div>
                    </div>
                </div>
            </div>
        </div>
</asp:Content>
