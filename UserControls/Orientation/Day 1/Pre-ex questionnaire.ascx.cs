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
        if (this.IsPostBack)
            return;
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
		var member = PrizeMemberAuthUtils.GetMemberData();
        if (member != null)
        {
            string temp = string.Format(@"
<html>
<body>
<div>1. What is your training goal and when do you want to achieve it by?</div>
<div>{0}</div>
<br />
<div>2. Have you tried to achieve this goal before and didn't succeed?</div>
<div>{1}</div>
<br />
<div>If yes, explain why you didn't succeed.</div>
<div>{2}</div>
<div>3. Why is this goal important to you. If yes, how many?</div>
<div>{3}</div>
<br />
<div>4. Have you ever exercised previously?</div>
<div>{4}</div>
<br />
<div>5. What type of exercise have you been doing in the last 3 months until today? Choose the answer which reflects the predominant part of your weekly routine.</div>
<div>{5}</div>
<br />
<div>6. Where do you exercise majority of the time?</div>
<div>{6}</div>
<br />
<div>7. What obstacles do you foresee stopping you from achieving your goals?</div>
<div>{7}</div>
</body>
</html>", oriTextarea1.Text, radioButtonListGoalBefore.SelectedValue, oriTextarea2.Text,
oriTextarea3.Text, radioButtonListEverExercise.SelectedValue, radioButtonListExerciseType.SelectedValue,
radioButtonListLocation.SelectedValue, oriTextarea7.Text);
            PrizeEmail.SendEmail("jrguico@yahoo.com.au", "Pre-exercise by " + member.Email, temp);
        }
        dbAccess.UpdateOrientationWeekDayResult(myPlan.Id, 1, 2, true);
        Response.Redirect("/orientation/day-1/get-familiar-with-the-squat");
    }
}