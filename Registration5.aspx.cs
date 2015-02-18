using System;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;
using WebMatrix.WebData;
using yleana.Data;

namespace yleana
{
    public partial class Registration5 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
			if ((!WebSecurity.IsAuthenticated) || (!Roles.IsUserInRole("StudentRole")))
			{
				Response.Redirect("~/Login.aspx");
			}

            DisablePage();

            using (YleanaDataContext dbcontext = new YleanaDataContext())
            {
                int idUser = WebSecurity.CurrentUserId;
                var application = dbcontext.StudentApplications.Where(A => A.idUser == idUser).FirstOrDefault();

                if (application.dtSubmittedPhase2.HasValue)
                {
					btnSubmit.Text = "SUBMITTED";
					btnSubmit.Enabled = false;
                }
            }
            PopulateExisting();
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
					btnSubmit.Enabled = false;                    
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

        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                if (ValidateInput())
                {
                    uploadDocuments();

                    // Make Entry in the action tracking table
                    Helper.BusinessHelper business = new Helper.BusinessHelper();
                    business.InsertToActionTracking("SavedApplication");

                    lblMessage.ForeColor = System.Drawing.Color.Green;
                    lblMessage.Text = "Application Saved successfully!";
                }
                else
                {
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                }
            }
            catch 
            {
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = "There was an error while saving the application!, Please try again or contact Yleana";
            }            
        }

        protected void uploadDocuments()
        {
            string path = string.Empty;
            using (YleanaDataContext dbcontext = new YleanaDataContext())
            {
                string fileSharePath = Convert.ToString(ConfigurationManager.AppSettings["FileShare"]);
                int idUser = WebSecurity.CurrentUserId;
                var application = dbcontext.StudentApplications.Where(A => A.idUser == idUser).FirstOrDefault();
                path = fileSharePath + @"\" + DateTime.Today.Year.ToString() + @"\Application_" + application.idApplication.ToString() + @"\";

                if (!Directory.Exists(path))
                {
                    Directory.CreateDirectory(path);
                }

                DirectoryInfo myDir = new DirectoryInfo(path);
                string searchPattern = string.Empty;
                string strfilename = string.Empty;

                foreach (UploadedFile f in RaduploadTranscript.UploadedFiles)
                {
                    strfilename = "Transcript_" + application.UserProfile.FirstName + "_" + application.UserProfile.LastName + f.GetExtension();
                    searchPattern = "Transcript_*.*";
                    FileInfo[] files = myDir.GetFiles(searchPattern);
                    for (int i = 0; i < files.Length; i++)
                    {
                        files[i].Delete();
                    }
                    f.SaveAs(path + strfilename, true);
                    application.transcriptUploaded = true;
                }

                foreach (UploadedFile f in RadUploadPersonalStatement.UploadedFiles)
                {
                    searchPattern = "PersonalStatement_*.*";
                    FileInfo[] files = myDir.GetFiles(searchPattern);
                    for (int i = 0; i < files.Length; i++)
                    {
                        files[i].Delete();
                    }
                    strfilename = "PersonalStatement_" + application.UserProfile.FirstName + "_" + application.UserProfile.LastName + f.GetExtension();
                    f.SaveAs(path + strfilename, true);
                    application.essayUploaded = true;
                }

                foreach (UploadedFile f in RadUploadResume.UploadedFiles)
                {
                    searchPattern = "Resume_*.*";
                    FileInfo[] files = myDir.GetFiles(searchPattern);
                    for (int i = 0; i < files.Length; i++)
                    {
                        files[i].Delete();
                    }
                    strfilename = "Resume_" + application.UserProfile.FirstName + "_" + application.UserProfile.LastName + f.GetExtension();
                    f.SaveAs(path + strfilename, true);
                    application.ResumeUploaded = true;
                }
                application.dtUpdated = DateTime.Now;
                dbcontext.SubmitChanges();
            }           
        }

        private bool ValidateInput()
        {
            lblMessage.Text = string.Empty;
            bool isValid = true;
            
            if(RaduploadTranscript.InvalidFiles.Count > 0)
            {
                lblMessage.Text += "Invalid file format!, Select a valid file for Transcript to upload" + "<br/>";
                isValid = false;
            }

            if (RadUploadPersonalStatement.InvalidFiles.Count > 0)
            {
                lblMessage.Text += "Invalid file format!, Select a valid file for Personal Statement to upload" + "<br/>";
                isValid = false;
            }

            if (RadUploadResume.InvalidFiles.Count > 0)
            {
                lblMessage.Text += "Invalid file format!, Select a valid file for Resume to upload" + "<br/>";
                isValid = false;
            }
            return isValid;
        }

        protected void btnPrevious_Click(object sender, EventArgs e)
        {
            Response.Redirect("Registration4.aspx");
        }

		protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                if (ValidateInput())
                {
                    uploadDocuments();
                
                    using (YleanaDataContext dbcontext = new YleanaDataContext())
                    {
                        int idUser = WebSecurity.CurrentUserId;
                        var application = dbcontext.StudentApplications.Where(A => A.idUser == idUser).FirstOrDefault();
                    
                        bool isValid = true;
                        lblMessage.Text = string.Empty;

                        if (application.transcriptUploaded != true)
                        {
                            lblMessage.Text += "Select a Transcript file to upload" + "<br/>";
                            isValid = false;
                        }

                        if (application.essayUploaded != true)
                        {
                            lblMessage.Text += "Select a Personal Statement file to upload" + "<br/>";
                            isValid = false;
                        }

                        if (isValid == false)
                        {
                            lblMessage.ForeColor = System.Drawing.Color.Red;
                            return;
                        }

                        if ((application.transcriptUploaded) && (application.essayUploaded))
                        {
                            application.dtSubmittedPhase2 = DateTime.Now;
                            dbcontext.SubmitChanges();

                            // Make Entry in the action tracking table
                            Helper.BusinessHelper business = new Helper.BusinessHelper();
                            business.InsertToActionTracking("Phase2Submitted");

                            btnSave.Enabled = false;
						    btnSubmit.Enabled = false;
                            lblMessage.ForeColor = System.Drawing.Color.Green;
                            lblMessage.Text = "Application submitted successfully!";
                        }
                        else
                        {
                            lblMessage.Text = "Please upload the required Transcript and Personal statement and Submit the Application again!";
                        }
                    }
                }
                else
                {
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                }
            }
            catch 
            {
                lblMessage.Text = "There was an error while submitting the Application. Please try again or contact Yleana!";
            }
        }

        protected void PopulateExisting()
        {
            using (YleanaDataContext dbcontext = new YleanaDataContext())
            {
                int idUser = WebSecurity.CurrentUserId;
                var application = dbcontext.StudentApplications.Where(SA => SA.idUser == idUser).FirstOrDefault();
                
                if (application.transcriptUploaded == true)
                {
                    lblUploadedTranscript.Text = "(Transcript Uploaded)";
                }

                if (application.essayUploaded == true)
                {
                    lblUploadedPersonalStatement.Text = "(Personal Statement Uploaded)";
                }

                if (application.ResumeUploaded == true)
                {
                    lblUploadedResume.Text = "(Resume Uploaded)";
                }
            }
        }

    }
}