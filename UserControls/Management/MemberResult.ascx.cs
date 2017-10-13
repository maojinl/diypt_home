using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserControls_Management_MemberResult : System.Web.UI.UserControl
{
    int memberId;
    protected void Page_Load(object sender, System.EventArgs e)
    {
        memberId = Convert.ToInt32(Session["MID"]);
        this.BindGrid();
    }


    private void BindGrid()
    {
        using (DIYPTEntities db = new DIYPTEntities())
        {
            db.Database.Connection.Open();
            {
                
                var languages = from a in db.MemberPlanWeekResults
                                join b in db.PrizeMembers on a.MemberId equals b.UmbracoId
                                join c in db.MemberExercisePlanWeeks on a.MemberExercisePlanWeekId equals c.Id
                                join d in db.MemberExercisePlans on c.MemberExercisePlanId equals d.Id
                                join e in db.PrizeExercisePlans on d.ExercisePlanId equals e.Id
                                where a.MemberId == memberId
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


                var foodplanweek = db.MemberFoodPlanWeeks.FirstOrDefault(a => a.MemberId == memberId);


                if (foodplanweek != null)
                {
                    tbFood1.Text = foodplanweek.Food1;
                    tbFood2.Text = foodplanweek.Food2;
                    tbFood3.Text = foodplanweek.Food3;
                    tbFood4.Text = foodplanweek.Food4;
                    if (foodplanweek.Food5 != null)
                    {
                        string[] sPersentage = foodplanweek.Food5.Split(';');
                        if (sPersentage.Length > 0)
                        {
                            tbFood5.Text = sPersentage[0];
                            if (sPersentage.Length > 1)
                            {
                                tbFood6.Text = sPersentage[1];
                                if (sPersentage.Length > 2)
                                    tbFood7.Text = sPersentage[2];
                            }
                        }
                    }
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
                    MemFoodPW.Food5 = tbFood5.Text + ";" + tbFood6.Text + ";" + tbFood7.Text;
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
                    foodplanweek.Food5 = tbFood5.Text + ";" + tbFood6.Text + ";" + tbFood7.Text;
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


    protected void btnChangeLevel_Click(object sender, EventArgs e)
    {
        var sTargetLevel = ddlLevel.Text;
        PrizeMemberPlanManager man = new PrizeMemberPlanManager();
        PrizeDataAccess dbAccess = new PrizeDataAccess();
        MemberExercisePlan myPlan = dbAccess.GetCurrentMemberPlan(memberId);
        if (myPlan == null)
        {
            Response.Write("<script>alert('Can't find the user's plan.');</script>");
        }
        else
        {
            if (!man.ChangeMemberPlanLevel(myPlan.Id, sTargetLevel))
                Response.Write("<script>alert('The level of the current program not in the database.');</script>");
            else
                Response.Write("<script>alert('The user's level has been changed to " + sTargetLevel + ");</script>");
        }
    }
}