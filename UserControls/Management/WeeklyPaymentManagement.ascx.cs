using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserControls_Management_WeeklyPaymentManagement : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, System.EventArgs e)
    {
    }

    private void BindGrid()
    {
        using (DIYPTEntities db = new DIYPTEntities())
        {
            db.Database.Connection.Open();
            {
                DateTime st = DateTime.MinValue;
                DateTime ed = DateTime.MaxValue;
                if (tbFrom.Text != "" && tbFrom.Text != null)
                {
                    st = DateTime.ParseExact(tbFrom.Text, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                }
                if (tbTo.Text != "" && tbTo.Text != null)
                {
                    ed = DateTime.ParseExact(tbTo.Text, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                }

                var weeklyPayments = from w in db.MemberWeeklyPayments
                                     join a in db.MemberExercisePlans on w.MemberExercisePlanId equals a.Id
                                     join dic in db.PrizeMembers on a.MemberId equals dic.UmbracoId
                                     join b in db.PrizeExercisePlans on a.ExercisePlanId equals b.Id
                                     join Program in db.PrizePlanPrograms on b.ProgramId equals Program.Id
                                     join Location in db.PrizePlanLocations on b.LocationId equals Location.Id
                                     join Experience in db.PrizePlanExperiences on b.ExperienceId equals Experience.Id
                                     join Level in db.PrizePlanLevels on b.LevelId equals Level.Id
                                     join c in db.PrizeOrders on a.Id equals c.MemberPlanId
                                     orderby a.StartDate descending
                                     where w.CreatedDate > st && w.CreatedDate < ed
                                     select new
                                     {
                                         Id = dic.UmbracoId,
                                         Firstname = dic.Firstname,
                                         Surname = dic.Surname,
                                         Email = dic.Email,
                                         IsTrialPlan = b.IsTrialPlan,
                                         PlanName = Program.Name + "_" + Location.Name + "_" + Level.Name + "_" + Experience.Name,
                                         CreatedDate = w.CreatedDate,
                                         StartDate = a.StartDate,
                                         Status = w.Status,
                                         OrderId = c.OrderId.ToString(),
                                         Transaction = c.PaymentTransactionId,
                                  };

                if (tbfistname.Text != "")
                {
                    weeklyPayments = weeklyPayments.Where(m => m.Firstname.Contains(tbfistname.Text));
                }

                GridView1.DataSource = weeklyPayments.ToList();
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
        Calendar.SelectedDate = PrizeCommonUtils.GetSystemDate();
        Calendar1.SelectedDate = PrizeCommonUtils.GetSystemDate();
    }

    protected void OnPaging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        this.BindGrid();
    }

    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Start")
        {
            string[] args = e.CommandArgument.ToString().Split(new char[]{','});
            int orderId = Convert.ToInt32(args[0]);
            int memberPlanId = Convert.ToInt32(args[1]);
            int rowIndex = Convert.ToInt32(e.CommandArgument);
            GridViewRow row = GridView1.Rows[rowIndex];
            string transaction = (row.FindControl("txtTransactionId") as TextBox).Text;
            PrizeMemberPlanManager man = new PrizeMemberPlanManager();
            man.PayMemberPlanWeekly(orderId, memberPlanId, transaction);
            this.BindGrid();
        }
    }

    protected void ImageButtonCalendar_Click(object sender, ImageClickEventArgs e)
    {
        Calendar.Visible = true;
    }

    protected void Calendar_SelectionChanged(object sender, EventArgs e)
    {
        DateTime dt = Calendar.SelectedDate;
        tbFrom.Text = dt.ToString("dd/MM/yyyy");
        Calendar.Visible = false;
    }

    protected void ImageButtonCalendar1_Click(object sender, ImageClickEventArgs e)
    {
        Calendar1.Visible = true;
    }

    protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    {
        DateTime dt = Calendar1.SelectedDate;
        tbTo.Text = dt.ToString("dd/MM/yyyy");
        Calendar1.Visible = false;
    }

}