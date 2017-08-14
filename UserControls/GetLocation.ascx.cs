using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserControls_GetLocation : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (PrizeMemberAuthUtils.CurrentUserLogin() != true)
            return;

        location.Text = "Home";
    }
}