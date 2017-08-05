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
                return "The email address provided is invalid. Please check the value and try again.";

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

    protected void Register()
    {
        try
        { 
            string username = txtFirstName.Text + " " + tbLastName.Text;

            string password = "";
            if (Session["pwd"] != null)
            {
                password = Session["pwd"].ToString();
                //txtConfirmPwd.Text = txtPassword.Text;
                Session["pwd"] = null;
            }
            else
                return;

            MembershipUser newUser = Membership.CreateUser(txtEmail.Text, password, txtEmail.Text);

            bool bLogin = Membership.ValidateUser(txtEmail.Text, password);
            if (bLogin != false)
            {
                Member uMember = Member.GetMemberFromLoginNameAndPassword(txtEmail.Text, password);
                if (uMember != null)
                {
                    AddNewUserDetails(uMember.Id);
                    Session["taRegistration"] = uMember.Email;
                    System.Web.Security.FormsAuthentication.SetAuthCookie(uMember.LoginName, true);
                    Member.AddMemberToCache(uMember);   //, true, new TimeSpan(0, timeout, 0));
                    string sLocation = ddlLocation.Text;
                    string sProgram = ddlProgram.Text;
                    string sLevel = ddlLevel.Text;
                    PrizeEmailWrapper.SendWelcomeEmail(PrizeMemberAuthUtils.GetMemberData(uMember.Id), uMember.LoginName);
                    Response.Redirect(String.Format("{0}?program={1}&location={2}&level={3}&experience={4}&Trial=1", PrizeConstants.URL_MEMBER_BUY_PLAN, sProgram, sLocation, sLevel, "Semester 1"));
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

    protected void btnSubmit_Click(object sender, EventArgs e)
    {

        if (txtFirstName.ReadOnly != true)
        {
            if (!txtPassword.Text.Equals(txtConfirmPwd.Text))
            {
                lblMsg.Text = "The password and the confirmation password are not equal.";
                return;
            }
            Session["pwd"] = txtPassword.Text;
            txtFirstName.ReadOnly = true;
            tbLastName.ReadOnly = true;
            txtEmail.ReadOnly = true;

            tbStreetAddress.ReadOnly = true;
            tbSuburb.ReadOnly = true;
            tbState.ReadOnly = true;
            ddCountry.Enabled = false;
            tbPostCode.ReadOnly = true;
            tbMobile.ReadOnly = true;
            tbPhone.ReadOnly = true;

            txtPassword.Visible = false;
            txtConfirmPwd.Visible = false;

            ddlLocation.Enabled = false;
            ddlProgram.Enabled = false;
            ddlLevel.Enabled = false;
            lblPassword.Visible = false;
            lblPassword1.Visible = false;
            Response.Write(
                       @"<SCRIPT LANGUAGE=""JavaScript"">alert('Please confirm your information')</SCRIPT>");
        }
        else
            Register();
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

                //member.Password = txtPassword.Text;
                /*member.Gender = RdoGender.Text;
                member.DoB = Convert.ToDateTime(txtDob.Text);

                member.Height = Convert.ToDecimal(tbHeight.Text);
                member.Weight = Convert.ToDecimal(tbWeight.Text);
                member.BodyFat = Convert.ToDecimal(tbBodayfat.Text);
                                    
                member.Waist = Convert.ToDecimal(tbWaist.Text);
                member.GoalWaist = Convert.ToDecimal(tbGoalWaist.Text);
                member.GoalWeight = Convert.ToDecimal(tbGoalWeight.Text);
                member.GoalBodyFat = Convert.ToDecimal(tbGoalBodayfat.Text);
                                */
                member.UmbracoId = newUserId;
                member.RegisterDateTime = PrizeCommonUtils.GetSystemDate();
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