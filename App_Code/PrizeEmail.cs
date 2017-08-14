using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net.Mail;
using System.Text;
using umbraco.presentation.nodeFactory;


/// <summary>
/// Summary description for PrizeEmail
/// </summary>
public static class PrizeEmail
{
    static public void SendBlogComment(string blog, string user, string comment)
    {
        SmtpClient client = new SmtpClient();
       // client.Port = 587;
        //client.Host = "smtp.gmail.com";
        //client.EnableSsl = true;
        client.Timeout = 10000;
        //client.DeliveryMethod = SmtpDeliveryMethod.Network;
        //client.UseDefaultCredentials = false;
        //client.Credentials = new System.Net.NetworkCredential("user@gmail.com", "password");

        MailMessage mm = new MailMessage("thuyen.vu@gmail.com", "thuyen.vu@gmail.com");
        mm.Subject = "New comment by " + user;
        mm.Body = "A comment was made by " + user + " in " + blog + @". Please log in and approve.

Comment:
" + comment;
        mm.BodyEncoding = UTF8Encoding.UTF8;
        //mm.DeliveryNotificationOptions = DeliveryNotificationOptions.OnFailure;

        client.Send(mm);
    }

    static public void SendPasswordReminder(string email, string password)
    {
        SmtpClient client = new SmtpClient();
        // client.Port = 587;
        //client.Host = "smtp.gmail.com";
        //client.EnableSsl = true;
        client.Timeout = 10000;
        //client.DeliveryMethod = SmtpDeliveryMethod.Network;
        //client.UseDefaultCredentials = false;
        //client.Credentials = new System.Net.NetworkCredential("user@gmail.com", "password");

        MailMessage mm = new MailMessage("no-reply@diypt.com", email);
        mm.Subject = "DIYPT password reset";
        mm.Body = "Your new password is: " + password;
        mm.BodyEncoding = UTF8Encoding.UTF8;
        //mm.DeliveryNotificationOptions = DeliveryNotificationOptions.OnFailure;

        client.Send(mm);
    }

	static public void SendEmailByType(string email, PrizeConstants.EmailType emailType, string emailSubject, List<string> additionalContents)
	{
		int nodeId = 0;
        int templateNodeId = 5332;

		if (emailType == PrizeConstants.EmailType.WelcomeEmail)
			nodeId = 5333;
		else if (emailType == PrizeConstants.EmailType.TwoDaysPrior2Start)
			nodeId = 6671;
		else if (emailType == PrizeConstants.EmailType.OneDaysPrior2Week4)
			nodeId = 5377;
        else if (emailType == PrizeConstants.EmailType.OneDaysPrior2Week11)
            nodeId = 9676;
        else if (emailType == PrizeConstants.EmailType.ContinuousLogin)
            nodeId = 6672;
        else if (emailType == PrizeConstants.EmailType.NewYearEmail)
            nodeId = 6681;
        else if (emailType == PrizeConstants.EmailType.EasterEmail)
            nodeId = 6680;
        else if (emailType == PrizeConstants.EmailType.ChristmasEmail)
            nodeId = 5385;
		else if (emailType == PrizeConstants.EmailType.BirthdayEmail)
			nodeId = 5380;
		else if (emailType == PrizeConstants.EmailType.FirstMonthEmail)
			nodeId = 6673;
		else if (emailType == PrizeConstants.EmailType.SecondMonthEmail)
			nodeId = 6674;
		else if (emailType == PrizeConstants.EmailType.ThirdMonthEmail)
			nodeId = 6675;
        else if (emailType == PrizeConstants.EmailType.TwoDaysPrior2End)
            nodeId = 6678;
        else if (emailType == PrizeConstants.EmailType.OneDayPrior2TrialEnd)
            nodeId = 6679;
        else if (emailType == PrizeConstants.EmailType.MileStoneWeek2)
            nodeId = 5379;
        else if (emailType == PrizeConstants.EmailType.MileStoneWeek6)
            nodeId = 5381;
        else if (emailType == PrizeConstants.EmailType.MileStoneWeek10)
            nodeId = 5382;
        else if (emailType == PrizeConstants.EmailType.MileStoneWeek12)
            nodeId = 5384;
        else if (emailType == PrizeConstants.EmailType.MileStoneEndWeek12)
            nodeId = 6683;
        else if (emailType == PrizeConstants.EmailType.MileStoneGoalWeek13)
            nodeId = 9675;

        if (templateNodeId == 5332)
            return;

        var node = new Node(nodeId);
		var templateNode = new Node(templateNodeId);
		string header = templateNode.GetProperty("templateheader").Value;
		string footer = templateNode.GetProperty("templateFooter").Value;
		string body = node.GetProperty("bodyContent").Value;
		string subject = emailSubject;

        if (additionalContents.Count > 0)
            body = body.Replace("[name]", additionalContents[0]);

        if (emailType == PrizeConstants.EmailType.WelcomeEmail)
            body = body.Replace("[username]", additionalContents[1]);

        if (emailType == PrizeConstants.EmailType.OneDaysPrior2Week4)
        {
            body = body.Replace("[protein]", additionalContents[2]);
            body = body.Replace("[carb]", additionalContents[3]);
            body = body.Replace("[fat]", additionalContents[4]);
        }

        PrizeEmail.SendEmail(email, subject, (header + body + footer).Replace("/images/", "http://web106.sand.studiocoast.com.au/images/"));
	}

	static public void SendEmail(string email, string subject, string content)
	{
		SmtpClient client = new SmtpClient();

		client.Timeout = 10000;
		MailMessage mm = new MailMessage("no-reply@diypt.com", email);
		mm.Subject = subject;
		mm.Body = content;
		mm.BodyEncoding = UTF8Encoding.UTF8;
		mm.IsBodyHtml = true;

		client.Send(mm);
	}

	static public void SendTestEmail(string content)
    {
        SmtpClient client = new SmtpClient();
        // client.Port = 587;
        //client.Host = "smtp.gmail.com";
        //client.EnableSsl = true;
        client.Timeout = 10000;
        //client.DeliveryMethod = SmtpDeliveryMethod.Network;
        //client.UseDefaultCredentials = false;
        //client.Credentials = new System.Net.NetworkCredential("user@gmail.com", "password");

        MailMessage mm = new MailMessage("no-reply@diypt.com", "thuyen.vu@ctc.usyd.edu.au");
        mm.Subject = "Test email";
        mm.Body = content;
        mm.BodyEncoding = UTF8Encoding.UTF8;
        mm.IsBodyHtml = true;
        //mm.DeliveryNotificationOptions = DeliveryNotificationOptions.OnFailure;

        client.Send(mm);
    }

    static public void SendContactEmail(string content)
    {
        SmtpClient client = new SmtpClient();
        // client.Port = 587;
        //client.Host = "smtp.gmail.com";
        //client.EnableSsl = true;
        client.Timeout = 10000;
        //client.DeliveryMethod = SmtpDeliveryMethod.Network;
        //client.UseDefaultCredentials = false;
        //client.Credentials = new System.Net.NetworkCredential("user@gmail.com", "password");

        MailMessage mm = new MailMessage("no-reply@diypt.com.au", "thuyen.vu@gmail.com");
        //mm.To.Add("jrguico@yahoo.com.au");
        //mm.To.Add("");
        mm.Subject = "Contact us";
        mm.Body = content;
        mm.BodyEncoding = UTF8Encoding.UTF8;
        mm.IsBodyHtml = true;
        //mm.DeliveryNotificationOptions = DeliveryNotificationOptions.OnFailure;

        client.Send(mm);
    }
}