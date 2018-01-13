using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserControls_Management_MemberPlanInfo : System.Web.UI.UserControl
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

                var memberPlans = from a in db.MemberExercisePlans
                                  join dic in db.PrizeMembers on a.MemberId equals dic.UmbracoId
                                  join b in db.PrizeExercisePlans on a.ExercisePlanId equals b.Id
                                  join Program in db.PrizePlanPrograms on b.ProgramId equals Program.Id
                                  join Location in db.PrizePlanLocations on b.LocationId equals Location.Id
                                  join Experience in db.PrizePlanExperiences on b.ExperienceId equals Experience.Id
                                  join Level in db.PrizePlanLevels on b.LevelId equals Level.Id
                                  join c in db.PrizeOrders on a.Id equals c.MemberPlanId into gj from subOrder in gj.DefaultIfEmpty()
                                  orderby a.StartDate descending
                                  where !a.Status.EndsWith("C")
                                select new
                                {
                                    Id = dic.UmbracoId,
                                    Firstname = dic.Firstname,
                                    Surname = dic.Surname,
                                    Email = dic.Email,
                                    IsTrialPlan = b.IsTrialPlan,
                                    PlanName = Program.Name + "_" + Location.Name + "_" + Level.Name + "_" + Experience.Name,
                                    StartDate = a.StartDate,
                                    EndDate = a.EndDate,
                                    Status = a.Status,
                                    PaidDate = subOrder!=null?subOrder.OrderDate.ToString():"",
                                };


                if (tbfistname.Text != "")
                {
                    memberPlans = memberPlans.Where(m => m.Firstname.Contains(tbfistname.Text));
                }
                if (tbemail.Text != "")
                {
                    memberPlans = memberPlans.Where(m => m.Email.Contains(tbemail.Text));
                }

                GridView1.DataSource = memberPlans.ToList();

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

    protected void OnRowCancelingEdit(object sender, EventArgs e)
    {
        GridView1.EditIndex = -1;
        this.BindGrid();
    }

	protected string GetStartStatus(object obj)
	{
		char status = (char)obj;
		string s = "";
		if (status==PrizeConstants.STATUS_PLAN_NOT_STARTED[0])
			s = "Not Started";
		else if (status==PrizeConstants.STATUS_PLAN_STARTED[0])
			s = "Started";
		else if (status==PrizeConstants.STATUS_PLAN_FINISHED[0])
			s = "Finished";
		else if (status==PrizeConstants.STATUS_PLAN_SUSPENDED[0])
			s = "Suspended";
		else if (status==PrizeConstants.STATUS_PLAN_TERMINATED[0])
			s = "Terminated";

		return s;

	}


}