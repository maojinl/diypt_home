using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserControls_ExercisePlan : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lblError.Text = "";
        if (!Page.IsPostBack)
        {
            UpdateForm();
        }

    }
    private void UpdateForm()
    {
        using (DIYPTEntities db = new DIYPTEntities())
        {
            var tempStage = int.Parse(ddlStage.SelectedValue);
            var tempLevel = int.Parse(ddlLevel.SelectedValue);
            var tempWeek = int.Parse(ddlWeek.SelectedValue);

            /*var dbStage = (from c in db.PrizeExercisePlans
                           where c.PlanStage == tempStage
                           && c.PlanLevel == tempLevel
                           select c).FirstOrDefault();
            if (dbStage != null)
            {
                var dbWeek = (from c in db.PrizeExercisePlanWeeks
                              where c.Week == tempWeek
                              && c.PrizeExercisePlan.Id == dbStage.Id
                              select c).FirstOrDefault();

                txtDescription.Text = dbStage.Description;

                txtDay1.Text = "";
                txtDay2.Text = "";
                txtDay3.Text = "";
                txtDay4.Text = "";
                txtDay5.Text = "";
                txtDay6.Text = "";
                txtDay7.Text = "";

                if (dbWeek != null)
                {
                    txtDay1.Text = dbWeek.ExerciseDay1;
                    txtDay2.Text = dbWeek.ExerciseDay2;
                    txtDay3.Text = dbWeek.ExerciseDay3;
                    txtDay4.Text = dbWeek.ExerciseDay4;
                    txtDay5.Text = dbWeek.ExerciseDay5;
                    txtDay6.Text = dbWeek.ExerciseDay6;
                    txtDay7.Text = dbWeek.ExerciseDay7;
                }
            }

            var dbFood = (from c in db.PrizeFoodPlans
                          select c).ToList();
            ddlFoodPlan.DataSource = dbFood;
            ddlFoodPlan.DataTextField = "PlanName";
            ddlFoodPlan.DataValueField = "Id";
            ddlFoodPlan.DataBind();*/
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        using (DIYPTEntities db = new DIYPTEntities())
        {
            var tempStage = int.Parse(ddlStage.SelectedValue);
            var tempLevel = int.Parse(ddlLevel.SelectedValue);
            var tempWeek = decimal.Parse(ddlWeek.SelectedValue);

           /* var dbStage = (from c in db.PrizeExercisePlans
                           where c.PlanStage == tempStage
                           && c.PlanLevel == tempLevel
                           select c).FirstOrDefault();
            if (dbStage != null)
            {
                var dbWeek = (from c in db.PrizeExercisePlanWeeks
                              where c.Week == tempWeek
                              && c.PrizeExercisePlan.Id == dbStage.Id
                              select c).FirstOrDefault();

                dbStage.Description = txtDescription.Text;

                if (dbWeek != null)
                {
                    dbWeek.Week = tempWeek;
                    dbWeek.ExerciseDay1 = txtDay1.Text;
                    dbWeek.ExerciseDay2 = txtDay2.Text;
                    dbWeek.ExerciseDay3 = txtDay3.Text;
                    dbWeek.ExerciseDay4 = txtDay4.Text;
                    dbWeek.ExerciseDay5 = txtDay5.Text;
                    dbWeek.ExerciseDay6 = txtDay6.Text;
                    dbWeek.ExerciseDay7 = txtDay7.Text;

                    dbWeek.PrizeFoodPlanId = tempWeek;
                    dbWeek.PrizeExercisePlanId = dbStage.Id;
                }
                else
                {
                    dbWeek = new PrizeExercisePlanWeek();
                    dbWeek.Week = tempWeek;
                    dbWeek.ExerciseDay1 = txtDay1.Text;
                    dbWeek.ExerciseDay2 = txtDay2.Text;
                    dbWeek.ExerciseDay3 = txtDay3.Text;
                    dbWeek.ExerciseDay4 = txtDay4.Text;
                    dbWeek.ExerciseDay5 = txtDay5.Text;
                    dbWeek.ExerciseDay6 = txtDay6.Text;
                    dbWeek.ExerciseDay7 = txtDay7.Text;

                    dbWeek.PrizeFoodPlanId = tempWeek;
                    dbWeek.PrizeExercisePlanId = dbStage.Id;

                    db.PrizeExercisePlanWeeks.Add(dbWeek);
                }



                db.SaveChanges();
                lblError.Text = "Saved!";
            }*/

        }
    }
    protected void ddlWeek_SelectedIndexChanged(object sender, EventArgs e)
    {
        UpdateForm();
    }
    protected void ddlLevel_SelectedIndexChanged(object sender, EventArgs e)
    {
        UpdateForm();
    }
    protected void ddlStage_SelectedIndexChanged(object sender, EventArgs e)
    {
        UpdateForm();
    }
}