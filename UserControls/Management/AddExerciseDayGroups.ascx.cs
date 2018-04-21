using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserControls_Management_AddExerciseDayGroups : System.Web.UI.UserControl
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
        using (DIYPTEntities db = new DIYPTEntities())
        {
            db.Database.Connection.Open();
            {
                var languages = from dic in db.PrizeExerciseDayGroupNames
                                select new
                                {
                                    DayGroupId = dic.Id,
                                    DayGroupName = dic.DayGroupName,
                                };


                GridView1.DataSource = languages.ToList();
                GridView1.DataBind();
            }
            db.Database.Connection.Close();

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
        string DayGroupName = (row.FindControl("ttDayGroupName") as TextBox).Text;


        using (DIYPTEntities db = new DIYPTEntities())
        {
            db.Database.Connection.Open();
            PrizeExerciseDayGroupName item = (from c in db.PrizeExerciseDayGroupNames
                                         where c.Id == Id
                                         select c).FirstOrDefault();

            item.DayGroupName = DayGroupName;

            db.SaveChanges();
            db.Database.Connection.Close();
        }
        GridView1.EditIndex = -1;
        this.BindGrid();


    }


    protected void Insert(object sender, EventArgs e)
    {
        using (DIYPTEntities db = new DIYPTEntities())
        {

            db.Database.Connection.Open();
            {

                PrizeExerciseDayGroupName dayType = new PrizeExerciseDayGroupName();
                dayType.DayGroupName = txtDayGroupName.Text;
                db.PrizeExerciseDayGroupNames.Add(dayType);
                db.SaveChanges();
                this.BindGrid();

            }

            db.Database.Connection.Close();

        }

    }




    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {


    }
}