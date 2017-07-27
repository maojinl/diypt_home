using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserControls_Management_ExercisePlanWeeksDetail : System.Web.UI.UserControl
{
    Int32 planId;
    protected void Page_Load(object sender, EventArgs e)
    {
        string sid = Session["PLANID"].ToString();
        planId = Convert.ToInt32(sid);
        if (!Page.IsPostBack)
            this.BindGrid();

    }

    private void BindGrid()
    {
        using (DIYPTEntities db = new DIYPTEntities())
        {
            db.Database.Connection.Open();
            {
                string sName = Session["PLANNAME"].ToString();
                lblPlanName.Text = sName;
                var languages = from dic in db.PrizeExercisePlanWeeks
                                where dic.ExercisePlanId == planId
                                select new
                                {
                                    ExercisePlanId = dic.ExercisePlanId,
                                    StartWeek = dic.StartWeek,
                                    EndWeek = dic.EndWeek,
                                    Description = dic.Description,
                                    Id = dic.Id,
                                };
                GridView1.DataSource = languages.OrderBy(x => x.StartWeek).ToList();
                GridView1.DataBind();
            }
            db.Database.Connection.Close();
        }
    }

    protected void Insert(object sender, EventArgs e)
    {
        int iStart = Convert.ToInt32(txtStartWeek.Text);
        int iEnd;
        if (!int.TryParse(txtEndWeek.Text, out iEnd))
            iEnd = iStart;
        if (iStart > iEnd)
        {
            Response.Write("<script>alert('Start week can not larger than end week.');</script>");
            return;
        }
        using (DIYPTEntities db = new DIYPTEntities())
        {
            PrizeExercisePlanWeek planWeek = (from c in db.PrizeExercisePlanWeeks
                                              where c.ExercisePlanId == planId && (c.StartWeek >= iStart && c.StartWeek <= iEnd || c.EndWeek >= iStart && c.EndWeek <= iEnd)
                                              select c).FirstOrDefault();
            if (planWeek != null)
            {
                Response.Write("<script>alert('There is a start week or end week already in this plan.');</script>");
                return;
            }

            db.Database.Connection.Open();
            {
                
                PrizeExercisePlanWeek CD = new PrizeExercisePlanWeek();
                CD.ExercisePlanId = planId;
                CD.StartWeek = iStart;
                CD.EndWeek = iEnd;
                CD.Description = txtDescription.Text;
                db.PrizeExercisePlanWeeks.Add(CD);
                db.SaveChanges();
            }
            txtStartWeek.Text = "";
            txtEndWeek.Text = "";
            txtDescription.Text = "";
            db.Database.Connection.Close();
            this.BindGrid();
        }

    }

    protected void Return(object sender, EventArgs e)
    {
        Response.Redirect("/management/add-exercise-plan.aspx");
    }

    protected void OnRowDataBound(object sender, GridViewRowEventArgs e)
    {

    }
    protected void OnPaging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        this.BindGrid();
    }

    protected void OnRowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        GridViewRow row = GridView1.Rows[e.RowIndex];
        int Id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);
        string startWeek = (row.FindControl("txtStartWeek") as TextBox).Text;
        string endWeek = (row.FindControl("txtEndWeek") as TextBox).Text;
        string Description = (row.FindControl("txtDescription") as TextBox).Text;

        using (DIYPTEntities db = new DIYPTEntities())
        {
            db.Database.Connection.Open();
            PrizeExercisePlanWeek item = (from c in db.PrizeExercisePlanWeeks
                                          where c.Id == Id
                                          select c).FirstOrDefault();

            item.Description = Description;
            item.StartWeek = Convert.ToInt32(startWeek);
            item.EndWeek = Convert.ToInt32(endWeek);
            db.SaveChanges();
            db.Database.Connection.Close();
        }
        GridView1.EditIndex = -1;
        this.BindGrid();
    }

    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Select")
        {
            string[] arg = new string[2];
            arg = e.CommandArgument.ToString().Split(';');

            Session["PLANWEEKID"] = Convert.ToString(arg[0]);
            Session["PLANWEEKNUM"] = arg[1];

            Response.Redirect("/management/exercise-plan-week-day.aspx");


        }


    }

    protected void OnRowCancelingEdit(object sender, EventArgs e)
    {
        GridView1.EditIndex = -1;
        this.BindGrid();
    }
    protected void OnRowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;
        this.BindGrid();
    }

}