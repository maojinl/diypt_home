using System;

public partial class UserControls_Checkout_CheckoutCancel : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //PrizeDataAccess dbAccess = new PrizeDataAccess();
            //dbAccess.PayMemberPlanCancel(currentOrderId);
        }
    }
}