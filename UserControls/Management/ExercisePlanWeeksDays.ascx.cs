using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserControls_Management_ExercisePlanWeeksDays : System.Web.UI.UserControl
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
                var ProgramQuery = from c in db.PrizeExerciseDayTypes
                                   select new { c.DayTypeName, c.Id };
                ddldaytype.DataValueField = "Id";
                ddldaytype.DataTextField = "DayTypeName";
                ddldaytype.DataSource = ProgramQuery.ToList();

                ddldaytype.DataBind();
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
                string sid = Session["PLANWEEKID"].ToString();
                Int32 ID = Convert.ToInt32(sid);

                string sName = Session["PLANNAME"].ToString();
                lblPlanName.Text = sName;
                string sWeek = Session["PLANWEEKNUM"].ToString();
                lblWeekNum.Text = sWeek;

                var DayTypes = from a in db.PrizeExercisePlanWeekDays
                               join b in db.PrizeExerciseDayTypes on a.DayTypeId equals b.Id
                               where a.ExercisePlanWeekId == ID
                               orderby a.Day
                               select new
                               {
                                   Id = a.Id,
                                   Day = a.Day,
                                   DayTypeName = b.DayTypeName,
                                   ExercisePlanWeekId = a.ExercisePlanWeekId

                               };
                GridView1.DataSource = DayTypes.ToList();

                GridView1.DataBind();



            }
            db.Database.Connection.Close();
        }
    }
    protected void Return(object sender, EventArgs e)
    {
        Response.Redirect("/management/exercise-plan-week-detail.aspx");
    }
    protected void Insert(object sender, EventArgs e)
    {
        using (DIYPTEntities db = new DIYPTEntities())
        {
            db.Database.Connection.Open();
            {
                string sid = Session["PLANWEEKID"].ToString();
                Int32 ID = Convert.ToInt32(sid);

                string dtype = ddldaytype.SelectedItem.Text;


                PrizeExerciseDayType daytpes = (from c in db.PrizeExerciseDayTypes
                                                where c.DayTypeName == dtype
                                                select c).FirstOrDefault();

                int dId = daytpes.Id;



                PrizeExercisePlanWeekDay CD = new PrizeExercisePlanWeekDay();
                CD.ExercisePlanWeekId = ID;
                CD.Day = Convert.ToInt32(txtDay.Text);
                CD.DayTypeId = dId;

                db.PrizeExercisePlanWeekDays.Add(CD);
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
            PrizeExercisePlanWeekDay item = (from c in db.PrizeExercisePlanWeekDays
                                             where c.Id == Id
                                             select c).FirstOrDefault();

            IQueryable<PrizeExerciseUnitSetForDay> unitSets = (from c in db.PrizeExerciseUnitSetForDays
                                                               where c.ExercisePlanWeekId == item.ExercisePlanWeekId && c.ExerciseDay == item.Day
                                                               select c);
            foreach (var unitset in unitSets)
                db.PrizeExerciseUnitSetForDays.Remove(unitset);
            db.PrizeExercisePlanWeekDays.Remove(item);

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
            string[] arg = new string[2];
            arg = e.CommandArgument.ToString().Split(';');

            Session["PWID"] = Convert.ToString(arg[0]);
            Session["DAY"] = Convert.ToString(arg[1]);

            Response.Redirect("/management/exercise-day-group.aspx");


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