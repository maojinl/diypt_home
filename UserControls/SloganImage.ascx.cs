using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserControls_SloganImage : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        var planType = "2";
            string tempScript = "<style>";
        PrizeDataAccess db = new PrizeDataAccess();
        var memberExercisePlan = db.GetCurrentMemberPlanOrStartingPlan(PrizeMemberAuthUtils.GetMemberID());
		
                    lblTop.Text = "WEIGHT BEARING EXERCISES";
                    lblMiddle.Text = "WHOLESOME FOODS";
                    lblBottom.Text = " REDUCED DOCTOR VISITS";
                    //weight
                    tempScript += @"
.container-fluid-header { background-image: url('/images/login/lose-weight/hero-lose-weight.jpg');}
@media (max-width:767px) {
.container-fluid-header { background-image: url('/images/login/lose-weight/hero-lose-weight-m.jpg');}
}
";

        if (memberExercisePlan != null)
        {
            var exercisePlan = db.GetExercisePlan(memberExercisePlan.ExercisePlanId);
            if (exercisePlan != null)
            {
                if (exercisePlan.PlanName.ToLower().Contains("weight"))
                    planType = "1";
                if (exercisePlan.PlanName.ToLower().Contains("muscle"))
                    planType = "2";
                if (exercisePlan.PlanName.ToLower().Contains("tone"))
                    planType = "3";
            }
            switch (planType)
            {
                case "1":
                    lblTop.Text = "WEIGHT BEARING EXERCISES";
                    lblMiddle.Text = "WHOLESOME FOODS";
                    lblBottom.Text = " REDUCED DOCTOR VISITS";
                    //weight
                    tempScript += @"
.container-fluid-header { background-image: url('/images/login/lose-weight/hero-lose-weight.jpg');}
@media (max-width:767px) {
.container-fluid-header { background-image: url('/images/login/lose-weight/m-hero-lose-weight.jpg');}
}
";
                    break;
                case "2":
                    lblTop.Text = "VOLUME";
                    lblMiddle.Text = "A MEAL EVERY 3 HOURS";
                    lblBottom.Text = " ARNIE ARMS";
                    tempScript += @"
.container-fluid-header { background-image: url('/images/login/build-strength/hero-build-strength.jpg');}
@media (max-width:767px) {
.container-fluid-header { background-image: url('/images/login/build-strength/m-hero-build-strength.jpg');}
}";
                    //muscle
                    break;
                case "3":
                    lblTop.Text = "MACRO COUNTING";
                    lblMiddle.Text = "WEIGHTS BASED TRAINING PROGRAM";
                    lblBottom.Text = " < 10% BODY FAT";
                    tempScript += @"
.container-fluid-header { background-image: url('/images/login/toneup/hero-tone-up.jpg');}

@media (max-width:767px) {
.container-fluid-header { background-image: url('/images/login/toneup/m-hero-tone-up.jpg');}
}

@media (min-width:1560px) {
.container-fluid-header { background-image: url('/images/login/toneup/hero-tone-up.jpg');}
background-size: 1400px; 
}
";
                    //tone
                    break;
                default:
                    break;
            }
        }
            tempScript += "</style>";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "sloganHeadImage", tempScript, false);
    }
}