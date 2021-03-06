﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for PrizeConstants
/// </summary>
public static class PrizeConstants
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

	public enum PresetTasksType
	{
		YearlyEmailNewYear = 1,
		YearlyEmailEaster,
		YearlyEmailChristmas
	}

	public enum MemberSettings
	{
		ShowProgram,
		ShowLevel,
		ShowedWeek1NotificationTimes,
		PromotionalPhoto
	}

	public enum MemberTasksConfig
	{
		Login21DayEmail,
		Task1
	}

	public static readonly string[] WEEK_DAY_NAMES =
		{ "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"
	};

	public static readonly int[] WEEKS_NEEDS_RESULT = { 0, 4, 7, 10, 12};

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
	public const string URL_MEMBER_CONTINUE_PLAN = "~/continuePlan";
	public const string URL_EZIDEBIT_LOGIN_WEEKLY = "https://secure.ezidebit.com.au/webddr/Request.aspx?a=093E3FE3-E747-4909-B457-C0FA23BC9E68&debits=2&ramount=28.35&aFreq=1&dur=4&tpay=13&nouRef=1";
	public const string URL_EZIDEBIT_LOGIN_FULLY = "https://secure.ezidebit.com.au/webddr/Request.aspx?a=093E3FE3-E747-4909-B457-C0FA23BC9E68&debits=1&oamount=313.70&nouRef=1";
	public const string URL_EZIDEBIT_LOGIN_TRIAL = "https://secure.ezidebit.com.au/webddr/Request.aspx?a=093E3FE3-E747-4909-B457-C0FA23BC9E68&debits=1&oamount=14.00&nouRef=1";
	public const string URL_MEMBER_PLAN_SUSPENDED = "~/plan-suspended";

	public const int TIME_OUT = 20;

	public const String STATUS_PLAN_NOT_PAID = "N";
	public const String STATUS_PLAN_PAID = "P";
	public const String STATUS_PLAN_PAYMENT_CANCELLED = "C";
	public const String STATUS_PLAN_MANUAL_PAYMENT = "M";

	public const String STATUS_PLAN_NOT_STARTED = "0";
	public const String STATUS_PLAN_STARTED = "1";
	public const String STATUS_PLAN_FINISHED = "2";
	public const String STATUS_PLAN_SUSPENDED = "3";
	public const String STATUS_PLAN_TERMINATED = "4";

	public const String STATUS_PLAN_MANUAL_PAYMENT_NOT_APPROVED = "0";
	public const String STATUS_PLAN_MANUAL_PAYMENT_APPROVED = "1";
	public const String STATUS_PLAN_MANUAL_PAYMENT_TERMINATED = "2";
	public const String STATUS_PLAN_MANUAL_PAYMENT_WEEKLY = "W";
	public const String STATUS_PLAN_MANUAL_PAYMENT_FULLY = "F";

	public const String STATUS_PLAN_WEEK_NOT_STARTED = "0";
	public const String STATUS_PLAN_WEEK_STARTED = "1";
	public const String STATUS_PLAN_WEEK_FINISHED = "2";
	public const String STATUS_PLAN_WEEK_SUSPENDED = "3";
	public const String STATUS_PLAN_WEEK_TERMINATED = "4";

	public const double GENERAL_PLAN_PRIZE = 33.99;

	public const int MAX_ORIENTATION_QUESTION = 70;

	public const int MAX_CONTINUOUS_LOGIN = 21;

	public const String WALLET_USER_NAME = "jonathan.guico_api1.gmail.com";
	public const String WALLET_PASSWORD = "MLZFQT92E3F453GD";
	public const String WALLET_SIGNATURE = "AFcWxV21C7fd0v3bYYYRCpSSRl31AF2zdK7rGKe5UJO3wYPYC3wjo4UZ";

	public const String DEFAULT_MEMBER_SETTINGS = "11111111111111111111";
	public const String DEFAULT_MEMBER_TASKS_CONFIG = "0000000000000000000000000000000";
	public const String CONST_JS_WARNING_PLAN_NOT_START = "<script>alert('Your plan will start on next Monday.');</script>";

	public enum EmailType
	{
		WelcomeEmail = 1,
		TwoDaysPrior2Start,
		OneDaysPrior2Week4Normal,
		OneDaysPrior2Week4Vegan,
		OneDaysPrior2Week4Lactose,
		OneDaysPrior2Week11,
		ContinuousLogin,
		NewYearEmail,
		EasterEmail,
		ChristmasEmail,
		BirthdayEmail,
		FirstMonthEmail,
		SecondMonthEmail,
		ThirdMonthEmail,
		TwoDaysPrior2End,
		OneDayPrior2TrialEnd,
		MileStoneWeek2,
		MileStoneWeek6,
		MileStoneWeek10,
		MileStoneWeek12,
		MileStoneEndWeek12,
		MileStoneGoalWeek13,
		MeasurmentWeek4,
		MeasurmentWeek7,
		MeasurmentWeek12,
		MeasurmentMissedWeek4,
		MeasurmentMissedWeek7,
		MeasurmentMissedWeek12,
		FisrtDayOnWeek1,
		ReviveMeEmail,
		MeasurmentWeek10,
		MeasurmentMissedWeek10,
		WelcomeEmailTrial,
		ReviveMeEmailTrial,
		FisrtDayOnWeek1Trial,
		NewYearEmailTrial,
		EasterEmailTrial,
		ChristmasEmailTrial,
		BirthdayEmailTrial,
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
		LevelMedium,
		LevelSerious
	}
}