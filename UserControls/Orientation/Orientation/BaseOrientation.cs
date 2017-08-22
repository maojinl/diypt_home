﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for BaseOrientation
/// </summary>
public class BaseOrientation : System.Web.UI.UserControl
{
    public BaseOrientation()
    {
        //
        // TODO: Add constructor logic here
        //

    }

    public static DateTime GetOrientationDate(int day)
    {
        PrizeDataAccess db = new PrizeDataAccess();
        var exercisePlan = db.GetMemberCurrentPlanInfo(1066);
        var nextMonday = exercisePlan.StartDate.Value.Next(DayOfWeek.Monday);
        
        return nextMonday.AddDays(day-1);
    }
}

public static class Extensions
{
    public static DateTime Next(this DateTime from, DayOfWeek dayOfWeek)
    {
        int start = (int)from.DayOfWeek;
        int target = (int)dayOfWeek;
        if (target <= start)
            target += 7;
        return from.AddDays(target - start);
    }
}