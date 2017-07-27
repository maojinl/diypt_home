using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserControls_Orientation_Week : BaseOrientation
{
    protected void Page_Load(object sender, EventArgs e)
    {
        PrizeDataAccess db = new PrizeDataAccess();
        var exercisePlan = db.GetCurrentMemberPlanOrStartingPlan(PrizeMemberAuthUtils.GetMemberID());
        var nextMonday = exercisePlan.StartDate;
        //.Value.Next(DayOfWeek.Monday);
        int counter = 0;
        string weekLabel = "";
        //10 April - 17 April, 2017
        for (int d = 1; d <= 7; d++)
        {

            DateTime newDate = nextMonday.AddDays(counter);

            if (newDate.Date == DateTime.Now.Date)
            {
                dayView1.Attributes.Add("href", "/orientation/day-" + d);
                dayView2.Attributes.Add("href", "/orientation/day-" + d);
            }
            if (counter == 0)
                weekLabel += newDate.ToString("d MMMM");

            if (counter == 6)
                weekLabel += " - " + newDate.ToString("d MMMM, yyyy");

            Label tempLabel = this.FindControl(string.Format("lblDay{0}", d)) as Label;
            Label tempLabelDate = this.FindControl(string.Format("lblDate{0}", d)) as Label;
            if (tempLabel != null)
            {
                tempLabel.Text = newDate.ToString("d MMMM yyyy");
                tempLabelDate.Text = newDate.ToString("dddd");
            }
            counter++;
        }
        lblWeekly.Text = weekLabel;

        if (!IsPostBack)
        {
            MemberExercisePlan myPlan = dbAccess.GetCurrentMemberPlanOrStartingPlan(PrizeMemberAuthUtils.GetMemberID());
            for (int i = 1; i < 7; i++)
            {
                string result = dbAccess.GetOrientationWeekDayResult(myPlan.Id, i);
                string controlName = "";
                for (int j = 1; j <= 10; j++)
                {
                    controlName = "quest" + i + j;
                    var c = FindControl(controlName);
                    if (c == null)
                        break;
                    if (result[j - 1] == '0')
                        c.Visible = false;
                    else
                        c.Visible = true;
                }
            }
        }
    }
}