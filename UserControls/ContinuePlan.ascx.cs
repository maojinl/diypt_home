using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserControls_ContinuePlan : System.Web.UI.UserControl
{
    protected DIYPTEntities db;
    protected PrizeMember member;
    protected PrizeExercisePlan plan;
    string planName;
    string[] sPlanName;
    PrizeDataAccess dbAcess = new PrizeDataAccess();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack)
            return;

        member = PrizeMemberAuthUtils.GetMemberData();
        /*if (dbAcess.RemainningWeeks(member.UmbracoId) > 0)
        {
            Response.Write(@"<SCRIPT LANGUAGE=""JavaScript"">alert('Not the last week')</SCRIPT>");
            this.btnSubmit.Enabled = false;
            return;
        }*/

        plan = dbAcess.GetNextPlanToBuy(member.UmbracoId);
        LoadUserDetails();
       
        if (plan == null)
        {
            Response.Write(@"<SCRIPT LANGUAGE=""JavaScript"">alert('There is no new plan to buy')</SCRIPT>");
            this.btnSubmit.Enabled = false;
            return;
        }
        else
        {
            planName = dbAcess.GetPlanName(plan);
            lblNextPlanName.Text = planName;
            sPlanName = planName.Split('_');
            ddlLocation.Text = sPlanName[1];
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string sLocation = ddlLocation.Text;
        planName = lblNextPlanName.Text;
        sPlanName = planName.Split('_');
        string sProgram = sPlanName[0];
        string sLevel = sPlanName[2];
        string sExp = sPlanName[3];
        Response.Redirect(String.Format("{0}?program={1}&location={2}&level={3}&experience={4}",
            PrizeConstants.URL_MEMBER_BUY_PLAN, sPlanName[0], 
            sLocation, sLevel, sExp));
    }

    private void LoadUserDetails()
    {

        string username = member.Firstname + " " + member.Surname;

        txtFirstName.Text = member.Firstname;
        tbLastName.Text = member.Surname;
        txtEmail.Text = member.Email;

        tbStreetAddress.Text = member.StreetAddress;
        tbSuburb.Text = member.Suburb;
        tbState.Text = member.State;
        ddCountry.Text = member.Country;
        tbPostCode.Text = member.Postcode;
        tbMobile.Text = member.Mobile;
        tbPhone.Text = member.Phone;
    }

}