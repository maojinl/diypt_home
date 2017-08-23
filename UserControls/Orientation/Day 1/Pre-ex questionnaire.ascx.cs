using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserControls_Orientation_Day_1_Pre_ex_questionnaire : BaseOrientation
{
    protected void Page_Load(object sender, EventArgs e)
    {
        DateTime myDate = GetOrientationDate(1);
        lblDay.Text = myDate.ToString("dddd d").ToUpper();
        lblDate.Text = myDate.ToString("MMMM, yyyy");
        MemberExercisePlan myPlan = dbAccess.GetCurrentMemberPlan(PrizeMemberAuthUtils.GetMemberID());
        if (myPlan == null)
        {
            Response.Write(PrizeConstants.CONST_JS_WARNING_PLAN_NOT_START);
            this.oriTextarea1.Enabled = false;
            this.oriTextarea2.Enabled = false;
            this.oriTextarea3.Enabled = false;
            this.oriTextarea7.Enabled = false;
            this.radioButtonListEverExercise.Enabled = false;
            this.radioButtonListExerciseType.Enabled = false;
            this.radioButtonListLocation.Enabled = false;
            this.radioButtonListGoalBefore.Enabled = false;
        }
    }

    protected void btnTaskDone_Click(object sender, EventArgs e)
    {
        MemberExercisePlan myPlan = dbAccess.GetCurrentMemberPlan(PrizeMemberAuthUtils.GetMemberID());
        if (myPlan == null)
        {
            Response.Write(PrizeConstants.CONST_JS_WARNING_PLAN_NOT_START);
            return;
        }
        dbAccess.UpdateOrientationWeekDayResult(myPlan.Id, 1, 2, true);
        Response.Redirect("/orientation/day-1/get-familiar-with-the-squat");
    }
}