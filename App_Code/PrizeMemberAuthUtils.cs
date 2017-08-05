using System;
using System.Linq;
using System.Text;
using System.Web.Security;

/// <summary>
/// Summary description for Class1
/// </summary>
public class PrizeMemberAuthUtils
{

    public PrizeMemberAuthUtils()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    static public bool CurrentUserLogin()
    {
        umbraco.cms.businesslogic.member.Member uMember;
        MembershipUser aMember;
        aMember = Membership.GetUser();
        if (aMember != null)
        {
            return true;
        }
        else
        {
            uMember = umbraco.cms.businesslogic.member.Member.GetCurrentMember();
            if (uMember != null)
                return true;
        }
        return false;
    }

    static public int GetMemberID()
    {
        umbraco.cms.businesslogic.member.Member uMember;
        MembershipUser aMember;
        aMember = Membership.GetUser();
        if (aMember != null)
            return Int32.Parse(aMember.ProviderUserKey.ToString());
        else
        {
            uMember = umbraco.cms.businesslogic.member.Member.GetCurrentMember();
            if (uMember != null)
                return uMember.Id;
        }
        return -1;
    }

    static public string GetMemberName()
    {
        umbraco.cms.businesslogic.member.Member uMember;
        MembershipUser aMember;
        aMember = Membership.GetUser();
        if (aMember != null)
            return aMember.UserName;
        else
        {
            uMember = umbraco.cms.businesslogic.member.Member.GetCurrentMember();
            if (uMember != null)
                return uMember.LoginName;
        }
        return "";
    }

    static public string GetMemberEmail()
    {
        umbraco.cms.businesslogic.member.Member uMember;
        MembershipUser aMember;
        aMember = Membership.GetUser();
        if (aMember != null)
            return aMember.Email;
        else
        {
            uMember = umbraco.cms.businesslogic.member.Member.GetCurrentMember();
            if (uMember != null)
                return uMember.Email;
        }
        return "";
    }

    static public PrizeMember GetMemberData()
    {
        int memberId = GetMemberID();
        using (DIYPTEntities db = new DIYPTEntities())
        {
            //db.Database.Connection.Open();
            PrizeMember member = (from c in db.PrizeMembers
                                  where c.UmbracoId == memberId
                                  select c).FirstOrDefault();
            return member;
            //db.Database.Connection.Close();
        }
    }

    static public char GetMemberSetting(string userSettings, PrizeConstants.MemberSettings setting)
    {
        char c = '0';
        int n = (int)setting;
        if (userSettings == null || userSettings.Length < n)
            return c;
        c = userSettings[n];
        return c;
    }

    static public bool SetMemberSetting(ref string userSettings, PrizeConstants.MemberSettings setting, char value)
    {
        int n = (int)setting;
        if (userSettings == null)
            userSettings = PrizeConstants.DEFAULT_MEMBER_SETTINGS;

        if (userSettings.Length < PrizeConstants.DEFAULT_MEMBER_SETTINGS.Length)
            for (int i = userSettings.Length; i < PrizeConstants.DEFAULT_MEMBER_SETTINGS.Length; i++)
                userSettings += "0";
        char[] arr = userSettings.ToArray();
        arr[n] = value;
        userSettings = new string(arr);
        return true;
    }

    static public char GetMemberTaskConfig(string memberTasks, int iIndex)
    {
        char c = '0';
        int n = iIndex;
        if (memberTasks == null || memberTasks.Length < n)
            return c;
        c = memberTasks[n];
        return c;
    }

    static public bool SetMemberTaskConfig(ref string memberTasks, int iIndex, char value)
    {
        int n = iIndex;
        if (memberTasks == null)
            memberTasks = PrizeConstants.DEFAULT_MEMBER_TASKS_CONFIG;

        if (memberTasks.Length < PrizeConstants.DEFAULT_MEMBER_TASKS_CONFIG.Length)
            for (int i = memberTasks.Length; i < PrizeConstants.DEFAULT_MEMBER_TASKS_CONFIG.Length; i++)
                memberTasks += "0";
        char[] arr = memberTasks.ToArray();
        arr[n] = value;
        memberTasks = new string(arr);
        return true;
    }

    static public bool IsMemberAdmin(umbraco.cms.businesslogic.member.Member uMember)
    {
        foreach (var group in uMember.Groups.Values)
            if (group.ToString().Contains("DIYPT_Admin"))
                return true;
        return false;
    }

    static public PrizeMember GetMemberData(int memberId)
    {
        using (DIYPTEntities db = new DIYPTEntities())
        {
            //db.Database.Connection.Open();
            PrizeMember member = (from c in db.PrizeMembers
                                  where c.UmbracoId == memberId
                                  select c).FirstOrDefault();
            return member;
            //db.Database.Connection.Close();
        }
    }

    static public string GetMemberAnswer(PrizeMember member, int questionNumber)
    {
        string sRet = "";
        char[] c = "\r\n".ToCharArray();
        string[] questionAnwsers = member.Questions.Split(c);
        int iIndex = (questionNumber - 1) * 2 + 1;
        if (iIndex < questionAnwsers.Length)
            sRet = questionAnwsers[iIndex];
        return sRet;
    }

    static public int GetMemberWeek1NotifiedTimes(PrizeMember member)
    {
        char c = GetMemberSetting(member.UserSettings, PrizeConstants.MemberSettings.ShowedWeek1NotificationTimes);
        StringBuilder sb = new StringBuilder();
        sb.Append(c);
        int i = int.Parse(sb.ToString());
        return i;
    }

    static public int AddMemberWeek1NotifiedTimes(PrizeMember member)
    {
        using (DIYPTEntities db = new DIYPTEntities())
        {
            PrizeMember memberUpdating = (from table in db.PrizeMembers
                                            where table.UmbracoId == member.UmbracoId
                                          select table).FirstOrDefault();
            char c = GetMemberSetting(memberUpdating.UserSettings, PrizeConstants.MemberSettings.ShowedWeek1NotificationTimes);
            StringBuilder sb = new StringBuilder();
            sb.Append(c);
            int i = int.Parse(sb.ToString());
            if (i < 9)
                i++;
            sb.Clear();
            sb.Append(i.ToString());
            string s = string.Copy(memberUpdating.UserSettings);
            SetMemberSetting(ref s, PrizeConstants.MemberSettings.ShowedWeek1NotificationTimes, sb[0]);
            memberUpdating.UserSettings = s;
            db.SaveChanges();
            return i;
        }
    }

    static public void SaveMemberLoginLog(int memberId, int? memberPlanId, string sWebPage, string sEvent, string sError = null)
    {
        using (DIYPTEntities db = new DIYPTEntities())
        {
            PrizeMember member = (from table in db.PrizeMembers
                                          where table.UmbracoId == memberId
                                          select table).FirstOrDefault();

            var log = new PrizeMemberLog();
            log.MemberId = memberId;
            log.MemberExercisePlanId = memberPlanId;
            log.Page = sWebPage; //HttpContext.Current.Request.Url.AbsolutePath;
            log.LogDate = PrizeCommonUtils.GetSystemDate();
            log.Event = sEvent;
            log.Error = sError;
            db.PrizeMemberLogs.Add(log);

            DateTime dtYesterdayStart = PrizeCommonUtils.GetDayStart(log.LogDate.AddDays(-1));
            DateTime dtYesterdayEnd = PrizeCommonUtils.GetDayEnd(log.LogDate.AddDays(-1));

            PrizeMemberLog yesterdayLogin = (from table in db.PrizeMemberLogs
                                             where table.MemberId == memberId && table.LogDate >= dtYesterdayStart && table.LogDate <= dtYesterdayEnd
                                             select table).FirstOrDefault();
            if (yesterdayLogin != null && member.ContinuousLogin < PrizeConstants.MAX_CONTINUOUS_LOGIN)
                member.ContinuousLogin++;
            else
                member.ContinuousLogin = 1;

            if (member.ContinuousLogin >= PrizeConstants.MAX_CONTINUOUS_LOGIN)
            {
                PrizeEmailWrapper.SendMemberConintuousLoginEmail(member);
            }

            db.SaveChanges();
        }
    }
}