using System;
using System.Collections.Generic;
using System.Linq;
using System.Transactions;

/// <summary>
/// Summary description for PrizeMemberPlanManager
/// </summary>
public class PrizeMemberPlanManager
{
    private DIYPTEntities db;

    public PrizeMemberPlanManager()
    {
        //
        // TODO: Add constructor logic here
        //

        db = new DIYPTEntities();
    }

    public int FindNewPlan(string sProgram, string sLocation, string sLevel, string sExp, bool bIsTrial = false)
    {
        int newPlanId = -1;
        try
        {
            db.Database.Connection.Open();
            PrizePlanProgram program = (from c in db.PrizePlanPrograms
                                        where c.Name == sProgram
                                        select c).FirstOrDefault();
            if (program == null)
            {
                return PrizeErrorCode.ERROR_WRONG_PROGRAM;
            }


            PrizePlanLocation location = (from c in db.PrizePlanLocations
                                          where c.Name == sLocation
                                          select c).FirstOrDefault();
            if (location == null)
            {
                return PrizeErrorCode.ERROR_WRONG_LOCATION;
            }

            PrizePlanLevel level = (from c in db.PrizePlanLevels
                                    where c.Name == sLevel
                                    select c).FirstOrDefault();
            if (level == null)
            {
                return PrizeErrorCode.ERROR_WRONG_LEVEL;
            }

            PrizePlanExperience exp = (from c in db.PrizePlanExperiences
                                       where c.Name == sExp
                                       select c).FirstOrDefault();
            if (exp == null)
            {
                return PrizeErrorCode.ERROR_WRONG_LEVEL;
            }

            PrizeExercisePlan plan;
            
            if (bIsTrial == false)
                plan = (from c in db.PrizeExercisePlans
                    where c.ProgramId == program.Id && c.LocationId == location.Id
                    && c.LevelId == level.Id && c.ExperienceId == exp.Id && c.IsTrialPlan == 0
                    select c).FirstOrDefault();
            else
                plan = (from c in db.PrizeExercisePlans
                        where c.ProgramId == program.Id && c.LocationId == location.Id
                        && c.LevelId == level.Id && c.ExperienceId == exp.Id && c.IsTrialPlan == 1
                        select c).FirstOrDefault();

            if (plan != null)
                newPlanId = plan.Id;

            return newPlanId;
        }
        finally
        {
            db.Database.Connection.Close();
        }
    }

    public int BuyNewPlan(int newPlanId, ref PrizeExercisePlan prizePlan, ref MemberExercisePlan newMemberPlan)
    {
        try
        {
            if (PrizeMemberAuthUtils.CurrentUserLogin() != true)
                return PrizeErrorCode.ERROR_NOT_LOGGED_IN;
            int memberId = PrizeMemberAuthUtils.GetMemberID();

            db.Database.Connection.Open();

            PrizeExercisePlan plan = (from c in db.PrizeExercisePlans
                                      where c.Id == newPlanId
                                      select c).FirstOrDefault();

            if (plan == null)
            {
                return -1;
            }

            //using (TransactionScope transaction = new TransactionScope())
            //{
                if (plan == null)
                {
                    return PrizeErrorCode.ERROR_PLAN_NOT_EXIST;
                }

                MemberExercisePlan myExistingPaidPlan = (from c in db.MemberExercisePlans
                                                     where c.MemberId == memberId && 
                                                     ( c.Status.Equals(PrizeConstants.STATUS_PLAN_STARTED + PrizeConstants.STATUS_PLAN_PAID) 
                                                     || c.Status.Equals(PrizeConstants.STATUS_PLAN_NOT_STARTED + PrizeConstants.STATUS_PLAN_PAID))
                                                     orderby c.EndDate descending
                                                     select c).FirstOrDefault();
                DateTime currentEndDate;
                if (myExistingPaidPlan != null)
                    currentEndDate = myExistingPaidPlan.EndDate.Value;
                else
                    currentEndDate = PrizeCommonUtils.GetSystemDate();

                IQueryable<MemberExercisePlan> myNotPaidPlans = (from c in db.MemberExercisePlans
                                                     where c.MemberId == memberId && c.Status.EndsWith(PrizeConstants.STATUS_PLAN_NOT_PAID)
                                                     select c);

                foreach (MemberExercisePlan notPaidPlan in myNotPaidPlans)
                {
                    IQueryable<MemberExercisePlanWeek> notPaidPlanWeeks = (from c in db.MemberExercisePlanWeeks
                                                                            where c.MemberExercisePlanId == notPaidPlan.Id
                                                                            select c);
                    foreach (var week in notPaidPlanWeeks)
                    {
                        MemberPlanWeekResult weekResult = (from c in db.MemberPlanWeekResults
                                                             where c.MemberExercisePlanWeekId == week.Id
                                                             select c).SingleOrDefault();
                        db.MemberExercisePlanWeeks.Remove(week);
                        db.MemberPlanWeekResults.Remove(weekResult);
                    }
                    notPaidPlan.Status = PrizeConstants.STATUS_PLAN_NOT_STARTED + PrizeConstants.STATUS_PLAN_PAYMENT_CANCELLED;
                }
                db.SaveChanges();


                DateTime startDate = PrizeCommonUtils.GetNextWeekStart(currentEndDate);
                DateTime endDate = PrizeCommonUtils.GetWeekEnd(startDate);

                MemberExercisePlan myPlan = new MemberExercisePlan();
                myPlan.MemberId = memberId;
                myPlan.ExercisePlanId = plan.Id;
                myPlan.StartDate = startDate;
                myPlan.Status = PrizeConstants.STATUS_PLAN_NOT_STARTED + PrizeConstants.STATUS_PLAN_NOT_PAID;  //Not paid
                db.MemberExercisePlans.Add(myPlan);
                db.SaveChanges();

                MemberExercisePlanWeek myPlanWeekOrientation = new MemberExercisePlanWeek();
                myPlanWeekOrientation.MemberExercisePlanId = myPlan.Id;
                myPlanWeekOrientation.ExercisePlanWeekId = 0;
                myPlanWeekOrientation.MemberId = memberId;
                myPlanWeekOrientation.StartDate = startDate;
                myPlanWeekOrientation.EndDate = endDate;
                myPlanWeekOrientation.Status = PrizeConstants.STATUS_PLAN_WEEK_NOT_STARTED;
                myPlanWeekOrientation.Week = 0;
                db.MemberExercisePlanWeeks.Add(myPlanWeekOrientation);
                db.SaveChanges();

                MemberPlanWeekResult myWeekResult = new MemberPlanWeekResult();
                myWeekResult.MemberId = memberId;
                myWeekResult.MemberExercisePlanWeekId = myPlanWeekOrientation.Id;
                InitialiseWeekResult(ref myWeekResult);
                db.MemberPlanWeekResults.Add(myWeekResult);
                myPlan.EndDate = endDate;
                db.SaveChanges();

                startDate = startDate.AddDays(7);
                endDate = endDate.AddDays(7);
                IOrderedEnumerable<PrizeExercisePlanWeek> planWeeks = plan.PrizeExercisePlanWeeks.OrderBy(s => s.StartWeek);
                foreach (PrizeExercisePlanWeek planWeek in planWeeks)
                {
                    for (int i = planWeek.StartWeek; i <= planWeek.EndWeek; i++)
                    {
                        MemberExercisePlanWeek myPlanWeek = new MemberExercisePlanWeek();
                        myPlanWeek.MemberExercisePlanId = myPlan.Id;
                        myPlanWeek.ExercisePlanWeekId = planWeek.Id;
                        myPlanWeek.MemberId = memberId;
                        myPlanWeek.StartDate = startDate;
                        myPlanWeek.EndDate = endDate;
                        myPlanWeek.Status = PrizeConstants.STATUS_PLAN_WEEK_NOT_STARTED;
                        myPlanWeek.Week = i;
                        db.MemberExercisePlanWeeks.Add(myPlanWeek);
                        db.SaveChanges();

                        myWeekResult = new MemberPlanWeekResult();
                        myWeekResult.MemberId = memberId;
                        myWeekResult.MemberExercisePlanWeekId = myPlanWeek.Id;
                        InitialiseWeekResult(ref myWeekResult);
                        db.MemberPlanWeekResults.Add(myWeekResult);
                        myPlan.EndDate = endDate;
                        db.SaveChanges();

                        startDate = startDate.AddDays(7);
                        endDate = endDate.AddDays(7);
                    }
                }

                //transaction.Complete();
                newMemberPlan = myPlan;
                prizePlan = plan;

                return newPlanId;
            //}
        }
        finally
        {
            db.Database.Connection.Close();
        }
    }

    public static bool UpdateMemberPlans()
    {
        using (DIYPTEntities db = new DIYPTEntities())
        {
            try
            {
                db.Database.Connection.Open();

                DateTime today = PrizeCommonUtils.GetDayStart(PrizeCommonUtils.GetSystemDate());
                MemberExercisePlanWeek startingPlanWeek;
                String availableStatus = PrizeConstants.STATUS_PLAN_STARTED + PrizeConstants.STATUS_PLAN_PAID;
                IQueryable<MemberExercisePlan> plans = (from c in db.MemberExercisePlans
                                                        where c.Status.Equals(availableStatus)
                                                        orderby c.MemberId, c.Id
                                                        select c);

                foreach (MemberExercisePlan plan in plans)
                {
                    MemberExercisePlanWeek finishingPlanWeek = (from c in db.MemberExercisePlanWeeks
                                                                where c.MemberExercisePlanId == plan.Id && c.EndDate <= today
                                                                && c.Status.Equals(PrizeConstants.STATUS_PLAN_WEEK_STARTED)
                                                                orderby c.ExercisePlanWeekId
                                                                select c).FirstOrDefault();

                    if (finishingPlanWeek != null)
                    {
                        finishingPlanWeek.Status = PrizeConstants.STATUS_PLAN_WEEK_FINISHED;
                        startingPlanWeek = (from c in db.MemberExercisePlanWeeks
                                            where c.StartDate >= finishingPlanWeek.EndDate && c.Status.Equals(PrizeConstants.STATUS_PLAN_WEEK_NOT_STARTED)
                                            && c.MemberExercisePlanId == plan.Id
                                            orderby c.StartDate
                                            select c).FirstOrDefault();
                        if (startingPlanWeek != null)
                        {
                            MemberPlanWeekResult finishingResult = (from c in db.MemberPlanWeekResults
                                                                    where c.MemberExercisePlanWeekId == finishingPlanWeek.Id
                                                                    select c).FirstOrDefault();

                            MemberPlanWeekResult startingResult = (from c in db.MemberPlanWeekResults
                                                                   where c.MemberExercisePlanWeekId == startingPlanWeek.Id
                                                                   select c).FirstOrDefault();
                            CopyWeekResult(ref startingResult, ref finishingResult);
                            startingPlanWeek.Status = PrizeConstants.STATUS_PLAN_WEEK_STARTED;
                        }
                        else
                            plan.Status = PrizeConstants.STATUS_PLAN_FINISHED + PrizeConstants.STATUS_PLAN_PAID;
                    }

                }

                availableStatus = PrizeConstants.STATUS_PLAN_NOT_STARTED + PrizeConstants.STATUS_PLAN_PAID;
                plans = (from c in db.MemberExercisePlans
                         where c.Status.Equals(availableStatus)
                         orderby c.MemberId
                         select c);

                foreach (MemberExercisePlan plan in plans)
                {
                    startingPlanWeek = (from c in db.MemberExercisePlanWeeks
                                        where c.StartDate <= today && c.Status.Equals(PrizeConstants.STATUS_PLAN_WEEK_NOT_STARTED)
                                        && c.MemberExercisePlanId == plan.Id
                                        orderby c.StartDate
                                        select c).FirstOrDefault();
                    if (startingPlanWeek != null)
                    {
                        MemberPlanWeekResult startingResult = (from c in db.MemberPlanWeekResults
                                                               where c.MemberExercisePlanWeekId == startingPlanWeek.Id
                                                               select c).FirstOrDefault();
                        MemberExercisePlanWeek finishedWeek = (from c in db.MemberExercisePlanWeeks
                                                               where c.EndDate < startingPlanWeek.StartDate && c.Status.Equals(PrizeConstants.STATUS_PLAN_WEEK_FINISHED)
                                                               select c).FirstOrDefault();
                        if (finishedWeek != null)
                        {
                            MemberPlanWeekResult finishingResult = (from c in db.MemberPlanWeekResults
                                                                    where c.MemberExercisePlanWeekId == finishedWeek.Id
                                                                    select c).FirstOrDefault();
                            CopyWeekResult(ref startingResult, ref finishingResult);
                        }

                        startingPlanWeek.Status = PrizeConstants.STATUS_PLAN_WEEK_STARTED;
                        plan.Status = PrizeConstants.STATUS_PLAN_STARTED + PrizeConstants.STATUS_PLAN_PAID;
                    }
                }
                db.SaveChanges();
                return true;
            }
            catch (Exception e)
            {
                PrizeLogs.SaveSystemErrorLog(0, 0, PrizeConstants.SystemErrorLevel.LevelSerious, typeof(PrizeMemberPlanManager).ToString(), 
                    "UpdateMemberPlans", e.Message, e.InnerException == null ? "" : e.InnerException.Message);
                return false;
            }
            finally
            {
                db.Database.Connection.Close();
            }
        }
    }

    protected static void CopyWeekResult(ref MemberPlanWeekResult startingWeekResult, ref MemberPlanWeekResult finishingWeekResult)
    {
        startingWeekResult.StartBodyFat = finishingWeekResult.EndBodyFat;
        startingWeekResult.StartChest = finishingWeekResult.EndChest;
        startingWeekResult.StartHeartRate = finishingWeekResult.EndHeartRate;
        startingWeekResult.StartHip = finishingWeekResult.EndHip;
        startingWeekResult.StartWaist = finishingWeekResult.EndWaist;
        startingWeekResult.StartWeight = finishingWeekResult.EndWeight;
        return;
    }

    protected void InitialiseWeekResult(ref MemberPlanWeekResult startingWeekResult)
    {
        /*startingWeekResult.StartChest = 0;
        startingWeekResult.StartBodyFat = 0;
        startingWeekResult.StartHeartRate = 0;
        startingWeekResult.StartHip = 0;
        startingWeekResult.StartWaist = 0;
        startingWeekResult.StartWeight = 0;

        startingWeekResult.EndChest = 0;
        startingWeekResult.EndBodyFat = 0;
        startingWeekResult.EndHeartRate = 0;
        startingWeekResult.EndHip = 0;
        startingWeekResult.EndWaist = 0;
        startingWeekResult.EndWeight = 0;*/
        startingWeekResult.Tasks = PrizeConstants.DEFAULT_MEMBER_TASKS_CONFIG;
        return;
    }

    public void PayMemberPlans(int currentOrderId, string PaymentConfirmation)
    {
        try
        {
            db.Database.Connection.Open();

            PrizeOrder myCurrentOrder;
            MemberExercisePlan myPlan;
            if (currentOrderId >= 0)
            {
                // Get the order based on order id.
                myCurrentOrder = db.PrizeOrders.Single(o => o.OrderId == currentOrderId);
                // Update the order to reflect payment has been completed.
                myCurrentOrder.PaymentTransactionId = PaymentConfirmation;

                myPlan = db.MemberExercisePlans.Single(o => o.Id == myCurrentOrder.MemberPlanId);

                myPlan.Status = PrizeConstants.STATUS_PLAN_NOT_STARTED + PrizeConstants.STATUS_PLAN_PAID;
                DateTime currentEndDate = PrizeCommonUtils.GetSystemDate();
                if (myPlan.StartDate < currentEndDate)
                {
                    DateTime startDate = PrizeCommonUtils.GetNextWeekStart(currentEndDate);
                    DateTime endDate = PrizeCommonUtils.GetWeekEnd(startDate);
                    myPlan.StartDate = startDate;
                    IList<MemberExercisePlanWeek> myPlanWeeks = (from c in db.MemberExercisePlanWeeks
                                                    where c.MemberExercisePlanId == myPlan.Id
                                                    orderby c.StartDate
                                                    select c).ToList();
                    foreach (MemberExercisePlanWeek myPlanWeek in myPlanWeeks)
                    {
                        myPlanWeek.StartDate = startDate;
                        myPlanWeek.EndDate = endDate;
                        myPlanWeek.Status = PrizeConstants.STATUS_PLAN_WEEK_NOT_STARTED;
                        myPlan.EndDate = endDate;
                        db.SaveChanges();

                        startDate = startDate.AddDays(7);
                        endDate = endDate.AddDays(7);
                    }
                }
                // Save to DB.
                db.SaveChanges();
            }
        }
        finally
        {
            db.Database.Connection.Close();
        }
    }

    public void PayMemberPlanCancel(int currentOrderId)
    {
        try
        {
            db.Database.Connection.Open();

            PrizeOrder myCurrentOrder;
            MemberExercisePlan myPlan;
            if (currentOrderId >= 0)
            {
                // Get the order based on order id.
                myCurrentOrder = db.PrizeOrders.Single(o => o.OrderId == currentOrderId);

                myPlan = db.MemberExercisePlans.Single(o => o.Id == myCurrentOrder.MemberPlanId);

                myPlan.Status = PrizeConstants.STATUS_PLAN_NOT_STARTED + PrizeConstants.STATUS_PLAN_PAYMENT_CANCELLED;
                // Save to DB.
                db.SaveChanges();
            }
        }
        finally
        {
            db.Database.Connection.Close();
        }
    }

    public bool ChangeMemberPlanLevel(int myPlanId, string sLevel)
    {
        bool ret = false;
        try
        {
            db.Database.Connection.Open();

            MemberExercisePlan myPlan = (from c in db.MemberExercisePlans
                                         where c.Id == myPlanId
                                         select c).FirstOrDefault();
            if (myPlan == null)
                return ret;

            PrizeExercisePlan plan = (from c in db.PrizeExercisePlans
                                      where c.Id == myPlan.ExercisePlanId
                                      select c).FirstOrDefault();

            if (plan == null)
                return ret;

            PrizePlanLevel level = (from c in db.PrizePlanLevels
                                    where c.Name == sLevel
                                    select c).FirstOrDefault();
            if (level == null)
            {
                return ret;
            }

            if (level.Id == plan.LevelId)
                return true;

            PrizeExercisePlan targetPlan;
            if (plan.IsTrialPlan == 1)
                targetPlan = (from c in db.PrizeExercisePlans
                              where c.ProgramId == plan.ProgramId && c.LocationId == plan.LocationId && c.ExperienceId == plan.ExperienceId && c.LevelId == level.Id && c.IsTrialPlan == 1
                              select c).FirstOrDefault();
            else
                targetPlan = (from c in db.PrizeExercisePlans
                              where c.ProgramId == plan.ProgramId && c.LocationId == plan.LocationId && c.ExperienceId == plan.ExperienceId && c.LevelId == level.Id && c.IsTrialPlan == 0
                              select c).FirstOrDefault();

            if (targetPlan == null)
            {
                return ret;
            }

            IQueryable<PrizeExercisePlanWeek> targetPlanWeeks = (from c in db.PrizeExercisePlanWeeks
                                                                 where c.ExercisePlanId == targetPlan.Id
                                                                 orderby c.StartWeek
                                                                 select c);

            foreach (var targetPlanWeek in targetPlanWeeks)
            {

                IQueryable<MemberExercisePlanWeek> myPlanWeeks = (from c in db.MemberExercisePlanWeeks
                                                                  join d in db.PrizeExercisePlanWeeks on c.ExercisePlanWeekId equals d.Id
                                                                  where c.MemberExercisePlanId == myPlan.Id && c.Week >= targetPlanWeek.StartWeek && c.Week <= targetPlanWeek.EndWeek
                                                                  select c);
                foreach (var myPlanWeek in myPlanWeeks)
                    myPlanWeek.ExercisePlanWeekId = targetPlanWeek.Id;
            }

            myPlan.ExercisePlanId = targetPlan.Id;

            db.SaveChanges();

            return true;
        }
        catch
        {
            return false;
        }
        finally
        {
            db.Database.Connection.Close();
        }
    }

    protected MemberExercisePlan GetNextMemberPlanNeedToPay(int iMemberId)
    {
        try
        {
            db.Database.Connection.Open();
            string status = PrizeConstants.STATUS_PLAN_NOT_STARTED + PrizeConstants.STATUS_PLAN_NOT_PAID;
            MemberExercisePlan myPlan = (from c in db.MemberExercisePlans
                                         where c.MemberId == iMemberId && c.Status.Equals(status)
                                         orderby c.Id descending
                                         select c).FirstOrDefault();
            return myPlan;
        }
        finally
        {
            db.Database.Connection.Close();
        }
    }

    public string GetEmptyPlanJumpURL(PrizeMember member)
    {
        string sURL = "";
        MemberExercisePlan myPlan = GetNextMemberPlanNeedToPay(member.UmbracoId);
        if (myPlan == null)
        {
            sURL = String.Format("{0}?loginName={1}&memberId={2}", PrizeConstants.URL_MEMBER_CONTINUE_PLAN, member.Email, member.UmbracoId);
        }
        else
        {
            sURL = String.Format("{0}?targetplanid={1}&targetmemberplanid={2}", PrizeConstants.URL_MEMBER_BUY_PLAN, myPlan.ExercisePlanId, myPlan.Id);
        }
        return sURL;
    }
}