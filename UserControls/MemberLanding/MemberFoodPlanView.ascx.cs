using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserControls_MemberLanding_MemberFoodPlanView : System.Web.UI.UserControl
{
    protected PrizeDataAccess dbAccess = new PrizeDataAccess();
    protected void Page_Load(object sender, EventArgs e)
    {
        int memberId = PrizeMemberAuthUtils.GetMemberID();
        MemberExercisePlanWeek memberPlanWeek = dbAccess.GetCurrentMemberPlanWeek(memberId);
        if (memberPlanWeek == null)
            return;

        int iWeekNum = memberPlanWeek.Week;
        lblWeekNum.Text = "Week " + iWeekNum;
        lblDateDuration.Text = PrizeCommonUtils.ParseDateToEnglish(memberPlanWeek.StartDate) + " - "
            + PrizeCommonUtils.ParseDateToEnglish(memberPlanWeek.EndDate);

        MemberExercisePlan memberPlan = dbAccess.GetCurrentMemberPlan(memberId);
        if (memberPlan == null)
            return;
        PrizeExercisePlan plan = dbAccess.GetExercisePlan(memberPlan.ExercisePlanId);
        if (plan == null)
            return;
        lblPlanProgram.Text = plan.PrizePlanProgram.Name;

        MemberFoodPlanWeek foodWeek = dbAccess.GetMemberFoodPlanWeek(memberId, memberPlanWeek.MemberExercisePlanId, memberPlanWeek.Week);
        if (foodWeek == null)
            return;
        if (foodWeek.Food1 == null || foodWeek.Food1.Equals(""))
            this.colories.Visible = false;
        else
            lblFood1.Text = foodWeek.Food1;

        if (foodWeek.Food2 == null || foodWeek.Food2.Equals(""))
            this.protein.Visible = false;
        else
            lblFood2.Text = foodWeek.Food2;

        if (foodWeek.Food3 == null || foodWeek.Food3.Equals(""))
            this.carbo.Visible = false;
        else
            lblFood3.Text = foodWeek.Food3;

        if (foodWeek.Food4 == null || foodWeek.Food4.Equals(""))
            this.fats.Visible = false;
        else
            lblFood4.Text = foodWeek.Food4;
    }
}