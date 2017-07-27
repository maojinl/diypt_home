using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using umbraco.cms.businesslogic.member;

public partial class UserControls_Management_MemberInfo : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, System.EventArgs e)
    {
        if (!this.IsPostBack)
        {
            this.BindGrid();
        }
    }


    private void BindGrid()
    {
        using (DIYPTEntities db = new DIYPTEntities())
        {
            db.Database.Connection.Open();
            {

                var languages = from dic in db.PrizeMembers
                                select new
                                {
                                    Id = dic.UmbracoId,
                                    Firstname = dic.Firstname,
                                    Surname = dic.Surname,
                                    DoB = dic.DoB,
                                    Gender = dic.Gender,
                                    Country = dic.Country,
                                    Email = dic.Email,
                                    StreetAddress = dic.StreetAddress,
                                    Suburb = dic.Suburb,
                                    City = dic.City,
                                    Postcode = dic.Postcode,
                                    State = dic.State,
                                    Height = dic.Height,
                                    Weight = dic.Weight,
                                    Password = dic.Password,
                                    Waist = dic.Waist,
                                    BodyFat = dic.BodyFat,
                                    GoalDescription = dic.GoalDescription,
                                    GoalWeight = dic.GoalWeight,
                                    GoalWaist = dic.GoalWaist,
                                    GoalBodyFat = dic.GoalBodyFat,

                                };

                if (tbfistname.Text != "")
                {
                    languages = languages.Where(m => m.Firstname.Contains(tbfistname.Text));
                }
                if (tbemail.Text != "")
                {
                    languages = languages.Where(m => m.Email.Contains(tbemail.Text));
                }

                GridView1.DataSource = languages.ToList();



                GridView1.DataBind();



            }
            db.Database.Connection.Close();
        }
    }


    protected void search(object sender, EventArgs e)
    {
        this.BindGrid();

    }

    protected void refresh(object sender, EventArgs e)
    {
        tbfistname.Text = string.Empty;
        tbemail.Text = string.Empty;

        this.BindGrid();

    }
    protected void OnPaging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        this.BindGrid();
    }
    protected void OnRowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;
        this.BindGrid();
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Select")
        {

            int id = Convert.ToInt32(e.CommandArgument);
            Session["MID"] = Convert.ToString(id);

            Response.Redirect("/management/member-result.aspx");


        }


    }
    protected void OnRowUpdating(object sender, GridViewUpdateEventArgs e)
    {


    }
    protected void OnRowDeleting(object sender, GridViewDeleteEventArgs e)
    {
    }


    protected void OnRowDataBound(object sender, GridViewRowEventArgs e)
    {

    }

    protected void Send(object sender, EventArgs e)
    {
        PrizeEmailWrapper wrapper = new PrizeEmailWrapper();
        MembershipUser aMember;

        PrizeMember member = PrizeMemberAuthUtils.GetMemberData(1066);
       
        wrapper.SendWelcomeEmail(member, "loginname");
    }

    protected void OnRowCancelingEdit(object sender, EventArgs e)
    {
        GridView1.EditIndex = -1;
        this.BindGrid();
    }


}