using System;
using System.Configuration;
using System.Net.Mail;
using yleana.Data;

namespace yleana.Helper
{
    public class Helper
    {
             
        public static void SendEmail(string emailTo, string subject, string fromEmailAddress, string fromEmailName, string body, string mailCC = "")
        {
            if (string.IsNullOrWhiteSpace(emailTo) || string.IsNullOrWhiteSpace(subject) || string.IsNullOrWhiteSpace(body))
            {
                throw new ArgumentNullException("SendEmail - Invalid Input Parameters");
            }

            SmtpClient client = new SmtpClient();
            client.Host = Convert.ToString(ConfigurationManager.AppSettings["SmtpClient"]);
            client.UseDefaultCredentials = true;

            MailMessage msg = new MailMessage();
            msg.From = new MailAddress(fromEmailAddress, fromEmailName);
            msg.To.Add(new MailAddress(emailTo));
            if (!string.IsNullOrEmpty(mailCC))
            {
                msg.CC.Add(new MailAddress(mailCC));
            }

            msg.Subject = subject;
            msg.IsBodyHtml = true;
            msg.Body = body;            

            client.Send(msg);
        }

        public static string FormatEmailBody(string emailbody, int UserID, int ClientID, string status)
        {
            System.Text.StringBuilder sbEmailBody = new System.Text.StringBuilder(emailbody);

            using (YleanaDataContext context1 = new YleanaDataContext())
            {
                //var userProfileEntity = context1.UserProfiles.FirstOrDefault(u => u.idUser == UserID);
                //var client = context1.ClientUsers.Where(c => c.idClient == ClientID && c.isAccountOwner == true).FirstOrDefault();
                //if (userProfileEntity != null)
                //{
                //    sbEmailBody.Replace("#firstname#", userProfileEntity.FirstName);
                //    sbEmailBody.Replace("#lastname#", userProfileEntity.LastName);
                //    sbEmailBody.Replace("#email#", userProfileEntity.EmailAddress);
                //    sbEmailBody.Replace("#date#", userProfileEntity.DtCreated.ToShortDateString());
                //    sbEmailBody.Replace("#status#", status);
                //    sbEmailBody.Replace("#AccountOwner#", client.UserProfile.FirstName + " " + client.UserProfile.LastName);
                //    sbEmailBody.Replace("#ClientName#", client.Client.ClientName);
                //}
            }
            return sbEmailBody.ToString();
        }
    }    
}