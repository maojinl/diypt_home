using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserControls_Orientation_OrientationCompleted : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        PrizeDataAccess db = new PrizeDataAccess();
        if (db.MemberInOrientation(PrizeMemberAuthUtils.GetMemberID()))
            hideOrientation.Text = "class='nav-item col'";
        else
            hideOrientation.Text = "class='nav-item col hide'";
    }
}