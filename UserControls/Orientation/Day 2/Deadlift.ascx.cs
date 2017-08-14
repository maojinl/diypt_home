using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserControls_Orientation_Day_2_Deadlift : BaseOrientation
{
    protected void Page_Load(object sender, EventArgs e)
    {
        DateTime myDate = GetOrientationDate(2);
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
                    tempScript += @"$('#exerciseModal1').load('/exercise/powerband-deadlift');
                    $('#exerciseModal2').load('/exercise/powerband-sumo-deadlift');
                    $('#exerciseModal3').load('/exercise/bb-deadlift');";
                    imgExercise1.ImageUrl = "/media/14727/landscape_powerband_deadlift_step1.jpg";
                    imgExercise2.ImageUrl = "/media/14762/landscape_powerband_sumo_deadlift_step1.jpg";
                    imgExercise3.ImageUrl = "/media/14998/landscape_bb_deadlift_step1.jpg";

                    lblExercise1.Text = "Powerband deadlift";
                    lblExercise2.Text = "Powerband sumo deadlift";
                    lblExercise3.Text = "BB deadlift";
                }
                else
                {
                    tempScript += @"$('#exerciseModal1').load('/exercise/KB-deadlift');
                    $('#exerciseModal2').load('/exercise/bb-deadlift');
                    $('#exerciseModal3').load('/exercise/powerband-sumo-deadlift');";
                    imgExercise1.ImageUrl = "/media/13939/landscape_kettlebell_deadlift_step1.jpg";
                    imgExercise2.ImageUrl = "/media/14998/landscape_bb_deadlift_step1.jpg";
                    imgExercise3.ImageUrl = "/media/14992/landscape_bb_sumo_deadlift_step1.jpg";
                    lblExercise1.Text = "KB deadlift";
                    lblExercise2.Text = "BB deadlift";
                    lblExercise3.Text = "BB sumo deadlift";
                }
                break;

            case "Build Muscle":
                if (planArray[1] == "Home")
                {
                    tempScript += @"$('#exerciseModal1').load('/exercise/powerband-deadlift');
                    $('#exerciseModal2').load('/exercise/Powerband-good-morning');
                    $('#exerciseModal3').load('/exercise/bb-deadlift');";
                    imgExercise1.ImageUrl = "/media/14727/landscape_powerband_deadlift_step1.jpg";
                    imgExercise2.ImageUrl = "/media/14768/landscape_powerband_good_morning_step1.jpg";
                    imgExercise3.ImageUrl = "/media/14998/landscape_bb_deadlift_step1.jpg";
                    lblExercise1.Text = "Powerband deadlift";
                    lblExercise2.Text = "Powerband good morning";
                    lblExercise3.Text = "BB deadlift";
                }
                else
                {
                    tempScript += @"$('#exerciseModal1').load('/exercise/bb-rack-pull');
                    $('#exerciseModal2').load('/exercise/bb-deadlift');
                    $('#exerciseModal3').load('/exercise/bb-stiff-leg-deadlift');";
                    imgExercise1.ImageUrl = "/media/13967/landscape_rack_pull_step1.jpg";
                    imgExercise2.ImageUrl = "/media/14998/landscape_bb_deadlift_step1.jpg";
                    imgExercise3.ImageUrl = "/media/15085/landscape_bb_stiff_leg_deadlift_step1.jpg";
                    lblExercise1.Text = "Rack pull";
                    lblExercise2.Text = "BB deadlift";
                    lblExercise3.Text = "BB stiff leg deadlift";
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
            Response.Write("<script>alert('Your plan has not started yet.');</script>");
            return;
        }
        dbAccess.UpdateOrientationWeekDayResult(myPlan.Id, 2, 3, true);
        Response.Redirect("/orientation/day-2");
    }
}