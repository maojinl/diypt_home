using Umbraco.Core;
using System;
using System.Web;
using System.IO;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Data.Common;

/// <summary>
/// Summary description for RegisterEvents
/// </summary>
public class PrizeEmailServiceThread : ApplicationEventHandler
{
    public PrizeEmailServiceThread()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    protected override void ApplicationStarted(UmbracoApplicationBase umbracoApplication, ApplicationContext applicationContext)
    {
        System.Timers.Timer myTimer = new System.Timers.Timer(60000);
        myTimer.Elapsed += new System.Timers.ElapsedEventHandler(OnTimedEvent);
        myTimer.Interval = 60000;
        myTimer.Enabled = true;
    }

    private static void OnTimedEvent(object source, System.Timers.ElapsedEventArgs e)
    {
        /* ------------------Write log file------------------
        string logFile = AppDomain.CurrentDomain.BaseDirectory +"App_Data\\TimeEvent.txt";
        StreamWriter sw = new StreamWriter(logFile, true);
        sw.WriteLine("new time even {0} **********", PrizeCommonUtils.GetSystemDate());
        sw.Flush();
        sw.Close();
        */
        System.Timers.Timer myTimer = (System.Timers.Timer)source;
        try
        {
            myTimer.Enabled = false;
            DoSendShceduledEmail();
        }
        finally
        {
            myTimer.Enabled = true;
        }
    }

    private static void DoSendShceduledEmail()
    {
        DIYPTEntities db = new DIYPTEntities();
        try
        {

            db.Database.Connection.Open();
            IQueryable<MemberEmail> emails = (from c in db.MemberEmails
                                              where c.Status == (int)PrizeConstants.EmailStatus.Shceduled
                                              select c);
            bool bSent = false;
            foreach (MemberEmail email in emails.ToList())
            {
                string sError;
                List<string> additionalContents = new List<string>();
                additionalContents.Add(email.Content1);
                additionalContents.Add(email.Content2);
                additionalContents.Add(email.Content3);
                additionalContents.Add(email.Content4);
                additionalContents.Add(email.Content5);
                bSent = PrizeEmailServiceThread.SendEmailHandler(out sError, email.EmailAddress, (PrizeConstants.EmailType)email.EmailType, email.Title, additionalContents);

                if (bSent)
                {
                    email.Status = (int)PrizeConstants.EmailStatus.Succeeded;
                    email.SendDate = PrizeCommonUtils.GetSystemDate();
                    db.SaveChanges();
                }
                else
                {
                    PrizeLogs.SaveSystemErrorLog(email.MemberId, 0, PrizeConstants.SystemErrorLevel.LevelNormal, "Email thread", "Sending email",  sError, "");
                    email.SendDate = PrizeCommonUtils.GetSystemDate();
                    email.Status = (int)PrizeConstants.EmailStatus.Failed;
                    db.SaveChanges();
                }
            }
        }
        finally
        {
            db.Database.Connection.Close();
        }
    }

    static public bool SendEmailHandler(out string sErrorMessage, string email, PrizeConstants.EmailType emailType, string emailSubject, List<string> additionalContents)
    {
        try
        {
            PrizeEmail.SendEmailByType(email, emailType, emailSubject, additionalContents);
            sErrorMessage = "";
            return true;
        }
        catch (Exception e)
        {
            sErrorMessage = e.Message + " " + e.InnerException.Message;
            return false;
        }
    }

}