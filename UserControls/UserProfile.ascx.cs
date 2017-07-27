using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.IO;

public partial class UserControls_UserProfile : System.Web.UI.UserControl
{
    private PrizeMember member;

    protected void Page_Load(object sender, EventArgs e)
    {
        member = PrizeMemberAuthUtils.GetMemberData();
        LoadMemberDetails();
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

        tbFirstName.Text = member.Firstname;
        tbLastName.Text = member.Surname;
        txtEmail.Text = member.Email;
        RdoGender.Text = member.Gender;
        if (member.DoB.HasValue)
            txtDob.Text = member.DoB.Value.ToLongDateString();
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
            tbGoalDec.Text = plan.PrizePlanProgram.Name;
        }

        tbFacebook.Text = member.Facebook;
        tbInstagram.Text = member.Instagram;
        tbTwitter.Text = member.Twiter;
        profilePhoto.ImageUrl = member.Photo;
        if (PrizeMemberAuthUtils.GetMemberSetting(member.UserSettings, PrizeConstants.MemberSettings.ShowProgram) == '1')
            cbShowProgram.Checked = true;
        else
            cbShowProgram.Checked = false;

        if (PrizeMemberAuthUtils.GetMemberSetting(member.UserSettings, PrizeConstants.MemberSettings.ShowLevel) == '1')
            cbShowLevel.Checked = true;
        else
            cbShowLevel.Checked = false;

    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        try
        {
            UpdateUserDetails();
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

    private void UpdateUserDetails()
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
                memberUpdating.Email = txtEmail.Text;
                //member.Password = txtPassword.Text;
                memberUpdating.Gender = RdoGender.Text;
                //member.DoB = Convert.ToDateTime(txtDob.Text);
                memberUpdating.StreetAddress = tbStreetAddress.Text;
                memberUpdating.Suburb = tbSuburb.Text;
                memberUpdating.State = tbState.Text;
                memberUpdating.Country = tbCountry.Text;
                memberUpdating.Postcode = tbPostCode.Text;
                memberUpdating.Mobile = tbMobile.Text;
                memberUpdating.Phone = tbPhone.Text;
                //memberUpdating.GoalDescription = tbGoalDec.Text;
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
            }
        }
    }
}
