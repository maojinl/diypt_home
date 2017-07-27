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
        PrizeDataAccess db = new PrizeDataAccess();
        var memberExercisePlan = db.GetCurrentMemberPlanOrStartingPlan(PrizeMemberAuthUtils.GetMemberID());
        if (memberExercisePlan != null)
        {
            var exercisePlan = db.GetExercisePlanInfo(memberExercisePlan.ExercisePlanId);
            if (exercisePlan.Tables[0].Rows.Count != 0)
            {
                if (exercisePlan.Tables[0].Rows[0]["ProgramName"].ToString().ToLower().Contains("lose weight"))
                    planType = "1";
                if (exercisePlan.Tables[0].Rows[0]["ProgramName"].ToString().Contains("build muscle"))
                    planType = "2";
                if (exercisePlan.Tables[0].Rows[0]["ProgramName"].ToString().Contains("tone up"))
                    planType = "3";
            }
            string tempScript = "<style>";
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
.container-fluid-header { background-image: url('/images/login/lose-weight/hero-lose-weight-m.jpg');}
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
.container-fluid-header { background-image: url('/images/login/build-strength/hero-build-strength-m.jpg');}
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
.container-fluid-header { background-image: url('/images/login/toneup/hero-tone-up-m.jpg');}
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

            tempScript += "</style>";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "sloganHeadImage", tempScript, false);
        }
    }
}