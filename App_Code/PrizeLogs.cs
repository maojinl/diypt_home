using System;
using System.Diagnostics;

/// <summary>
/// Summary description for PrizeLogs
/// </summary>
public static class PrizeLogs
{

	static public void SaveSystemErrorLog(int memberId, int? memberPlanId, PrizeConstants.SystemErrorLevel level, 
		string sWebPage, string sEvent, string sError, string sInnerError)
	{
		using (DIYPTEntities db = new DIYPTEntities())
		{
			var log = new PrizeErrorLog();
			log.MemberExercisePlanId = memberId;
			log.MemberExercisePlanId = memberPlanId;
			log.Page = sWebPage; //HttpContext.Current.Request.Url.AbsolutePath;'
			log.ErrorLevel = (int)level;
			log.LogDate = PrizeCommonUtils.GetSystemDate();
			log.Event = sEvent;
			log.Error = sError;
			log.InnerError = sInnerError;
			db.PrizeErrorLogs.Add(log);
			db.SaveChanges();
		}
	}

	static public void SaveSystemErrorLog(int memberId, int? memberPlanId, PrizeConstants.SystemErrorLevel level,
		string sWebPage, string sEvent, Exception ex)
	{
		using (DIYPTEntities db = new DIYPTEntities())
		{
			var log = new PrizeErrorLog();
			log.MemberExercisePlanId = memberId;
			log.MemberExercisePlanId = memberPlanId;
			log.Page = sWebPage; //HttpContext.Current.Request.Url.AbsolutePath;'
			log.ErrorLevel = (int)level;
			log.LogDate = PrizeCommonUtils.GetSystemDate();
			log.Event = sEvent;

			// Get stack trace for the exception with source file information
			var st = new StackTrace(ex, true);
			// Get the top stack frame
			var frame = st.GetFrame(st.FrameCount - 1);
			// Get the line number from the stack frame
			var line = frame.GetFileLineNumber();
			string sError = ex.Message + " Line_" + frame.GetFileLineNumber() + "\r\n" + ex.StackTrace;

			log.Error = sError;
			log.InnerError = "";
			if (ex.InnerException != null)
			{
				log.InnerError = ex.InnerException.Message + "\r\n" + ex.InnerException.StackTrace;

			db.PrizeErrorLogs.Add(log);
			db.SaveChanges();
		}
	}
}