﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserControls_MemberBuyPlan : BaseOrientation
{
    PrizeDataAccess dbAccess = new PrizeDataAccess();
	bool IsTrial = false;
    protected void Page_Load(object sender, EventArgs e)
    {
		string PaymentURL = "";
        if (!IsPostBack)
        {
            string sProgram = Request.QueryString["program"];
            string sLocation = Request.QueryString["location"];
            string sLevel = Request.QueryString["level"];
            string sExp = Request.QueryString["experience"];

            string sPlanId = Request.QueryString["targetplanid"];
            string sMyPlanId = Request.QueryString["targetmemberplanid"];

			PaymentURL = Request.QueryString["paymenturl"];

			if (Request.UrlReferrer != null)
			{
				string referer = Request.UrlReferrer.ToString();
				if(referer.Contains("signup")|| referer.Contains("continue"))
					lblMsg.Text = "Please review your details and click one of the payment options below.";
				else
					lblMsg.Text = "Whoops, you've missed the payment step. Please click Pay with PayPal button below.";
			}
            var member = PrizeMemberAuthUtils.GetMemberData();
			txtFirstName.Text = member.Firstname;
			tbLastName.Text = member.Surname;
            txtEmail.Text = member.Email;
            tbMobile.Text = member.Mobile;
            tbPhone.Text = member.Phone;
            tbStreetAddress.Text = member.StreetAddress;
            tbSuburb.Text = member.Suburb;
            tbState.Text = member.State;
            ddCountry.Text = member.Country;
            tbPostCode.Text = member.Postcode;
			
			ddlProgram.Text = sProgram;
			ddlLocation.Text = sLocation;
            //ddlQ3.Text = member.Questions;
			//PrizeMemberAuthUtils.GetMemberAnswer(member, 3);
            //ddlQ4.Text = "test " + member.Email;

            IsTrial = false;
            if (Request.QueryString["Trial"] != null && Request.QueryString["Trial"].Equals("1"))
                IsTrial = true;
            int newPlanId = 0;
            MemberExercisePlan myPlan = new MemberExercisePlan();
            PrizeExercisePlan prizePlan = new PrizeExercisePlan();
            double nPrize = 0;
            PrizeMemberPlanManager planManager = new PrizeMemberPlanManager();
            int ret;
            if (String.IsNullOrEmpty(sMyPlanId))
            {
                if (String.IsNullOrEmpty(sPlanId))
                {
                    newPlanId = planManager.FindNewPlan(sProgram, sLocation, sLevel, sExp, IsTrial);
					if (newPlanId < 0)
					{
						//throw new Exception("ERROR: could not find the plan " + PrizeErrorCode.getErrorMessage(newPlanId));
						this.btnPayFully.Enabled = false;
						this.btnPayWeekly.Enabled = false;
						Response.Write("<script>alert('There is no new plan suitable for you.');</script>");
						return;
					}
                }
                else
                    newPlanId = int.Parse(sPlanId);
                ret = planManager.BuyNewPlan(newPlanId, ref prizePlan, ref myPlan);
            }
            else
            {
                if (String.IsNullOrEmpty(sPlanId))
                    ret = -1;
                else
                {
                    prizePlan = dbAccess.GetExercisePlan(int.Parse(sPlanId));
                    myPlan = dbAccess.GetMemberExercisePlan(int.Parse(sMyPlanId));
                    ret = 0;
                }
            }

            if (ret < 0)
            {
                throw new Exception("ERROR: error for buying plan " + ret);
            }
            else
            {
                ShowNewPlan(prizePlan, myPlan);
                Session["buying_plan_name"] = prizePlan.PlanName;
                Session["buying_my_plan_id"] = myPlan.Id;
                Session["buying_plan_id"] = myPlan.ExercisePlanId;
                if (prizePlan.Price > 0)
                    Session["payment_amt"] = prizePlan.Price;
                else
                    Session["payment_amt"] = PrizeConstants.GENERAL_PLAN_PRIZE;
            }
        }
		if (IsTrial)
		{
			this.btnPayWeekly.Visible = false;
		}
    }

    protected void ShowNewPlan(PrizeExercisePlan plan, MemberExercisePlan myPlan)
    {
        //if (myPlan.StartDate != null)
        //    lblPlan.Text = dbAccess.GetPlanName(plan);   //plan.PlanName +" Start on " + PrizeCommonUtils.ParseDateTime((DateTime)myPlan.StartDate);
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        /*NVPAPICaller payPalCaller = new NVPAPICaller();
        string retMsg = "";
        string token = "";

        if (Session["payment_amt"] != null)
        {
            string amt = Session["payment_amt"].ToString();
            string planName = Session["buying_plan_name"].ToString();
            payPalCaller.SetCredentials(PrizeConstants.WALLET_USER_NAME, 
                PrizeConstants.WALLET_PASSWORD,
                PrizeConstants.WALLET_SIGNATURE);
            bool ret = payPalCaller.ShortcutExpressCheckout(amt, planName, ref token, ref retMsg);
            if (ret)
            {
                Session["token"] = token;
                Response.Redirect(retMsg);
            }
            else
            {
                Response.Redirect(PrizeConstants.URL_CHECKOUT_ERROR+"?" + retMsg);
            }
        }
        else
        {
            Response.Redirect(PrizeConstants.URL_CHECKOUT_ERROR + "?ErrorCode =AmtMissing");
        }
        */
        doNoPaymentPlan();
    }

    protected void btnSubmitPayWeekly_Click(object sender, EventArgs e)
    {
        DoWeeklyPaymentPlan(PrizeConstants.STATUS_PLAN_MANUAL_PAYMENT_WEEKLY);
    }

    protected void btnSubmitPayFully_Click(object sender, EventArgs e)
    {
        DoWeeklyPaymentPlan(PrizeConstants.STATUS_PLAN_MANUAL_PAYMENT_FULLY);
    }

    private void doNoPaymentPlan()
    {
        PrizeOrder myOrder = new PrizeOrder();
        myOrder.OrderDate = PrizeCommonUtils.GetSystemDate();
        myOrder.Username = PrizeMemberAuthUtils.GetMemberName();
        myOrder.FirstName = "";
        myOrder.LastName = "";
        myOrder.Email = PrizeMemberAuthUtils.GetMemberEmail();
        myOrder.Total = 0;
        myOrder.MemberPlanId = Int32.Parse(Session["buying_my_plan_id"].ToString());          
        myOrder.ExercisePlanId = Int32.Parse(Session["buying_plan_id"].ToString());

        // Get DB context.
        DIYPTEntities _db = new DIYPTEntities();
        try
        {
            // Add order to DB.
            _db.Database.Connection.Open();
            _db.PrizeOrders.Add(myOrder);
            _db.SaveChanges();
            Session["currentOrderId"] = myOrder.OrderId;
        }
        finally
        {
            _db.Database.Connection.Close();
        }
        int currentOrderId = -1;
        if (Session["currentOrderId"] != string.Empty)
        {
            currentOrderId = Convert.ToInt32(Session["currentOrderID"]);
        }

        PrizeMemberPlanManager planManager = new PrizeMemberPlanManager();
        planManager.PayMemberPlans(currentOrderId, "");

        Response.Redirect(PrizeConstants.URL_MEMBER_LANDING);
    }

    private void DoWeeklyPaymentPlan(string mode)
    {
        int memberPlanId = Int32.Parse(Session["buying_my_plan_id"].ToString());
        int exercisePlanId = Int32.Parse(Session["buying_plan_id"].ToString());
		if (Request.QueryString["Trial"] != null && Request.QueryString["Trial"].Equals("1"))
			IsTrial = true;

		PrizeMemberPlanManager planManager = new PrizeMemberPlanManager();
        planManager.ManualPaymentMemberPlanSetup(PrizeMemberAuthUtils.GetMemberData(), memberPlanId, exercisePlanId, mode);

		if (mode.Equals(PrizeConstants.STATUS_PLAN_MANUAL_PAYMENT_WEEKLY))
		{
			Response.Redirect(PrizeConstants.URL_EZIDEBIT_LOGIN_WEEKLY);
		}
		else
		{
			if (IsTrial)
			{
				Response.Redirect(PrizeConstants.URL_EZIDEBIT_LOGIN_TRIAL);
			}
			else
			{
				Response.Redirect(PrizeConstants.URL_EZIDEBIT_LOGIN_FULLY);
			}
		}
    }

}