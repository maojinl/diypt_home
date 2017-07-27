using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserControls_Orientation_Day_4_Day4 : BaseOrientation
{
    protected void Page_Load(object sender, EventArgs e)
    {
        DateTime myDate = GetOrientationDate(4);
        lblDay.Text = myDate.ToString("dddd d").ToUpper();
        lblDate.Text = myDate.ToString("MMMM, yyyy");
        if (!IsPostBack)
        {
            MemberExercisePlan myPlan = dbAccess.GetCurrentMemberPlan(PrizeMemberAuthUtils.GetMemberID());
            string result = dbAccess.GetOrientationWeekDayResult(myPlan.Id, 4);
            if (result != null)
            {
                if (result[0] == '1')
                    CheckBox1.Checked = true;
                else
                    CheckBox1.Checked = false;
                if (result[1] == '1')
                    CheckBox2.Checked = true;
                else
                    CheckBox2.Checked = false;
                if (result[2] == '1')
                    CheckBox3.Checked = true;
                else
                    CheckBox3.Checked = false;
            }
        }
    }

    protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
    {
        int quest = 1;
        CheckBox cb = (CheckBox)sender;
        if (sender == this.CheckBox2)
            quest = 2;
        else if (sender == this.CheckBox3)
            quest = 3;
        MemberExercisePlan myPlan = dbAccess.GetCurrentMemberPlan(PrizeMemberAuthUtils.GetMemberID());
        dbAccess.UpdateOrientationWeekDayResult(myPlan.Id, 4, quest, cb.Checked);
    }
}