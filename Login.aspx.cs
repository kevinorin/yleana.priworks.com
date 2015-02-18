using System;
using System.Linq;
using System.Web.Security;
using Twilio;
using WebMatrix.WebData;
using yleana.Data;

namespace yleana
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((WebSecurity.IsAuthenticated) || (Roles.IsUserInRole("StudentRole")))
            {
                // Make Entry in the action tracking table
                Helper.BusinessHelper business = new Helper.BusinessHelper();
                business.InsertToActionTracking("LoggedIn");

                Response.Redirect("~/registration1.aspx");
            }

            using (YleanaDataContext dbcontext = new YleanaDataContext())
            {
                var appdates = dbcontext.ApplicationDates.Where(A => A.DateTitle == "ApplicationOpen" && A.AppYear == DateTime.Today.Year).FirstOrDefault();
                var appdeadline = dbcontext.ApplicationDates.Where(A => A.DateTitle == "FinalDeadline" && A.AppYear == DateTime.Today.Year).FirstOrDefault();
                //if (appdates != null)
				//{
				//   if (appdates.StartDate > DateTime.Today)
				//	{
				//		Response.Redirect("~/Home.aspx?msg=OpenError");
				//	}
				//   else if (appdeadline.StartDate < DateTime.Today)
				//	{
				//		Response.Redirect("~/Home.aspx?msg=CloseError");
				//	}
                //}
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (WebSecurity.Login(txtUserId.Text.Trim(), txtPassword.Text.Trim(), false))
            {
                int UserID = WebSecurity.GetUserId(txtUserId.Text.Trim());

                using (YleanaDataContext dbcontext = new YleanaDataContext())
                {
                    var userProfile = dbcontext.UserProfiles.Where(U => U.idUser == UserID).FirstOrDefault();
                    userProfile.dtLastLogin = DateTime.Now;
                    dbcontext.SubmitChanges();
                }
                
                Response.Redirect("~/login.aspx");
            }
            else
            {
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = "Invalid User ID or Password";
            }
        }
       
    }
}