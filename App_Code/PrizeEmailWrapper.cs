using System;
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

    public void SendWelcomeEmail(PrizeMember member, string loginName)
    {
        int emailId = PrepareSimpleEmailByType(member, PrizeConstants.EmailType.WelcomeEmail, "Welcome", member.Firstname, loginName);
       // SenEmailById(emailId);
    }

    public void Prepare1DaysPrior2Week4Email(int memberId)
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
            db.MemberEmails.Add(myEmail);
			db.SaveChanges();
			return;
		}
    }

    public void SendTestEmail(String content)
    {
        return;
    }

    public int PrepareSimpleEmailByType(PrizeMember member, PrizeConstants.EmailType type, string title, 
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
                mydb.MemberEmails.Add(myEmail);
				mydb.SaveChanges();
				return myEmail.EmailId;
			}
        }
        catch (Exception e)
        {
            PrizeLogs.SaveSystemErrorLog(member.UmbracoId, 0, PrizeConstants.SystemErrorLevel.LevelMidium, this.ToString(), "Prepare email", e.Message, e.InnerException.Message);
            return 0;
        }
    }

    public void DailyEmailTask()
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
					if (now.AddDays(2) < memberPlan.StartDate)
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
					if (now.AddDays(1) < memberPlanWithWeek.WeekStartDate)
						continue;

					MemberPlanWeekResult memberPlanWeekResult = (from c in db.MemberPlanWeekResults
																 where c.MemberExercisePlanWeekId == memberPlanWithWeek.MemberPlanWeekId
																 select c).FirstOrDefault();
					if (memberPlanWeekResult.Tasks != null && memberPlanWeekResult.Tasks.Length > 1 && memberPlanWeekResult.Tasks[1] == '0')
					{
						Prepare1DaysPrior2Week4Email(memberPlanWithWeek.MemberId);
						char[] arr = memberPlanWeekResult.Tasks.ToArray();
						arr[1] = '1';
						memberPlanWeekResult.Tasks = new string(arr);
						
					}
					
				}
				db.SaveChanges();
				return;
			}
		}
		catch (Exception e)
		{
			PrizeLogs.SaveSystemErrorLog(0, 0, PrizeConstants.SystemErrorLevel.LevelSerious, this.ToString(), "DailyEmailTask", e.Message, e.InnerException.Message);
		}
    }


}