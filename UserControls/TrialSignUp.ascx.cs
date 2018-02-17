using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Transactions;
using umbraco.cms.businesslogic.member;
using System.Text;

public partial class UserControls_TrialSignUp : System.Web.UI.UserControl
{
    private DIYPTEntities db;

    protected void Page_Load(object sender, EventArgs e)
    {

    }



    protected string GetErrorMessage(MembershipCreateStatus status)
    {
        switch (status)
        {
            case MembershipCreateStatus.DuplicateUserName:
                return "Email address already exists. Please enter a different email address.";

            case MembershipCreateStatus.DuplicateEmail:
                return "A username for that email address already exists. Please enter a different email address.";

            case MembershipCreateStatus.InvalidPassword:
                return "The password provided is invalid. Please enter a valid password value.";

            case MembershipCreateStatus.InvalidEmail:
                return "The e-mail address provided is invalid. Please check the value and try again.";

            case MembershipCreateStatus.InvalidAnswer:
                return "The password retrieval answer provided is invalid. Please check the value and try again.";

            case MembershipCreateStatus.InvalidQuestion:
                return "The password retrieval question provided is invalid. Please check the value and try again.";

            case MembershipCreateStatus.InvalidUserName:
                return "The user name provided is invalid. Please check the value and try again.";

            case MembershipCreateStatus.ProviderError:
                return "The authentication provider returned an error. Please verify your entry and try again. If the problem persists, please contact your system administrator.";

            case MembershipCreateStatus.UserRejected:
                return "The user creation request has been canceled. Please verify your entry and try again. If the problem persists, please contact your system administrator.";

            default:
                return "An unknown error occurred. Please verify your entry and try again. If the problem persists, please contact your system administrator.";
        }
    }



    protected void btnClear_Click(object sender, EventArgs e)
    {
        Page.Response.Redirect(Page.Request.Url.ToString(), true);
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        try
        {
            if (!txtPassword.Text.Equals(txtConfirmPwd.Text))
            {
                lblMsg.Text = "The password and the confirmation password are not equal.";
                return;
            }

            string username = txtFirstName.Text + " " + tbLastName.Text;
            MembershipUser newUser = Membership.CreateUser(txtEmail.Text, txtPassword.Text, txtEmail.Text);

            bool bLogin = Membership.ValidateUser(txtEmail.Text, txtPassword.Text);
            if (bLogin != false)
            {
                Member uMember = Member.GetMemberFromLoginNameAndPassword(txtEmail.Text, txtPassword.Text);
                if (uMember != null)
                {
                    AddNewUserDetails(uMember.Id);
                    Session["taRegistration"] = uMember.Email;
                    System.Web.Security.FormsAuthentication.SetAuthCookie(uMember.LoginName, true);
                    Member.AddMemberToCache(uMember);   //, true, new TimeSpan(0, timeout, 0));
                    string sLocation = ddlLocation.Text;
                    string sProgram = ddlProgram.Text;
                    PrizeEmailWrapper.SendWelcomeEmail(PrizeMemberAuthUtils.GetMemberData(uMember.Id), uMember.LoginName, true);
                    Response.Redirect(String.Format("{0}?program={1}&location={2}&level={3}&experience={4}&Trial=1", PrizeConstants.URL_MEMBER_BUY_PLAN, sProgram, sLocation, "Beginner", "Semester 1"));
                    return;
                }
            }
            Response.Redirect("login.aspx");
        }
        catch (MembershipCreateUserException me)
        {
            lblMsg.Text = GetErrorMessage(me.StatusCode);
        }
        catch (HttpException httpe)
        {
            lblMsg.Text = httpe.Message;
        }
    }

    private void AddNewUserDetails(int newUserId)
    {

        using (DIYPTEntities db = new DIYPTEntities())
        {
            db.Database.Connection.Open();
            try
            {

                PrizeMember member = new PrizeMember();

                member.Firstname = txtFirstName.Text;
                member.Surname = tbLastName.Text;
                member.Email = txtEmail.Text;

                member.StreetAddress = tbStreetAddress.Text;
                member.Suburb = tbSuburb.Text;
                member.State = tbState.Text;
                member.Country = ddCountry.Text;
                member.Postcode = tbPostCode.Text;
                member.Mobile = tbMobile.Text;
                member.Phone = tbPhone.Text;

                StringBuilder sb = new StringBuilder();
                sb.Append(Q3.InnerText);
                sb.Append("\r\n");
                sb.Append(ddlQ3.Text);
                sb.Append("\r\n");
                sb.Append(Q4.InnerText);
                sb.Append("\r\n");
                sb.Append(ddlQ4.Text);
                sb.Append("\r\n");
                sb.Append(regQ4.InnerText);
                sb.Append("\r\n");
                sb.Append(Q5.InnerText);
                sb.Append("\r\n");
                sb.Append(regQ5.InnerText);
                sb.Append("\r\n");
                sb.Append(ddlQ6.Text);
                sb.Append("\r\n");
                sb.Append(regQ6.InnerText);
                sb.Append("\r\n");
				sb.Append(ddlQ7.Text);
				sb.Append("\r\n");
				sb.Append(regQ7.InnerText);
				sb.Append("\r\n");

				member.Questions = sb.ToString();
                
                member.UmbracoId = newUserId;
                member.RegisterDateTime = PrizeCommonUtils.GetSystemDate();
				char c = '1';
				if (!cbPromotionalPhoto.Checked)
				{
					c = '0';
				}
				member.UserSettings = PrizeConstants.DEFAULT_MEMBER_SETTINGS;
				string s = string.Copy(member.UserSettings);
				PrizeMemberAuthUtils.SetMemberSetting(ref s, PrizeConstants.MemberSettings.PromotionalPhoto, c);
				member.UserSettings = s;
				db.PrizeMembers.Add(member);
                db.SaveChanges();
            }
            finally
            {
                db.Database.Connection.Close();
            }
        }
    }

}


