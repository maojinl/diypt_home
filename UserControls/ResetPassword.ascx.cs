using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using umbraco.cms.businesslogic.member;
using System.Web.Security;
using Umbraco.Core;
using Umbraco.Core.Events;
using Umbraco.Core.Models;
using Umbraco.Core.Services;

public partial class UserControls_ResetPassword : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnReset_Click(object sender, EventArgs e)
    {
        //var member = Membership.GetUser("");
        var mem = ApplicationContext.Current.Services.MemberService.GetByEmail(txtEmail.Text);
        //var mem = Member.GetMemberFromEmail(txtEmail.Text);
        if (mem != null)
        {
            var pass = Membership.GeneratePassword(6, 1);
			
            //ApplicationContext.Services.UserService.SavePassword(mem, pass);
            ApplicationContext.Current.Services.MemberService.SavePassword(mem, pass);
			//user.ChangePassword(user.GetPassword(), newpw);
            //mem.Password = pass;
           //mem.ChangePassword(pass);
           //mem.Save();
            PrizeEmail.SendPasswordReminder(txtEmail.Text, pass);
            lblReset.Text = "A new password has been sent to your email";

        }
        else
            lblReset.Text = "Email does not exists";
    }
}