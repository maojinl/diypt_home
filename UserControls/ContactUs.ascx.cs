using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserControls_ContactUs : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        confirmation.Visible = false;
    }

    protected void btnLink_Click(object sender, EventArgs e)
    {
        string temp = "";
        temp = string.Format(@"First Name: {0}{4}
Last Name: {1}{4}
Email: {2}{4}
Message {3}", first_name.Text, last_name.Text, email.Text, message.Text, "<br />");

        first_name.Text = "";
        last_name.Text = "";
        email.Text = "";
        message.Text = "";
        PrizeEmail.SendContactEmail(temp);
        Response.Write("<script>alert('Thank you. Your message has been sent. We will get back to you within 24 hours');</script>");
        //confirmation.Visible = true;
    }
}