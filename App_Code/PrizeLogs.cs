using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

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
}