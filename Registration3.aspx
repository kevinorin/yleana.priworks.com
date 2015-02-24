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
        function numberOnly(sender, eventArgs) {
        	var k = eventArgs.get_keyCode()
        	if (k == 46 || k == 8) {
        		// let it happen, don't do anything
        	}
        	else {
        		// Ensure that it is a number and stop the keypress
        		if (k < 48 || k > 57) {
        			eventArgs.set_cancel(true);
        		}
        	}
        }

	</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
	<asp:Panel ID="panl1" runat="server">
		<div class="rspForms col-lg-12">
			<div class="row">
				<div class="col-md-8 col-md-offset-3">
					<h1>Educational Info</h1>
					<div class="row spacedRow">
						<div class="col-md-4">
							<label><span style="color: red;">*</span> What is the name of the high school that you currently attend? </label>
						</div>
						<div class="col-md-8">
							<telerik:RadTextBox ID="txtSchoolName" runat="server" MaxLength="50"></telerik:RadTextBox><br />
							<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ForeColor="Red" Display="Dynamic" ControlToValidate="txtSchoolName" ErrorMessage="School Name cannot be empty!"></asp:RequiredFieldValidator>
						</div>
					</div>
					<div class="row spacedRow">
						<div class="col-md-4">
							<label><span style="color: red;">*</span> In what year do you expect to graduate? </label>
						</div>
						<div class="col-md-8">
							<telerik:RadDropDownList runat="server" ID="ddlGraduationYear" DefaultMessage="Select Year" OnClientSelectedIndexChanged="ShowGraduationYear">
							</telerik:RadDropDownList>
							<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ForeColor="Red" Display="Dynamic" ControlToValidate="ddlGraduationYear" ErrorMessage="Graduation Year cannot be empty!"></asp:RequiredFieldValidator>
						</div>
					</div>
					<div class="row spacedRow">
						<div id="divGraduYear" style="display: none;">
							<div class="col-md-4">
								<label>Fill your Graduation Year:</label>
							</div>
							<div class="col-md-8">
								<telerik:RadTextBox ID="txtGraduationYear" runat="server" MaxLength="4">
									<ClientEvents OnKeyPress="numberOnly" />
								</telerik:RadTextBox><br />
							</div>
						</div>
					</div>
					<div class="row spacedRow">
						<div class="col-md-4">
							<label><span style="color: red;">*</span> Do you qualify for free/reduced lunch? </label>
						</div>
						<div class="col-md-8">
							<asp:RadioButtonList runat="server" ID="rboLunch" TextAlign="Right" RepeatDirection="Vertical">
								<asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
								<asp:ListItem Text="No" Value="No"></asp:ListItem>
							</asp:RadioButtonList>
							<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ForeColor="Red" Display="Dynamic" ControlToValidate="rboLunch" ErrorMessage="Please select the Free/Reduced lunch options!"></asp:RequiredFieldValidator>
						</div>
					</div>
					<div class="row spacedRow">
						<div class="col-md-12">
							<p>(Please select "Other" if you attend an IB school and enter it in the box below.)</p>
						</div>
					</div>

					<div class="row spacedRow">
						<div class="col-md-4">
							<label><span style="color: red;">*</span>What is your current GPA? </label>
						</div>
						<div class="col-md-8">
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
						</div>

						<div id="divGPA" style="display: none;">
							<div class="col-md-4">
								<label>Fill your GPA: </label>
							</div>
							<div class="col-md-8">
								<telerik:RadTextBox ID="txtGPA" runat="server" MaxLength="50"></telerik:RadTextBox><br />
							</div>
						</div>
					</div>
					<div class="row spacedRow">
						<div class="col-md-4">
							<label>Do you currently have extended time or any accommodations on any standardized test? </label>
						</div>
						<div class="col-md-8">
							<asp:RadioButtonList runat="server" ID="rbtExtendedTimeStandardised" TextAlign="Right" RepeatDirection="Vertical" onchange="ShowTest();">
								<asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
								<asp:ListItem Text="No" Value="No"></asp:ListItem>
							</asp:RadioButtonList>
						</div>

						<div id="divExtendedTest" style="display: none;">
							<div class="col-md-4">
								<label class="LabelInput">Select the test: </label>
							</div>
							<div class="col-md-8">
								<telerik:RadDropDownList ID="ddlextendedtest" runat="server">
									<Items>
										<telerik:DropDownListItem Text="ACT" Value="ACT" />
										<telerik:DropDownListItem Text="SAT" Value="SAT" />
										<telerik:DropDownListItem Text="Both" Value="Both" />
									</Items>
								</telerik:RadDropDownList>
							</div>
							<div class="col-md-4">
								<label>Please describe these accommodations: </label>
							</div>
							<div class="col-md-8">
								<telerik:RadTextBox ID="txtExtendedTimeStandardisedText" runat="server" MaxLength="250" TextMode="MultiLine" Rows="5"></telerik:RadTextBox><br />
							</div>
						</div>
					</div>
					<div class="row spacedRow">
						<div class="col-md-4">
							<label>Do you currently have extended time or any accommodations while at school?  </label>
						</div>
						<div class="col-md-8">
							<asp:RadioButtonList runat="server" ID="rbtExtendedSchool" TextAlign="Right" RepeatDirection="Vertical" onchange="ShowExtendedSchool();">
								<asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
								<asp:ListItem Text="No" Value="No"></asp:ListItem>
							</asp:RadioButtonList>
						</div>

						<div id="divExtendedSchool" style="display: none;">
							<div class="col-md-4">
								<label>Please describe these accommodations: </label>
							</div>
							<div class="col-md-8">
								<telerik:RadTextBox ID="txtExtendedSchoolText" runat="server" MaxLength="250" TextMode="MultiLine" Rows="5"></telerik:RadTextBox><br />
							</div>
						</div>
					</div>
					<div class="row spacedRow">
						<div class="col-md-4">
							<label>Does anyone ever read your tests out loud to you in school or write down your answers for you? </label>
						</div>
						<div class="col-md-8">
							<asp:RadioButtonList runat="server" ID="rbtExamHelper" TextAlign="Right" RepeatDirection="Vertical">
								<asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
								<asp:ListItem Text="No" Value="No"></asp:ListItem>
							</asp:RadioButtonList>
						</div>
					</div>
					<div class="row spacedRow">
						<div class="col-md-12">
							<h1>SAT Info</h1>
						</div>
					</div>

					<div class="row spacedRow">
						<div class="col-md-4">
							<label><span style="color: red;">*</span> Have you studied or prepared for the SAT in any way before? </label>
						</div>
						<div class="col-md-8">
							<asp:RadioButtonList runat="server" ID="rbtSATPreparation" TextAlign="Right" RepeatDirection="Vertical" onchange="ShowSATPrepare();">
								<asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
								<asp:ListItem Text="No" Value="No"></asp:ListItem>
							</asp:RadioButtonList>
							<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ForeColor="Red" Display="Dynamic" ControlToValidate="rbtSATPreparation" ErrorMessage="Please select your SAT preparation option!"></asp:RequiredFieldValidator>
						</div>
						<div id="divSATPrepare" style="display: none;">
							<div class="col-md-4">
								<label>Fill your SAT Preparation details: </label>
							</div>
							<div class="col-md-8">
								<telerik:RadTextBox ID="txtSATPrepare" runat="server" MaxLength="250" TextMode="MultiLine" Rows="5"></telerik:RadTextBox><br />
							</div>
						</div>
					</div>
					<div class="row spacedRow">
						<div class="col-md-4">
							<label><span style="color: red;">*</span> Have you taken an official (College Board administered) SAT exam? </label>
						</div>
						<div class="col-md-8">
							<asp:RadioButtonList runat="server" ID="rbtOfficialSAT" TextAlign="Right" RepeatDirection="Vertical" onchange="ShowOfficialSATScore();">
								<asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
								<asp:ListItem Text="No" Value="No"></asp:ListItem>
							</asp:RadioButtonList>
							<asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ForeColor="Red" Display="Dynamic" ControlToValidate="rbtOfficialSAT" ErrorMessage="Please select your Official SAT details!"></asp:RequiredFieldValidator>
						</div>

						<div id="divOfficialSATScore" style="display: none;">
							<div class="col-md-4">
								<label>Fill your SAT score: </label>
							</div>
							<div class="col-md-8">
								<telerik:RadTextBox ID="txtSATTotal" runat="server" EmptyMessage="SAT Total Score" MaxLength="4">
									<ClientEvents OnKeyPress="numberOnly" />
								</telerik:RadTextBox><br />
								<telerik:RadTextBox ID="txtSATReading" runat="server" EmptyMessage="Reading Score" MaxLength="4">
									<ClientEvents OnKeyPress="numberOnly" />
								</telerik:RadTextBox><br />
								<telerik:RadTextBox ID="txtSATWriting" runat="server" EmptyMessage="Writing Score" MaxLength="4">
									<ClientEvents OnKeyPress="numberOnly" />
								</telerik:RadTextBox><br />
								<telerik:RadTextBox ID="txtSATMath" runat="server" EmptyMessage="Math Score" MaxLength="4">
									<ClientEvents OnKeyPress="numberOnly" />
								</telerik:RadTextBox><br />
							</div>
						</div>
					</div>
					<div class="row spacedRow">
						<div class="col-md-4">
							<label>Have you taken a practice SAT exam, either at your school, at home or somewhere else? </label>
						</div>
						<div class="col-md-8">

							<asp:RadioButtonList runat="server" ID="rbtPracticeSAT" TextAlign="Right" RepeatDirection="Vertical" onchange="ShowPracticeSATScore();">
								<asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
								<asp:ListItem Text="No" Value="No"></asp:ListItem>
							</asp:RadioButtonList>
						</div>

						<div id="divPracticeSATScore" style="display: none;">
							<div class="col-md-4">
								<label>Fill your SAT score: </label>
							</div>
							<div class="col-md-8">
								<telerik:RadTextBox ID="txtPracticeSATScore" runat="server" EmptyMessage="SAT Total Score" MaxLength="4">
									<ClientEvents OnKeyPress="numberOnly" />
								</telerik:RadTextBox><br />
								<telerik:RadTextBox ID="txtPracticeSATReading" runat="server" EmptyMessage="Reading Score" MaxLength="4">
									<ClientEvents OnKeyPress="numberOnly" />
								</telerik:RadTextBox><br />
								<telerik:RadTextBox ID="txtPracticeSATWriting" runat="server" EmptyMessage="Writing Score" MaxLength="4">
									<ClientEvents OnKeyPress="numberOnly" />
								</telerik:RadTextBox><br />
								<telerik:RadTextBox ID="txtPracticeSATMath" runat="server" EmptyMessage="Math Score" MaxLength="4">
									<ClientEvents OnKeyPress="numberOnly" />
								</telerik:RadTextBox><br />
							</div>
						</div>
					</div>

					<div class="row spacedRow">
						<div class="col-md-4">
							<label>Have you taken any other type of standardized test? If so, please list here </label>
						</div>
						<div class="col-md-8">
							<telerik:RadTextBox ID="txtOtherStandardTests" runat="server" MaxLength="250" TextMode="MultiLine" Width="200" Rows="5"></telerik:RadTextBox><br />
						</div>
					</div>

				</div>
			</div>

		</div>
	</asp:Panel>
	<div class="rspForms col-lg-12">
		<div class="row">
			<div class="col-md-8 col-md-offset-3">
				<div class="col-md-12">
					<asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label><br />
					<telerik:RadButton ID="btnPrevious" runat="server" CausesValidation="false" ButtonType="StandardButton" Text="PREVIOUS" Width="20%" OnClick="btnPrevious_Click"></telerik:RadButton>
					<telerik:RadButton ID="btnSave" runat="server" CausesValidation="false" ButtonType="StandardButton" Text="SAVE SECTION" Width="20%" OnClick="btnSave_Click"></telerik:RadButton>
					<telerik:RadButton ID="btnSaveNext" runat="server" CausesValidation="false" ButtonType="StandardButton" Text="SAVE & NEXT" Width="20%" OnClick="btnSaveNext_Click"></telerik:RadButton>
					<telerik:RadButton ID="btnNext" runat="server" CausesValidation="false" ButtonType="StandardButton" Text="NEXT" Width="20%" OnClick="btnNext_Click"></telerik:RadButton>
				</div>
				<div class="row">
					<div class="col-md-8 col-md-offset-3">
						<div class="col-md-4">
							<label class="LabelInput">Step 3 of 5</label>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</asp:Content>
