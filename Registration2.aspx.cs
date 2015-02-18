using System;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebMatrix.WebData;
using yleana.Data;

namespace yleana
{
    public partial class Registration2 : System.Web.UI.Page
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
                PopulateParentFamilyInfo();
            }
        }

        protected void  DisablePage()
        {
            using (YleanaDataContext dbcontext = new YleanaDataContext())
            {
                int idUser = WebSecurity.CurrentUserId;
                var application = dbcontext.StudentApplications.Where(A => A.idUser == idUser).FirstOrDefault();

                if (application.dtSubmittedPhase2 != null)
                {
                    DisableControls(this.panl1);
					btnSave.Enabled = false;
					btnSaveAndNext.Enabled = false;
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
            Response.Redirect("Registration1.aspx");
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                SaveParentAndFamilyInfo();

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

        protected void btnNext_Click(object sender, EventArgs e)
        {
            Response.Redirect("Registration3.aspx");
        }

        protected void btnSaveNext_Click(object sender, EventArgs e)
        {
            try
            {
                if (ValidateInput())
                {
                    SaveParentAndFamilyInfo();

                    // Make Entry in the action tracking table
                    Helper.BusinessHelper business = new Helper.BusinessHelper();
                    business.InsertToActionTracking("SavedApplication");

                    Response.Redirect("Registration3.aspx");
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

        protected bool ValidateInput()
        {
            bool isValid = true;
            lblMessage.Text = string.Empty;

            string MatchEmailPattern = @"^(([\w-]+\.)+[\w-]+|([a-zA-Z]{1}|[\w-]{2,}))@" + @"((([0-1]?[0-9]{1,2}|25[0-5]|2[0-4][0-9])\.([0-1]?
				[0-9]{1,2}|25[0-5]|2[0-4][0-9])\." + @"([0-1]?[0-9]{1,2}|25[0-5]|2[0-4][0-9])\.([0-1]? [0-9]{1,2}|25[0-5]|2[0-4][0-9])){1}|"
               + @"([a-zA-Z]+[\w-]+\.)+[a-zA-Z]{2,4})$";

            bool isEmailValid = Regex.IsMatch(txtParentEmail.Text, MatchEmailPattern);

            if (string.IsNullOrEmpty(txtEmergencyContactName.Text.Trim()))
            {
                lblMessage.Text += "Enter Emergency contact name" + "<br/>";
                isValid = false;
            }

            if (ddlRelation.SelectedIndex < 0)
            {
                lblMessage.Text += "Select a Relationship" + "<br/>";
                isValid = false;
            }

            if (string.IsNullOrEmpty(txtparentContactNumber.Text.Trim()))
            {
                lblMessage.Text += "Enter Emergency contact Phone" + "<br/>";
                isValid = false;
            }

            if (string.IsNullOrEmpty(txtParentEmail.Text.Trim()))
            {
                lblMessage.Text += "Enter Parent/Guardian Email" + "<br/>";
                isValid = false;
            }
            else
            {
                if (!isEmailValid)
                {
                    lblMessage.Text += "Enter a valid Parent/Guardian Email Address" + "<br/>";
                    isValid = false;
                }
            }

            if (string.IsNullOrEmpty(rboFirstGeneration.SelectedValue))
            {
                lblMessage.Text += "Select first generation college option" + "<br/>";
                isValid = false;
            }    
        
            return isValid;
        }

        protected string BuildHomeStayString()
        {
            string s = string.Empty;
            for (int i = 0; i < rbtStayHomeWith.Items.Count; i++)
            {
                if (rbtStayHomeWith.Items[i].Selected)
                {
                    s = s + rbtStayHomeWith.Items[i].Text + ",";
                }
            }
            return s.TrimEnd(',');
        }

        protected bool IsHomeStayOtherSelected()
        {

            for (int i = 0; i < rbtStayHomeWith.Items.Count; i++)
            {
                if (rbtStayHomeWith.Items[i].Selected)
                {
                    if (rbtStayHomeWith.Items[i].Text == "Other")
                    {
                        return true;
                    }
                }
            }
            return false;
        }

        protected void BindHomeStay(string str)
        {
            string[] homestay = str.Split(',');
            for (int i = 0; i < rbtStayHomeWith.Items.Count; i++)
            {
                for (int j = 0; j < homestay.Length; j++)
                {
                    if (rbtStayHomeWith.Items[i].Value == homestay[j])
                    {
                        rbtStayHomeWith.Items[i].Selected = true;
                        break;
                    }
                }

            }
        }

        protected string BuildIncomeContributionString()
        {
            string s = string.Empty;
            for (int i = 0; i < cboIncomeContribution.Items.Count; i++)
            {
                if (cboIncomeContribution.Items[i].Selected)
                {
                    s = s + cboIncomeContribution.Items[i].Text + ",";
                }
            }
            return s.TrimEnd(',');
        }

        protected bool IsIncomeContributionOtherSelected()
        {
            for (int i = 0; i < cboIncomeContribution.Items.Count; i++)
            {
                if (cboIncomeContribution.Items[i].Selected)
                {
                    if (cboIncomeContribution.Items[i].Text == "Other")
                    {
                        return true;
                    }
                }
            }
            return false;
        }

        protected void BindIncomeContribution(string str)
        {
            string[] homestay = str.Split(',');
            for (int i = 0; i < cboIncomeContribution.Items.Count; i++)
            {
                for (int j = 0; j < homestay.Length; j++)
                {
                    if (cboIncomeContribution.Items[i].Value == homestay[j])
                    {
                        cboIncomeContribution.Items[i].Selected = true;
                        break;
                    }
                }

            }
        }        

        protected void SaveParentAndFamilyInfo()
        {
            using (YleanaDataContext dbcontext = new YleanaDataContext())
            {
                int idUser = WebSecurity.CurrentUserId;
                var application = dbcontext.StudentApplications.Where(A => A.idUser == idUser).FirstOrDefault();
                var FamilyInfo = dbcontext.App_FamilyInfos.Where(s => s.idApplication == application.idApplication).FirstOrDefault();
                FamilyInfo.FamilyIncomeContribution = BuildIncomeContributionString();
                FamilyInfo.FamilyIncomeContributionText = (IsIncomeContributionOtherSelected()) ? txtIncomeContributionText.Text.Trim() : "";
                FamilyInfo.AnnualFamilyIncome = ddlIncome.SelectedValue.Trim();
                FamilyInfo.FirstGenerationCollege = (rboFirstGeneration.SelectedValue.Trim() == "Yes") ? true: false;
                FamilyInfo.FirstGenerationCollegeText = (rboFirstGeneration.SelectedValue.Trim() == "No") ? txtFirstGraduationText.Text.Trim() : "";
                FamilyInfo.AnyoneGraduateHigherEducation = (rboFirstGeneration.SelectedValue.Trim() == "No") ? rboAnyoneGraduateHigherEducation.SelectedValue.Trim() : ""; ;
                FamilyInfo.ParentsGuardianAttendHighSchool = rboParentHighSchool.SelectedValue.Trim();

                if (rboParentHighSchool.SelectedValue.Trim() == "No")
                {
                    FamilyInfo.ParentsGuardianfamiliarUSEducation = (rboParentFamilierUSEducation.SelectedValue.Trim() == "Yes") ? true : false;
                }
                else
                {
                    FamilyInfo.ParentsGuardianfamiliarUSEducation = null;
                }

                FamilyInfo.ParentGuardianSATTaken = (rboParentSAT.SelectedValue.Trim() == "Yes") ? true : false;
                FamilyInfo.HaveSiblings = rboSiblings.SelectedValue.Trim();
                FamilyInfo.SiblingsGender = (rboSiblings.SelectedValue.Trim() == "Yes") ? ddlSiblingGender.SelectedValue.Trim(): "";
                FamilyInfo.SiblingsYoungerElder = (rboSiblings.SelectedValue.Trim() == "Yes") ? ddlsiblingOlderYounger.SelectedValue.Trim(): "";
                FamilyInfo.SiblingsCollege = (rboSiblings.SelectedValue.Trim() == "Yes") ? rboSiblingAttendedCollege.SelectedValue.Trim() : "";

                FamilyInfo.StayHomeWith = BuildHomeStayString();
                FamilyInfo.StayHomeWithText = (IsHomeStayOtherSelected() == true) ? txtStayHomeWithText.Text.Trim() : "";
                FamilyInfo.ParentGuardianName = txtEmergencyContactName.Text.Trim();
                FamilyInfo.ParentGuardianRelation = ddlRelation.SelectedValue.Trim();
                FamilyInfo.ParentGuardianRelationText = (ddlRelation.SelectedValue.Trim() == "Other") ? txtRelationshipText.Text.Trim() : "";
                FamilyInfo.ParentGuardianContact = txtparentContactNumber.Text.Trim();
                FamilyInfo.ParentGuardianEmail = txtParentEmail.Text.Trim();
                FamilyInfo.ParentGuardianAddress = ddlParentAddress.SelectedValue.Trim();
                if (ddlParentAddress.SelectedValue.Trim() == "Other")
                {
                    var idParentAddress = dbcontext.USP_AddAddress("ParentGuardianAddress", txtParentAddress1.Text.Trim(), txtParentAddress2.Text.Trim(), txtParentCity.Text.Trim(), cboParentState.SelectedValue.Trim(), txtParentZip.Text.Trim(), FamilyInfo.idParentAddress);
                    FamilyInfo.idParentAddress = Convert.ToInt16(idParentAddress);
                }
                else
                {
                    FamilyInfo.idParentAddress = null;
                }
                    
                dbcontext.SubmitChanges();
            }
        }

		protected void PopulateParentFamilyInfo()
        {
            try
            {
                using (YleanaDataContext dbcontext = new YleanaDataContext())
                {
                    int idUser = WebSecurity.CurrentUserId;
                    var application = dbcontext.StudentApplications.Where(A => A.idUser == idUser).FirstOrDefault();
                    var FamilyInfo = dbcontext.App_FamilyInfos.Where(s => s.idApplication == application.idApplication).FirstOrDefault();

                    if (Convert.ToString(FamilyInfo.StayHomeWith) != null)
                    {
                        BindHomeStay(FamilyInfo.StayHomeWith);
                    }

                    txtStayHomeWithText.Text = FamilyInfo.StayHomeWithText;
                    txtEmergencyContactName.Text = FamilyInfo.ParentGuardianName;
                    ddlRelation.SelectedValue = FamilyInfo.ParentGuardianRelation;
                    txtRelationshipText.Text = FamilyInfo.ParentGuardianRelationText;
                    txtparentContactNumber.Text = FamilyInfo.ParentGuardianContact;
                    txtParentEmail.Text = FamilyInfo.ParentGuardianEmail;
                    ddlParentAddress.SelectedValue = FamilyInfo.ParentGuardianAddress;

                    if (FamilyInfo.ParentGuardianAddress == "Other")
                    {
                        var parentAddress = dbcontext.Addresses.Where(a => a.idAddress == FamilyInfo.idParentAddress).FirstOrDefault();

                        if (parentAddress != null)
                        {
                            if (parentAddress.Address1 != "")
                                txtParentAddress1.Text = parentAddress.Address1;

                            if (parentAddress.Address2 != "")
                                txtParentAddress2.Text = parentAddress.Address2;

                            if (parentAddress.City != "")
                                txtParentCity.Text = parentAddress.City;

                            if (parentAddress.State != "")
                                cboParentState.SelectedValue = parentAddress.State;

                            if (parentAddress.Zip.Trim() != "")
                                txtParentZip.Text = parentAddress.Zip;
                        }
                    }

                    if (Convert.ToString(FamilyInfo.FamilyIncomeContribution) != null)
                    {
                        BindIncomeContribution(FamilyInfo.FamilyIncomeContribution);
                    }

                    txtIncomeContributionText.Text = FamilyInfo.FamilyIncomeContributionText;
                    ddlIncome.SelectedValue = FamilyInfo.AnnualFamilyIncome;
                    rboFirstGeneration.SelectedValue = (FamilyInfo.FirstGenerationCollege == true) ? "Yes" : "No";
                    txtFirstGraduationText.Text = FamilyInfo.FirstGenerationCollegeText;

                    rboAnyoneGraduateHigherEducation.SelectedValue = FamilyInfo.AnyoneGraduateHigherEducation;
                    rboParentHighSchool.SelectedValue = FamilyInfo.ParentsGuardianAttendHighSchool;
                    rboParentFamilierUSEducation.SelectedValue = (FamilyInfo.ParentsGuardianfamiliarUSEducation ==  true)? "Yes": "No";
                    rboParentSAT.SelectedValue = (FamilyInfo.ParentGuardianSATTaken == true) ? "Yes" : "No";
                    rboSiblings.SelectedValue = FamilyInfo.HaveSiblings;
                    ddlSiblingGender.SelectedValue = FamilyInfo.SiblingsGender;
                    ddlsiblingOlderYounger.SelectedValue = FamilyInfo.SiblingsYoungerElder;
                    rboSiblingAttendedCollege.SelectedValue = FamilyInfo.SiblingsCollege;
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text += ex.Message;
            }
        }

        protected void btnSaveAndNext_Click(object sender, EventArgs e)
        {
            try
            {
                if (ValidateInput())
                {
                    SaveParentAndFamilyInfo();
                    Response.Redirect("Registration3.aspx");
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = ex.Message;
            }
        }

        
    }
}