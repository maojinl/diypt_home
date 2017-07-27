using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserControls_Management_MemberResult : System.Web.UI.UserControl
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
                int id = Convert.ToInt32(Session["MID"]);
                var languages = from a in db.MemberPlanWeekResults
                                join b in db.PrizeMembers on a.MemberId equals b.UmbracoId
                                join c in db.MemberExercisePlanWeeks on a.MemberExercisePlanWeekId equals c.Id
                                join d in db.MemberExercisePlans on c.MemberExercisePlanId equals d.Id
                                join e in db.PrizeExercisePlans on d.ExercisePlanId equals e.Id
                                where a.MemberId == id
                                orderby c.StartDate
                                select new
                                {
                                    Memberid = a.MemberId,
                                    Firstname = b.Firstname,
                                    Surname = b.Surname,
                                    Week = c.Week,
                                    StartDate = c.StartDate,
                                    EndDate = c.EndDate,
                                    PlanName = e.PlanName,
                                    EndWeight = a.EndWeight,
                                    EndWaist = a.EndWaist,
                                    EndBodyFat = a.EndBodyFat,
                                    EndChest = a.EndChest,
                                    EndHip = a.EndHip,
                                    EndHeartRate = a.EndHeartRate,
                                    FrontPhoto = a.FrontPhoto,
                                    BackPhoto = a.BackPhoto,
                                    SidePhoto = a.SidePhoto,
                                    Tasks = a.Tasks,
                                };



                GridView1.DataSource = languages.ToList();



                GridView1.DataBind();


                var foodplanweek = db.MemberFoodPlanWeeks.FirstOrDefault(a => a.MemberId == id);


                if (foodplanweek != null)
                {
                    tbFood1.Text = foodplanweek.Food1;
                    tbFood2.Text = foodplanweek.Food2;
                    tbFood3.Text = foodplanweek.Food3;
                    tbFood4.Text = foodplanweek.Food4;
                }


            }
            db.Database.Connection.Close();
        }
    }


    protected void Save(object sender, EventArgs e)
    {

        using (DIYPTEntities db = new DIYPTEntities())
        {

            db.Database.Connection.Open();
            {
                int id = Convert.ToInt32(Session["MID"]);



                var foodplanweek = db.MemberFoodPlanWeeks.FirstOrDefault(a => a.MemberId == id);

                if (foodplanweek == null)
                {

                    MemberFoodPlanWeek MemFoodPW = new MemberFoodPlanWeek();
                    MemFoodPW.MemberId = id;
                    MemFoodPW.MemberExercisePlanId = 1;
                    MemFoodPW.Food1 = tbFood1.Text;
                    MemFoodPW.Food2 = tbFood2.Text;
                    MemFoodPW.Food3 = tbFood3.Text;
                    MemFoodPW.Food4 = tbFood4.Text;
                    MemFoodPW.StartWeek = 1;
                    MemFoodPW.EndWeek = 1;
                    db.MemberFoodPlanWeeks.Add(MemFoodPW);


                }
                else
                {
                    foodplanweek.Food1 = tbFood1.Text;
                    foodplanweek.Food2 = tbFood2.Text;
                    foodplanweek.Food3 = tbFood3.Text;
                    foodplanweek.Food4 = tbFood4.Text;
                }

                db.SaveChanges();
            }

        }
    }

    protected void refresh(object sender, EventArgs e)
    {
        this.BindGrid();
    }
    protected void OnPaging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        this.BindGrid();
    }

}