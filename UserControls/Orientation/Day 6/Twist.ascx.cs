using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserControls_Orientation_Day_6_Twist : BaseOrientation
{
    protected void Page_Load(object sender, EventArgs e)
    {
        DateTime myDate = GetOrientationDate(6);
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
                    tempScript += @"$('#exerciseModal1').load('/exercise/Side-plank');
                    $('#exerciseModal2').load('/exercise/Powerband-high-to-low-woodchop');
                    $('#exerciseModal3').load('/exercise/Side-plank-powerband-pull');";
                    imgExercise1.ImageUrl = "/media/15009/landscape_side_plank_step1.jpg";
                    imgExercise2.ImageUrl = "/media/14715/landscape_powerband_high_to_low_woodchop_step1.jpg";
                    imgExercise3.ImageUrl = "/media/15150/landscape_side_plank_powerband_pull_step1.jpg";

                    lblExercise1.Text = "Side plank";
                    lblExercise2.Text = "Powerband high to low woodchop";
                    lblExercise3.Text = "Side plank powerband pull";
                }
                else
                {
                    tempScript += @"$('#exerciseModal1').load('/exercise/Ab-circles');
                    $('#exerciseModal2').load('/exercise/Cable-mid-woodchop');
                    $('#exerciseModal3').load('/exercise/Deadball-woodchop-slam');";
                    imgExercise1.ImageUrl = "/media/15145/landscape_ab_circles.jpg";
                    imgExercise2.ImageUrl = "/media/15126/landscape_cable_woodchop-mid_step1.jpg";
                    imgExercise3.ImageUrl = "/media/14403/landscape_deadball_woodchop_slam_step1.jpg";

                    lblExercise1.Text = "Ab circles";
                    lblExercise2.Text = "Cable mid woodchop";
                    lblExercise3.Text = "Deadball woodchop slam";
                }
                break;

            case "Build Muscle":
                if (planArray[1] == "Home")
                {

                    tempScript += @"$('#exerciseModal1').load('/exercise/Side-plank');
                    $('#exerciseModal2').load('/exercise/Powerband-high-to-low-woodchop');
                    $('#exerciseModal3').load('/exercise/Powerband-pallof-press');";
                    imgExercise1.ImageUrl = "/media/15009/landscape_side_plank_step1.jpg";
                    imgExercise2.ImageUrl = "/media/14715/landscape_powerband_high_to_low_woodchop_step1.jpg";
                    imgExercise3.ImageUrl = "/media/14689/landscape_powerband_pallof_press_step1.jpg";

                    lblExercise1.Text = "Side plank";
                    lblExercise2.Text = "Powerband high to low woodchop";
                    lblExercise3.Text = "Powerband pallof press";

                }
                else
                {
                    /*tempScript += @"$('#exerciseModal1').load('/exercise/Ab-circles');
                    $('#exerciseModal2').load('/exercise/"Cable-low-to-high-woodchop');
                    $('#exerciseModal3').load('/exercise/Cable-pallof-press');";
                    imgExercise1.ImageUrl = "/media/15145/landscape_ab_circles.jpg";
                    imgExercise2.ImageUrl = "/media/15123/landscape_cable_woodchop-low_to_high_step1.jpg";
                    imgExercise3.ImageUrl = "/media/15106/landscape_cable_pallof_press_step1.jpg";

                    lblExercise1.Text = "Ab circles";
                    lblExercise2.Text = "Cable low to high woodchop";
                    lblExercise3.Text = "Cable pallof press";*/
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
            Response.Write(PrizeConstants.CONST_JS_WARNING_PLAN_NOT_START);
            return;
        }
        dbAccess.UpdateOrientationWeekDayResult(myPlan.Id, 6, 2, true);
        Response.Redirect("/orientation/day-6");
    }
}