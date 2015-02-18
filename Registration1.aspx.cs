using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebMatrix.WebData;
using yleana.Data;

namespace yleana
{
    public partial class Registration1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if ((!WebSecurity.IsAuthenticated) || (!Roles.IsUserInRole("StudentRole")))
            {
                Response.Redirect("~/Login.aspx");
            }

            DisablePage();

            if (!Page.IsPostBack)
            {
                using (YleanaDataContext dbcontext = new YleanaDataContext())
                {
                    List<usp_GetAllPartnersResult> partners = dbcontext.usp_GetAllPartners().ToList<usp_GetAllPartnersResult>();
                    ddlPartner.DataSource = partners;
                    ddlPartner.DataBind();

                    List<usp_GetAllPartnerLocationsResult> locations = dbcontext.usp_GetAllPartnerLocations().ToList<usp_GetAllPartnerLocationsResult>();
                    ddlLocation.DataSource = locations;
                    ddlLocation.DataBind();
                }

                PopulateDemographicInfo();
            }

        }

        protected void DisablePage()
        {
            using (YleanaDataContext dbcontext = new YleanaDataContext())
            {
                int idUser = WebSecurity.CurrentUserId;
                var application = dbcontext.StudentApplications.Where(A => A.idUser == idUser).FirstOrDefault();

                if (application.dtSubmittedPhase2 != null)
                {
					DisableControls(this.pnlRegister);
					btnSave.Enabled = false;
					btnSaveNext.Enabled = false;
                    btnNext.Visible = true;
                }
                else
                {
                    btnNext.Visible = false;
                }
            }            
        }

        private void DisableControls(Control c)
        {
            if (c is WebControl)
                ((WebControl)c).Enabled = false;

            foreach (Control child in c.Controls)
                DisableControls(child);
        } 

        protected void PopulateDemographicInfo()
        {
            try
            {
                using (YleanaDataContext dbcontext = new YleanaDataContext())
                {
                    int idUser = WebSecurity.CurrentUserId;
                    var application = dbcontext.StudentApplications.Where(A => A.idUser == idUser).FirstOrDefault();
                    var StudentInfo = dbcontext.App_StudentInfos.Where(s => s.idApplication == application.idApplication).FirstOrDefault();
                    ddlPartner.SelectedValue = application.idPartner.ToString();
                    ddlLocation.SelectedValue = application.idPartnerLocation.ToString();

                    txtFirstName.Text = application.UserProfile.FirstName;
                    txtLastName.Text = application.UserProfile.LastName;

                    if (StudentInfo.DateOfBirth != null)
                    {
                        dpDOB.SelectedDate = Convert.ToDateTime(StudentInfo.DateOfBirth);
                    }

                    if (!String.IsNullOrEmpty(StudentInfo.Gender))
                    {
                        ddlGender.SelectedValue = StudentInfo.Gender.ToString();

                        if (StudentInfo.Gender.ToString() == "Others")
                        {
                            txtGender.Text = StudentInfo.GenderText;
                        }
                    }

                    ddlEthnical.SelectedValue = StudentInfo.Ethnicity;
                    rbtRace.SelectedValue = StudentInfo.Race;

                    if (StudentInfo.Race == "Other")
                    {
                        txtRace.Text = StudentInfo.RaceText;
                    }

                    rbtPracticeTest.SelectedValue = (StudentInfo.PracticeTestSaturday == true) ? "1" : "0";
                    ddlCountry.SelectedValue = StudentInfo.Country;
                    txtCountry.Text = StudentInfo.CountryText;
                    rbtLanguage.SelectedValue = StudentInfo.FirstLanguageEnglish;

                    if (StudentInfo.FirstLanguageEnglish == "No")
                    {
                        txtLanguage.Text = StudentInfo.FirstLanguageText;
                    }

                    txtPhoneMasked.Text = StudentInfo.ContactNumber;
                    txtEmail.Text = application.UserProfile.EmailAddress;
                    var homeAddress = dbcontext.Addresses.Where(a => a.idAddress == StudentInfo.idHomeAddress).FirstOrDefault();

                    if (homeAddress != null)
                    {
                        txtHomeAddress1.Text = homeAddress.Address1;
                        txtHomeAddress2.Text = homeAddress.Address2;
                        txtHomeCity.Text = homeAddress.City;
                        cboHomeState.SelectedValue = homeAddress.State;
                        txtHomeZip.Text = homeAddress.Zip;
                    }

                    var SessionInfo = dbcontext.App_Session_infos.Where(s => s.idApplication == application.idApplication).FirstOrDefault();
                    rboSessionConflicts.SelectedValue = SessionInfo.HaveSessionConflict;

                    if (SessionInfo.HaveSessionConflict == "Yes")
                    {
                        ddlSession.SelectedValue = SessionInfo.ConflictSessionAttend;
                    }

                    rboSessionPrefReason.SelectedValue = SessionInfo.PreferSession;

                    if (SessionInfo.PreferSession == "Yes")
                    {
                        txtSessionPrefReason.Text = SessionInfo.PreferSessionReason;
                        ddlPreferedSession.SelectedValue = SessionInfo.PreferSessionToAttend;
                    }

                }
            }
            catch
            {
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = "There was an error while submitting the Application. Please try again or contact Yleana!";
            }
        }
        
        protected void btnSaveNext_Click(object sender, EventArgs e)
        {
            try
            {
                if (ValidateInput())
                {
                    SaveDemographicInfo();

                    // Make Entry in the action tracking table
                    Helper.BusinessHelper business = new Helper.BusinessHelper();
                    business.InsertToActionTracking("SavedApplication");

                    Response.Redirect("Registration2.aspx");
                }
                else
                {
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                }
            }
            catch 
            {
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = "There was an error while submitting the Application. Please try again or contact Yleana!";
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                SaveDemographicInfo();

                // Make Entry in the action tracking table
                Helper.BusinessHelper business = new Helper.BusinessHelper();
                business.InsertToActionTracking("SavedApplication");

                lblMessage.ForeColor = System.Drawing.Color.Green;
                lblMessage.Text = "Application Saved successfully!";
            }
            catch
            {
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = "There was an error while submitting the Application. Please try again or contact Yleana!";
            }
        }

        protected void btnNext_Click(object sender, EventArgs e)
        {
            Response.Redirect("Registration2.aspx");
        }

        

        protected void SaveDemographicInfo()
        {
            using (YleanaDataContext dbcontext = new YleanaDataContext())
            {
                int idUser = WebSecurity.CurrentUserId;
                var application = dbcontext.StudentApplications.Where(A => A.idUser == idUser).FirstOrDefault();
                application.idPartner = Convert.ToInt16(ddlPartner.SelectedValue);
                application.idPartnerLocation = Convert.ToInt16(ddlLocation.SelectedValue);
                application.dtUpdated = DateTime.Now;

                var StudentInfo = dbcontext.App_StudentInfos.Where(s => s.idApplication == application.idApplication).FirstOrDefault();
                application.UserProfile.FirstName = txtFirstName.Text.Trim();
                application.UserProfile.LastName = txtLastName.Text.Trim();
                StudentInfo.DateOfBirth = dpDOB.DbSelectedDate.ToString();
                StudentInfo.Gender = ddlGender.SelectedValue;
                StudentInfo.GenderText = (ddlGender.SelectedValue == "Others") ? txtGender.Text.Trim() : "";
                StudentInfo.Ethnicity = ddlEthnical.SelectedValue.Trim();

                StudentInfo.Race = rbtRace.SelectedValue.Trim();
                StudentInfo.RaceText = (rbtRace.SelectedValue.Trim() == "Other") ? txtRace.Text.Trim() : "";
                StudentInfo.PracticeTestSaturday = (rbtPracticeTest.SelectedValue == "1") ? true : false;
                StudentInfo.Country = ddlCountry.SelectedValue.Trim();
                StudentInfo.CountryText = txtCountry.Text.Trim();
                StudentInfo.FirstLanguageEnglish = rbtLanguage.SelectedValue.Trim();
                StudentInfo.FirstLanguageText = (rbtLanguage.SelectedValue.Trim() == "No") ? txtLanguage.Text.Trim() : "";
                StudentInfo.ContactNumber = txtPhoneMasked.Text.Trim();
                application.UserProfile.EmailAddress = txtEmail.Text.Trim();

                var SessionInfo = dbcontext.App_Session_infos.Where(s => s.idApplication == application.idApplication).FirstOrDefault();
                SessionInfo.HaveSessionConflict = rboSessionConflicts.SelectedValue.Trim();
                SessionInfo.ConflictSessionAttend = (rboSessionConflicts.SelectedValue.Trim() == "Yes") ? ddlSession.SelectedValue.Trim() : "";
                SessionInfo.PreferSession = rboSessionPrefReason.SelectedValue.Trim();
                SessionInfo.PreferSessionReason = (rboSessionPrefReason.SelectedValue.Trim() == "Yes") ? txtSessionPrefReason.Text.Trim() : "";
                SessionInfo.PreferSessionToAttend = (rboSessionPrefReason.SelectedValue.Trim() == "Yes") ? ddlPreferedSession.SelectedValue.Trim(): "";                    
                var idHomeAddress = dbcontext.USP_AddAddress("HomeAddress", txtHomeAddress1.Text.Trim(), txtHomeAddress2.Text.Trim(), txtHomeCity.Text.Trim(), cboHomeState.SelectedValue.Trim(), txtHomeZip.Text.Trim(), StudentInfo.idHomeAddress);
                StudentInfo.idHomeAddress = Convert.ToInt32(idHomeAddress);
                dbcontext.SubmitChanges();
            }
        }

        protected bool ValidateInput()
        {
            bool isValid = true;
            lblMessage.Text = string.Empty;

            string MatchEmailPattern = @"^(([\w-]+\.)+[\w-]+|([a-zA-Z]{1}|[\w-]{2,}))@" + @"((([0-1]?[0-9]{1,2}|25[0-5]|2[0-4][0-9])\.([0-1]?
				[0-9]{1,2}|25[0-5]|2[0-4][0-9])\." + @"([0-1]?[0-9]{1,2}|25[0-5]|2[0-4][0-9])\.([0-1]? [0-9]{1,2}|25[0-5]|2[0-4][0-9])){1}|"
               + @"([a-zA-Z]+[\w-]+\.)+[a-zA-Z]{2,4})$";

            bool isEmailValid = Regex.IsMatch(txtEmail.Text, MatchEmailPattern);

            if (ddlPartner.SelectedIndex < 0)
            {
                lblMessage.Text += "Select a Partner Organization" + "<br/>";
                isValid = false;
            }

            if (ddlLocation.SelectedIndex < 0)
            {
                lblMessage.Text += "Select a Partner Organization Location" + "<br/>";
                isValid = false;
            }

            if (string.IsNullOrEmpty(txtEmail.Text.Trim()))
            {
                lblMessage.Text += "Enter Email Address" + "<br/>";
                isValid = false;
            }
            else
            {
                if (!isEmailValid)
                {
                    lblMessage.Text += "Enter a valid Email Address" + "<br/>";
                    isValid = false;
                }
            }

            if (string.IsNullOrEmpty(txtFirstName.Text.Trim()))
            {
                lblMessage.Text += "Enter First Name" + "<br/>";
                isValid = false;
            }

            if (string.IsNullOrEmpty(txtLastName.Text.Trim()))
            {
                lblMessage.Text += "Enter Last Name" + "<br/>";
                isValid = false;
            }

            if (dpDOB.SelectedDate == DateTime.MinValue )
            {
                lblMessage.Text += "Select the Date of Birth" + "<br/>";
                isValid = false;
            }

            if (ddlGender.SelectedIndex < 0)
            {
                lblMessage.Text += "Select the Gender" + "<br/>";
                isValid = false;
            }

            if (string.IsNullOrEmpty(rbtLanguage.SelectedValue.Trim()))
            {
                lblMessage.Text += "Select the Language" + "<br/>";
                isValid = false;
            }

            if (string.IsNullOrEmpty(txtPhoneMasked.Text.Trim()))
            {
                lblMessage.Text += "Enter Contact Number" + "<br/>";
                isValid = false;
            }

            if (string.IsNullOrEmpty(txtHomeAddress1.Text.Trim()))
            {
                lblMessage.Text += "Enter address1" + "<br/>";
                isValid = false;
            }

            if (string.IsNullOrEmpty(txtHomeCity.Text.Trim()))
            {
                lblMessage.Text += "Enter City" + "<br/>";
                isValid = false;
            }

            if (string.IsNullOrEmpty(cboHomeState.SelectedValue.Trim()))
            {
                lblMessage.Text += "Select the State" + "<br/>";
                isValid = false;
            }            

            if (string.IsNullOrEmpty(txtHomeZip.Text.Trim()))
            {
                lblMessage.Text += "Enter Zip" + "<br/>";
                isValid = false;
            }

            return isValid;
        }

    }
}