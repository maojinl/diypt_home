using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserControls_Checkout_CheckoutReview : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            NVPAPICaller payPalCaller = new NVPAPICaller();

            string retMsg = "";
            string token = "";
            string PayerID = "";
            NVPCodec decoder = new NVPCodec();
            payPalCaller.SetCredentials(PrizeConstants.WALLET_USER_NAME,
                PrizeConstants.WALLET_PASSWORD,
                PrizeConstants.WALLET_SIGNATURE);
            token = Session["token"].ToString();

            bool ret = payPalCaller.GetCheckoutDetails(token, ref PayerID, ref decoder, ref retMsg);
            if (ret)
            {
                Session["payerId"] = PayerID;

                var myOrder = new PrizeOrder();
                myOrder.OrderDate = Convert.ToDateTime(decoder["TIMESTAMP"].ToString());
                myOrder.Username = PrizeMemberAuthUtils.GetMemberName();
                myOrder.FirstName = decoder["FIRSTNAME"].ToString();
                myOrder.LastName = decoder["LASTNAME"].ToString();
                myOrder.Email = decoder["EMAIL"].ToString();
                myOrder.Total = Convert.ToDecimal(decoder["AMT"].ToString());
                myOrder.MemberPlanId = Int32.Parse(Session["buying_my_plan_id"].ToString());
                myOrder.ExercisePlanId = Int32.Parse(Session["buying_plan_id"].ToString());

                // Verify total payment amount as set on CheckoutStart.aspx.
                try
                {
                    decimal paymentAmountOnCheckout = Convert.ToDecimal(Session["payment_amt"].ToString());
                    decimal paymentAmoutFromPayPal = Convert.ToDecimal(decoder["AMT"].ToString());
                    if (paymentAmountOnCheckout != paymentAmoutFromPayPal)
                    {
                        Response.Redirect("/Checkout/CheckoutError.aspx?" + "Desc=Amount%20total%20mismatch.");
                    }
                }
                catch (Exception)
                {
                    Response.Redirect("/Checkout/CheckoutError.aspx?" + "Desc=Amount%20total%20mismatch.");
                }

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

            }
            Session["userCheckoutCompleted"] = "true";
            Response.Redirect("~/Checkout/CheckoutComplete.aspx");
        }
    }

    protected void CheckoutConfirm_Click(object sender, EventArgs e)
    {

    }
}