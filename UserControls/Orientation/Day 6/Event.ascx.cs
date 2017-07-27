﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserControls_Orientation_Day_6_Calendar : BaseOrientation
{
    protected void Page_Load(object sender, EventArgs e)
    {
        DateTime myDate = GetOrientationDate(6);
        lblDay.Text = myDate.ToString("dddd d").ToUpper();
        lblDate.Text = myDate.ToString("MMMM, yyyy");

    }

    protected void btnTaskDone_Click(object sender, EventArgs e)
    {
        MemberExercisePlan myPlan = dbAccess.GetCurrentMemberPlan(PrizeMemberAuthUtils.GetMemberID());
        dbAccess.UpdateOrientationWeekDayResult(myPlan.Id, 6, 2, true);
        Response.Redirect("/orientation/day-6/mark-on-your-calendar-diary-your-shopping-days");
    }
}