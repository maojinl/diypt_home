using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserControls_Checkout_CheckoutComplete : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            // Verify user has completed the checkout process.
            if ((string)Session["userCheckoutCompleted"] != "true")
            {
                Session["userCheckoutCompleted"] = string.Empty;
                Response.Redirect(PrizeConstants.URL_CHECKOUT_ERROR+"?" + "Desc=Unvalidated%20Checkout.");
            }

            NVPAPICaller payPalCaller = new NVPAPICaller();
            payPalCaller.SetCredentials(PrizeConstants.WALLET_USER_NAME,
                PrizeConstants.WALLET_PASSWORD,
                PrizeConstants.WALLET_SIGNATURE);

            string retMsg = "";
            string token = "";
            string finalPaymentAmount = "";
            string PayerID = "";
            NVPCodec decoder = new NVPCodec();

            token = Session["token"].ToString();
            PayerID = Session["payerId"].ToString();
            finalPaymentAmount = Session["payment_amt"].ToString();

            bool ret = payPalCaller.DoCheckoutPayment(finalPaymentAmount, token, PayerID, ref decoder, ref retMsg);
            if (ret)
            {
                // Retrieve PayPal confirmation value.
                string PaymentConfirmation = decoder["PAYMENTINFO_0_TRANSACTIONID"].ToString();

                TransactionId.Text = PaymentConfirmation;

                int currentOrderId = -1;
                if (Session["currentOrderId"] != string.Empty)
                {
                    currentOrderId = Convert.ToInt32(Session["currentOrderID"]);
                }

                PrizeMemberPlanManager planManager = new PrizeMemberPlanManager();
                planManager.PayMemberPlans(currentOrderId, PaymentConfirmation);

                // Clear order id.
                Session["currentOrderId"] = string.Empty;

            }
            else
            {
                Response.Redirect(PrizeConstants.URL_CHECKOUT_ERROR+"?" + retMsg);
            }
        }
    }

    protected void Continue_Click(object sender, EventArgs e)
    {
        //Response.Redirect("~/Default.aspx");
        Response.Redirect(PrizeConstants.URL_MEMBER_LANDING);
    }
}