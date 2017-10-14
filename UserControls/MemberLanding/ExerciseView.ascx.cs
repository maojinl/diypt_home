using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Data;
using System.Text.RegularExpressions;

public partial class UserControls_MemberLanding_ExerciseView : BaseOrientation
{
    protected List<Label> labels;
    protected List<Label> lblDates;
    protected List<Label> lblTimeDuration;
    // protected HashSet<int> exerciseUnitSets;
    protected PrizeDataAccess dbAccess = new PrizeDataAccess();
    protected int currentPlanWeekId;
    protected int currentPlanId;
    protected int prevMemberPlanWeekId;
    protected int nextMemberPlanWeekId;
    protected int dayNumber;
    protected List<string> strEquipments;
    PrizeExercisePlanWeek planWeek;
    MemberExercisePlanWeek memberPlanWeek;

    protected void InitLables()
    {
        if (labels == null)
        {
            labels = new List<Label>();
            labels.Add(lblExMon1);
            labels.Add(lblExTue1);
            labels.Add(lblExWed1);
            labels.Add(lblExThu1);
            labels.Add(lblExFri1);
            labels.Add(lblExSat1);
            labels.Add(lblExSun1);
        }

        if (lblDates == null)
        {
            lblDates = new List<Label>();
            lblDates.Add(lblDay1);
            lblDates.Add(lblDay2);
            lblDates.Add(lblDay3);
            lblDates.Add(lblDay4);
            lblDates.Add(lblDay5);
            lblDates.Add(lblDay6);
            lblDates.Add(lblDay7);
        }

        if (lblTimeDuration == null)
        {
            lblTimeDuration = new List<Label>();
            lblTimeDuration.Add(lblTimeDuration1);
            lblTimeDuration.Add(lblTimeDuration2);
            lblTimeDuration.Add(lblTimeDuration3);
            lblTimeDuration.Add(lblTimeDuration4);
            lblTimeDuration.Add(lblTimeDuration5);
            lblTimeDuration.Add(lblTimeDuration6);
            lblTimeDuration.Add(lblTimeDuration7);
        }
        //exerciseUnitSets = new HashSet<int>();
    }

    protected void Page_Load(object sender, EventArgs e)
    {
         /*
		//Handled in BaseOrientation//
		if (PrizeMemberAuthUtils.CurrentUserLogin() != true)
            return;
		*/
        int memberId = PrizeMemberAuthUtils.GetMemberID();
		
		var exercisePlan = dbAccess.GetCurrentMemberPlanOrStartingPlan(memberId);
        if (exercisePlan == null)
		{
            PrizeMember member = PrizeMemberAuthUtils.GetMemberData(memberId);
            PrizeMemberPlanManager planMan = new PrizeMemberPlanManager();
            Response.Redirect(planMan.GetEmptyPlanJumpURL(member));
        }	
        InitLables();
        //var member = PrizeMemberAuthUtils.GetMemberData();
        //lblTest.Text = member.Questions;


        if (Request["MemberPlanWeekID"] != null)
        {
            int memberPlanWeekId;
            int.TryParse(Request["MemberPlanWeekID"], out memberPlanWeekId);

            memberPlanWeek = dbAccess.GetMemberPlanWeekById(memberPlanWeekId);

            planWeek = dbAccess.GetExercisePlanWeek(memberPlanWeek.ExercisePlanWeekId);

        }
        else
        {
            memberPlanWeek = dbAccess.GetCurrentMemberPlanWeek(memberId); //(MemberExercisePlanWeek)Session["MemberPlanWeek"];
            if (memberPlanWeek == null)
            {
				HideLinks();
                topInfo.Visible = false;
				dayPre.Visible = false;
				dayNext.Visible = false;
				dayView.Visible =false;
				printDay.Visible = false;
				timesaverDiv.Visible = false;
				timesaverDivMobile.Visible = false;
				divNotStarted.Visible = true;
                return;
            }
			divNotStarted.Visible = false;

            planWeek = dbAccess.GetExercisePlanWeek(memberPlanWeek.ExercisePlanWeekId);
        }

        currentPlanWeekId = (int)memberPlanWeek.ExercisePlanWeekId;
        //
        dayView.HRef = dbAccess.GetCurrentDailyViewURL(memberId);
        LoadWeeklyInfo(memberId, planWeek, memberPlanWeek);

        MemberExercisePlan myPlan = dbAccess.GetMemberExercisePlan(memberPlanWeek.MemberExercisePlanId);
        MemberExercisePlanWeek prevWeek = dbAccess.GetMemberPlanWeekByMemberPlanAndWeek(myPlan.Id, memberPlanWeek.Week - 1);
        if (prevWeek != null)
        {
            dayPre.NavigateUrl = "/my-account/exercise-view?MemberPlanWeekID=" + prevWeek.Id;
            dayPre.Text = "Week " + (memberPlanWeek.Week -1);
        }
        else
            dayPre.Attributes.Add("class", "no-arrow");

        MemberExercisePlanWeek nextWeek = dbAccess.GetMemberPlanWeekByMemberPlanAndWeek(myPlan.Id, memberPlanWeek.Week + 1);
        if (nextWeek != null)
        {
            dayNext.NavigateUrl = "/my-account/exercise-view?MemberPlanWeekID=" + nextWeek.Id;
            dayNext.Text = "Week " + (memberPlanWeek.Week + 1);
        }
        else
            dayNext.Attributes.Add("class", "no-arrow");
    }

	private void HideLinks()
	{
		
            for (int i = 1; i <= 7; i++)
			{
				   HyperLink linkDay = FindControl("linkDay" + (i )) as HyperLink;
				    if (linkDay != null )
						linkDay.Visible = false;
					
					System.Web.UI.HtmlControls.HtmlGenericControl timeDay = FindControl("timeDay" + (i)) as System.Web.UI.HtmlControls.HtmlGenericControl;
				    if (timeDay != null )
						timeDay.Visible = false;
					
			}
	}
    protected void LoadWeeklyInfo(int memberID, PrizeExercisePlanWeek planWeek, MemberExercisePlanWeek memberPlanWeek)
    {
        dayNumber = PrizeCommonUtils.GetSystemDate().GetDayOfWeek();

        int memberId = PrizeMemberAuthUtils.GetMemberID();

        using (DIYPTEntities db = new DIYPTEntities())
        {
            db.Database.Connection.Open();

            lblDateDuration.Text = PrizeCommonUtils.ParseDateToEnglish(memberPlanWeek.StartDate) + " - "
                + PrizeCommonUtils.ParseDateToEnglish(memberPlanWeek.EndDate);

            for (int i = 0; i < lblDates.Count; i++)
            {
                lblDates[i].Text = PrizeCommonUtils.ParseShortDateToEnglish(memberPlanWeek.StartDate.AddDays(i));
                HyperLink linkDay = FindControl("linkDay" + (i + 1)) as HyperLink;
                if (linkDay != null && planWeek != null)
                    linkDay.NavigateUrl = (String.Format("{0}?PlanWeekId={1}&MemberPlanWeekId={2}&PlanDayNumber={3}", PrizeConstants.URL_MEMBER_DAY_VIEW, planWeek.Id, memberPlanWeek.Id, i + 1));
                else if (planWeek == null)
                {
                    //Orientation week
                    linkDay.NavigateUrl = "/orientation/day-" + (i + 1);
                    labels[i].Text = "Orientation day " + (i + 1);
                }
            }
            if (planWeek == null)
            {
                lblWeekNum.Text = "Week 0";
                PrizeDataAccess dba = new PrizeDataAccess();
                if (dba.MemberInOrientation(PrizeMemberAuthUtils.GetMemberID()))
                     topInfo.Visible = false;
                db.Database.Connection.Close();
                return;
            }

            int iWeekNum = memberPlanWeek.Week;
            lblWeekNum.Text = "Week " + iWeekNum;

            string[] planWeekDesc = planWeek.Description.Split('\n');
            bool bEquipmentSession = false;
            if (strEquipments == null)
                strEquipments = new List<string>();
            for (int i = 0; i < planWeekDesc.Length; i++)
            {
                string[] strKeyValue = planWeekDesc[i].Split(':');
                if (strKeyValue != null && strKeyValue.Length > 1)
                {
                    if ((i == 1) && (strKeyValue[0].IndexOf("phase", StringComparison.OrdinalIgnoreCase) >= 0))
                    {
                        lblTrainingPhase.Text = strKeyValue[1];
                        continue;
                    }
                    if ((i == 2) && (strKeyValue[0].IndexOf("phase duration", StringComparison.OrdinalIgnoreCase) >= 0 || (strKeyValue[0].IndexOf("training duration", StringComparison.OrdinalIgnoreCase) >= 0)))
                    {
                        lblDuration.Text = strKeyValue[1];
                        continue;
                    }

                    if (strKeyValue[0].IndexOf("equipment", StringComparison.OrdinalIgnoreCase) >= 0)
                    {
                        bEquipmentSession = true;
                        strEquipments.Clear();
                        continue;
                    }
                }

                if (bEquipmentSession && Regex.Matches(planWeekDesc[i], @"[a-zA-Z]").Count > 0)
                {
                    strEquipments.Add(planWeekDesc[i]);
                    continue;
                }
            }

            if (strEquipments != null && strEquipments.Count > 0)
            {
                string tempLiteral = "<ul class='equipment-list'>";
                foreach (var e in strEquipments)
                {
					if(e != " ")
						tempLiteral += "<li>" + e + "</li>";
                }
                tempLiteral += "</ul>";
                equipmentLiteral.Text = tempLiteral;
                equipmentLiteralMobile.Text = tempLiteral;
                equipmentDiv.Visible = true;
            }

            DataSet myPlan = dbAccess.GetExercisePlanInfo((int)planWeek.ExercisePlanId);
            if (myPlan.Tables[0].Rows.Count == 0)
            {
                db.Database.Connection.Close();
                return;
            }

            this.lblGoal.Text = myPlan.Tables[0].Rows[0]["ProgramName"].ToString();


            LoadDailyInfo(memberId, planWeek);

            //PrizePlanProgram myProgram = (from c in db.PrizePlanPrograms
            //                              where c.Id == planWeek.ExercisePlanId
            //                              select c).FirstOrDefault();
            

            db.Database.Connection.Close();
        }
    }

    protected void LoadDailyInfo(int iMemberId, PrizeExercisePlanWeek planWeek)
    {
        //lblExercise.Text = dbWeek.Description;
        //lblWeek.Text = dbWeek.Week.ToString();

        foreach (var lbl in labels)
            lbl.Text = PrizeConstants.STR_NO_TRAINNING;

        DataSet ds = dbAccess.GetMemberWeeklyInfo(planWeek.Id);

        int DayTimeTypeId1 = 0;
        //int DayTimeTypeId2 = 0;
        foreach (DataRow row in ds.Tables[0].Rows)
        {
            int iWeekDay = (int)row[0] - 1;
            int iDayTimeType = (int)row[1]; //(int)reader.GetInt32(3);

            if (iWeekDay < labels.Count)
            {
                int iIndex = iWeekDay;
                //if (iDayTimeType == DayTimeTypeId2)
                //iIndex += 7;
                labels[iIndex].Text = (String)row[2];//reader.GetString(1);
            }

            //if (iWeekDay == (int)(PrizeCommonUtils.GetSystemDate().DayOfWeek))
            //exerciseUnitSets.Add((int)row[4]); //((int)reader.GetInt32(4));
        }

        HtmlControl temp = (HtmlControl)FindControl("day" + (int)(PrizeCommonUtils.GetSystemDate().GetDayOfWeek()));
        HtmlControl tempe = (HtmlControl)FindControl("day" + (int)(PrizeCommonUtils.GetSystemDate().GetDayOfWeek()) + "e");
        /*if (temp != null)
        {
            temp.Attributes.Add("style", "background-color: #eee");
            tempe.Attributes.Add("style", "background-color: #eee");
        }
        */
        for (int i = 0; i < 7; i++)
        {
            DataSet dsDaily = dbAccess.GetExerciseUnitsSetDetail(planWeek.Id, i + 1);
            double dTimeDuration = 0;
            int iTimeDuration = 0;
            for (int j = 1; j < dsDaily.Tables.Count; j++)
            {
                foreach (DataRow row in dsDaily.Tables[j].Rows)
                {
                    dTimeDuration += double.Parse(row["TimeDuration"].ToString());
                    iTimeDuration = (int)Math.Ceiling((double)dTimeDuration / 60);       
                }
            }
            if (dsDaily.Tables.Count > 1)
                iTimeDuration = iTimeDuration + 10 + 5; // +10 warm up; +5 cool down
            lblTimeDuration[i].Text = "" + iTimeDuration;
        }
		
        for (int i = 0; i < 7; i++)
        {
			switch(labels[i].Text.Trim())
			{
				case "Brisk walk":
					lblTimeDuration[i].Text = "30 mins";
					break;
					
				case "Own 1hr cardio":
				case "Own training":
				case "Own cardio":
					lblTimeDuration[i].Text = "60 mins";
					break;
					
				case "30-60min weekend physical activity":
				case "Weekend physical activity":
					lblTimeDuration[i].Text = "30-60 mins";
					break;
				case "Rest Day":
					lblTimeDuration[i].Text = "All Day";
					break;
					
				default:
					lblTimeDuration[i].Text += " mins";
					break;
			}
		}
    }



    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect(String.Format("{0}?PlanWeekId={1}&MemberPlanWeek={2}&PlanDayNumber={3}", PrizeConstants.URL_MEMBER_DAY_VIEW, currentPlanWeekId, memberPlanWeek.Id, dayNumber));
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect(String.Format("{0}?PlanWeekId={1}&PlanDayNumber={2}", PrizeConstants.URL_MEMBER_PROGRESS_STATUS, currentPlanWeekId, dayNumber));
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        int memberId = PrizeMemberAuthUtils.GetMemberID();

        PrizeExercisePlan plan = dbAccess.GetNotStartedExercisePlan(memberId);
        if (plan == null)
        {
            MemberExercisePlan curMemberPlan = dbAccess.GetCurrentMemberPlan(memberId);
            if (curMemberPlan != null)
            {
                plan = dbAccess.GetExercisePlan(curMemberPlan.ExercisePlanId);
            }
            if (plan == null)
                plan = dbAccess.GetLastFinishedExercisePlan(memberId);
        }

        PrizeExercisePlan nextPlan = dbAccess.GetNextExercisePlan(plan);

        if (nextPlan != null)
            Response.Redirect(String.Format("{0}?targetplanid={1}", PrizeConstants.URL_MEMBER_BUY_PLAN, nextPlan.Id));

    }

}