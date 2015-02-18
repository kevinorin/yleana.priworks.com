using System;
using System.Linq;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebMatrix.WebData;
using yleana.Data;

namespace yleana
{
    public partial class Registration4 : System.Web.UI.Page
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
                PopulateData();
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
            Response.Redirect("Registration3.aspx");
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                SaveData();

                // Make Entry in the action tracking table
                Helper.BusinessHelper business = new Helper.BusinessHelper();
                business.InsertToActionTracking("SavedApplication");

                lblMessage.ForeColor = System.Drawing.Color.Green;
                lblMessage.Text = "Application saved successfully!.";
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
                    SaveData();

                    // Make Entry in the action tracking table
                    Helper.BusinessHelper business = new Helper.BusinessHelper();
                    business.InsertToActionTracking("SavedApplication");

                    Response.Redirect("Registration5.aspx");
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
            Response.Redirect("Registration5.aspx");
        }

        protected void PopulateData()
        {
            try
            {
                using (YleanaDataContext dbcontext = new YleanaDataContext())
                {
                    int idUser = WebSecurity.CurrentUserId;
                    var application = dbcontext.StudentApplications.Where(A => A.idUser == idUser).FirstOrDefault();

                    var TravelInfo = dbcontext.App_Travel_Camp_Infos.Where(s => s.idApplication == application.idApplication).FirstOrDefault();
                    rbotravelledOutOfState.SelectedValue = TravelInfo.TraveledOutOfState;
                    rboAwayHomeOneWeek.SelectedValue = TravelInfo.AwayFromHomeMoreThanOneWeek;
                    ddlAwayHome.SelectedValue = TravelInfo.ContextOfAwayFromHome;
                    txtAwayHomeContext.Text = TravelInfo.ContextOfAwayFromHomeText;

                    var collegeinfo = dbcontext.App_College_Intrest_Infos.Where(c => c.idApplication == application.idApplication).FirstOrDefault();
                    rboFinancialAid.SelectedValue = collegeinfo.NeedFinancialAid;
                    ddlCounselor.SelectedValue = collegeinfo.HaveCounselorAdviser;
                    ddlCollegeState.SelectedValue = collegeinfo.ApplyColleges;
                    ddlSpecialProgram.SelectedValue = collegeinfo.ApplyForSpecialSupport;

                    if (collegeinfo.TypeOfSchool != null)
                    {
                        BindSchoolType(collegeinfo.TypeOfSchool);
                    }

                    txtExperience.Text = application.WorkExperience;
                }
            }
            catch (Exception ex)
            {
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = "There was an error while submitting the Application. Please try again or contact Yleana!";
            }
        }

        protected void SaveData()
        {
            using (YleanaDataContext dbcontext = new YleanaDataContext())
            {
                int idUser = WebSecurity.CurrentUserId;
                var application = dbcontext.StudentApplications.Where(A => A.idUser == idUser).FirstOrDefault();

                var TravelInfo = dbcontext.App_Travel_Camp_Infos.Where(s => s.idApplication == application.idApplication).FirstOrDefault();
                TravelInfo.TraveledOutOfState = rbotravelledOutOfState.SelectedValue.Trim();
                TravelInfo.AwayFromHomeMoreThanOneWeek = rboAwayHomeOneWeek.SelectedValue.Trim();
                TravelInfo.ContextOfAwayFromHome = (rboAwayHomeOneWeek.SelectedValue.Trim() == "Yes") ? ddlAwayHome.SelectedValue.Trim() : "";
                TravelInfo.ContextOfAwayFromHomeText = (ddlAwayHome.SelectedValue.Trim() == "Other") ? txtAwayHomeContext.Text.Trim() : "";

                var collegeinfo = dbcontext.App_College_Intrest_Infos.Where(c => c.idApplication == application.idApplication).FirstOrDefault();
                collegeinfo.NeedFinancialAid = rboFinancialAid.SelectedValue.Trim();
                collegeinfo.HaveCounselorAdviser = ddlCounselor.SelectedValue.Trim();
                collegeinfo.ApplyColleges = ddlCollegeState.SelectedValue.Trim();
                collegeinfo.ApplyForSpecialSupport = ddlSpecialProgram.SelectedValue.Trim();
                collegeinfo.TypeOfSchool = BuildSchoolTypeString();

                application.WorkExperience = txtExperience.Text.Trim();
                dbcontext.SubmitChanges();
            }
        }

        protected string BuildSchoolTypeString()
        {
            string s = string.Empty;
            for (int i = 0; i < rbtSchoolType.Items.Count; i++)
            {
                if (rbtSchoolType.Items[i].Selected)
                {
                    s = s + rbtSchoolType.Items[i].Value + ",";
                }
            }
            return s.TrimEnd(',');
        }

        protected void BindSchoolType(string str)
        {
            string[] homestay = str.Split(',');
            for (int i = 0; i < rbtSchoolType.Items.Count; i++)
            {
                for (int j = 0; j < homestay.Length; j++)
                {
                    if (rbtSchoolType.Items[i].Value == homestay[j])
                    {
                        rbtSchoolType.Items[i].Selected = true;
                        break;
                    }
                }

            }
        }

        protected bool ValidateInput()
        {
            bool isValid = true;
            lblMessage.Text = string.Empty;

            if (string.IsNullOrEmpty(rbotravelledOutOfState.SelectedValue))
            {
                lblMessage.Text += "Please select the traveled out of state option" + "<br/>";
                isValid = false;
            }

            if (string.IsNullOrEmpty(rboAwayHomeOneWeek.SelectedValue))
            {
                lblMessage.Text += "Please select the away from home option" + "<br/>";
                isValid = false;
            }

            if (string.IsNullOrEmpty(rboFinancialAid.SelectedValue))
            {
                lblMessage.Text += "Please select the financial aid option" + "<br/>";
                isValid = false;
            }

            if (ddlCounselor.SelectedValue == "")
            {
                lblMessage.Text += "Please select college counselor/adviser option" + "<br/>";
                isValid = false;
            }

            return isValid;
        }
    }
}