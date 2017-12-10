using System;

public partial class UserControls_GetLocation : System.Web.UI.UserControl
{
	protected void Page_Load(object sender, EventArgs e)
	{
		if (PrizeMemberAuthUtils.CurrentUserLogin() != true)
			return;

		location.Text = "Home";
	}
}