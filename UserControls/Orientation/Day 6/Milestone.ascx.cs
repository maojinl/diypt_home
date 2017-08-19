using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserControls_Orientation_Day_6_Milestone : BaseOrientation
{
    protected void Page_Load(object sender, EventArgs e)
    {
        DateTime myDate = GetOrientationDate(6);
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
        dbAccess.UpdateOrientationWeekDayResult(myPlan.Id, 6, 4, true);
        Response.Redirect("/orientation/day-6/get-familiar-with-the-twist");
    }
}