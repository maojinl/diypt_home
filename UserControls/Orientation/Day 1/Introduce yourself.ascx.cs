using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserControls_Orientation_Day_1_Introduce_yourself : BaseOrientation
{
    protected void Page_Load(object sender, EventArgs e)
    {
        DateTime myDate = GetOrientationDate(1);
        lblDay.Text = myDate.ToString("dddd d").ToUpper();
        lblDate.Text = myDate.ToString("MMMM, yyyy");

        var member = PrizeMemberAuthUtils.GetMemberData();
        if(member.Photo != "")
            imgProfile.ImageUrl = member.Photo;
        else
            imgProfile.ImageUrl = "/images/icon-member.svg";

        if (IsPostBack)
            return;

        MemberExercisePlan myPlan = dbAccess.GetCurrentMemberPlan(PrizeMemberAuthUtils.GetMemberID());
        if (myPlan == null)
        {
            return;
        }

        string result = dbAccess.GetOrientationWeekDayResult(myPlan.Id, 1);
        if (result != null)
        {
            if (result[3] == '1')
                CheckBox1.Checked = true;
            else
                CheckBox1.Checked = false;
            if (result[4] == '1')
                CheckBox2.Checked = true;
            else
                CheckBox2.Checked = false;
            if (result[5] == '1')
                CheckBox3.Checked = true;
            else
                CheckBox3.Checked = false;
        }
    }

    protected void btnTaskDone_Click(object sender, EventArgs e)
    {
        MemberExercisePlan myPlan = dbAccess.GetCurrentMemberPlan(PrizeMemberAuthUtils.GetMemberID());
        if (myPlan == null)
        {
            Response.Write("<script>alert('Your plan has not started yet.');</script>");
            return;
        }
        dbAccess.UpdateOrientationWeekDayResult(myPlan.Id, 1, 1, true);
        Response.Redirect("/orientation/day-1/pre-ex-questionnaire");
    }

    protected void OnCheckedChangedMethod(object sender, EventArgs e)
    {
        MemberExercisePlan myPlan = dbAccess.GetCurrentMemberPlan(PrizeMemberAuthUtils.GetMemberID());
        if (myPlan == null)
        {
            Response.Write("<script>alert('Your plan has not started yet.');</script>");
            return;
        }

        CheckBox cb = (CheckBox)sender;
        int questNumber = 4;
        if (cb == this.CheckBox2)
            questNumber = 5;
        else if (cb == this.CheckBox3)
            questNumber = 6;

        dbAccess.UpdateOrientationWeekDayResult(myPlan.Id, 1, questNumber, cb.Checked);
    }
}