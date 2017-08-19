using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserControls_Orientation_Day_1_Get_Familiar_with_the_squat : BaseOrientation
{
    protected void Page_Load(object sender, EventArgs e)
    {
        DateTime myDate = GetOrientationDate(1);
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

        var acc = new PrizeDataAccess();
        var planDetails = acc.GetPlanName(plan);
        var planArray = planDetails.Split('_');
        switch (planArray[0])
        {

            case "Lose Weight":
            case "Tone Up":
                if (planArray[1] == "Home")
                {
                    tempScript += @"$('#exerciseModal1').load('/exercise/squat');
                    $('#exerciseModal2').load('/exercise/powerband-front-squat');
                    $('#exerciseModal3').load('/exercise/powerband-back-squat');";
                    imgExercise1.ImageUrl = "/media/14986/landscape_bw_squat_step1.jpg";
                    imgExercise2.ImageUrl = "/media/14724/landscape_powerband_front_raise_step1.jpg";
                    imgExercise3.ImageUrl = "/media/14739/landscape_powerband_back_squat_step1.jpg";

                    lblExercise1.Text = "BW squat";
                    lblExercise2.Text = "Powerband front squat";
                    lblExercise3.Text = "Powerband back squat";
                }
                else
                {
                    tempScript += @"$('#exerciseModal1').load('/exercise/squat');
                    $('#exerciseModal2').load('/exercise/bb-back-squat');
                    $('#exerciseModal3').load('/exercise/bb-front-squat');";
                    imgExercise1.ImageUrl = "/media/14986/landscape_bw_squat_step1.jpg";
                    imgExercise2.ImageUrl = "/media/13366/landscape_bb_back_squat_step1.jpg";
                    imgExercise3.ImageUrl = "/media/13373/landscape_bb_front_squat_step1.jpg";
                    lblExercise1.Text = "BW squat";
                    lblExercise2.Text = "BB back squat";
                    lblExercise3.Text = "BB front squat";
                }
                break;

            case "Build Muscle":
                if (planArray[1] == "Home")
                {
                    tempScript += @"$('#exerciseModal1').load('/exercise/squat');
                    $('#exerciseModal2').load('/exercise/bb-pulse-squat');
                    $('#exerciseModal3').load('/exercise/bb-front-squat');";
                    imgExercise1.ImageUrl = "/media/14986/landscape_bw_squat_step1.jpg";
                    imgExercise2.ImageUrl = "/media/14673/landscape_bb_pulse_squat.jpg";
                    imgExercise3.ImageUrl = "/media/13373/landscape_bb_front_squat_step1.jpg";
                    lblExercise1.Text = "BW squat";
                    lblExercise2.Text = "BB pulse squat";
                    lblExercise3.Text = "BB front squat";
                }
                else
                {
                    tempScript += @"$('#exerciseModal1').load('/exercise/squat');
                    $('#exerciseModal2').load('/exercise/bb-back-squat');
                    $('#exerciseModal3').load('/exercise/bb-front-squat');";
                    imgExercise1.ImageUrl = "/media/14986/landscape_bw_squat_step1.jpg";
                    imgExercise2.ImageUrl = "/media/13366/landscape_bb_back_squat_step1.jpg";
                    imgExercise3.ImageUrl = "/media/13373/landscape_bb_front_squat_step1.jpg";
                    lblExercise1.Text = "BW squat";
                    lblExercise2.Text = "BB back squat";
                    lblExercise3.Text = "BB front squat";
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
        dbAccess.UpdateOrientationWeekDayResult(myPlan.Id, 1, 3, true);
        Response.Redirect("/orientation/day-1");
    }
}