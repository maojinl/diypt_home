using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for PrizeCommonUtils
/// </summary>
public static class PrizeCommonUtils
{
    static public DateTime GetDayStart(DateTime date)
    {
        DateTime dt = DateTime.Parse(date.ToString("yyyy-MM-dd") + " 00:00:00");
        return dt;
    }

    static public DateTime GetDayEnd(DateTime date)
    {
        DateTime dt = DateTime.Parse(date.ToString("yyyy-MM-dd") + " 23:59:59");
        return dt;
    }

    static public DateTime GetNextWeekStart(DateTime date)
    {
        int remainDays = 7 - (int)date.GetDayOfWeek() + 1;
        DateTime startDate = date.AddDays(remainDays);
        DateTime dt = DateTime.Parse(startDate.ToString("yyyy-MM-dd") + " 00:00:00");
        return dt;
    }

    static public DateTime GetWeekEnd(DateTime date)
    {
        int remainDays = 7 - (int)date.GetDayOfWeek() + 1;
        DateTime endDate = date.AddDays(remainDays);
        DateTime dt = DateTime.Parse(endDate.ToString("yyyy-MM-dd") + " 00:00:00").AddSeconds(-1);
        return dt;
    }

    static public DateTime GetYearStart(DateTime date)
    {
        DateTime dt = DateTime.Parse(date.ToString("yyyy") + "-01-01 00:00:00");
        return dt;
    }

    static public DateTime GetYearEnd(DateTime date)
    {
        DateTime dt = DateTime.Parse(date.ToString("yyyy") + "-12-31 00:00:00");
        return dt;
    }

    static public int GetDayOfWeek(this DateTime dt)
    {
        if (dt.DayOfWeek == 0)
            return 7;
        return (int)dt.DayOfWeek;
    }

    static public string ParseDateTime(DateTime date)
    {
        string s = date.ToString("yyyy-MM-dd HH:mm:ss");
        return s;
    }

    static public string ParseDateTimeSimple(DateTime date)
    {
        string s = date.ToString("yyyyMMdd");
        return s;
    }

    static public string ParseDateToEnglish(DateTime date)
    {
        string s = date.ToString("dd MMMM yyyy", new CultureInfo("en-GB"));
        return s;
    }

    static public string ParseWeekDayToEnglish(int day)
    {
        return PrizeConstants.WEEK_DAY_NAMES[day - 1];
    }

    static public string FormatExerciseNumber(decimal d)
    {
        return d.ToString("0,0.00");
    }

    static public DateTime GetSystemDate()
    {
        DateTime dt = DateTime.Now;
        bool bTest = true;
        if (!bTest)
            return dt;
        using (DIYPTEntities db = new DIYPTEntities())
        {
            PrizeSysConfig conf = (from c in db.PrizeSysConfigs
                select c).FirstOrDefault();
            if (conf != null && conf.SystemDate.HasValue)
                dt = conf.SystemDate.Value;
        }
        return dt;
    }
}