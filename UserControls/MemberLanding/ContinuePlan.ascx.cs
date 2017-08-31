using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserControls_ContinuePlan : BaseOrientation
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
            sPlanName = planName.Split('_');
            lblProg.Text = sPlanName[0];
            lblSem.Text = sPlanName[3].Replace("Semester", "");
            lblLvl.Text = sPlanName[2];
            lblLoc.Text = sPlanName[1];
            ddlLocation.Text = sPlanName[1];

            string continueType = Request.QueryString["type"];
            if(continueType != null && continueType == "new")
            {
                ddlProgram.Items[0].Text = "Select a new program";
            }
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string sLocation = ddlLocation.Text;
        string sProgram = lblProg.Text;
        string sLevel = lblLvl.Text;
        string sExp = "Semester " + lblSem.Text;

        if (ddlProgram.SelectedValue != "" && sProgram.ToLower() != ddlProgram.SelectedValue.ToLower() )
        {
            sProgram = ddlProgram.SelectedValue;
            sLevel = "Beginner";
            sExp = "Semester 1";
        }
        Response.Redirect(String.Format("{0}?program={1}&location={2}&level={3}&experience={4}",
            PrizeConstants.URL_MEMBER_BUY_PLAN, sProgram, 
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