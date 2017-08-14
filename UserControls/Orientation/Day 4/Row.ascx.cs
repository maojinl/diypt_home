using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserControls_Orientation_Day_4_Row : BaseOrientation
{
    protected void Page_Load(object sender, EventArgs e)
    {
        DateTime myDate = GetOrientationDate(4);
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
                    tempScript += @"$('#exerciseModal1').load('/exercise/Powerband-low-row');
                    $('#exerciseModal2').load('/exercise/Powerband-high-row');
                    $('#exerciseModal3').load('/exercise/Powerband-bent-over-row');";
                    imgExercise1.ImageUrl = "/media/14692/landscape_powerband_low_row_step1.jpg";
                    imgExercise2.ImageUrl = "/media/14695/landscape_powerband_high_row_step1.jpg";
                    imgExercise3.ImageUrl = "/media/14736/landscape_powerband_bent_over_row_step1.jpg";

                    lblExercise1.Text = "Powerband low row";
                    lblExercise2.Text = "Powerband high row";
                    lblExercise3.Text = "Powerband bent over row";
                }
                else
                {
                    tempScript += @"$('#exerciseModal1').load('/exercise/seated-row');
                    $('#exerciseModal2').load('/exercise/lat-pulldown');
                    $('#exerciseModal3').load('/exercise/Assisted-Powerband-pullups');";
                    imgExercise1.ImageUrl = "/media/14705/landscape_seated_row_step1.jpg";
                    imgExercise2.ImageUrl = "/media/15138/landscape_lat_pulldown_step1.jpg";
                    imgExercise3.ImageUrl = "/media/15073/landscape_assisted_powerband_pullups_step1.jpg";
                    lblExercise1.Text = "Seated row NG";
                    lblExercise2.Text = "Lat pulldown machine PG";
                    lblExercise3.Text = "Assisted Powerband pullups";
                }
                break;

            case "Build Muscle":
                if (planArray[1] == "Home")
                {

                    tempScript += @"$('#exerciseModal1').load('/exercise/Powerband-high-row');
                    $('#exerciseModal2').load('/exercise/Powerband-bent-over-row');
                    $('#exerciseModal3').load('/exercise/Powerband-lat-pulldown');";
                    imgExercise1.ImageUrl = "/media/14695/landscape_powerband_high_row_step1.jpg";
                    imgExercise2.ImageUrl = "/media/14736/landscape_powerband_bent_over_row_step1.jpg";
                    imgExercise3.ImageUrl = "/media/15054/landscape_powerband_lat_pulldown_step1.jpg";
                    lblExercise1.Text = "Powerband high row";
                    lblExercise2.Text = "Powerband bent over row";
                    lblExercise3.Text = "Powerband lat pulldown";

                }
                else
                {
                    tempScript += @"$('#exerciseModal1').load('/exercise/seated-row');
                    $('#exerciseModal2').load('/exercise/lat-pulldown');
                    $('#exerciseModal3').load('/exercise/Pullup-negatives');";
                    imgExercise1.ImageUrl = "/media/14705/landscape_seated_row_step1.jpg";
                    imgExercise2.ImageUrl = "/media/15138/landscape_lat_pulldown_step1.jpg";
                    imgExercise3.ImageUrl = "/media/14787/landscape_pullup_negatives_step1w.jpg";
                    lblExercise1.Text = "Seated row NG";
                    lblExercise2.Text = "Lat pulldown machine PG";
                    lblExercise3.Text = "Pullup negatives";
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
        dbAccess.UpdateOrientationWeekDayResult(myPlan.Id, 4, 3, true);
        Response.Redirect("/orientation/day-4");
    }
}