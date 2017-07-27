using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserControls_TopNavLogin : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //lblMemberName
        if (HttpContext.Current.User.Identity.IsAuthenticated)
        {
            var member = PrizeMemberAuthUtils.GetMemberData();
            if (member != null)
                lblMemberName.Text = member.Firstname;
            loggedInDiv.Visible = true;
        }
        else
        {
            navLogin.Visible = true;
            navjoin.Visible = true;
            loggedInDiv.Visible = false;
        }
    }

    protected void LinkButtonLogout_Click(object sender, EventArgs e)
    {
        System.Web.Security.FormsAuthentication.SignOut();
        Roles.DeleteCookie();
        Session.Clear();
        Response.Redirect("/");
    }
}