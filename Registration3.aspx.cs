using System;
using System.Linq;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;
using WebMatrix.WebData;
using yleana.Data;

namespace yleana
{
    public partial class Registration3 : System.Web.UI.Page
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
                DropDownListItem item;

                for (int i = 1; i <= 2; i++)
                {
                    item = new DropDownListItem();
                    item.Text = DateTime.Today.AddYears(i).Year.ToString();
                    item.Value = DateTime.Today.AddYears(i).Year.ToString();
                    ddlGraduationYear.Items.Add(item);
                }

                item = new DropDownListItem();
                item.Text = "Other";
                item.Value = "Other";
                ddlGraduationYear.Items.Add(item);
                PopulateEducationalInfo();
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
                    DisableControls(this.panl1);
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

        protected void btnPrevious_Click(object sender, EventArgs e)
        {
            Response.Redirect("Registration2.aspx");
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                SaveEducationalInfo();

                // Make Entry in the action tracking table
                Helper.BusinessHelper business = new Helper.BusinessHelper();
                business.InsertToActionTracking("SavedApplication");

                lblMessage.ForeColor = System.Drawing.Color.Green;
                lblMessage.Text = "Application saved successfully!";
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
                    SaveEducationalInfo();

                    // Make Entry in the action tracking table
                    Helper.BusinessHelper business = new Helper.BusinessHelper();
                    business.InsertToActionTracking("SavedApplication");

                    Response.Redirect("Registration4.aspx");
                }
                else
                {
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                }
            }
            catch (Exception ex)
            {
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = "There was an error while submitting the Application. Please try again or contact Yleana!";
            }
        }

        protected void btnNext_Click(object sender, EventArgs e)
        {
            Response.Redirect("Registration4.aspx");
        }

        protected bool ValidateInput()
        {
            bool isValid = true;
            lblMessage.Text = string.Empty;
           
			if (string.IsNullOrEmpty(txtSchoolName.Text.Trim()))
            {
                lblMessage.Text += "Enter School Name" + "<br/>";
                isValid = false;
            }

            if (ddlGraduationYear.SelectedIndex < 0)
            {
                lblMessage.Text += "Select Graduation Year" + "<br/>";
                isValid = false;
            }

            if (string.IsNullOrEmpty(rboLunch.SelectedValue))
            {
                lblMessage.Text += "Select Free/Reduced lunch option" + "<br/>";
                isValid = false;
            }

            if (ddlGPA.SelectedIndex < 0)
            {
                lblMessage.Text += "Select GPA" + "<br/>";
                isValid = false;
            }

            if (string.IsNullOrEmpty(rbtSATPreparation.SelectedValue))
            {
                lblMessage.Text += "Select your SAT preparation option" + "<br/>";
                isValid = false;
            }

            if (string.IsNullOrEmpty(rbtOfficialSAT.SelectedValue))
            {
                lblMessage.Text += "Select your Official SAT details" + "<br/>";
                isValid = false;
            }

            return isValid;
        }

        protected void SaveEducationalInfo()
        {
            using (YleanaDataContext dbcontext = new YleanaDataContext())
            {
                int idUser = WebSecurity.CurrentUserId;
                var application = dbcontext.StudentApplications.Where(A => A.idUser == idUser).FirstOrDefault();

                var EducationalInfo = dbcontext.App_EducationalInfos.Where(s => s.idApplication == application.idApplication).FirstOrDefault();
                EducationalInfo.HighSchoolName = txtSchoolName.Text.Trim();
                EducationalInfo.GraduationYear = ddlGraduationYear.SelectedValue;
                EducationalInfo.GraduationYearText = (ddlGraduationYear.SelectedValue== "Other") ? txtGraduationYear.Text.Trim() : "";
                EducationalInfo.FreeLunch = (rboLunch.SelectedValue == "Yes") ? true : false;
                EducationalInfo.CurrentGPA = ddlGPA.SelectedValue.Trim();
                EducationalInfo.CurrentGPAText = (ddlGPA.SelectedValue.Trim() == "Other") ? txtGPA.Text.Trim() : "";
                EducationalInfo.ExtendedStandardizedTime = rbtExtendedTimeStandardised.SelectedValue.Trim();
                EducationalInfo.ExtendedStandardizedTestName = (rbtExtendedTimeStandardised.SelectedValue.Trim() == "Yes") ? ddlextendedtest.SelectedValue.Trim() : "";
                EducationalInfo.ExtendedStandardizedTimeText = (rbtExtendedTimeStandardised.SelectedValue.Trim() == "Yes") ? txtExtendedTimeStandardisedText.Text.Trim() : "";
                EducationalInfo.ExtendedTimeAtSchool = rbtExtendedSchool.SelectedValue.Trim();
                EducationalInfo.ExtendedTimeAtSchoolText = (rbtExtendedSchool.SelectedValue.Trim() == "Yes")? txtExtendedSchoolText.Text.Trim() : "";
                EducationalInfo.HelperRequired = (rbtExamHelper.SelectedValue == "Yes") ? true : false;
                EducationalInfo.StudiedForSAT = rbtSATPreparation.SelectedValue.Trim();
                EducationalInfo.StudiedForSATText = (rbtSATPreparation.SelectedValue.Trim() =="Yes")? txtSATPrepare.Text.Trim(): "" ;
                EducationalInfo.OfficialSATTaken = (rbtOfficialSAT.SelectedValue == "Yes") ? true : false;

                if (rbtOfficialSAT.SelectedValue == "Yes")
                {
                    EducationalInfo.OfficialSATTotalScore = txtSATTotal.Text.Trim();
                    EducationalInfo.OfficialSATMathScore = (!string.IsNullOrEmpty(txtSATMath.Text)) ? Convert.ToInt16(txtSATMath.Text.Trim()) : 0;
                    EducationalInfo.OfficialSATReadingScore = (!string.IsNullOrEmpty(txtSATReading.Text)) ? Convert.ToInt16(txtSATReading.Text.Trim()) : 0;
                    EducationalInfo.OfficialSATWritingScore = (!string.IsNullOrEmpty(txtSATWriting.Text)) ? Convert.ToInt16(txtSATWriting.Text.Trim()) : 0;
                    //EducationalInfo.OfficialSATEssayScore = (!string.IsNullOrEmpty(txtSATEssay.Text)) ? Convert.ToInt16(txtSATEssay.Text.Trim()) : 0;
                }
                else
                {
                    EducationalInfo.OfficialSATTotalScore = "";
                    EducationalInfo.OfficialSATMathScore = null;
                    EducationalInfo.OfficialSATReadingScore = null;
                    EducationalInfo.OfficialSATWritingScore = null;
                    //EducationalInfo.OfficialSATEssayScore = null;
                }

                EducationalInfo.PracticeSATTaken = (rbtPracticeSAT.SelectedValue == "Yes") ? true : false;

                if (rbtPracticeSAT.SelectedValue == "Yes")
                {
                    EducationalInfo.PracticeSATTotalScore = txtPracticeSATScore.Text.Trim();
                    EducationalInfo.PracticeSATMathScore = (!string.IsNullOrEmpty(txtPracticeSATMath.Text)) ? Convert.ToInt16(txtPracticeSATMath.Text.Trim()) : 0;
                    EducationalInfo.PracticeSATReadingScore = (!string.IsNullOrEmpty(txtPracticeSATReading.Text)) ? Convert.ToInt16(txtPracticeSATReading.Text.Trim()) : 0;
                    EducationalInfo.PracticeSATWritingScore = (!string.IsNullOrEmpty(txtPracticeSATWriting.Text)) ? Convert.ToInt16(txtPracticeSATWriting.Text.Trim()) : 0;
                    //EducationalInfo.PracticeSATEssayScore = (!string.IsNullOrEmpty(txtPracticeSATEssay.Text)) ? Convert.ToInt16(txtPracticeSATEssay.Text.Trim()) : 0;
                }
                else
                {
                    EducationalInfo.PracticeSATTotalScore = "";
                    EducationalInfo.PracticeSATMathScore = null;
                    EducationalInfo.PracticeSATReadingScore = null;
                    EducationalInfo.PracticeSATWritingScore = null;
                    //EducationalInfo.PracticeSATEssayScore = null;

                }

                EducationalInfo.OtherstandardizedTests = txtOtherStandardTests.Text.Trim();
                dbcontext.SubmitChanges();
            }

        }

        protected void PopulateEducationalInfo()
        {
            try
            {
                using (YleanaDataContext dbcontext = new YleanaDataContext())
                {
                    int idUser = WebSecurity.CurrentUserId;
                    var application = dbcontext.StudentApplications.Where(A => A.idUser == idUser).FirstOrDefault();
                    var EducationalInfo = dbcontext.App_EducationalInfos.Where(E => E.idApplication == application.idApplication).FirstOrDefault();
                    txtSchoolName.Text = EducationalInfo.HighSchoolName;

                    if (!String.IsNullOrEmpty(EducationalInfo.GraduationYear))
                    {
                        ddlGraduationYear.SelectedValue = EducationalInfo.GraduationYear;
                    }

                    txtGraduationYear.Text = EducationalInfo.GraduationYearText;
                    rboLunch.SelectedValue = (EducationalInfo.FreeLunch == true) ? "Yes" : "No";

                    if (!String.IsNullOrEmpty(EducationalInfo.CurrentGPA))
                    {
                        ddlGPA.SelectedValue = EducationalInfo.CurrentGPA;
                    }

                    txtGPA.Text = EducationalInfo.CurrentGPAText;
                    rbtExtendedTimeStandardised.SelectedValue = EducationalInfo.ExtendedStandardizedTime;

                    if (!String.IsNullOrEmpty(EducationalInfo.ExtendedStandardizedTestName))
                    {
                        ddlextendedtest.SelectedValue = EducationalInfo.ExtendedStandardizedTestName;
                    }

                    txtExtendedTimeStandardisedText.Text = EducationalInfo.ExtendedStandardizedTimeText;
                    rbtExtendedSchool.SelectedValue = EducationalInfo.ExtendedTimeAtSchool;
                    txtExtendedSchoolText.Text = EducationalInfo.ExtendedTimeAtSchoolText;
                    rbtExamHelper.SelectedValue = (EducationalInfo.HelperRequired == true) ? "Yes" : "No";
                    rbtSATPreparation.SelectedValue = EducationalInfo.StudiedForSAT;
                    txtSATPrepare.Text = EducationalInfo.StudiedForSATText;
                    rbtOfficialSAT.SelectedValue = (EducationalInfo.OfficialSATTaken == true) ? "Yes" : "No";
                    txtSATTotal.Text = EducationalInfo.OfficialSATTotalScore;
                    txtSATMath.Text = Convert.ToString(EducationalInfo.OfficialSATMathScore);
                    txtSATReading.Text = Convert.ToString(EducationalInfo.OfficialSATReadingScore);
                    txtSATWriting.Text = Convert.ToString(EducationalInfo.OfficialSATWritingScore);
                    rbtPracticeSAT.SelectedValue = (EducationalInfo.PracticeSATTaken == true) ? "Yes" : "No";
                    txtPracticeSATScore.Text = Convert.ToString(EducationalInfo.PracticeSATTotalScore);
                    txtPracticeSATMath.Text = Convert.ToString(EducationalInfo.PracticeSATMathScore);
                    txtPracticeSATReading.Text = Convert.ToString(EducationalInfo.PracticeSATReadingScore);
                    txtPracticeSATWriting.Text = Convert.ToString(EducationalInfo.PracticeSATWritingScore);
                    txtOtherStandardTests.Text = EducationalInfo.OtherstandardizedTests;                    
                }
            }
            catch (Exception ex)
            {
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = "There was an error while submitting the Application. Please try again or contact Yleana!";
            }
        }
    }
}