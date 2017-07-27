using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class UserControls_ComingUp : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        FillDate();
        if (!Page.IsPostBack)
        {
            if (Session["firstWeek1111"] == null)
            {
                Session["firstWeek1111"] = 1;
                string tempScript = @"<script>$(window).load(function() {
        $('#weekModal').modal('show');
    });</script>";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "modalWelcome", tempScript, false);
            }
                /*
                 *   
                 * */

        }
    }

    private void FillDate()
    {
        //DateTime tempdate = new DateTime(2017, 1, 10);
        //var nextSunday = tempdate.Next(DayOfWeek.Sunday);
        PrizeDataAccess db = new PrizeDataAccess();
            
            var exercisePlan = db.GetCurrentMemberPlanOrStartingPlan(PrizeMemberAuthUtils.GetMemberID());
        var nextSunday = exercisePlan.StartDate.NextDay(DayOfWeek.Sunday);
        int counter = 0;
        for (int i = 1; i < 14; i++)
        {
            Label dateLabel = this.FindControl(string.Format("week{0}Date", i)) as Label;
            if (dateLabel != null)
            {
                dateLabel.Text = nextSunday.AddDays((i-1) * 7).Date.ToString("dd/MM") + "-" + nextSunday.AddDays(i*7 - 1).Date.ToString("dd/MM");
            }
            for (int d = 1; d <= 7; d++)
            {
                if (nextSunday.AddDays(counter).Date == PrizeCommonUtils.GetSystemDate())
                {
                    
                    HtmlTableCell tempLabel = this.FindControl(string.Format("w{0}d{1}", i, d)) as HtmlTableCell;
                    if (tempLabel != null)
                        tempLabel.Attributes.Add("class", tempLabel.Attributes["class"] + " active");

                }
                //Label tempLabel = this.FindControl(string.Format("week{0}_{1}", i, d)) as Label;
                //if (tempLabel != null)
                //    tempLabel.Text = nextSunday.AddDays(counter).ToString("dd/M");
                counter++;
            }

        }
    }


}

static class Extensions
{
    public static DateTime NextDay(this DateTime from, DayOfWeek dayOfWeek)
    {
        int start = (int)from.DayOfWeek;
        int target = (int)dayOfWeek;
        if (target <= start)
            target += 7;
        return from.AddDays(target - start);
    }
}