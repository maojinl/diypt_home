using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserControls_Orientation_Day_2_Fitness_test : BaseOrientation
{
    protected void Page_Load(object sender, EventArgs e)
    {
        DateTime myDate = GetOrientationDate(2);
        lblDay.Text = myDate.ToString("dddd d").ToUpper();
        lblDate.Text = myDate.ToString("MMMM, yyyy");
        MemberExercisePlan myPlan = dbAccess.GetCurrentMemberPlan(PrizeMemberAuthUtils.GetMemberID());
        if (myPlan == null)
        {
            Response.Write(PrizeConstants.CONST_JS_WARNING_PLAN_NOT_START);
            this.div1.Visible = false;
            return;
        }
        var acc = new PrizeDataAccess();
        PrizeExercisePlan plan = acc.GetExercisePlan(myPlan.ExercisePlanId);
        if (plan.PlanName.ToLower().Contains("muscle"))
		{
            divMuscle.Attributes.Add("class", "show-pg-b");
			hiddenPlan.Text = "muscle";
		}
        if (plan.PlanName.ToLower().Contains("tone"))
		{
            divTone.Attributes.Add("class", "show-pg-t");
			hiddenPlan.Text = "tone";
		}
        if (plan.PlanName.ToLower().Contains("weight"))
		{
            divWeight.Attributes.Add("class", "show-pg-l");
			hiddenPlan.Text = "weight";
		}
		
		
		var planName = acc.GetPlanName(plan);
		var sPlanName = planName.Split('_');
		hiddenLocation.Text = sPlanName[1].ToLower();
		if(sPlanName[1].ToLower() == "gym")
			divFitness.Attributes.Add("class","tab-inner-content show-gym");
		else
			divFitness.Attributes.Add("class","tab-inner-content show-home");
		
    }

    protected void btnTaskDone_Click(object sender, EventArgs e)
    {
        var sTargetLevel = result.Text;
        PrizeMemberPlanManager man = new PrizeMemberPlanManager();
        MemberExercisePlan myPlan = dbAccess.GetCurrentMemberPlan(PrizeMemberAuthUtils.GetMemberID());
        if (myPlan == null)
        {
            Response.Write(PrizeConstants.CONST_JS_WARNING_PLAN_NOT_START);
            return;
        }

        man.ChangeMemberPlanLevel(myPlan.Id, sTargetLevel);
        dbAccess.UpdateOrientationWeekDayResult(myPlan.Id, 2, 2, true);
        Response.Redirect("/orientation/day-2/get-familiar-with-the-deadlift");
    }
}