using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using umbraco.cms.businesslogic.member;
public partial class UserControls_MemberLogin : System.Web.UI.UserControl
{
    protected PrizeDataAccess dbAccess = new PrizeDataAccess();
    protected void Page_Load(object sender, EventArgs e)
    {
    }
    protected void login_Click(object sender, ImageClickEventArgs e)
    {
     
    }
    protected void loginTest_Click(object sender, ImageClickEventArgs e)
    {
        bool bLogin = Membership.ValidateUser(username.Text, password.Text);
        if (bLogin != false)
        {
            Member uMember = Member.GetMemberFromLoginNameAndPassword(username.Text, password.Text);
            if (uMember != null)
            {
                Session["taRegistration"] = uMember.Email;
                System.Web.Security.FormsAuthentication.SetAuthCookie(uMember.LoginName, true);
                Member.AddMemberToCache(uMember);   //, true, new TimeSpan(0, timeout, 0));
                Member uMember1 = Member.GetCurrentMember();
                Response.Redirect(String.Format("{0}?program={1}&location={2}&level={3}&experience={4}", PrizeConstants.URL_MEMBER_BUY_PLAN, "Build muscle", "GYM", "Beginner", "Rookie"));
                return;
            }
        }
        errorLabel.Text = "Invalid UserId/password.";
    }
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        bool bLogin = Membership.ValidateUser(username.Text, password.Text);
        if (bLogin != false)
        {
            Member uMember = Member.GetMemberFromLoginNameAndPassword(username.Text, password.Text);
            if (uMember != null)
            {
                Session["taRegistration"] = uMember.Email;
                System.Web.Security.FormsAuthentication.SetAuthCookie(uMember.LoginName, true);
                Member.AddMemberToCache(uMember);
                MemberExercisePlan myPlan = dbAccess.GetCurrentMemberPlanOrStartingPlan(uMember.Id);
                int myPlanId = 0;
                if (myPlan != null)
                    myPlanId = myPlan.ExercisePlanId;
                PrizeMemberAuthUtils.SaveMemberLoginLog(uMember.Id, myPlanId, this.ToString(), "Login");
                if (myPlan == null)
                {
                    PrizeMember member = PrizeMemberAuthUtils.GetMemberData(uMember.Id);
                    PrizeMemberPlanManager planMan = new PrizeMemberPlanManager();
                    Response.Redirect(planMan.GetEmptyPlanJumpURL(member));
                }
                else
                {
					if (Request.QueryString["returnUrl"] != null)
                            Response.Redirect(Request.QueryString["returnUrl"]);
                    PrizeExercisePlan plan = dbAccess.GetExercisePlan(myPlan.ExercisePlanId);
                    if (plan.IsTrialPlan != 1)
                        Response.Redirect(String.Format("{0}?loginName={1}&memberId={2}", PrizeConstants.URL_MEMBER_COMING_UP, uMember.LoginName, uMember.Id));
                    else
                        Response.Redirect(String.Format("{0}?loginName={1}&memberId={2}", PrizeConstants.URL_MEMBER_LANDING, uMember.LoginName, uMember.Id));
                }
                //var log = new MemberVisitLogs();
                //log.UmbracoId = uMember.Id;
                //log.Page = HttpContext.Current.Request.Url.AbsolutePath;
                //log.CreatedOn = PrizeCommonUtils.GetSystemDate();
                //log.MembersReference.EntityKey = new EntityKey("SydneyCatalystMemberEntities.Members", "Id", member.Id);
                //db.AddToMemberVisitLogs(log);
                //db.SaveChanges();
                return;
            }
        }
        errorLabel.Text = "Invalid UserId/password.";
    }
}