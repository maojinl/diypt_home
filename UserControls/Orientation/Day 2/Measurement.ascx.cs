using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserControls_Orientation_Day_2_Measurement : BaseOrientation
{
    protected void Page_Load(object sender, EventArgs e)
    {
        DateTime myDate = GetOrientationDate(2);
        lblDay.Text = myDate.ToString("dddd d").ToUpper();
        lblDate.Text = myDate.ToString("MMMM, yyyy");

    }

    protected void btnTaskDone_Click(object sender, EventArgs e)
    {
        MemberExercisePlan myPlan = dbAccess.GetCurrentMemberPlan(PrizeMemberAuthUtils.GetMemberID());
        if (myPlan == null)
        {
            Response.Write("<script>alert('Your plan will start on next Monday.');</script>");
            return;
        }
        dbAccess.UpdateOrientationWeekDayResult(myPlan.Id, 2, 1, true);
        Response.Redirect("/orientation/day-2/fitness-test");
    }
}