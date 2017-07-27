using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;

public partial class UserControls_Management_ExerciseUnits : System.Web.UI.UserControl
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

    private void BindGrid()
    {
        OnFilter(null, null);
        /*using (DIYPTEntities db = new DIYPTEntities())
        {

            db.Database.Connection.Open();
            {
                var languages = from dic in db.PrizeExerciseUnits

                                select new
                                {
                                    Exercise = dic.Exercise,
                                    Reps = dic.Reps,
                                    Rest = dic.Rest,
                                    Weight = dic.Weight,
                                    Comments = dic.Comments,
                                    //UnitOrder = dic.UnitOrder,
                                    Tempo = dic.Tempo,
                                    Trainning_Set = dic.Trainning_Set,
                                    Video = dic.Video,
                                    Image = dic.Image,
                                    TimeDuration = dic.TimeDuration,
                                    Id = dic.Id,

                                };


                GridView1.DataSource = languages.ToList();
                GridView1.DataBind();
            }
            db.Database.Connection.Close();

        }*/
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
        string Exercise = (row.FindControl("ttExercise") as TextBox).Text;
        string AlterExercise = (row.FindControl("ttAlterExercise") as TextBox).Text;
        string Reps = (row.FindControl("ttReps") as TextBox).Text;
        string Rest = (row.FindControl("ttRest") as TextBox).Text;
        string Weight = (row.FindControl("ttWeight") as TextBox).Text;
        string Comments = (row.FindControl("ttComments") as TextBox).Text;
        //string UnitOrder = (row.FindControl("ttUnitOrder") as TextBox).Text;
        string Tempo = (row.FindControl("ttTempo") as TextBox).Text;
        string Trainning_Set = (row.FindControl("ttTrainning_Set") as TextBox).Text;
        string TimeDuration = (row.FindControl("ttTimeDuration") as TextBox).Text;
        string Image = (row.FindControl("ttImage") as TextBox).Text;


        using (DIYPTEntities db = new DIYPTEntities())
        {
            db.Database.Connection.Open();
            PrizeExerciseUnit item = (from c in db.PrizeExerciseUnits
                                      where c.Id == Id
                                      select c).FirstOrDefault();

            item.Exercise = Exercise;
            item.AlternateExercise = AlterExercise;
            item.Reps = Reps;
            item.Rest = Rest;
            item.Weight = Weight;
            //item.UnitOrder = Convert.ToInt32(UnitOrder);
            item.Comments = Comments;
            item.Tempo = Tempo;
            item.Trainning_Set = Trainning_Set;
            item.Comments = Comments;
            item.TimeDuration = Convert.ToInt32(TimeDuration);
            item.Image = Image;

            db.SaveChanges();
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
            PrizeExerciseUnit item = (from c in db.PrizeExerciseUnits
                                      where c.Id == Id
                                      select c).FirstOrDefault();
            db.PrizeExerciseUnits.Remove(item);

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


    protected void Insert(object sender, EventArgs e)
    {
        using (DIYPTEntities db = new DIYPTEntities())
        {

            db.Database.Connection.Open();
            {

                string[] sTemp = txtExercise.Text.Split(new string[] { "or alternatively" }, 2, StringSplitOptions.None);

                string sExercise = sTemp[0];
                string sAlterExercise = "";
                sExercise = sExercise.Trim(new char[] { ' ' });
                if (sTemp.Length > 1)
                {
                    sAlterExercise = sTemp[1];
                    sAlterExercise = Regex.Replace(sAlterExercise, @",", "");
                    sAlterExercise = sAlterExercise.Trim(new char[] { ' ' });
                }

                PrizeExerciseUnit addplan = new PrizeExerciseUnit();
                addplan.Exercise = sExercise;
                addplan.AlternateExercise = sAlterExercise;
                addplan.Reps = txtReps.Text;
                addplan.Rest = txtRest.Text;
                addplan.Weight = txtWeight.Text;
                addplan.Comments = txtComments.Text;
                addplan.UnitOrder = 0;// Convert.ToInt32(txtUnitOrder.Text);
                addplan.Tempo = txtTempo.Text;
                addplan.Trainning_Set = txtTrainning_Set.Text;
                addplan.TimeDuration = Convert.ToInt32(txtTimeDuration.Text);
                addplan.Image = txtImage.Text;
                //addplan.Video = txtVideo.Text;


                db.PrizeExerciseUnits.Add(addplan);
                db.SaveChanges();
                this.BindGrid();



            }

            //   transaction.Complete();
            db.Database.Connection.Close();

        }

    }




    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {


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
                                         Id = dic.Id,
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

                                     };
                    GridView1.DataSource = languages2.ToList();
                    GridView1.DataBind();
                }
                else
                {
                    var languages2 = from dic in db.PrizeExerciseUnits
                                     where dic.Exercise.ToUpper().Contains(txtFilter.Text.ToUpper())
                                     select new
                                     {
                                         Id = dic.Id,
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

                                     };
                    GridView1.DataSource = languages2.ToList();
                    GridView1.DataBind();
                }


            }
            db.Database.Connection.Close();
        }
    }
}