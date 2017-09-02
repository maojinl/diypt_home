using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.IO;
using Umbraco.Core;

public partial class UserControls_UserProfile : BaseOrientation
{
    private PrizeMember member;

    protected void Page_Load(object sender, EventArgs e)
    {
        member = PrizeMemberAuthUtils.GetMemberData();
		var exercisePlan = dbAccess.GetCurrentMemberPlanOrStartingPlan(member.UmbracoId);
        if (exercisePlan == null)
		{
			var myPlan = dbAccess.GetNextMemberPlanNeedToPay(member.UmbracoId);
			if (myPlan != null)
			{
				Response.Redirect(String.Format("{0}?targetplanid={1}&targetmemberplanid={2}", PrizeConstants.URL_MEMBER_BUY_PLAN, myPlan.ExercisePlanId, myPlan.Id));
			}
			else
				return;
		}
		lblMsg.Text = "";
        LoadMemberDetails();
        if (!Page.IsPostBack)
            DisableValidatorsControls();
    }
    private void DisableValidatorsControls()
    {
        RfvUserName.Enabled = false;
        RfvGender.Enabled = false;
        RequiredFieldValidator7.Enabled = false;
        RegularExpressionValidator8.Enabled = false;
        RequiredFieldValidator8.Enabled = false;
        RegularExpressionValidator9.Enabled = false;
        RequiredFieldValidator9.Enabled = false;
        RequiredFieldValidator12.Enabled = false;
        RequiredFieldValidator10.Enabled = false;
        RequiredFieldValidator13.Enabled = false;
        RequiredFieldValidator11.Enabled = false;

    }
    protected string GetErrorMessage(MembershipCreateStatus status)
    {
        switch (status)
        {
            case MembershipCreateStatus.DuplicateUserName:
                return "Username already exists. Please enter a different user name.";

            case MembershipCreateStatus.DuplicateEmail:
                return "A username for that e-mail address already exists. Please enter a different e-mail address.";

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

    protected void LoadMemberDetails()
    {
        string username = member.Firstname + " " + member.Surname;
        this.lblFullName.Text = username;

        lblFirstName.Text = member.Firstname;
        lblLastName.Text = member.Surname;
        tbFirstName.Text = member.Firstname;
        tbLastName.Text = member.Surname;
        lblEmail.Text = member.Email;
        txtEmail.Text = member.Email;
        lblGender.Text = member.Gender;
        RdoGender.Text = member.Gender;
        if (member.DoB.HasValue)
        {
            txtDob.Text = member.DoB.Value.ToString("dd/MM/yyyy");
            lblDoB.Text = txtDob.Text;
        }
        lblStreetAddress.Text = member.StreetAddress;
        lblSuburb.Text = member.Suburb;
        lblState.Text = member.State;
        lblCountry.Text = member.Country;
        lblPostCode.Text = member.Postcode;
        lblMobile.Text = member.Mobile;
        lblPhone.Text = member.Phone;
        lblWhyDiypt.Text = member.WhyDIYPT;

        tbStreetAddress.Text = member.StreetAddress;
        tbSuburb.Text = member.Suburb;
        tbState.Text = member.State;
        tbCountry.Text = member.Country;
        tbPostCode.Text = member.Postcode;
        tbMobile.Text = member.Mobile;
        tbPhone.Text = member.Phone;
        tbWhyDiypt.Text = member.WhyDIYPT;

        PrizeDataAccess dbAccess = new PrizeDataAccess();
        MemberExercisePlan myPlan = dbAccess.GetCurrentMemberPlanOrStartingPlan(member.UmbracoId);
        if (myPlan != null)
        {
            PrizeExercisePlan plan = dbAccess.GetExercisePlan(myPlan.ExercisePlanId);
            lblGoalDec.Text = plan.PrizePlanProgram.Name;
            tbGoalDec.Text = plan.PrizePlanProgram.Name;
        }

        lblFacebook.Text = member.Facebook;
        lblInstagram.Text = member.Instagram;
        lblTwitter.Text = member.Twiter;
        tbFacebook.Text = member.Facebook;
        tbInstagram.Text = member.Instagram;
        tbTwitter.Text = member.Twiter;
        profilePhoto.ImageUrl = member.Photo;
        if (PrizeMemberAuthUtils.GetMemberSetting(member.UserSettings, PrizeConstants.MemberSettings.ShowProgram) == '1')
        {
            cbShowProgram.Checked = true;
            lblShowProgram.Text = "Yes";
        }
        else
        {
            cbShowProgram.Checked = false;
            lblShowProgram.Text = "No";
        }

        if (PrizeMemberAuthUtils.GetMemberSetting(member.UserSettings, PrizeConstants.MemberSettings.ShowLevel) == '1')
        {
            cbShowLevel.Checked = true;
            lblShowLevel.Text = "Yes";
        }
        else
        {
            cbShowLevel.Checked = false;
            lblShowLevel.Text = "No";
        }
    }
    protected void lbEditProfile_Click(Object sender, EventArgs e)
    {
        divViewProfile.Visible = false;
        divEditProfile.Visible = true;
        divViewPersonal.Visible = true;
        divEditPersonal.Visible = false;
        divViewAccount.Visible = true;
        divEditAccount.Visible = false;
        RfvFirstName.Enabled = true;
        RequiredFieldValidator1.Enabled = true;
        //Page.ClientScript.RegisterStartupScript(this.GetType(), "hash", "location.hash = '#MOVEHERE';", true);
    }
    protected void lbCancelEditProfile_Click(Object sender, EventArgs e)
    {
        divViewProfile.Visible = true;
        divEditProfile.Visible = false;
        DisableValidatorsControls();
        //Page.ClientScript.RegisterStartupScript(this.GetType(), "hash", "location.hash = '#MOVEHERE';", true);
    }
    protected void lbEditAccount_Click(Object sender, EventArgs e)
    {
        divViewAccount.Visible = false;
        divEditAccount.Visible = true;
        divViewProfile.Visible = true;
        divEditProfile.Visible = false;
        divViewPersonal.Visible = true;
        divEditPersonal.Visible = false;
        RfvUserName.Enabled = true;
        Page.ClientScript.RegisterStartupScript(this.GetType(), "hash", "location.hash = '#account';", true);
    }
    protected void lbCancelEditAccount_Click(Object sender, EventArgs e)
    {
        divViewAccount.Visible = true;
        divEditAccount.Visible = false;
        DisableValidatorsControls();
        Page.ClientScript.RegisterStartupScript(this.GetType(), "hash", "location.hash = '#account';", true);
    }

    protected void lbEditPersonal_Click(Object sender, EventArgs e)
    {
        divViewPersonal.Visible = false;
        divEditPersonal.Visible = true;
        divViewProfile.Visible = true;
        divEditProfile.Visible = false;
        divViewAccount.Visible = true;
        divEditAccount.Visible = false;
        RfvGender.Enabled = true;
        RequiredFieldValidator7.Enabled = true;
        RegularExpressionValidator8.Enabled = true;
        RequiredFieldValidator8.Enabled = true;
        RegularExpressionValidator9.Enabled = true;
        RequiredFieldValidator9.Enabled = true;
        RequiredFieldValidator12.Enabled = true;
        RequiredFieldValidator10.Enabled = true;
        RequiredFieldValidator13.Enabled = true;
        RequiredFieldValidator11.Enabled = true;
        Page.ClientScript.RegisterStartupScript(this.GetType(), "hash", "location.hash = '#personal';", true);
    }
    protected void lbCancelEditPersonal_Click(Object sender, EventArgs e)
    {
        divViewPersonal.Visible = true;
        divEditPersonal.Visible = false;
        DisableValidatorsControls();
        Page.ClientScript.RegisterStartupScript(this.GetType(), "hash", "location.hash = '#personal';", true);
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        try
        {
            //UpdateUserDetails();
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
    protected void btnSubmitProfile_Click(object sender, EventArgs e)
    {
        try
        {
            using (DIYPTEntities db = new DIYPTEntities())
            {
                try
                {
                    PrizeMember memberUpdating = (from c in db.PrizeMembers
                                                  where c.UmbracoId == member.UmbracoId
                                                  select c).FirstOrDefault();
                    memberUpdating.Firstname = tbFirstName.Text;
                    memberUpdating.Surname = tbLastName.Text;
                    memberUpdating.WhyDIYPT = tbWhyDiypt.Text;
                    memberUpdating.Facebook = tbFacebook.Text;
                    memberUpdating.Instagram = tbInstagram.Text;
                    memberUpdating.Twiter = tbTwitter.Text;
                    string s = null;
                    if (memberUpdating.UserSettings != null)
                        s = string.Copy(memberUpdating.UserSettings);
                    if (cbShowProgram.Checked == true)
                        PrizeMemberAuthUtils.SetMemberSetting(ref s, PrizeConstants.MemberSettings.ShowProgram, '1');
                    else
                        PrizeMemberAuthUtils.SetMemberSetting(ref s, PrizeConstants.MemberSettings.ShowProgram, '0');

                    if (cbShowLevel.Checked == true)
                        PrizeMemberAuthUtils.SetMemberSetting(ref s, PrizeConstants.MemberSettings.ShowLevel, '1');
                    else
                        PrizeMemberAuthUtils.SetMemberSetting(ref s, PrizeConstants.MemberSettings.ShowLevel, '0');
                    memberUpdating.UserSettings = s;
                    // db.PrizeMembers(member);

                    //photoUpload
                    if (photoUpload != null && !string.IsNullOrEmpty(photoUpload.FileName))
                    {
                        string attachmentServerPath = "";
                        string sSuffix = photoUpload.FileName.Substring(photoUpload.FileName.Length - 4);
                        string sServerFileName = memberUpdating.UmbracoId + "_" + PrizeCommonUtils.ParseDateTimeSimple(DateTime.Now) + "_" + sSuffix;

                        string uploadPath = HttpContext.Current.Server.MapPath("~/member_images");
                        //@"C:\workspace\asp_project\diypt.club\home\member_images";
                        attachmentServerPath = String.Format(@"http://{0}/member_images/{1}", HttpContext.Current.Request.Url.Authority, sServerFileName);
                        decimal attachmentFileSize = Math.Round(Convert.ToDecimal(photoUpload.PostedFile.ContentLength / 1024), 2);

                        //if (attachmentFileSize + Helper.GetTrialTotalAttachmentSize(TrialId) < Convert.ToDecimal(ConfigurationManager.AppSettings["TotalAttachmentSizeLimit"]))
                        if (attachmentFileSize < 15000)
                        {
                            string[] dirs = Directory.GetFiles(uploadPath);
                            string folderPath = String.Format(@"\{0}", sServerFileName);
                            string fullFilePath = uploadPath + folderPath;

                            photoUpload.SaveAs(fullFilePath);
                            memberUpdating.Photo = attachmentServerPath;
                        }
                    }

                    db.SaveChanges();

                }
                finally
                {
                    db.Database.Connection.Close();
                    divViewProfile.Visible = true;
                    divEditProfile.Visible = false;
                    DisableValidatorsControls();
                    member = PrizeMemberAuthUtils.GetMemberData();
                    LoadMemberDetails();
                }
            }
        }
        catch (MembershipCreateUserException me)
        {
            lblMsg.Text = GetErrorMessage(me.StatusCode);
			lblMsgTop.Text = lblMsg.Text;
        }
        catch (HttpException httpe)
        {
            lblMsg.Text = httpe.Message;
			lblMsgTop.Text = lblMsg.Text;
        }
    }
    protected void btnSubmitAccount_Click(object sender, EventArgs e)
    {
        try
        {
            if (txtPassword.Text != txtConfirmPwd.Text)
            {
                lblMsg.Text = "Error: Passwords do not match.";
				lblMsgTop.Text = lblMsg.Text;
                return;
            }
            using (DIYPTEntities db = new DIYPTEntities())
            {
                try
                {
                    PrizeMember memberUpdating = (from c in db.PrizeMembers
                                                  where c.UmbracoId == member.UmbracoId
                                                  select c).FirstOrDefault();

                    var mem = ApplicationContext.Current.Services.MemberService.GetByEmail(memberUpdating.Email);
                    memberUpdating.Email = txtEmail.Text;
                    ApplicationContext.Current.Services.MemberService.SavePassword(mem, txtPassword.Text);
                    db.SaveChanges();

                }
                finally
                {
                    db.Database.Connection.Close();
                    divViewAccount.Visible = true;
                    divEditAccount.Visible = false;
                    DisableValidatorsControls();
                    member = PrizeMemberAuthUtils.GetMemberData();
                    LoadMemberDetails();
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "hash", "location.hash = '#account';", true);
                }
            }
        }
        catch (MembershipCreateUserException me)
        {
            lblMsg.Text = GetErrorMessage(me.StatusCode);
			lblMsgTop.Text = lblMsg.Text;
        }
        catch (HttpException httpe)
        {
            lblMsg.Text = httpe.Message;
			lblMsgTop.Text = lblMsg.Text;
        }
    }
    protected void btnSubmitPersonal_Click(object sender, EventArgs e)
    {
        try
        {
            using (DIYPTEntities db = new DIYPTEntities())
            {
                try
                {
                    PrizeMember memberUpdating = (from c in db.PrizeMembers
                                                  where c.UmbracoId == member.UmbracoId
                                                  select c).FirstOrDefault();
                    memberUpdating.Gender = RdoGender.Text;
                    memberUpdating.StreetAddress = tbStreetAddress.Text;
                    memberUpdating.Suburb = tbSuburb.Text;
                    memberUpdating.State = tbState.Text;
                    memberUpdating.Country = tbCountry.Text;
                    memberUpdating.Postcode = tbPostCode.Text;
                    memberUpdating.Mobile = tbMobile.Text;
                    memberUpdating.Phone = tbPhone.Text;

                    DateTime tempDoB;
                    if (DateTime.TryParse(txtDob.Text, out tempDoB))
                        memberUpdating.DoB = tempDoB;

                    db.SaveChanges();

                }
                finally
                {
                    db.Database.Connection.Close();
                    divViewPersonal.Visible = true;
                    divEditPersonal.Visible = false;
                    DisableValidatorsControls();
                    member = PrizeMemberAuthUtils.GetMemberData();
                    LoadMemberDetails();
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "hash", "location.hash = '#personal';", true);
                }
            }
        }
        catch (MembershipCreateUserException me)
        {
            lblMsg.Text = GetErrorMessage(me.StatusCode);
			lblMsgTop.Text = lblMsg.Text;
        }
        catch (HttpException httpe)
        {
            lblMsg.Text = httpe.Message;
			lblMsgTop.Text = lblMsg.Text;
        }
    }

    //private void UpdateUserDetails()
    //{
    //    using (DIYPTEntities db = new DIYPTEntities())
    //    {
    //        try
    //        {
    //            PrizeMember memberUpdating = (from c in db.PrizeMembers
    //                                          where c.UmbracoId == member.UmbracoId
    //                                          select c).FirstOrDefault();
    //            memberUpdating.Firstname = tbFirstName.Text;
    //            memberUpdating.Surname = tbLastName.Text;
    //            memberUpdating.Email = txtEmail.Text;
    //            //member.Password = txtPassword.Text;
    //            memberUpdating.Gender = RdoGender.Text;
    //            //member.DoB = Convert.ToDateTime(txtDob.Text);
    //            memberUpdating.StreetAddress = tbStreetAddress.Text;
    //            memberUpdating.Suburb = tbSuburb.Text;
    //            memberUpdating.State = tbState.Text;
    //            memberUpdating.Country = tbCountry.Text;
    //            memberUpdating.Postcode = tbPostCode.Text;
    //            memberUpdating.Mobile = tbMobile.Text;
    //            memberUpdating.Phone = tbPhone.Text;
    //            //memberUpdating.GoalDescription = tbGoalDec.Text;
    //            memberUpdating.WhyDIYPT = tbWhyDiypt.Text;

    //            memberUpdating.Facebook = tbFacebook.Text;
    //            memberUpdating.Instagram = tbInstagram.Text;
    //            memberUpdating.Twiter = tbTwitter.Text;
    //            string s = null;
    //            if (memberUpdating.UserSettings != null)
    //                s = string.Copy(memberUpdating.UserSettings);
    //            if (cbShowProgram.Checked == true)
    //                PrizeMemberAuthUtils.SetMemberSetting(ref s, PrizeConstants.MemberSettings.ShowProgram, '1');
    //            else
    //                PrizeMemberAuthUtils.SetMemberSetting(ref s, PrizeConstants.MemberSettings.ShowProgram, '0');

    //            if (cbShowLevel.Checked == true)
    //                PrizeMemberAuthUtils.SetMemberSetting(ref s, PrizeConstants.MemberSettings.ShowLevel, '1');
    //            else
    //                PrizeMemberAuthUtils.SetMemberSetting(ref s, PrizeConstants.MemberSettings.ShowLevel, '0');
    //            memberUpdating.UserSettings = s;
    //            // db.PrizeMembers(member);

    //            //photoUpload
    //            if (photoUpload != null && !string.IsNullOrEmpty(photoUpload.FileName))
    //            {
    //                string attachmentServerPath = "";
    //                string sSuffix = photoUpload.FileName.Substring(photoUpload.FileName.Length - 4);
    //                string sServerFileName = memberUpdating.UmbracoId + "_" + PrizeCommonUtils.ParseDateTimeSimple(DateTime.Now) + "_" + sSuffix;

    //                string uploadPath = HttpContext.Current.Server.MapPath("~/member_images");
    //                    //@"C:\workspace\asp_project\diypt.club\home\member_images";
    //                attachmentServerPath = String.Format(@"http://{0}/member_images/{1}", HttpContext.Current.Request.Url.Authority, sServerFileName);
    //                decimal attachmentFileSize = Math.Round(Convert.ToDecimal(photoUpload.PostedFile.ContentLength / 1024), 2);

    //                //if (attachmentFileSize + Helper.GetTrialTotalAttachmentSize(TrialId) < Convert.ToDecimal(ConfigurationManager.AppSettings["TotalAttachmentSizeLimit"]))
    //                if (attachmentFileSize < 15000)
    //                {
    //                    string[] dirs = Directory.GetFiles(uploadPath);
    //                    string folderPath = String.Format(@"\{0}", sServerFileName);
    //                    string fullFilePath = uploadPath + folderPath;

    //                    photoUpload.SaveAs(fullFilePath);
    //                    memberUpdating.Photo = attachmentServerPath;
    //                }
    //                }

    //                db.SaveChanges();

    //        }
    //        finally
    //        {
    //            db.Database.Connection.Close();
    //        }
    //    }
    //}
}
