using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for PrizeConstants
/// </summary>
public class PrizeConstants
{
    public enum GraphDrawType
    {
        DrawWeight,
        DrawWaist,
        DrawHip,
        DrawChest,
        DrawHeartRate
    }

    public enum TasksType
    {
        DailyRedoAble,
        DailyOnce
    }

    public enum MemberSettings
    {
        ShowProgram,
        ShowLevel,
        ShowedWeek1NotificationTimes
    }

    public enum MemberTasksConfig
    {
        Login21DayEmail,
        Task1
    }

    public static readonly string[] WEEK_DAY_NAMES =
        { "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"
    };

    public static readonly int[] WEEKS_NEEDS_RESULT = { 1, 5, 8, 11, 13};

    public const String STR_NO_TRAINNING = "REST DAY";

    public const string URL_MEMBER_LANDING = "~/my-account/Exercise-View";
    public const string URL_MEMBER_DAY_VIEW = "~/my-account/Exercise-Day-View";
    public const string URL_MEMBER_PROGRESS_STATUS = "~/my-account/Progress-Status";
    public const string URL_CHECKOUT_REVIEW = "~/Checkout/Checkout-Review";
    public const string URL_CHECKOUT_COMPLETE = "~/Checkout/Checkout-Complete";
    public const string URL_CHECKOUT_CANCEL = "~/Checkout/Checkout-Cancel";
    public const string URL_CHECKOUT_ERROR = "~/Checkout/Checkout-Error";
    public const string URL_MEMBER_BUY_PLAN = "~/buy-plan";
    public const string URL_MEMBER_COMING_UP = "~/my-account/coming-up#tab-bx-coming";

    public const int TIME_OUT = 20;

    public const String STATUS_PLAN_NOT_PAID = "N";
    public const String STATUS_PLAN_PAID = "P";
    public const String STATUS_PLAN_PAYMENT_CANCELLED = "C";

    public const String STATUS_PLAN_NOT_STARTED = "0";
    public const String STATUS_PLAN_STARTED = "1";
    public const String STATUS_PLAN_FINISHED = "2";

    public const String STATUS_PLAN_WEEK_NOT_STARTED = "0";
    public const String STATUS_PLAN_WEEK_STARTED = "1";
    public const String STATUS_PLAN_WEEK_FINISHED = "2";

    public const double GENERAL_PLAN_PRIZE = 33.99;

    public const int MAX_ORIENTATION_QUESTION = 70;

    public const int MAX_CONTINUOUS_LOGIN = 21;

    public const String WALLET_USER_NAME = "jerry.mao.au-facilitator_api1.gmail.com";
    public const String WALLET_PASSWORD = "T38GAH7S9YD7HDFG";
    public const String WALLET_SIGNATURE = "AFcWxV21C7fd0v3bYYYRCpSSRl31AAb7Ba0pk35icr1MyMz8i3EN1IOW";

    public const String DEFAULT_MEMBER_SETTINGS = "11111111111111111111";
    public const String DEFAULT_MEMBER_TASKS_CONFIG = "0000000000000000000000000000000";

    public enum EmailType
    {
        WelcomeEmail = 1,
        TwoDaysPrior2Start,
        OneDaysPrior2Week4,
        OneDaysPrior2Week11,
        ContinuousLogin
    }

    public enum EmailStatus
    {
        Shceduled = 1,
        Failed,
        Succeeded
    }

	public enum SystemErrorLevel
	{
		LevelNormal = 1,
		LevelMidium,
		LevelSerious
	}

	public PrizeConstants()
    {
        //
        // TODO: Add constructor logic here
        //
    }
  
}