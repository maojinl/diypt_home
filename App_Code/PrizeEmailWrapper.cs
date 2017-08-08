using System;
using System.Collections.Generic;
using System.Linq;

/// <summary>
/// Summary description for PrizeEmailWrapper
/// </summary>
public class PrizeEmailWrapper
{


    public PrizeEmailWrapper()
    {
        //
        // TODO: Add constructor logic here
        //        
    }

    static public void SendWelcomeEmail(PrizeMember member, string loginName)
    {
        int emailId = PrepareSimpleEmailByType(member, PrizeConstants.EmailType.WelcomeEmail, "Welcome", member.Firstname, loginName);
       // SenEmailById(emailId);
    }

    static public void Prepare1DaysPrior2Week4Email(int memberId)
    {
		using (var db = new DIYPTEntities())
		{
			PrizeMember member = PrizeMemberAuthUtils.GetMemberData(memberId);
			String sEmail = member.Email;
			String sQuestions = PrizeMemberAuthUtils.GetMemberAnswer(member, 0);
			String sDiertary = "";
			if (sQuestions.IndexOf("Vegan") >= 0)
				sDiertary = "Vegan";
			else if (sQuestions.IndexOf("Lactose intolerant") >= 0)
				sDiertary = "Lactose intolerant";
			else
				sDiertary = "";
			MemberEmail myEmail = new MemberEmail();
			myEmail.MemberId = memberId;
			myEmail.EmailType = (int)PrizeConstants.EmailType.OneDaysPrior2Week4;
			myEmail.EmailAddress = sEmail;
			myEmail.Title = "Night before Day 1 of Week 4";
			myEmail.Status = (int)PrizeConstants.EmailStatus.Shceduled;
            PrizeDataAccess dbAccess = new PrizeDataAccess();
            MemberFoodPlanWeek foodPlan = dbAccess.GetMemberFoodPlanWeek(memberId, 0, 0);
			myEmail.Content1 = member.Firstname;
            myEmail.Content2 = foodPlan.Food1;
            myEmail.Content3 = foodPlan.Food2;
            myEmail.Content4 = foodPlan.Food3;
            myEmail.Content5 = foodPlan.Food4;
            myEmail.ScheduleDate = PrizeCommonUtils.GetSystemDate();
            db.MemberEmails.Add(myEmail);
			db.SaveChanges();
			return;
		}
    }

    static public void SendTestEmail(String content)
    {
        return;
    }

    static public int PrepareSimpleEmailByType(PrizeMember member, PrizeConstants.EmailType type, string title, 
        string content1 = null, string content2 = null, string content3 = null, string content4 =null, string content5 = null)
    {
        try
        {
			using (var mydb = new DIYPTEntities())
			{
				MemberEmail myEmail = new MemberEmail();
				myEmail.MemberId = member.UmbracoId;
				myEmail.EmailType = (int)type;
				myEmail.EmailAddress = member.Email;
				myEmail.Title = title;
				myEmail.Status = (int)PrizeConstants.EmailStatus.Shceduled;
                myEmail.Content1 = content1;
                myEmail.Content2 = content2;
                myEmail.Content3 = content3;
                myEmail.Content4 = content4;
                myEmail.Content5 = content5;
                myEmail.ScheduleDate = PrizeCommonUtils.GetSystemDate();
                mydb.MemberEmails.Add(myEmail);
				mydb.SaveChanges();
				return myEmail.EmailId;
			}
        }
        catch (Exception e)
        {
            PrizeLogs.SaveSystemErrorLog(member.UmbracoId, 0, PrizeConstants.SystemErrorLevel.LevelMedium, typeof(PrizeEmailWrapper).ToString(), "Prepare email", e.Message, e.InnerException.Message);
            return 0;
        }
    }

    static public void DailyEmailTask()
    {
		try
		{
			using (var db = new DIYPTEntities())
			{
				string availableStatus;
				IQueryable<MemberExercisePlan> memberPlans;
				db.Database.Connection.Open();
				//send email 2 days prior to Orientation week 
				availableStatus = PrizeConstants.STATUS_PLAN_NOT_STARTED + PrizeConstants.STATUS_PLAN_PAID;
				memberPlans = (from c in db.MemberExercisePlans
							   where c.Status.Equals(availableStatus)
							   orderby c.MemberId
							   select c);
				foreach (var memberPlan in memberPlans)
				{
					DateTime now = PrizeCommonUtils.GetSystemDate();
					//if (now.AddDays(2) < memberPlan.StartDate)
                    if (!PrizeCommonUtils.LessThanDaysAhead(now, memberPlan.StartDate, 2))
						continue;
					MemberExercisePlanWeek memberPlanWeek = (from c in db.MemberExercisePlanWeeks
															 where c.MemberExercisePlanId == memberPlan.Id && c.Week == 0
															 select c).FirstOrDefault();
					if (memberPlanWeek == null)
						continue;
					MemberPlanWeekResult memberPlanWeekResult = (from c in db.MemberPlanWeekResults
																 where c.MemberExercisePlanWeekId == memberPlanWeek.Id
																 select c).FirstOrDefault();
					if (memberPlanWeekResult.Tasks != null && memberPlanWeekResult.Tasks.Length >= 1 && memberPlanWeekResult.Tasks[0] == '0')
					{
                        PrizeMember member = PrizeMemberAuthUtils.GetMemberData(memberPlan.MemberId);
						PrepareSimpleEmailByType(member, PrizeConstants.EmailType.TwoDaysPrior2Start, "2 days prior to Orientation week", member.Firstname);
						char[] arr = memberPlanWeekResult.Tasks.ToArray();
						arr[0] = '1';
						memberPlanWeekResult.Tasks = new string(arr);
					}
				}

				// send email 1 day prior to week 4
				availableStatus = PrizeConstants.STATUS_PLAN_STARTED + PrizeConstants.STATUS_PLAN_PAID;
				var memberPlanWithWeeks = from c in db.MemberExercisePlans
										  join b in db.MemberExercisePlanWeeks on c.Id equals b.MemberExercisePlanId
										  where c.Status.Equals(availableStatus) && b.Week == 4
										  select new
										  {
											  MemberId = c.MemberId,
											  MemberPlanWeekId = b.Id,
											  WeekStartDate = b.StartDate,
										  };

				foreach (var memberPlanWithWeek in memberPlanWithWeeks)
				{
					DateTime now = PrizeCommonUtils.GetSystemDate();
                    //if (now.AddDays(1) < memberPlanWithWeek.WeekStartDate)
                    if (!PrizeCommonUtils.LessThanDaysAhead(now, memberPlanWithWeek.WeekStartDate, 1))
                        continue;

					MemberPlanWeekResult memberPlanWeekResult = (from c in db.MemberPlanWeekResults
																 where c.MemberExercisePlanWeekId == memberPlanWithWeek.MemberPlanWeekId
																 select c).FirstOrDefault();
					if (memberPlanWeekResult.Tasks != null && memberPlanWeekResult.Tasks.Length > 1 && memberPlanWeekResult.Tasks[0] == '0')
					{
						Prepare1DaysPrior2Week4Email(memberPlanWithWeek.MemberId);
						char[] arr = memberPlanWeekResult.Tasks.ToArray();
						arr[0] = '1';
						memberPlanWeekResult.Tasks = new string(arr);
						
					}	
				}

                // send email 1 day prior to week 11
                availableStatus = PrizeConstants.STATUS_PLAN_STARTED + PrizeConstants.STATUS_PLAN_PAID;
                memberPlanWithWeeks = from c in db.MemberExercisePlans
                                          join b in db.MemberExercisePlanWeeks on c.Id equals b.MemberExercisePlanId
                                          where c.Status.Equals(availableStatus) && b.Week == 11
                                          select new
                                          {
                                              MemberId = c.MemberId,
                                              MemberPlanWeekId = b.Id,
                                              WeekStartDate = b.StartDate,
                                          };

                foreach (var memberPlanWithWeek in memberPlanWithWeeks)
                {
                    DateTime now = PrizeCommonUtils.GetSystemDate();
                    //if (now.AddDays(1) < memberPlanWithWeek.WeekStartDate)
                    if (!PrizeCommonUtils.LessThanDaysAhead(now, memberPlanWithWeek.WeekStartDate, 1))
                        continue;

                    MemberPlanWeekResult memberPlanWeekResult = (from c in db.MemberPlanWeekResults
                                                                 where c.MemberExercisePlanWeekId == memberPlanWithWeek.MemberPlanWeekId
                                                                 select c).FirstOrDefault();
                    if (memberPlanWeekResult.Tasks != null && memberPlanWeekResult.Tasks.Length > 1 && memberPlanWeekResult.Tasks[0] == '0')
                    {
                        PrizeMember member = PrizeMemberAuthUtils.GetMemberData(memberPlanWithWeek.MemberId);
                        PrepareSimpleEmailByType(member, PrizeConstants.EmailType.OneDaysPrior2Week11, "Night before Day 1 of Week 11", member.Firstname);
                        char[] arr = memberPlanWeekResult.Tasks.ToArray();
                        arr[0] = '1';
                        memberPlanWeekResult.Tasks = new string(arr);

                    }
                }
                db.SaveChanges();
				return;
			}
		}
		catch (Exception e)
		{
			PrizeLogs.SaveSystemErrorLog(0, 0, PrizeConstants.SystemErrorLevel.LevelSerious, typeof(PrizeEmailWrapper).ToString(), "DailyEmailTask", e.Message, e.InnerException.Message);
		}
    }

    static public void EmailPresetTask()
    {
        try
        {
            using (var db = new DIYPTEntities())
            {
                DateTime now = PrizeCommonUtils.GetSystemDate();
                DateTime end = now.AddDays(10);
                IList<PrizePresetTask> tasks = (from c in db.PrizePresetTasks
                    where c.TaskDate >= now && c.TaskDate <= end &&
                    (c.PresetTaskType == (int)PrizeConstants.PresetTasksType.YearlyEmailNewYear 
                    || c.PresetTaskType == (int)PrizeConstants.PresetTasksType.YearlyEmailEaster 
                    || c.PresetTaskType == (int)PrizeConstants.PresetTasksType.YearlyEmailChristmas)
                    && c.Status.Equals("1")
                    select c).ToList();
                IList<PrizeMember> membersList = null;

                foreach (PrizePresetTask task in tasks)
                {
                    if (PrizeCommonUtils.LessThanDaysAhead(now, task.TaskDate, 1))
                    {
                        if (task.PresetTaskType == (int)PrizeConstants.PresetTasksType.YearlyEmailNewYear)
                        {
                            if (membersList == null)
                            {
                                membersList = (from a in db.PrizeMembers
                                               join b in db.cmsMembers on a.UmbracoId equals b.nodeId
                                               orderby a.UmbracoId
                                               select a
                                ).ToList();
                            }
                            foreach (PrizeMember member in membersList)
                            {
                                PrepareSimpleEmailByType(member, PrizeConstants.EmailType.NewYearEmail, "Happy New Year", member.Firstname);
                            }
                            task.Status = "2";
                            task.Count++;
                        }
                        else if (task.PresetTaskType == (int)PrizeConstants.PresetTasksType.YearlyEmailEaster)
                        {
                            if (membersList == null)
                            {
                                membersList = (from a in db.PrizeMembers
                                               join b in db.cmsMembers on a.UmbracoId equals b.nodeId
                                               orderby a.UmbracoId
                                               select a
                                ).ToList();
                            }
                            foreach (PrizeMember member in membersList)
                            {
                                PrepareSimpleEmailByType(member, PrizeConstants.EmailType.EasterEmail, "Happy Easter", member.Firstname);
                            }
                            task.Status = "2";
                            task.Count++;
                        }
                        else if (task.PresetTaskType == (int)PrizeConstants.PresetTasksType.YearlyEmailChristmas)
                        {
                            if (membersList == null)
                            {
                                membersList = (from a in db.PrizeMembers
                                               join b in db.cmsMembers on a.UmbracoId equals b.nodeId
                                               orderby a.UmbracoId
                                               select a
                                ).ToList();
                            }
                            foreach (PrizeMember member in membersList)
                            {
                                PrepareSimpleEmailByType(member, PrizeConstants.EmailType.ChristmasEmail, "Merry Christmas", member.Firstname);
                            }
                            task.Status = "2";
                            task.Count++;
                        }
                    }  
                }
                db.SaveChanges();
            }
        }
        catch (Exception e)
        {
            PrizeLogs.SaveSystemErrorLog(0, 0, PrizeConstants.SystemErrorLevel.LevelSerious, typeof(PrizeEmailWrapper).ToString(), "EmailPresetTask", e.Message, e.InnerException.Message);
            return;
        }
    }


    static public int SendMemberConintuousLoginEmail(PrizeMember member)
    {
        int emailId = PrepareSimpleEmailByType(member, PrizeConstants.EmailType.ContinuousLogin, "After logging on consistently for 21 days", member.Firstname);
        return emailId;
    }


}