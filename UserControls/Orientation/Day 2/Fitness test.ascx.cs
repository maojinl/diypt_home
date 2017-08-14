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
            return;
        var acc = new PrizeDataAccess();
        PrizeExercisePlan plan = acc.GetExercisePlan(myPlan.ExercisePlanId);
        divMuscle.Visible = false;
        divTone.Visible = false;
        divWeight.Visible = false;
        if (plan.PlanName.ToLower().Contains("muscle"))
            divMuscle.Visible = true;
        if (plan.PlanName.ToLower().Contains("tone"))
            divTone.Visible = true;
        if (plan.PlanName.ToLower().Contains("weight"))
            divWeight.Visible = true;
    }

    protected void btnTaskDone_Click(object sender, EventArgs e)
    {
        var sTargetLevel = result.Text;
        PrizeMemberPlanManager man = new PrizeMemberPlanManager();
        MemberExercisePlan myPlan = dbAccess.GetCurrentMemberPlan(PrizeMemberAuthUtils.GetMemberID());
        if (myPlan == null)
        {
            Response.Write("<script>alert('Your plan has not started yet.');</script>");
            return;
        }

        man.ChangeMemberPlanLevel(myPlan.Id, sTargetLevel);
        dbAccess.UpdateOrientationWeekDayResult(myPlan.Id, 2, 2, true);
        Response.Redirect("/orientation/day-2/get-familiar-with-the-deadlift");
    }
}