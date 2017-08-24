using System;
using System.Collections.Generic;
using System.Linq;
using System.Diagnostics;

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
			String sQuestions = PrizeMemberAuthUtils.GetMemberAnswer(member, "dietary requirements");

            String sDiertary = "";
			PrizeConstants.EmailType emailType = PrizeConstants.EmailType.OneDaysPrior2Week4Normal;
			if (sQuestions.IndexOf("Vegan") >= 0)
			{
				sDiertary = "Vegan";
				emailType = PrizeConstants.EmailType.OneDaysPrior2Week4Vegan;
			}
			else if (sQuestions.IndexOf("Lactose intolerant") >= 0)
			{
				sDiertary = "Lactose intolerant";
				emailType = PrizeConstants.EmailType.OneDaysPrior2Week4Lactose;
			}
			else
				sDiertary = "";
			MemberEmail myEmail = new MemberEmail();
			myEmail.MemberId = memberId;
			myEmail.EmailType = (int)emailType;
			myEmail.EmailAddress = sEmail;
			myEmail.Title = "Night before Day 1 of Week 4";
			myEmail.Status = (int)PrizeConstants.EmailStatus.Shceduled;
            myEmail.Content1 = member.Firstname;
            PrizeDataAccess dbAccess = new PrizeDataAccess();
            MemberFoodPlanWeek foodPlan = dbAccess.GetMemberFoodPlanWeek(memberId, 0, 0);
            if (foodPlan != null)
            {
                myEmail.Content2 = foodPlan.Food1;
                myEmail.Content3 = foodPlan.Food2;
                myEmail.Content4 = foodPlan.Food3;
                myEmail.Content5 = foodPlan.Food4;
            }
            else
            {
                myEmail.Content2 = "";
                myEmail.Content3 = "";
                myEmail.Content4 = "";
                myEmail.Content5 = "";
            }
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
            PrizeLogs.SaveSystemErrorLog(member.UmbracoId, 0, PrizeConstants.SystemErrorLevel.LevelMedium, typeof(PrizeEmailWrapper).ToString(), "Prepare email", e.Message, e.InnerException == null ? "" : e.InnerException.Message);
            return 0;
        }
    }

	static public void DailyEmailTask()
	{
		ExercisePlanEmailTask();
        MemberEmailTask();
        EmailPresetTask();
	}

	static protected void MemberEmailTask()
	{
		try
		{
			IList<PrizeMember> membersList = null;
			DateTime now = PrizeCommonUtils.GetSystemDate();
			DateTime yearStart = PrizeCommonUtils.GetYearStart(now);
            DateTime dtSendEmailBegin = now.AddDays(-10);

            DateTime dtBegin = now.AddDays(1);
            DateTime dtEnd = now.AddDays(2);

            using (var db = new DIYPTEntities())
			{
				//send birthday email
				membersList = (from a in db.PrizeMembers
							   join b in db.cmsMembers on a.UmbracoId equals b.nodeId
							   where a.DoB.HasValue //&& PrizeCommonUtils.LessThanDaysAhead(now, a.DoB.Value, 1) 
                               && !(from c in db.MemberEmails where c.EmailType == (int)PrizeConstants.EmailType.BirthdayEmail 
								   && c.ScheduleDate > yearStart select c.MemberId).Contains(a.UmbracoId)
							   orderby a.UmbracoId
							   select a).ToList();

                DateTime dtBirthday;
				foreach (PrizeMember member in membersList)
				{
                    if (!member.DoB.HasValue)
                        continue;
                    dtBirthday = PrizeCommonUtils.GetThisYearDate(member.DoB.Value);
                    if (PrizeCommonUtils.LessThanDaysAhead(now, dtBirthday, 1))
                        PrepareSimpleEmailByType(member, PrizeConstants.EmailType.BirthdayEmail, "Happy Birthday", member.Firstname);
				}

                //send first month email
                dtBegin = now.AddDays(29);
                dtEnd = now.AddDays(30);
                membersList = (from a in db.PrizeMembers
							   join b in db.cmsMembers on a.UmbracoId equals b.nodeId
							   where a.RegisterDateTime.HasValue && dtBegin <= a.RegisterDateTime.Value && dtEnd >= a.RegisterDateTime.Value //&& PrizeCommonUtils.LessThanDaysAhead(a.RegisterDateTime.Value, now, 30)
                               && !(from c in db.MemberEmails
									where c.EmailType == (int)PrizeConstants.EmailType.BirthdayEmail && c.ScheduleDate > dtSendEmailBegin
                                    select c.MemberId).Contains(a.UmbracoId)
							   orderby a.UmbracoId
							   select a).ToList();

				foreach (PrizeMember member in membersList)
				{
					PrepareSimpleEmailByType(member, PrizeConstants.EmailType.FirstMonthEmail, "Anniversary 1 month", member.Firstname);
				}

                //send second month email
                dtBegin = now.AddDays(59);
                dtEnd = now.AddDays(60);
                membersList = (from a in db.PrizeMembers
							   join b in db.cmsMembers on a.UmbracoId equals b.nodeId
							   where a.RegisterDateTime.HasValue && dtBegin <= a.RegisterDateTime.Value && dtEnd >= a.RegisterDateTime.Value //&& PrizeCommonUtils.LessThanDaysAhead(a.RegisterDateTime.Value, now,  60)
                               && !(from c in db.MemberEmails
									where c.EmailType == (int)PrizeConstants.EmailType.BirthdayEmail && c.ScheduleDate > dtSendEmailBegin
                                    select c.MemberId).Contains(a.UmbracoId)
							   orderby a.UmbracoId
							   select a).ToList();

				foreach (PrizeMember member in membersList)
				{
					PrepareSimpleEmailByType(member, PrizeConstants.EmailType.SecondMonthEmail, "Anniversary 2 month", member.Firstname);
				}

                //send third month email
                dtBegin = now.AddDays(89);
                dtEnd = now.AddDays(90);
                membersList = (from a in db.PrizeMembers
							   join b in db.cmsMembers on a.UmbracoId equals b.nodeId
							   where a.RegisterDateTime.HasValue && dtBegin <= a.RegisterDateTime.Value && dtEnd >= a.RegisterDateTime.Value //&& PrizeCommonUtils.LessThanDaysAhead(a.RegisterDateTime.Value, now, 90)
                               && !(from c in db.MemberEmails
									where c.EmailType == (int)PrizeConstants.EmailType.BirthdayEmail && c.ScheduleDate > dtSendEmailBegin
                                    select c.MemberId).Contains(a.UmbracoId)
							   orderby a.UmbracoId
							   select a).ToList();

				foreach (PrizeMember member in membersList)
				{
					PrepareSimpleEmailByType(member, PrizeConstants.EmailType.ThirdMonthEmail, "Anniversary 3 month", member.Firstname);
				}
			}
		}
		catch (Exception e)
		{
			PrizeLogs.SaveSystemErrorLog(0, 0, PrizeConstants.SystemErrorLevel.LevelSerious, typeof(PrizeEmailWrapper).ToString(), "DailyEmailTask", e.Message, e.InnerException == null ? "" : e.InnerException.Message);
        }
	}

	static protected void ExercisePlanEmailTask()
    {
        string availableStatus;
        List<MemberExercisePlan> memberPlans;
        availableStatus = PrizeConstants.STATUS_PLAN_NOT_STARTED + PrizeConstants.STATUS_PLAN_PAID;
        DateTime now = PrizeCommonUtils.GetSystemDate();
        DateTime dtBegin = now.AddDays(1);
        DateTime dtEnd = now.AddDays(2);
        DateTime dtSendEmailBegin = now.AddDays(-10);

        try
        {
            //send email 2 days prior to Orientation week 
            using (var db = new DIYPTEntities())
            {
                db.Database.Connection.Open();
                memberPlans = (from c in db.MemberExercisePlans
                               where c.Status.Equals(availableStatus) && dtBegin <= c.StartDate && dtEnd >= c.StartDate  //PrizeCommonUtils.LessThanDaysAhead(now, c.StartDate, 2)
                               orderby c.MemberId
                               select c).ToList();

                foreach (var memberPlan in memberPlans)
                {
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
                        db.SaveChanges();
                    }
                }
            }
        }
        catch (Exception ex)
        {
            PrizeLogs.SaveSystemErrorLog(0, 0, PrizeConstants.SystemErrorLevel.LevelSerious, typeof(PrizeEmailWrapper).ToString(), 
                "DailyEmailTask 2 days prior to Orientation week", ex);
        }

        try
        {
            using (var db = new DIYPTEntities())
            {
                // send email 1 day prior to week 4
                availableStatus = PrizeConstants.STATUS_PLAN_STARTED + PrizeConstants.STATUS_PLAN_PAID;
                dtBegin = now.AddDays(0);
                dtEnd = now.AddDays(1);
                var memberPlanWithWeeks = from c in db.MemberExercisePlans
                                          join b in db.MemberExercisePlanWeeks on c.Id equals b.MemberExercisePlanId
                                          where c.Status.Equals(availableStatus) && b.Week == 4 && dtBegin <= b.StartDate && dtEnd >= b.StartDate //&& PrizeCommonUtils.LessThanDaysAhead(now, b.StartDate, 1)
                                          select new
                                          {
                                              MemberId = c.MemberId,
                                              MemberPlanWeekId = b.Id,
                                              WeekStartDate = b.StartDate,
                                              MemberExercisePlanId = c.Id,
                                          };

                foreach (var memberPlanWithWeek in memberPlanWithWeeks)
                {
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
            }
        }
        catch (Exception ex)
        {
            PrizeLogs.SaveSystemErrorLog(0, 0, PrizeConstants.SystemErrorLevel.LevelSerious, typeof(PrizeEmailWrapper).ToString(),
                "DailyEmailTask 1 day prior to week 4", ex);
        }

        try
        {
            using (var db = new DIYPTEntities())
            {
                // send email 1 day prior to week 11
                availableStatus = PrizeConstants.STATUS_PLAN_STARTED + PrizeConstants.STATUS_PLAN_PAID;
                dtBegin = now.AddDays(0);
                dtEnd = now.AddDays(1);
                var memberPlanWithWeeks = from c in db.MemberExercisePlans
									  join b in db.MemberExercisePlanWeeks on c.Id equals b.MemberExercisePlanId
									  where c.Status.Equals(availableStatus) && b.Week == 11 && dtBegin <= b.StartDate && dtEnd >= b.StartDate //&& PrizeCommonUtils.LessThanDaysAhead(now, b.StartDate, 1)
                                      select new
									  {
										  MemberId = c.MemberId,
										  MemberPlanWeekId = b.Id,
										  WeekStartDate = b.StartDate,
										  MemberExercisePlanId = c.Id,
									  };

                foreach (var memberPlanWithWeek in memberPlanWithWeeks)
                {
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
            }
        }
        catch (Exception ex)
        {
            PrizeLogs.SaveSystemErrorLog(0, 0, PrizeConstants.SystemErrorLevel.LevelSerious, typeof(PrizeEmailWrapper).ToString(),
                "DailyEmailTask 1 day prior to week 11", ex);
        }

        try
        {
            using (var db = new DIYPTEntities())
            {
                //send email Expiring in 2 days
                availableStatus = PrizeConstants.STATUS_PLAN_STARTED + PrizeConstants.STATUS_PLAN_PAID;
                dtBegin = now.AddDays(1);
                dtEnd = now.AddDays(2);
                memberPlans = (from c in db.MemberExercisePlans
							   where c.Status.Equals(availableStatus) && c.EndDate.HasValue && dtBegin <= c.EndDate.Value && dtEnd >= c.EndDate.Value //&& PrizeCommonUtils.LessThanDaysAhead(now, c.EndDate.Value, 2)
                               && !(from d in db.MemberEmails
								  where d.EmailType == (int)PrizeConstants.EmailType.BirthdayEmail && d.ScheduleDate > dtSendEmailBegin
                                    select d.MemberId).Contains(c.MemberId)
							   orderby c.MemberId
							   select c).ToList();

				foreach (var memberPlan in memberPlans)
				{
					PrizeMember member = PrizeMemberAuthUtils.GetMemberData(memberPlan.MemberId);
					PrepareSimpleEmailByType(member, PrizeConstants.EmailType.TwoDaysPrior2End, "Expiring in 2 days", member.Firstname);
				}
            }
        }
        catch (Exception ex)
        {
            PrizeLogs.SaveSystemErrorLog(0, 0, PrizeConstants.SystemErrorLevel.LevelSerious, typeof(PrizeEmailWrapper).ToString(),
                "DailyEmailTask Expiring in 2 days", ex);
        }

        try
        {
            using (var db = new DIYPTEntities())
            {
                // send email 1 day prior to end of trial plan
                availableStatus = PrizeConstants.STATUS_PLAN_STARTED + PrizeConstants.STATUS_PLAN_PAID;
                dtBegin = now.AddDays(1);
                dtEnd = now.AddDays(2);
                memberPlans = (from c in db.MemberExercisePlans
								join e in db.PrizeExercisePlans on c.ExercisePlanId equals e.Id
								where c.Status.Equals(availableStatus) && c.EndDate.HasValue && dtBegin <= c.EndDate.Value && dtEnd >= c.EndDate.Value //&& PrizeCommonUtils.LessThanDaysAhead(now, c.EndDate.Value, 2)
                                && !(from d in db.MemberEmails
									where d.EmailType == (int)PrizeConstants.EmailType.BirthdayEmail && d.ScheduleDate > dtSendEmailBegin
                                     select d.MemberId).Contains(c.MemberId)
								&& e.IsTrialPlan == 1
								orderby c.MemberId
								select c).ToList();

				foreach (var memberPlan in memberPlans)
				{
					PrizeMember member = PrizeMemberAuthUtils.GetMemberData(memberPlan.MemberId);
					PrepareSimpleEmailByType(member, PrizeConstants.EmailType.OneDayPrior2TrialEnd, "1 day before trial period ends", member.Firstname);
				}
            }
        }
        catch (Exception ex)
        {
            PrizeLogs.SaveSystemErrorLog(0, 0, PrizeConstants.SystemErrorLevel.LevelSerious, typeof(PrizeEmailWrapper).ToString(),
                "DailyEmailTask 1 day prior to end of trial plan", ex);
        }

        try
        {
            using (var db = new DIYPTEntities())
            {
                // send email COMPLETED STAGES - After week x
                for (int i = 0; i < 5; i++)
				{
					int weekNum = 3;
					PrizeConstants.EmailType emailType = PrizeConstants.EmailType.MileStoneWeek2;
					switch (i)
					{
						case 1:
							weekNum = 7;
							emailType = PrizeConstants.EmailType.MileStoneWeek6;
							break;
						case 2:
							weekNum = 11;
							emailType = PrizeConstants.EmailType.MileStoneWeek10;
							break;
						case 3:
							weekNum = 12;
							emailType = PrizeConstants.EmailType.MileStoneWeek12;
							break;
						case 4:
							weekNum = 13;
							emailType = PrizeConstants.EmailType.MileStoneGoalWeek13;
							break;
						default:
							break;
					}
					availableStatus = PrizeConstants.STATUS_PLAN_STARTED + PrizeConstants.STATUS_PLAN_PAID;
                    dtBegin = now.AddDays(0);
                    dtEnd = now.AddDays(-1);
                    var memberPlanWithWeeks = from c in db.MemberExercisePlans
										  join b in db.MemberExercisePlanWeeks on c.Id equals b.MemberExercisePlanId
										  where c.Status.Equals(availableStatus) && b.Week == weekNum && dtBegin <= b.StartDate && dtEnd >= b.StartDate //&& PrizeCommonUtils.LessThanDaysAhead(now, b.StartDate, 0)
                                           && !(from d in db.MemberEmails
												where d.EmailType == (int)PrizeConstants.EmailType.MileStoneWeek2 && d.ScheduleDate > dtSendEmailBegin
                                                select d.MemberId).Contains(c.MemberId)
										  select new
										  {
											  MemberId = c.MemberId,
											  MemberPlanWeekId = b.Id,
											  WeekStartDate = b.StartDate,
											  MemberExercisePlanId = c.Id,
										  };
					foreach (var memberPlanWithWeek in memberPlanWithWeeks)
					{
						PrizeMember member = PrizeMemberAuthUtils.GetMemberData(memberPlanWithWeek.MemberId);
						if (emailType == PrizeConstants.EmailType.MileStoneWeek12)
							PrepareSimpleEmailByType(member, emailType, "Milestone Week " + weekNum, member.Firstname);
						else if (emailType == PrizeConstants.EmailType.MileStoneGoalWeek13)
							PrepareSimpleEmailByType(member, emailType, "Milestone Goal Week " + weekNum, member.Firstname);
						else 
							PrepareSimpleEmailByType(member, emailType, "Milestone Week " + (weekNum - 1), member.Firstname);
					}
				}
            }
        }
        catch (Exception ex)
        {
            PrizeLogs.SaveSystemErrorLog(0, 0, PrizeConstants.SystemErrorLevel.LevelSerious, typeof(PrizeEmailWrapper).ToString(),
                "DailyEmailTask COMPLETED STAGES - After week x", ex);
        }

        try
        {
            using (var db = new DIYPTEntities())
            {
                //Milestone End Week 12
                availableStatus = PrizeConstants.STATUS_PLAN_STARTED + PrizeConstants.STATUS_PLAN_PAID;
                dtBegin = now.AddDays(0);
                dtEnd = now.AddDays(1);
                var memberPlanWithWeeks = from c in db.MemberExercisePlans
									  join b in db.MemberExercisePlanWeeks on c.Id equals b.MemberExercisePlanId
									  where c.Status.Equals(availableStatus) && b.Week == 12 && dtBegin <= b.EndDate && dtEnd >= b.EndDate //&& PrizeCommonUtils.LessThanDaysAhead(now, b.EndDate, 1)
                                       && !(from d in db.MemberEmails
											where d.EmailType == (int)PrizeConstants.EmailType.MileStoneWeek2 && d.ScheduleDate > dtSendEmailBegin
                                            select d.MemberId).Contains(c.MemberId)
									  select new
									  {
										  MemberId = c.MemberId,
										  MemberPlanWeekId = b.Id,
										  WeekStartDate = b.StartDate,
										  MemberExercisePlanId = c.Id,
									  };
				foreach (var memberPlanWithWeek in memberPlanWithWeeks)
				{
					PrizeMember member = PrizeMemberAuthUtils.GetMemberData(memberPlanWithWeek.MemberId);
					PrepareSimpleEmailByType(member, PrizeConstants.EmailType.MileStoneEndWeek12, "Milestone End Week 12", member.Firstname);
				}
            }
        }
        catch (Exception ex)
        {
            PrizeLogs.SaveSystemErrorLog(0, 0, PrizeConstants.SystemErrorLevel.LevelSerious, typeof(PrizeEmailWrapper).ToString(),
                "DailyEmailTask Milestone End Week 12", ex);
        }

        try
        {
            using (var db = new DIYPTEntities())
            {
                //Measurement Weeks
                for (int i = 0; i < 3; i++)
				{
					int weekNum = 4;
					PrizeConstants.EmailType emailType = PrizeConstants.EmailType.MeasurmentWeek4;
					switch (i)
					{
						case 1:
							weekNum = 8;
							emailType = PrizeConstants.EmailType.MeasurmentWeek8;
							break;
						case 2:
							weekNum = 11;
							emailType = PrizeConstants.EmailType.MeasurmentWeek12;
							break;
						default:
							break;
					}
					availableStatus = PrizeConstants.STATUS_PLAN_STARTED + PrizeConstants.STATUS_PLAN_PAID;
                    dtBegin = now.AddDays(1);
                    dtEnd = now.AddDays(-1);
                    var memberPlanWithWeeks = from c in db.MemberExercisePlans
										  join b in db.MemberExercisePlanWeeks on c.Id equals b.MemberExercisePlanId
										  where c.Status.Equals(availableStatus) && b.Week == weekNum && dtBegin <= b.StartDate && dtEnd >= b.StartDate //&& PrizeCommonUtils.LessThanDaysAhead(now, b.StartDate, 0)
                                           && !(from d in db.MemberEmails
												where d.EmailType == (int)emailType && d.ScheduleDate > dtSendEmailBegin
                                                select d.MemberId).Contains(c.MemberId)
										  select new
										  {
											  MemberId = c.MemberId,
											  MemberPlanWeekId = b.Id,
											  WeekStartDate = b.StartDate,
											  MemberExercisePlanId = c.Id,
										  };
					foreach (var memberPlanWithWeek in memberPlanWithWeeks)
					{
						PrizeMember member = PrizeMemberAuthUtils.GetMemberData(memberPlanWithWeek.MemberId);
						PrepareSimpleEmailByType(member, emailType, "Measurement Week " +weekNum, member.Firstname);
					}
				}
            }
        }
        catch (Exception ex)
        {
            PrizeLogs.SaveSystemErrorLog(0, 0, PrizeConstants.SystemErrorLevel.LevelSerious, typeof(PrizeEmailWrapper).ToString(),
                "DailyEmailTask Measurement Weeks", ex);
        }

        try
        {
            using (var db = new DIYPTEntities())
            {
                //Measurement Missed Weeks
                for (int i = 0; i < 3; i++)
				{
					int weekNum = 5;
					PrizeConstants.EmailType emailType = PrizeConstants.EmailType.MeasurmentMissedWeek4;
					switch (i)
					{
						case 1:
							weekNum = 8;
							emailType = PrizeConstants.EmailType.MeasurmentMissedWeek8;
							break;
						case 2:
							weekNum = 11;
							emailType = PrizeConstants.EmailType.MeasurmentMissedWeek12;
							break;
						default:
							break;
					}
					availableStatus = PrizeConstants.STATUS_PLAN_STARTED + PrizeConstants.STATUS_PLAN_PAID;
                    dtBegin = now.AddDays(0);
                    dtEnd = now.AddDays(1);
                    var memberPlanWithWeeks = from c in db.MemberExercisePlans
										  join b in db.MemberExercisePlanWeeks on c.Id equals b.MemberExercisePlanId
										  where c.Status.Equals(availableStatus) && b.Week == weekNum && dtBegin <= b.StartDate && dtEnd >= b.StartDate //&& PrizeCommonUtils.LessThanDaysAhead(now, b.StartDate, 1)
                                           && !(from d in db.MemberEmails
												where d.EmailType == (int)emailType && d.ScheduleDate > dtSendEmailBegin
                                                select d.MemberId).Contains(c.MemberId)
										  select new
										  {
											  MemberId = c.MemberId,
											  MemberPlanWeekId = b.Id,
											  WeekStartDate = b.StartDate,
											  MemberExercisePlanId = c.Id,
										  };
					foreach (var memberPlanWithWeek in memberPlanWithWeeks)
					{
						PrizeMember member = PrizeMemberAuthUtils.GetMemberData(memberPlanWithWeek.MemberId);
						MemberPlanWeekResult weekResult = (from f in db.MemberPlanWeekResults
														   join g in db.MemberExercisePlanWeeks on f.MemberExercisePlanWeekId equals g.Id
														   where g.MemberExercisePlanId == memberPlanWithWeek.MemberExercisePlanId && g.Week == (weekNum - 1)
														   && (!f.EndWeight.HasValue || !f.EndWaist.HasValue || !f.EndHip.HasValue 
														   || !f.EndChest.HasValue || !f.EndHeartRate.HasValue 
														   || String.IsNullOrEmpty(f.FrontPhoto) || String.IsNullOrEmpty(f.BackPhoto) || String.IsNullOrEmpty(f.SidePhoto))
														   select f).SingleOrDefault();
						if (weekResult != null)
							PrepareSimpleEmailByType(member, emailType, "Missed Measurement" + (weekNum - 1), member.Firstname);
					}
				}
            }
        }
        catch (Exception ex)
        {
            PrizeLogs.SaveSystemErrorLog(0, 0, PrizeConstants.SystemErrorLevel.LevelSerious, typeof(PrizeEmailWrapper).ToString(),
                "DailyEmailTask Measurement Missed Weeks", ex);
        }
        return;
    }

    static protected void EmailPresetTask()
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
            PrizeLogs.SaveSystemErrorLog(0, 0, PrizeConstants.SystemErrorLevel.LevelSerious, typeof(PrizeEmailWrapper).ToString(), "EmailPresetTask", e);
            return;
        }
    }


    static public int SendMemberConintuousLoginEmail(PrizeMember member)
    {
        int emailId = PrepareSimpleEmailByType(member, PrizeConstants.EmailType.ContinuousLogin, "After logging on consistently for 21 days", member.Firstname);
        return emailId;
    }


}