using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserControls_Orientation_Day_5_Lunge : BaseOrientation
{
    protected void Page_Load(object sender, EventArgs e)
    {
        DateTime myDate = GetOrientationDate(5);
        lblDay.Text = myDate.ToString("dddd d").ToUpper();
        lblDate.Text = myDate.ToString("MMMM, yyyy");
        DisplayExercise();
    }

    private void DisplayExercise()
    {
        string tempScript = "<script>";
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

        if (plan == null)
            return;

        var acc = new PrizeDataAccess();
        var planDetails = acc.GetPlanName(plan);
        var planArray = planDetails.Split('_');
        switch (planArray[0])
        {

            case "Lose Weight":
            case "Tone Up":
                if (planArray[1] == "Home")
                {
                    tempScript += @"$('#exerciseModal1').load('/exercise/Alternate-lunges');
                    $('#exerciseModal2').load('/exercise/Walking-lunges');
                    $('#exerciseModal3').load('/exercise/Alternating-reverse-lunge');";
                    imgExercise1.ImageUrl = "/media/14979/landscape_alternate_lunges_step1.jpg";
                    imgExercise2.ImageUrl = "/media/15076/landscape_walking_lunges.jpg";
                    imgExercise3.ImageUrl = "/media/14979/landscape_alternate_lunges_step1.jpg";

                    lblExercise1.Text = "Alternate lunges";
                    lblExercise2.Text = "Walking lunges";
                    lblExercise3.Text = "Alternating reverse lunge";
                }
                else
                {
                    tempScript += @"$('#exerciseModal1').load('/exercise/Alternate-lunges');
                    $('#exerciseModal2').load('/exercise/Walking-lunges');
                    $('#exerciseModal3').load('/exercise/Alternating-reverse-lunge');";
                    imgExercise1.ImageUrl = "/media/14979/landscape_alternate_lunges_step1.jpg";
                    imgExercise2.ImageUrl = "/media/15076/landscape_walking_lunges.jpg";
                    imgExercise3.ImageUrl = "/media/14979/landscape_alternate_lunges_step1.jpg";

                    lblExercise1.Text = "Alternate lunges";
                    lblExercise2.Text = "Walking lunges";
                    lblExercise3.Text = "Alternating reverse lunge";
                }
                break;

            case "Build Muscle":
                if (planArray[1] == "Home")
                {

                    tempScript += @"$('#exerciseModal1').load('/exercise/Alternate-lunges');
                    $('#exerciseModal2').load('/exercise/Walking-lunges');
                    $('#exerciseModal3').load('/exercise/side-lunge');";
                    imgExercise1.ImageUrl = "/media/14979/landscape_alternate_lunges_step1.jpg";
                    imgExercise2.ImageUrl = "/media/15076/landscape_walking_lunges.jpg";
                    imgExercise3.ImageUrl = "/media/13769/landscape_side_lunge_step1.jpg";

                    lblExercise1.Text = "Alternate lunges";
                    lblExercise2.Text = "Walking lunges";
                    lblExercise3.Text = "Side lunge";

                }
                else
                {
                    tempScript += @"$('#exerciseModal1').load('/exercise/Alternate-lunges');
                    $('#exerciseModal2').load('/exercise/Walking-lunges');
                    $('#exerciseModal3').load('/exercise/side-lunge');";
                    imgExercise1.ImageUrl = "/media/14979/landscape_alternate_lunges_step1.jpg";
                    imgExercise2.ImageUrl = "/media/15076/landscape_walking_lunges.jpg";
                    imgExercise3.ImageUrl = "/media/13769/landscape_side_lunge_step1.jpg";

                    lblExercise1.Text = "Alternate lunges";
                    lblExercise2.Text = "Walking lunges";
                    lblExercise3.Text = "Side lunge";
                }
                break;
            default:
                break;
        }
        tempScript += "</script>";
        Page.ClientScript.RegisterStartupScript(this.GetType(), "modalPopup", tempScript, false);
    }
    protected void btnTaskDone_Click(object sender, EventArgs e)
    {
        MemberExercisePlan myPlan = dbAccess.GetCurrentMemberPlan(PrizeMemberAuthUtils.GetMemberID());
        if (myPlan == null)
        {
            Response.Write("<script>alert('Your plan will start on next Monday.');</script>");
            return;
        }
        dbAccess.UpdateOrientationWeekDayResult(myPlan.Id, 5, 3, true);
        Response.Redirect("/orientation/day-5");
    }
}