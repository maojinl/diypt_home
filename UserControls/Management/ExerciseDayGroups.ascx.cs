using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserControls_Management_ExerciseDayGroups : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        { 
            this.BindGrid();
            this.BindDropDownList();

        }
    }

    private void BindDropDownList()
    {
        using (DIYPTEntities db = new DIYPTEntities())
        {

            db.Database.Connection.Open();
            {
                var ProgramQuery = from c in db.PrizeExerciseDayGroupNames
                                   select new { c.DayGroupName, c.Id };
                ddldaygroup.DataValueField = "Id";
                ddldaygroup.DataTextField = "DayGroupName";
                ddldaygroup.DataSource = ProgramQuery.ToList();

                ddldaygroup.DataBind();
                db.Database.Connection.Close();
            }
        }
    }

    private void BindGrid()
    {
        using (DIYPTEntities db = new DIYPTEntities())
        {
            db.Database.Connection.Open();
            {
                int weekid = Convert.ToInt32(Session["PWID"]);
                int day = Convert.ToInt32(Session["DAY"]);

                string sName = Session["PLANNAME"].ToString();
                lblPlanName.Text = sName;
                string sWeek = Session["PLANWEEKNUM"].ToString();
                lblWeekNum.Text = sWeek;
                string sDay = Session["DAY"].ToString();
                lblWeekDay.Text = sDay;

                var DayGroups = from a in db.PrizeExerciseUnitSetForDays
                                join b in db.PrizeExerciseDayGroupNames on a.DayGroupNameId equals b.Id
                                where a.ExercisePlanWeekId == weekid && a.ExerciseDay == day
                                select new
                                {
                                    DayGruopName = b.DayGroupName,
                                    ExerciseUnitSetId = a.ExerciseUnitSetId,
                                    Id = a.Id,
                                    DayGroupNameId = a.DayGroupNameId,
                                };
                GridView1.DataSource = DayGroups.ToList();

                GridView1.DataBind();

            }
            db.Database.Connection.Close();
        }
    }

    protected void Return(object sender, EventArgs e)
    {
        Response.Redirect("/management/exercise-plan-week-day.aspx");
    }

    protected void Insert(object sender, EventArgs e)
    {
        using (DIYPTEntities db = new DIYPTEntities())
        {
            db.Database.Connection.Open();
            {
                int weekid = Convert.ToInt32(Session["PWID"]);
                int day = Convert.ToInt32(Session["DAY"]);

                string dgroup = ddldaygroup.SelectedItem.Text;


                PrizeExerciseDayGroupName daygroups = (from c in db.PrizeExerciseDayGroupNames
                                                       where c.DayGroupName == dgroup
                                                       select c).FirstOrDefault();

                int dId = daygroups.Id;



                PrizeExerciseUnitSetForDay CD = new PrizeExerciseUnitSetForDay();
                CD.ExercisePlanWeekId = weekid;
                CD.ExerciseDay = day;
                CD.DayGroupNameId = dId;
                CD.ExerciseUnitSetId = 0;
                db.PrizeExerciseUnitSetForDays.Add(CD);
                db.SaveChanges();

            }
            db.Database.Connection.Close();

        }
        GridView1.EditIndex = -1;
        this.BindGrid();

    }

    protected void OnRowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int Id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);
        using (DIYPTEntities db = new DIYPTEntities())
        {
            db.Database.Connection.Open();
            PrizeExerciseUnitSetForDay item = (from c in db.PrizeExerciseUnitSetForDays
                                               where c.Id == Id
                                               select c).FirstOrDefault();
            db.PrizeExerciseUnitSetForDays.Remove(item);

            db.SaveChanges();
            db.Database.Connection.Close();
        }
        GridView1.EditIndex = -1;
        this.BindGrid();
    }



    protected void OnRowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow && e.Row.RowIndex != GridView1.EditIndex)
        {
            (e.Row.Cells[0].Controls[0] as LinkButton).Attributes["onclick"] = "return confirm('Do you want to delete this row?');";
        }
    }
    protected void OnPaging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        this.BindGrid();
    }



    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Select")
        {
            string report = e.CommandArgument.ToString();


            string[] arg = new string[3];
            arg = e.CommandArgument.ToString().Split(';');

            Session["UnitSetId"] = Convert.ToString(arg[0]);
            Session["DayGroupNameId"] = Convert.ToInt32(arg[1]);
            Session["DayGroupName"] = arg[2];

            if (report == null || report == "")
            {
                Session["UnitSetId"] = 0;
            }
            else
            {
                Session["UnitSetId"] = Convert.ToString(arg[0]);
            }


            Response.Redirect("/management/exercise-unit-sets.aspx");

        }


    }
}