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
public class RegisteredEvents: ApplicationEventHandler
{
    public RegisteredEvents()
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
            DailyTasks();
        }
        finally
        {
            myTimer.Enabled = true;
        }
    }

    private static void DailyTasks()
    {
        DIYPTEntities db = new DIYPTEntities();
        try
        {

            db.Database.Connection.Open();
            DateTime today = PrizeCommonUtils.GetDayStart(PrizeCommonUtils.GetSystemDate());

            PrizePollingTask task = (from c in db.PrizePollingTasks
                 where c.TaskDate >= today && c.TaskType == (int)PrizeConstants.TasksType.DailyRedoAble
                 select c).FirstOrDefault();
            
            if (task == null || task.Count < 20)
            {
                PrizeMemberPlanManager.UpdateMemberPlans();                    

                PrizeEmailWrapper.DailyEmailTask();

                if (task == null)
                {
                    task = new PrizePollingTask();
                    task.Status = "1";
                    task.TaskDate = PrizeCommonUtils.GetSystemDate();
                    task.TaskType = (int)PrizeConstants.TasksType.DailyRedoAble;
                    task.Count = 1;
                    db.PrizePollingTasks.Add(task);
                }
                else
                    task.Count++;
                
                db.SaveChanges();
            }
        }
        catch (Exception e)
        {
            PrizeLogs.SaveSystemErrorLog(0, 0, PrizeConstants.SystemErrorLevel.LevelSerious, typeof(RegisteredEvents).ToString(), "DailyTasks", e.Message, e.InnerException.Message);
            return;
        }
        finally
        {
            db.Database.Connection.Close();
        }
    }


}