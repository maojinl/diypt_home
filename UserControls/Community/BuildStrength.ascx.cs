using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserControls_Community_BuildStrength : System.Web.UI.UserControl
{
    public string GroupType { get; set; }
    public string GroupLevel { get; set; }

    protected void Page_Load(object sender, EventArgs e)
    {
        string v = Request.QueryString["type"];
        if (v != null)
        {
            GroupType = v;
        }

        string l = Request.QueryString["level"];
        if (l != null)
        {
            GroupLevel = l;
        }



        if (HttpContext.Current.User.Identity.IsAuthenticated)
        {
            var member = PrizeMemberAuthUtils.GetMemberData();
            if (member != null)
            {
                commentName.Text = member.Firstname + " " + member.Surname;
                var acc = new PrizeDataAccess();
                commentPlan.Text = acc.GetPlanInfoForPublish();
                if (member.Photo != null && member.Photo != "")
                    commentImage.ImageUrl = member.Photo;
                else
                    commentImage.ImageUrl = @"\images\profile.jpg";

            }

            BindForm();
        }
    }
    private void BindForm()
    {
        lblLevel.Text = GroupLevel;
        switch (GroupType.ToLower())
        {
            case "strength":
                dvMain.Attributes.Add("class", "col-lg-8 chat-group chat-group-y");
                imgGroup.ImageUrl = "/images/icon-strength-y.svg";
                lbSubmit.Attributes.Add("class", "btn  btn-secondary");
                lblGroup.Text = "INCREASE MUSCLE";
                lblGroup2.Text = "INCREASE MUSCLE";
                imgCard.ImageUrl = "/images/chat/build-strength.jpg";
                imgIcon.ImageUrl = "/images/icon-tab-strength.svg";
                imgIcon.Attributes.Add("class", "icon-pg icon-yellow");
                h5Beginner.Attributes.Add("class", "c_y");
                h5Intermediate.Attributes.Add("class", "c_y");
                h5Advance.Attributes.Add("class", "c_w");
                divChatLevel.Attributes.Add("class", "chat-level chat-level-y");
                linkBeginner.HRef = "/community/build-strength-group?type=strength&level=beginner";
                linkIntermediate.HRef = "/community/build-strength-group?type=strength&level=intermediate";
                linkAdvance.HRef = "/community/build-strength-group?type=strength&level=advanced";
                break;
            case "weight":
                dvMain.Attributes.Add("class", "col-lg-8 chat-group chat-group-p");
                imgGroup.ImageUrl = "/images/icon-weight-p.svg";
                lbSubmit.Attributes.Add("class", "btn  btn-secondary");
                lblGroup.Text = "WEIGHT LOSS";
                lblGroup2.Text = "WEIGHT LOSS";
                imgCard.ImageUrl = "/images/chat/weight-loss.jpg";
                imgIcon.ImageUrl = "/images/icon-tab-weight.svg";
                imgIcon.Attributes.Add("class", "icon-pg icon-pink");
                h5Beginner.Attributes.Add("class", "c_p");
                h5Intermediate.Attributes.Add("class", "c_p");
                h5Advance.Attributes.Add("class", "c_w");
                divChatLevel.Attributes.Add("class", "chat-level chat-level-p");
                linkBeginner.HRef = "/community/weight-loss-group?type=weight&level=beginner";
                linkIntermediate.HRef = "/community/weight-loss-group?type=weight&level=intermediate";
                linkAdvance.HRef = "/community/weight-loss-group?type=weight&level=advanced";
                break;
            case "tone":
                dvMain.Attributes.Add("class", "col-lg-8 chat-group chat-group-b");
                imgGroup.ImageUrl = "/images/icon-tone-up-b.svg";
                lbSubmit.Attributes.Add("class", "btn  btn-secondary");
                lblGroup.Text = "TONE UP";
                lblGroup2.Text = "TONE UP";
                imgCard.ImageUrl = "/images/chat/tone-up.jpg";
                imgIcon.ImageUrl = "/images/icon-tab-tone.svg";
                imgIcon.Attributes.Add("class", "icon-pg icon-blue");
                h5Beginner.Attributes.Add("class", "c_b");
                h5Intermediate.Attributes.Add("class", "c_b");
                h5Advance.Attributes.Add("class", "c_w");
                divChatLevel.Attributes.Add("class", "chat-level chat-level-b");
                linkBeginner.HRef = "/community/tone-up-group?type=tone&level=beginner";
                linkIntermediate.HRef = "/community/tone-up-group?type=tone&level=intermediate";
                linkAdvance.HRef = "/community/tone-up-group?type=tone&level=advanced";

                break;
            default:
                dvMain.Attributes.Add("class", "col-lg-8 chat-group chat-group-y");
                imgGroup.ImageUrl = "/images/icon-strength-y.svg";
                lbSubmit.Attributes.Add("class", "btn  btn-secondary btn-y");
                lblGroup.Text = "INCREASE MUSCLE";
                lblGroup2.Text = "INCREASE MUSCLE";
                imgCard.ImageUrl = "/images/chat/build-strength.jpg";
                imgIcon.ImageUrl = "/images/icon-tab-strength.svg";
                imgIcon.Attributes.Add("class", "icon-pg icon-yellow");
                h5Beginner.Attributes.Add("class", "c_y");
                h5Intermediate.Attributes.Add("class", "c_y");
                h5Advance.Attributes.Add("class", "c_w");
                divChatLevel.Attributes.Add("class", "chat-level chat-level-y");
                linkBeginner.HRef = "/community/build-strength-group?type=strength&level=beginner";
                linkIntermediate.HRef = "/community/build-strength-group?type=strength&level=intermediate";
                linkAdvance.HRef = "/community/build-strength-group?type=strength&level=advanced";
                break;
        }
        //List < Comments > coms = new List<Comments>();
        //coms.Add(new Comments() { Name = "Name1", Program = "program1", Comment = "comment1", Time = "20 hours ago" });
        //coms.Add(new Comments() { Name = "Name2", Program = "program2", Comment = "comment2", Time = "20 hours ago" });
        //coms.Add(new Comments() { Name = "Name3", Program = "program3", Comment = "comment3", Time = "20 hours ago" });
        //coms.Add(new Comments() { Name = "Name4", Program = "program4", Comment = "comment4", Time = "20 hours ago" });
        //coms.Add(new Comments() { Name = "Name5", Program = "program5", Comment = "comment5", Time = "20 hours ago" });
        //coms.Add(new Comments() { Name = "Name6", Program = "program6", Comment = "comment6", Time = "20 hours ago" });
        //coms.Add(new Comments() { Name = "Name7", Program = "program7", Comment = "commen67", Time = "20 hours ago" });
        //coms.Add(new Comments() { Name = "Name8", Program = "program8", Comment = "comment8", Time = "20 hours ago" });

        int tempCategory = 1;
        switch (GroupType)
        {
            case "strength":
                tempCategory = 1;
                break;
            case "weight":
                tempCategory = 2;
                break;
            case "tone":
                tempCategory = 3;
                break;
            default:
                break;
        }
		
        switch (GroupLevel)
        {
            case "beginner":
                tempCategory = (tempCategory*10) + 1;
                break;
            case "intermediate":
                tempCategory = (tempCategory*10) + 2;
                break;
            case "advanced":
            case "advance":
                tempCategory = (tempCategory*10) + 3;
                break;
            default:
                break;
        }
        var acc = new PrizeDataAccess();
        var posts = acc.GetAllPosts(tempCategory);

        rpComments.DataSource = posts.ToList();
        rpComments.DataBind();
        lblPostCount.Text = posts.Count() + " posts";
    }

    public class Comments
    {
        public string Name { get; set; }
        public string Program { get; set; }
        public string Time { get; set; }
        public string Comment { get; set; }
    }

    protected void lbSubmit_Click(object sender, EventArgs e)
    {
        var acc = new PrizeDataAccess();
        MemberCommunityChat chat = new MemberCommunityChat();
        switch (GroupType)
        {
            case "strength":
                chat.Catergory = 1;
                break;
            case "weight":
                chat.Catergory = 2;
                break;
            case "tone":
                chat.Catergory = 3;
                break;
            default:
                break;
        }
        switch (GroupLevel)
        {
            case "beginner":
                chat.Catergory = (chat.Catergory*10) + 1;
                break;
            case "intermediate":
                chat.Catergory = (chat.Catergory*10) + 2;
                break;
            case "advanced":
            case "advance":
                chat.Catergory = (chat.Catergory*10) + 3;
                break;
            default:
                break;
        }
        chat.Program = commentPlan.Text;
        chat.Time = DateTime.Now;
        chat.Name = commentName.Text;
        chat.ImageURL = commentImage.ImageUrl;
        chat.Comment = txtComment.Text;
        acc.SavePost(chat);
        txtComment.Text = "";
        BindForm();
    }

    protected string FormatDate(object dateObj)
    {
        if(dateObj != null)
        {
            return ((DateTime)dateObj).ToString("dd/MM/yyyy");
        }
        return "";
    }
}