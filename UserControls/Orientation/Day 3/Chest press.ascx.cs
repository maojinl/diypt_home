using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserControls_Orientation_Day_3_Chest_press : BaseOrientation
{
    protected void Page_Load(object sender, EventArgs e)
    {
        DateTime myDate = GetOrientationDate(3);
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
                    tempScript += @"$('#exerciseModal1').load('/exercise/pushups-on-knees');
                    $('#exerciseModal2').load('/exercise/powerband-push-press');
                    $('#exerciseModal3').load('/exercise/powerband-pushup-on-knees');";
                    imgExercise1.ImageUrl = "/media/13400/landscape_pushup_on_knees_step1.jpg";
                    imgExercise2.ImageUrl = "/media/14686/landscape_powerband_push_press_step1.jpg";
                    imgExercise3.ImageUrl = "/media/15048/landscape_powerband_pushup_on_knees.jpg";

                    lblExercise1.Text = "Pushups on knees";
                    lblExercise2.Text = "Powerband push press";
                    lblExercise3.Text = "Powerband pushup on knees";
                }
                else
                {
                    tempScript += @"$('#exerciseModal1').load('/exercise/pushups-on-knees');
                    $('#exerciseModal2').load('/exercise/bb-strict-press');
                    $('#exerciseModal3').load('/exercise/bb-push-press');";
                    imgExercise1.ImageUrl = "/media/13400/landscape_pushup_on_knees_step1.jpg";
                    imgExercise2.ImageUrl = "/media/13358/landscape_bb_strict_press_step1.jpg";
                    imgExercise3.ImageUrl = "/media/13357/landscape_bb_push_press_step1.jpg";
                    lblExercise1.Text = "Push ups on knees";
                    lblExercise2.Text = "BB strict press";
                    lblExercise3.Text = "BB push press";
                }
                break;

            case "Build Muscle":
                if (planArray[1] == "Home")
                {

                    tempScript += @"$('#exerciseModal1').load('/exercise/powerband-push-press');
                    $('#exerciseModal2').load('/exercise/Powerband-floor-chest-press');
                    $('#exerciseModal3').load('/exercise/Powerband-pushup-on-toes');";
                    imgExercise1.ImageUrl = "/media/14686/landscape_powerband_push_press_step1.jpg";
                    imgExercise2.ImageUrl = "/media/15015/landscape_powerband_floor_chest_press_step1.jpg";
                    imgExercise3.ImageUrl = "/media/15049/landscape_powerband-_pushup_on_toes.jpg";
                    lblExercise1.Text = "Powerband push press";
                    lblExercise2.Text = "Powerband floor chest press";
                    lblExercise3.Text = "Powerband pushup on toes";

                }
                else
                {
                    tempScript += @"$('#exerciseModal1').load('/exercise/Pushups-on-toes');
                    $('#exerciseModal2').load('/exercise/BB-flat-bench-press');
                    $('#exerciseModal3').load('/exercise/BB-incline-bench-press');";
                    imgExercise1.ImageUrl = "/media/13403/landscape_pushup_on_toes_step1.jpg";
                    imgExercise2.ImageUrl = "/media/13331/landscape_bb_flat_bench_press_step1.jpg";
                    imgExercise3.ImageUrl = "/media/13328/landscape_bb_incline_bench_press_step1.jpg";
                    lblExercise1.Text = "Pushups on toes";
                    lblExercise2.Text = "BB flat bench press";
                    lblExercise3.Text = "BB incline bench press";
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
        dbAccess.UpdateOrientationWeekDayResult(myPlan.Id, 3, 3, true);
        Response.Redirect("/orientation/day-3");
    }
}