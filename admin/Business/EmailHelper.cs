using System;
using System.Configuration;
using System.Net.Mail;
using System.Linq;

namespace YleanaAdmin.Business
{
	public class EmailHelper
	{
		public static void SendEmail(string emailAddress, string subject, string fromEmailAddress, string fromEmailName, string body, string attachment1, string attachment2, string attachment3)
		{
			if (string.IsNullOrWhiteSpace(emailAddress) || string.IsNullOrWhiteSpace(subject) || string.IsNullOrWhiteSpace(body))
			{
				throw new ArgumentNullException("SendEmail - Invalid Input Parameters");
			}

			SmtpClient client = new SmtpClient();
			client.Host = Convert.ToString(ConfigurationManager.AppSettings["SmtpClient"]);
			client.UseDefaultCredentials = true;

			MailMessage msg = new MailMessage();
			msg.From = new MailAddress(fromEmailAddress, fromEmailName);
			msg.To.Add(new MailAddress(emailAddress));

			msg.Subject = subject;
			msg.IsBodyHtml = true;
			msg.Body = body;

			if (!string.IsNullOrEmpty(attachment1))
			{
				msg.Attachments.Add(new Attachment(attachment1));
			}

			if (!string.IsNullOrEmpty(attachment2))
			{
				msg.Attachments.Add(new Attachment(attachment2));
			}

			if (!string.IsNullOrEmpty(attachment3))
			{
				msg.Attachments.Add(new Attachment(attachment3));
			}

			client.Send(msg);
		}
	}
}