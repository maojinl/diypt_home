using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;

public partial class UserControls_Management_ExerciseUnitSets : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, System.EventArgs e)
    {
        if (!this.IsPostBack)
        {

            this.BindGrid();

        }
    }



    protected void OnPaging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        this.BindGrid();
    }

    protected void OnPaging2(object sender, GridViewPageEventArgs e)
    {
        GridView2.PageIndex = e.NewPageIndex;
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
                string sWeek = Session["PLANWEEKNUM"].ToString();
                lblWeekNum.Text = sWeek;
                string sDay = Session["DAY"].ToString();
                lblWeekDay.Text = sDay;
                string sDayGroup = Session["DayGroupName"].ToString();
                lblDayGroup.Text = sDayGroup;

                /* var languages2 = from dic in db.PrizeExerciseUnits

                                  select new
                                  {
                                      ExerciseUnitId2 = dic.Id,
                                      Exercise2 = dic.Exercise,
                                      Reps2 = dic.Reps,
                                      Rest2 = dic.Rest,
                                      Weight2 = dic.Weight,
                                      Comments2 = dic.Comments,
                                      UnitOrder2 = dic.UnitOrder,
                                      Tempo2 = dic.Tempo,
                                      Trainning_Set2 = dic.Trainning_Set,
                                      Video2 = dic.Video,
                                      Image2 = dic.Image,
                                      TimeDuration2 = dic.TimeDuration,

                                  };


                 GridView2.DataSource = languages2.ToList();
                 GridView2.DataBind();*/
                OnFilter(null, null);

                int sid = Convert.ToInt32(Session["UnitSetId"]);

                if (sid != 0)
                {
                    Int32 UnitSetId = Convert.ToInt32(sid);

                    var languages = from a in db.PrizeExerciseUnitSets
                                    join dic in db.PrizeExerciseUnits
                                    on a.ExerciseUnitId equals dic.Id
                                    where a.UnitSetId == UnitSetId
                                    orderby a.Sequence
                                    select new
                                    {
                                        Sequence = a.Sequence,
                                        ExerciseUnitId = a.ExerciseUnitId,
                                        Exercise = dic.Exercise,
                                        AlternateExercise = dic.AlternateExercise,
                                        Reps = dic.Reps,
                                        Rest = dic.Rest,
                                        Weight = dic.Weight,
                                        Comments = dic.Comments,
                                        UnitOrder = dic.UnitOrder,
                                        Tempo = dic.Tempo,
                                        Trainning_Set = dic.Trainning_Set,
                                        Video = dic.Video,
                                        Image = dic.Image,
                                        TimeDuration = dic.TimeDuration,
                                        Id = a.Id,

                                    };




                    GridView1.DataSource = languages.ToList();
                    GridView1.DataBind();



                }


                db.Database.Connection.Close();

            }

        }


    }


    protected void OnRowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;
        this.BindGrid();
    }

    protected void OnRowCancelingEdit(object sender, EventArgs e)
    {
        GridView1.EditIndex = -1;
        this.BindGrid();
    }
    protected void OnRowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        GridViewRow row = GridView1.Rows[e.RowIndex];
        int Id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);
        string Sequence = (row.FindControl("ttSequence") as TextBox).Text;
        int ExerciseUnitId = Convert.ToInt32((row.FindControl("ttExerciseUnitId") as TextBox).Text);


        using (DIYPTEntities db = new DIYPTEntities())
        {
            db.Database.Connection.Open();

            var tt = (from c in db.PrizeExerciseUnits
                      where c.Id == ExerciseUnitId
                      select c).Count();

            if (Convert.ToInt32(tt) == 0)
            {
                string errorText = "Unit Id doesnot exist!Please add new unit first.";
                Response.Write(
    @"<SCRIPT LANGUAGE=""JavaScript"">alert('" + errorText + "')</SCRIPT>");


            }
            else
            {

                PrizeExerciseUnitSet item = (from c in db.PrizeExerciseUnitSets
                                             where c.Id == Id
                                             select c).FirstOrDefault();

                item.Sequence = Sequence;
                item.ExerciseUnitId = ExerciseUnitId;
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
            PrizeExerciseUnitSet item = (from c in db.PrizeExerciseUnitSets
                                         where c.Id == Id
                                         select c).FirstOrDefault();
            db.PrizeExerciseUnitSets.Remove(item);

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
            (e.Row.Cells[0].Controls[2] as LinkButton).Attributes["onclick"] = "return confirm('Do you want to delete this row?');";
        }
    }

    protected void OnFilter(object sender, EventArgs e)
    {
        using (DIYPTEntities db = new DIYPTEntities())
        {

            db.Database.Connection.Open();
            {

                if (txtFilter.Text.Equals(""))
                {
                    var languages2 = from dic in db.PrizeExerciseUnits
                      select new
                      {
                          ExerciseUnitId2 = dic.Id,
                          Exercise2 = dic.Exercise,
                          AlternateExercise2 = dic.AlternateExercise,
                          Reps2 = dic.Reps,
                          Rest2 = dic.Rest,
                          Weight2 = dic.Weight,
                          Comments2 = dic.Comments,
                          UnitOrder2 = dic.UnitOrder,
                          Tempo2 = dic.Tempo,
                          Trainning_Set2 = dic.Trainning_Set,
                          Video2 = dic.Video,
                          Image2 = dic.Image,
                          TimeDuration2 = dic.TimeDuration,

                      };
                    GridView2.DataSource = languages2.ToList();
                    GridView2.DataBind();
                }
                else
                {
                    var languages2 = from dic in db.PrizeExerciseUnits
                                 where dic.Exercise.ToUpper().Contains(txtFilter.Text.ToUpper())
                                 select new
                                 {
                                     ExerciseUnitId2 = dic.Id,
                                     Exercise2 = dic.Exercise,
                                     AlternateExercise2 = dic.AlternateExercise,
                                     Reps2 = dic.Reps,
                                     Rest2 = dic.Rest,
                                     Weight2 = dic.Weight,
                                     Comments2 = dic.Comments,
                                     UnitOrder2 = dic.UnitOrder,
                                     Tempo2 = dic.Tempo,
                                     Trainning_Set2 = dic.Trainning_Set,
                                     Video2 = dic.Video,
                                     Image2 = dic.Image,
                                     TimeDuration2 = dic.TimeDuration,

                   };
                    GridView2.DataSource = languages2.ToList();
                    GridView2.DataBind();
                }


            }
            db.Database.Connection.Close();
        }
    }


    protected void Insert(object sender, EventArgs e)
    {
        using (DIYPTEntities db = new DIYPTEntities())
        {

            db.Database.Connection.Open();
            {

                int ExerciseUnitSetId = 0;
                //int ExerciseUnitId = Convert.ToInt32(Session["UnitSetId"]);
                int ExerciseUnitId = Convert.ToInt32(txtExerciseUnitId.Text);

                var tt = (from c in db.PrizeExerciseUnits
                          where c.Id == ExerciseUnitId
                          select c).Count();

                if (Convert.ToInt32(tt) == 0)
                {
                    string errorText = "Unit Id doesnot exist!Please add new unit first.";
                    Response.Write(
        @"<SCRIPT LANGUAGE=""JavaScript"">alert('" + errorText + "')</SCRIPT>");


                }
                else
                {
                    ExerciseUnitSetId = Convert.ToInt32(Session["UnitSetId"]);
                    if (ExerciseUnitSetId == 0)
                    {
                        int units = (from c in db.PrizeExerciseUnitSets
                                    orderby c.UnitSetId
                                    select c.UnitSetId).DefaultIfEmpty(0).Max();

                        ExerciseUnitSetId = units + 1;

                        //add to unitset for days table one recond.
                        int pwid = Convert.ToInt32(Session["PWID"]);
                        int day = Convert.ToInt32(Session["DAY"]);
                        int DGNid = Convert.ToInt32(Session["DayGroupNameId"]);

                        PrizeExerciseUnitSetForDay item = (from c in db.PrizeExerciseUnitSetForDays
                                                           where c.ExercisePlanWeekId == pwid && c.ExerciseDay == day && c.DayGroupNameId == DGNid
                                                           select c).FirstOrDefault();

                        item.ExerciseUnitSetId = ExerciseUnitSetId;
                        db.SaveChanges();
                        Session["UnitSetId"] = ExerciseUnitSetId;
                    }


                    PrizeExerciseUnitSet addplan = new PrizeExerciseUnitSet();
                    addplan.Sequence = txtSequence.Text;
                    addplan.ExerciseUnitId = Convert.ToInt32(txtExerciseUnitId.Text);
                    addplan.UnitSetId = ExerciseUnitSetId;
                    db.PrizeExerciseUnitSets.Add(addplan);
                    db.SaveChanges();

                }
                this.BindGrid();
            }

            //   transaction.Complete();
            db.Database.Connection.Close();

        }

    }

    protected void Return(object sender, EventArgs e)
    {
        Response.Redirect("/management/exercise-day-group.aspx");
    }


    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {


    }
}