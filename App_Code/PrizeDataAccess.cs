using System;
using System.Collections.Generic;
using System.Linq;
using System.Data.Common;
using System.Data;
using System.Transactions;

/// <summary>
/// Summary description for PrizeDataAccess
/// </summary>
public class PrizeDataAccess
{
	private DIYPTEntities db;

	public PrizeDataAccess()
	{
		//
		// TODO: Add constructor logic here
		//
		db = new DIYPTEntities();
	}

	public MemberExercisePlan GetCurrentMemberPlan(int iMemberId)
	{
		try
		{
			db.Database.Connection.Open();
			string status = PrizeConstants.STATUS_PLAN_STARTED + PrizeConstants.STATUS_PLAN_PAID;
			MemberExercisePlan myPlan = (from c in db.MemberExercisePlans
										 where c.MemberId == iMemberId && c.Status.Equals(status)
										 select c).FirstOrDefault();
			return myPlan;
		}
		finally
		{
			db.Database.Connection.Close();
		}
	}

	public MemberExercisePlan GetMemberExercisePlan(int iMemberExsercisePlanId)
	{
		try
		{
			db.Database.Connection.Open();
			MemberExercisePlan myPlan = (from c in db.MemberExercisePlans
										 where c.Id == iMemberExsercisePlanId
										 select c).FirstOrDefault();
			return myPlan;
		}
		finally
		{
			db.Database.Connection.Close();
		}
	}

	public MemberExercisePlan GetCurrentMemberPlanOrStartingPlan(int iMemberId)
	{
		try
		{
			db.Database.Connection.Open();
			string status = PrizeConstants.STATUS_PLAN_STARTED + PrizeConstants.STATUS_PLAN_PAID;
			MemberExercisePlan myPlan = (from c in db.MemberExercisePlans
										 where c.MemberId == iMemberId && c.Status.Equals(status)
										 select c).FirstOrDefault();
			if (myPlan != null)
				return myPlan;

			status = PrizeConstants.STATUS_PLAN_NOT_STARTED + PrizeConstants.STATUS_PLAN_PAID;
			myPlan = (from c in db.MemberExercisePlans
										 where c.MemberId == iMemberId && c.Status.Equals(status)
										 orderby c.StartDate
										 select c).FirstOrDefault();
			return myPlan;
		}
		finally
		{
			db.Database.Connection.Close();
		}
	}

	public MemberExercisePlan GetMemberStartingPlan(int iMemberId)
	{
		try
		{
			db.Database.Connection.Open();

			string status = PrizeConstants.STATUS_PLAN_NOT_STARTED + PrizeConstants.STATUS_PLAN_PAID;
			MemberExercisePlan myPlan = (from c in db.MemberExercisePlans
					  where c.MemberId == iMemberId && c.Status.Equals(status)
					  orderby c.StartDate
					  select c).FirstOrDefault();
			return myPlan;
		}
		finally
		{
			db.Database.Connection.Close();
		}
	}

	public DataSet GetExercisePlanInfo(int iPlanId)
	{
		db.Database.Connection.Open();
		DbCommand cmd = db.Database.Connection.CreateCommand();
		cmd.CommandText = "SELECT a.PlanName, a.Description, c.Name as ProgramName, d.Name as LocationName, e.Name as LevelName, f.Name as ExperienceName" +
			" FROM PrizeExercisePlans a, PrizePlanPrograms c, PrizePlanLocations d, PrizePlanLevels e, PrizePlanExperiences f " +
			" WHERE a.ProgramId = c.Id AND a.LocationId = d.Id AND a.LevelId = e.Id AND a.ExperienceId = f.Id AND a.Id = " + iPlanId;
		try
		{
			DbDataReader reader = cmd.ExecuteReader();
			DataSet ds = new DataSet();
			ds.Load(reader, LoadOption.PreserveChanges, new String[] { "MemberPlanInfo" });
			return ds;
		}
		finally
		{
			db.Database.Connection.Close();
		}
	}

	public PrizeExercisePlan GetCurrentOrStartingExercisePlanInfo(int iMemberId)
	{
		try
		{
			MemberExercisePlan myPlan = GetCurrentMemberPlanOrStartingPlan(iMemberId);
			if (myPlan == null)
				return null;
			return GetExercisePlan(myPlan.ExercisePlanId);
		}
		finally
		{
		}
	}

	public DataSet GetMemberWeeklyInfo(int iPlanWeekId)
	{
		db.Database.Connection.Open();
		DbCommand cmd = db.Database.Connection.CreateCommand();
		cmd.CommandText = "SELECT b.Day, b.DayTypeId, c.DayTypeName " +
			" FROM PrizeExercisePlanWeekDays b, PrizeExerciseDayTypes c " +
			" WHERE b.ExercisePlanWeekId = " + iPlanWeekId +
			" AND b.DayTypeId = c.Id " +
			" ORDER BY b.Day";
		try
		{
			DbDataReader reader = cmd.ExecuteReader();
			DataSet ds = new DataSet();
			ds.Load(reader, LoadOption.PreserveChanges, new String[] { "PrizeWeeklyInfo" });
			return ds;
		}
		finally
		{
			db.Database.Connection.Close();
		}
	}

	public DataSet GetExerciseUnitsSetDetail(int iPlanWeekId, int iDay)
	{
		db.Database.Connection.Open();
		DbCommand cmd = db.Database.Connection.CreateCommand();
		cmd.CommandText = "SELECT  d.Id as GroupNameId, d.DayGroupName, c.ExerciseDay, MAX(c.Id) as DayGroupId " +
			 " FROM  PrizeExerciseUnitSetForDays c, PrizeExerciseDayGroupNames d " +
			 " WHERE c.DayGroupNameId = d.Id " +
			 " AND c.ExercisePlanWeekId = " + iPlanWeekId +
			 " AND c.ExerciseDay = " + iDay + " GROUP BY d.id, d.DayGroupName, c.ExerciseDay ORDER BY DayGroupId";

		try
		{
			DbDataReader reader = cmd.ExecuteReader();
			DataSet ds = new DataSet();
			ds.Load(reader, LoadOption.PreserveChanges, new String[] { "DayGroupInfo" });

			for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
			{
				cmd.CommandText = "SELECT  d.DayGroupName, c.ExerciseDay, a.Sequence, b.Exercise, b.AlternateExercise, b.Reps," +
					" b.Rest, b.Weight, b.Tempo, b.Trainning_Set, b.Image, b.TimeDuration, b.Comments " +
					" FROM  PrizeExerciseUnitSets a, PrizeExerciseUnits b, PrizeExerciseUnitSetForDays c, PrizeExerciseDayGroupNames d " +
					" WHERE a.ExerciseUnitId = b.Id AND a.UnitSetId = c.ExerciseUnitSetId " +
					" AND c.ExerciseDay = " + iDay + " AND c.DayGroupNameId = d.Id " +
					" AND c.ExercisePlanWeekId = " + iPlanWeekId +
					" AND d.Id = " + ds.Tables[0].Rows[i]["GroupNameId"].ToString() + " ORDER BY a.Sequence";
				reader = cmd.ExecuteReader();
				ds.Load(reader, LoadOption.PreserveChanges, new String[] { ds.Tables[0].Rows[i]["DayGroupName"].ToString() });
			}
			return ds;
		}
		finally
		{
			db.Database.Connection.Close();
		}
	}

	public bool GetNextAndPrevPlanWeek(MemberExercisePlanWeek currentMemberPlanWeek, ref int prevMemberPlanWeekId, ref int nextMemberPlanWeekId)
	{
		prevMemberPlanWeekId = -1;
		nextMemberPlanWeekId = -1;
		string statusFinished = PrizeConstants.STATUS_PLAN_FINISHED;
			//+ PrizeConstants.STATUS_PLAN_PAID;
		MemberExercisePlanWeek aMemberPlanWeek = (from c in db.MemberExercisePlanWeeks
												  where c.MemberId == currentMemberPlanWeek.MemberId && c.StartDate < currentMemberPlanWeek.StartDate && c.Status.Equals(statusFinished)
												  orderby c.StartDate descending
												  select c).FirstOrDefault();

		if (aMemberPlanWeek != null)
			prevMemberPlanWeekId = aMemberPlanWeek.Id;

		//statusFinished = PrizeConstants.STATUS_PLAN_FINISHED + PrizeConstants.STATUS_PLAN_PAID;
		string statusCurrent = PrizeConstants.STATUS_PLAN_STARTED;
			//+ PrizeConstants.STATUS_PLAN_PAID;
		aMemberPlanWeek = (from c in db.MemberExercisePlanWeeks
						   where c.MemberId == currentMemberPlanWeek.MemberId && c.StartDate > currentMemberPlanWeek.StartDate
										  && (c.Status.Equals(statusFinished) || c.Status.Equals(statusCurrent))
						   orderby c.StartDate ascending
						   select c).FirstOrDefault();

		if (aMemberPlanWeek != null)
			nextMemberPlanWeekId = aMemberPlanWeek.Id;

		return true;
	}

	public List<MemberPlanWeekResult> GetMemberPlanResults(int memberPlanId)
	{
		try
		{
			db.Database.Connection.Open();
			List<MemberPlanWeekResult> weekResults = (from c in db.MemberPlanWeekResults
													  join d in db.MemberExercisePlanWeeks on c.MemberExercisePlanWeekId equals d.Id
													  where d.MemberExercisePlanId == memberPlanId
													  && !d.Status.Equals(PrizeConstants.STATUS_PLAN_WEEK_NOT_STARTED)
													  orderby d.StartDate
													  select c).ToList();
			return weekResults;
		}
		finally
		{
			db.Database.Connection.Close();
		}
	}


	public MemberExercisePlanWeek GetCurrentMemberPlanWeek(int memberId)
	{
		try
		{
			db.Database.Connection.Open();
			MemberExercisePlanWeek memberPlanWeek = (from c in db.MemberExercisePlanWeeks
													 where c.MemberId == memberId && c.Status.Equals(PrizeConstants.STATUS_PLAN_WEEK_STARTED)
													 select c).FirstOrDefault();
			return memberPlanWeek;
		}
		finally
		{
			db.Database.Connection.Close();
		}
	}

	public MemberExercisePlanWeek GetMemberPlanWeekByMemberPlanAndWeek(int memberPlanId, int week)
	{
		try
		{
			db.Database.Connection.Open();
			MemberExercisePlanWeek memberPlanWeek = (from c in db.MemberExercisePlanWeeks
													 where c.MemberExercisePlanId == memberPlanId && c.Week == week
													 select c).FirstOrDefault();
			return memberPlanWeek;
		}
		finally
		{
			db.Database.Connection.Close();
		}
	}

	public bool MemberInOrientation(int memberId)
	{
		try
		{
			db.Database.Connection.Open();
			string status1 = PrizeConstants.STATUS_PLAN_NOT_STARTED + PrizeConstants.STATUS_PLAN_PAID;
			string status2 = PrizeConstants.STATUS_PLAN_STARTED + PrizeConstants.STATUS_PLAN_PAID;
			MemberExercisePlanWeek memberPlanWeek = (from c in db.MemberExercisePlanWeeks
													 join d in db.MemberExercisePlans on c.MemberExercisePlanId equals d.Id
													 where c.MemberId == memberId 
													 && (d.Status.Equals(status1) || d.Status.Equals(status2))
													 && (c.Status.Equals(PrizeConstants.STATUS_PLAN_WEEK_STARTED) || c.Status.Equals(PrizeConstants.STATUS_PLAN_WEEK_NOT_STARTED))
													 orderby c.StartDate
													 select c).FirstOrDefault();
			if (memberPlanWeek == null)
				return false;
			else
				if (memberPlanWeek.ExercisePlanWeekId != 0)
					return false;
			return true;
		}
		finally
		{
			db.Database.Connection.Close();
		}

	}

	public MemberExercisePlanWeek GetMemberPlanWeekById(int memberPlanWeekId)
	{

		try
		{
			db.Database.Connection.Open();
			MemberExercisePlanWeek memberPlanWeek = (from c in db.MemberExercisePlanWeeks
													 where c.Id == memberPlanWeekId
													 select c).FirstOrDefault();
			return memberPlanWeek;
		}
		finally
		{
			db.Database.Connection.Close();
		}

	}

	public PrizeExercisePlanWeek GetExercisePlanWeek(int planWeekId)
	{
		try
		{
			db.Database.Connection.Open();
			PrizeExercisePlanWeek planWeek = (from c in db.PrizeExercisePlanWeeks
											  where c.Id == planWeekId
											  select c).FirstOrDefault();
			return planWeek;
		}
		finally
		{
			db.Database.Connection.Close();
		}
	}

	public PrizeExercisePlan GetExercisePlan(int planId)
	{
		try
		{
			db.Database.Connection.Open();
			PrizeExercisePlan plan = (from c in db.PrizeExercisePlans
											  where c.Id == planId
											  select c).FirstOrDefault();
			return plan;
		}
		finally
		{
			db.Database.Connection.Close();
		}
	}

	public PrizeExercisePlan GetNotStartedExercisePlan(int memberId)
	{
		try
		{
			db.Database.Connection.Open();
			string finishedStatus = PrizeConstants.STATUS_PLAN_NOT_STARTED + PrizeConstants.STATUS_PLAN_PAID ;
			MemberExercisePlan memberPlan = (from c in db.MemberExercisePlans
											 where c.MemberId == memberId && c.Status.Equals(finishedStatus)
											 orderby c.EndDate descending
											 select c).FirstOrDefault();
			if (memberPlan == null)
				return null;
			PrizeExercisePlan finishedPlan = (from c in db.PrizeExercisePlans
											  where c.Id == memberPlan.ExercisePlanId
											  select c).FirstOrDefault();

			return finishedPlan;
		}
		finally
		{
			db.Database.Connection.Close();
		}
	}

	public PrizeExercisePlan GetLastFinishedExercisePlan(int memberId)
	{
		try
		{
			db.Database.Connection.Open();
			string finishedStatus = PrizeConstants.STATUS_PLAN_FINISHED + PrizeConstants.STATUS_PLAN_PAID;
			MemberExercisePlan memberPlan = (from c in db.MemberExercisePlans
											 where c.MemberId == memberId && c.Status.Equals(finishedStatus)
											 orderby c.EndDate descending
											 select c).FirstOrDefault();
			if (memberPlan == null)
				return null;
			PrizeExercisePlan finishedPlan = (from c in db.PrizeExercisePlans
											  where c.Id == memberPlan.ExercisePlanId
											  select c).FirstOrDefault();

			return finishedPlan;
		}
		finally
		{
			db.Database.Connection.Close();
		}
	}


	public PrizeExercisePlan GetNextExercisePlan(PrizeExercisePlan finishedPlan)
	{
		try
		{
			int programSeq = 1;
			int expSeq = 1;
			int levelSeq = 1;
			int locationSeq = 1;
			int locationId;
			db.Database.Connection.Open();
			PrizePlanProgram program;
			PrizePlanExperience exp;
			PrizePlanLevel lvl;
			PrizePlanLocation location;

			bool bUpgraded = false;

			location = (from c in db.PrizePlanLocations
						orderby c.Sequence
						select c).FirstOrDefault();
			locationId = location.Id;

			if (finishedPlan != null)
			{
				if (finishedPlan.IsTrialPlan == 0)
				{
					exp = (from c in db.PrizePlanExperiences
						   where c.Id == finishedPlan.ExperienceId
						   select c).FirstOrDefault();
					if (exp.Sequence < db.PrizePlanExperiences.Count())
					{
						expSeq = exp.Sequence + 1;
						bUpgraded = false;
					}
					else
					{
						expSeq = 1;
						bUpgraded = true;
					}

					lvl = (from c in db.PrizePlanLevels
						   where c.Id == finishedPlan.LevelId
						   select c).FirstOrDefault();
					if (!bUpgraded)
						levelSeq = lvl.Sequence;
					else
					{
						if (lvl.Sequence < db.PrizePlanLevels.Count())
						{
							levelSeq = lvl.Sequence + 1;
							bUpgraded = false;
						}
						else
						{
							levelSeq = 1;
							bUpgraded = true;
						}
					}

					program = (from c in db.PrizePlanPrograms
							   where c.Id == finishedPlan.ProgramId
							   select c).FirstOrDefault();
					if (!bUpgraded)
						programSeq = program.Sequence;
					else
					{
						if (program.Sequence < db.PrizePlanPrograms.Count())
						{
							programSeq = program.Sequence + 1;
							bUpgraded = false;
						}
					}

					locationId = finishedPlan.LocationId;
				}
			}

			program = (from c in db.PrizePlanPrograms
					   where c.Sequence == programSeq
					   select c).FirstOrDefault();

			exp = (from c in db.PrizePlanExperiences
				   where c.Sequence == expSeq
				   select c).FirstOrDefault();

			lvl = (from c in db.PrizePlanLevels
				   where c.Sequence == levelSeq
				   select c).FirstOrDefault();



			PrizeExercisePlan nextPlan = (from c in db.PrizeExercisePlans
										  where c.LocationId == locationId && c.ProgramId == program.Id && c.ExperienceId == exp.Id && c.LevelId == lvl.Id 
										  && c.IsTrialPlan == 0
										  select c).FirstOrDefault();

			return nextPlan;
		}
		finally
		{
			db.Database.Connection.Close();
		}
	}

	public PrizeExercisePlan GetNextExercisePlanForTrialPlan(PrizeExercisePlan finishedPlan)
	{
		try
		{
			if (finishedPlan == null)
				return null;

			if (finishedPlan.IsTrialPlan == 0)
				return null;

			db.Database.Connection.Open();

			PrizeExercisePlan nextPlan = (from c in db.PrizeExercisePlans
										  where c.LocationId == finishedPlan.LocationId && c.ProgramId == finishedPlan.ProgramId
										  && c.ExperienceId == finishedPlan.ExperienceId && c.LevelId == finishedPlan.LevelId
										  && c.IsTrialPlan == 0
										  select c).FirstOrDefault();

			return nextPlan;
		}
		finally
		{
			db.Database.Connection.Close();
		}
	}

	public int RemainningWeeks(int memberId)
	{
		int iWeeks = 0;
		MemberExercisePlan curMemberPlan = GetCurrentMemberPlan(memberId);
		MemberExercisePlan startingPlan = GetMemberStartingPlan(memberId);
		try
		{
			db.Database.Connection.Open();
			if (curMemberPlan != null)
			{
				IQueryable<MemberExercisePlanWeek> weeks = (from l in db.MemberExercisePlanWeeks
															where l.MemberExercisePlanId == curMemberPlan.Id
															orderby l.ExercisePlanWeekId descending
															select l);

				foreach (var week in weeks)
					if (week.Status.Equals(PrizeConstants.STATUS_PLAN_WEEK_NOT_STARTED))
						iWeeks++;
			}

				if (startingPlan != null)
				{
					IQueryable<MemberExercisePlanWeek> weeks = (from l in db.MemberExercisePlanWeeks
																where l.MemberExercisePlanId == startingPlan.Id
																orderby l.ExercisePlanWeekId descending
																select l);

					foreach (var week in weeks)
						if (week.Status.Equals(PrizeConstants.STATUS_PLAN_WEEK_NOT_STARTED))
							iWeeks++;
				}
				return iWeeks;
		}
		finally
		{
			db.Database.Connection.Close();
		}

	}

	public PrizeExercisePlan GetNextPlanToBuy(int memberId)
	{
		PrizeExercisePlan plan = GetNotStartedExercisePlan(memberId);
		if (plan == null)
		{
			MemberExercisePlan curMemberPlan = GetCurrentMemberPlan(memberId);
			if (curMemberPlan != null)
			{
				plan = GetExercisePlan(curMemberPlan.ExercisePlanId);
			}
			if (plan == null)
				plan = GetLastFinishedExercisePlan(memberId);
		}

		PrizeExercisePlan nextPlan;
		if (plan != null && plan.IsTrialPlan == 1)
			nextPlan = GetNextExercisePlanForTrialPlan(plan);
		else
			nextPlan = GetNextExercisePlan(plan);

		return nextPlan;
	}

	public PrizeExercisePlan ChangeExercisePlanLocation(PrizeExercisePlan originalPlan, string sLocation)
	{
		try
		{
			db.Database.Connection.Open();
			PrizePlanLocation location = (from l in db.PrizePlanLocations
										  where l.Name.Equals(sLocation)
										  select l).FirstOrDefault();

			PrizeExercisePlan nextPlan = (from c in db.PrizeExercisePlans
										  where c.LocationId == location.Id && c.ProgramId == originalPlan.ProgramId && c.ExperienceId == originalPlan.ExperienceId && c.LevelId == originalPlan.LevelId
										  && c.IsTrialPlan == 0
										  select c).FirstOrDefault();

			return nextPlan;
		}
		finally
		{
			db.Database.Connection.Close();
		}
	}

	public string GetPlanName(PrizeExercisePlan plan)
	{
		string planName = "";
		PrizePlanProgram planProgram = (from l in db.PrizePlanPrograms
										  where l.Id == plan.ProgramId
										  select l).FirstOrDefault();

		PrizePlanLocation planLocation = (from l in db.PrizePlanLocations
										  where l.Id == plan.LocationId
										  select l).FirstOrDefault();

		PrizePlanExperience planExp = (from l in db.PrizePlanExperiences
										  where l.Id == plan.ExperienceId
										  select l).FirstOrDefault();

		PrizePlanLevel planLevel = (from l in db.PrizePlanLevels
									   where l.Id == plan.LevelId
									   select l).FirstOrDefault();

		planName = planProgram.Name + "_" + planLocation.Name + "_" + planLevel.Name + "_" + planExp.Name;
		return planName;
	}

	public string GetOrientationWeekDayResult(int memberPlanId, int day)
	{
		MemberPlanWeekResult result = GetOrientationWeekResult(memberPlanId);
		if (result != null)
		{
			string s = "";
			for (int i = 0; i < 10; i++)
				s += "0";
			if (result.Questions != null && result.Questions.Length >= day * 10)
				s = result.Questions.Substring( (day-1)*10, 10);
			return s;
		}
		else
			throw new Exception("No week result.");
	}

	public MemberPlanWeekResult GetOrientationWeekResult(int memberPlanId)
	{
		MemberPlanWeekResult result = (from r in db.MemberPlanWeekResults
									   join weeks in db.MemberExercisePlanWeeks on r.MemberExercisePlanWeekId equals weeks.Id  
									   where weeks.MemberExercisePlanId == memberPlanId && weeks.ExercisePlanWeekId == 0
										select r).FirstOrDefault();

		return result;
	}

	public void UpdateOrientationWeekDayResult(int memberPlanId, int day, int quest, bool done)
	{
		using (this.db)
		{
			MemberPlanWeekResult result = (from r in db.MemberPlanWeekResults
										   join weeks in db.MemberExercisePlanWeeks on r.MemberExercisePlanWeekId equals weeks.Id
										   where weeks.MemberExercisePlanId == memberPlanId && weeks.ExercisePlanWeekId == 0
										   select r).FirstOrDefault();

			char[] arr;
			if (result.Questions == null || result.Questions.Length < PrizeConstants.MAX_ORIENTATION_QUESTION)
			{
				result.Questions = "";
				arr = new char[PrizeConstants.MAX_ORIENTATION_QUESTION];
				for (int i = 0; i < PrizeConstants.MAX_ORIENTATION_QUESTION; i++)
					arr[i] = '0';
			}
			else
				arr = result.Questions.ToArray();
			int idx = (day - 1) * 10 + (quest - 1);
			if (done)
				arr[idx] = '1';
			else
				arr[idx] = '0';
			result.Questions = new string(arr);
			db.SaveChanges();
		}
	}

	public MemberFoodPlanWeek GetMemberFoodPlanWeek(int iMemberId, int iMemberPlanId, int iWeek)
	{
		MemberFoodPlanWeek myFoodPlanWeek = (from c in db.MemberFoodPlanWeeks
										where c.MemberExercisePlanId == iMemberPlanId && c.StartWeek <= iWeek && c.EndWeek >= iWeek
										select c).FirstOrDefault();
		if (myFoodPlanWeek == null)
			myFoodPlanWeek = (from c in db.MemberFoodPlanWeeks
							  where c.MemberId == iMemberId
							  select c).FirstOrDefault();
		return myFoodPlanWeek;
	}

	public string GetPlanInfoForPublish()
	{
		string planInfo = "";
		PrizeMember member = PrizeMemberAuthUtils.GetMemberData();
		if (member == null)
			return planInfo;
		MemberExercisePlan myPlan = this.GetCurrentMemberPlanOrStartingPlan(member.UmbracoId);
		if (myPlan == null)
			return planInfo;
		PrizeExercisePlan plan = this.GetExercisePlan(myPlan.ExercisePlanId);

		char c = PrizeMemberAuthUtils.GetMemberSetting(member.UserSettings, PrizeConstants.MemberSettings.ShowProgram);
		if (c != '0')
		{
			PrizePlanProgram level = (from tbl in db.PrizePlanPrograms
									  where tbl.Id == plan.ProgramId
									select tbl).SingleOrDefault();
			planInfo += level.Name;
		}

		c = PrizeMemberAuthUtils.GetMemberSetting(member.UserSettings, PrizeConstants.MemberSettings.ShowLevel);
		if (c != '0')
		{
			PrizePlanLevel level = (from tbl in db.PrizePlanLevels
									where tbl.Id == plan.LevelId
									select tbl).SingleOrDefault();
			if (!planInfo.Equals(""))
				planInfo += " ";
			planInfo += level.Name;
		}

		return planInfo;
	}

	public IQueryable<MemberCommunityChat> GetAllPosts(int categoryId)
	{
		IQueryable<MemberCommunityChat> allPosts = (from c in db.MemberCommunityChats
													where c.Catergory == categoryId
													select c);
		return allPosts;
	}

	public bool SavePost(MemberCommunityChat chat)
	{
		try
		{
			db.MemberCommunityChats.Add(chat);
			db.SaveChanges();
			return false;
		}
		catch
		{
			return false;
		}
	}

	public string GetCurrentDailyViewURL(int memberId)
	{
		string result = "";
		MemberExercisePlanWeek memberPlanWeek = GetCurrentMemberPlanWeek(memberId);
		if (memberPlanWeek == null)
			return result;
		PrizeExercisePlanWeek planWeek = GetExercisePlanWeek(memberPlanWeek.ExercisePlanWeekId);
		if (planWeek == null)
			return result;
		result = String.Format("{0}?PlanWeekId={1}&MemberPlanWeekId={2}&PlanDayNumber={3}", PrizeConstants.URL_MEMBER_DAY_VIEW, planWeek.Id, memberPlanWeek.Id, PrizeCommonUtils.GetSystemDate().GetDayOfWeek());
		return result;
	}

}