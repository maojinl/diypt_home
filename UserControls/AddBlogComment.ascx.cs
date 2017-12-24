using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using umbraco.presentation.nodeFactory;
using umbraco.cms.businesslogic.web;

public partial class UserControls_AddBlogComment : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //if (HttpContext.Current.User.Identity.IsAuthenticated)
        //{
            var member = PrizeMemberAuthUtils.GetMemberData();
            if (member != null)
            {
                commentName.Text = member.Firstname + " " + member.Surname;
                //commentPlan.Text = member.
                if (member.Photo != null && member.Photo != "")
                    commentImage.ImageUrl = member.Photo.Replace("http://web106.sand.studiocoast.com.au", "https://diypt.com.au").Replace("http://diypt.com.au", "https://diypt.com.au");
                else
                    commentImage.ImageUrl = @"\images\profile.jpg";

            }
			else
				divReply.Visible = false;

        //}
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        var member = PrizeMemberAuthUtils.GetMemberData();
        //if (HttpContext.Current.User.Identity.IsAuthenticated)
			if(member != null)
        {
            var memberName = member.Firstname + " " + member.Surname;
            Node current = Node.GetCurrent();
            DocumentType dt = new DocumentType(3285);
            umbraco.BusinessLogic.User u = new umbraco.BusinessLogic.User(1);
            Document doc = Document.MakeNew(memberName + " " + DateTime.Now.ToString("dd-MM-yy HH:MM:ss"), dt, u, current.Id);
            doc.getProperty("commentName").Value = memberName;
            if(member.Photo != "")
                doc.getProperty("commentImage").Value = member.Photo.Replace("http://web106.sand.studiocoast.com.au", "https://diypt.com.au").Replace("http://diypt.com.au", "https://diypt.com.au");
            else
                doc.getProperty("commentImage").Value = @"\images\profile.jpg";
            doc.getProperty("commentText").Value = commentText.Text;
            //doc.Save();
			doc.Publish(u);
            PrizeEmail.SendBlogComment(current.Name, memberName, commentText.Text);
            //commentText.Text = "";
			Response.Redirect(Request.RawUrl);
        }
    }
}