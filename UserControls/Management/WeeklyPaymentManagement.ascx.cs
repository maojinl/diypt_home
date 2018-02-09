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

	private void BindGridWeeklyPayStart()
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

				var weeklyPayments = from w in db.MemberManualPayments
									 join a in db.MemberExercisePlans on w.MemberExercisePlanId equals a.Id
									 join dic in db.PrizeMembers on a.MemberId equals dic.UmbracoId
									 join b in db.PrizeExercisePlans on a.ExercisePlanId equals b.Id
									 join Program in db.PrizePlanPrograms on b.ProgramId equals Program.Id
									 join Location in db.PrizePlanLocations on b.LocationId equals Location.Id
									 join Experience in db.PrizePlanExperiences on b.ExperienceId equals Experience.Id
									 join Level in db.PrizePlanLevels on b.LevelId equals Level.Id
									 join c in db.PrizeOrders on a.Id equals c.MemberPlanId
									 orderby a.StartDate descending
									 where w.CreatedDate > st && w.CreatedDate < ed && w.Status.StartsWith(PrizeConstants.STATUS_PLAN_MANUAL_PAYMENT_NOT_APPROVED)
										&& (a.Status.EndsWith(PrizeConstants.STATUS_PLAN_MANUAL_PAYMENT))
									 select new
									 {

										 ManualPaymentId = w.Id,
										 MemberPlanId = a.Id,
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
										 Comment = w.Comment,
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

	private void BindGridWeeklyPayStop()
	{
		using (DIYPTEntities db = new DIYPTEntities())
		{
			db.Database.Connection.Open();
			{
				DateTime st = DateTime.MinValue;
				DateTime ed = DateTime.MaxValue;
				if (tbFrom2.Text != "" && tbFrom2.Text != null)
				{
					st = DateTime.ParseExact(tbFrom2.Text, "dd/MM/yyyy", CultureInfo.InvariantCulture);
				}
				if (tbTo2.Text != "" && tbTo2.Text != null)
				{
					ed = DateTime.ParseExact(tbTo2.Text, "dd/MM/yyyy", CultureInfo.InvariantCulture);
				}

				var weeklyPayments = from w in db.MemberManualPayments
									join a in db.MemberExercisePlans on w.MemberExercisePlanId equals a.Id
									join dic in db.PrizeMembers on a.MemberId equals dic.UmbracoId
									join b in db.PrizeExercisePlans on a.ExercisePlanId equals b.Id
									join Program in db.PrizePlanPrograms on b.ProgramId equals Program.Id
									join Location in db.PrizePlanLocations on b.LocationId equals Location.Id
									join Experience in db.PrizePlanExperiences on b.ExperienceId equals Experience.Id
									join Level in db.PrizePlanLevels on b.LevelId equals Level.Id
									join c in db.PrizeOrders on a.Id equals c.MemberPlanId
									orderby a.StartDate descending
									where w.CreatedDate > st && w.CreatedDate < ed && w.Status.StartsWith(PrizeConstants.STATUS_PLAN_MANUAL_PAYMENT_APPROVED) && !a.Status.StartsWith("2")
									select new
									{
										ManualPaymentId = w.Id,
										MemberPlanId = a.Id,
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
										Comment = w.Comment,
									};

				if (tbFirstName2.Text != "")
				{
					weeklyPayments = weeklyPayments.Where(m => m.Firstname.Contains(tbFirstName2.Text));
				}

				GridView2.DataSource = weeklyPayments.ToList();
				GridView2.DataBind();
			}
			db.Database.Connection.Close();
		}
	}



	protected void search(object sender, EventArgs e)
	{
		this.BindGridWeeklyPayStart();
	}

	protected void search2(object sender, EventArgs e)
	{
		this.BindGridWeeklyPayStop();
	}

	protected void refresh(object sender, EventArgs e)
	{
		tbfistname.Text = string.Empty;
		clWeeklyPaymentStart1.SelectedDate = PrizeCommonUtils.GetSystemDate();
		clWeeklyPaymentStart2.SelectedDate = PrizeCommonUtils.GetSystemDate();
	}

	protected void refresh2(object sender, EventArgs e)
	{
		tbFirstName2.Text = string.Empty;
		clWeeklyPaymentStop1.SelectedDate = PrizeCommonUtils.GetSystemDate();
		clWeeklyPaymentStop2.SelectedDate = PrizeCommonUtils.GetSystemDate();
	}

	protected void OnPaging(object sender, GridViewPageEventArgs e)
	{
		GridView1.PageIndex = e.NewPageIndex;
		this.BindGridWeeklyPayStart();
	}

	protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
	{
		if (e.CommandName != "Start" && e.CommandName != "Terminate")
			return;
		GridView grid = sender as GridView;
		GridViewRow row = (GridViewRow)(((Button)e.CommandSource).NamingContainer);
		int RowIndex = row.RowIndex;
		if (e.CommandName == "Start")
		{
			string[] args = e.CommandArgument.ToString().Split(new char[] { ',' });
			int weeklyPaymentId = Convert.ToInt32(args[0]);
			int memberPlanId = Convert.ToInt32(args[1]);
			int orderId = Convert.ToInt32(args[2]);
			string transaction = (row.FindControl("txtTransactionId") as TextBox).Text;
			string comment = (row.FindControl("txtComment") as TextBox).Text;
			PrizeMemberPlanManager man = new PrizeMemberPlanManager();
			man.PayMemberManualPayment(weeklyPaymentId, orderId, memberPlanId, transaction, comment);
			this.BindGridWeeklyPayStart();
		}
		else if (e.CommandName == "Terminate")
		{
			string[] args = e.CommandArgument.ToString().Split(new char[] { ',' });
			int weeklyPaymentId = Convert.ToInt32(args[0]);
			int memberPlanId = Convert.ToInt32(args[1]);
			int orderId = Convert.ToInt32(args[2]);
			string comment = (row.FindControl("txtComment2") as TextBox).Text;
			PrizeMemberPlanManager man = new PrizeMemberPlanManager();
			man.TerminateMemberManualPaymentPlan(weeklyPaymentId, memberPlanId, comment);
			this.BindGridWeeklyPayStart();
		}
	}

	protected void ImageButtonCalendar_Click(object sender, ImageClickEventArgs e)
	{
		if (sender == this.btnCalendarStart1)
			clWeeklyPaymentStart1.Visible = true;
		else
			clWeeklyPaymentStart2.Visible = true;
	}

	protected void Calendar_SelectionChanged(object sender, EventArgs e)
	{
		if (sender == clWeeklyPaymentStart1)
		{
			DateTime dt = clWeeklyPaymentStart1.SelectedDate;
			tbFrom.Text = dt.ToString("dd/MM/yyyy");
			clWeeklyPaymentStart1.Visible = false;
		}
		else
		{
			DateTime dt = clWeeklyPaymentStart2.SelectedDate;
			tbFrom2.Text = dt.ToString("dd/MM/yyyy");
			clWeeklyPaymentStart2.Visible = false;
		}
	}

	protected void ImageButtonCalendar1_Click(object sender, ImageClickEventArgs e)
	{
		if (sender == this.btnCalendarEnd1)
			clWeeklyPaymentStop1.Visible = true;
		else
			clWeeklyPaymentStop2.Visible = true;
	}

	protected void Calendar1_SelectionChanged(object sender, EventArgs e)
	{
		if (sender == clWeeklyPaymentStop1)
		{
			DateTime dt = clWeeklyPaymentStop1.SelectedDate;
			tbTo.Text = dt.ToString("dd/MM/yyyy");
			clWeeklyPaymentStop1.Visible = false;
		}
		else
		{
			DateTime dt = clWeeklyPaymentStop2.SelectedDate;
			tbTo2.Text = dt.ToString("dd/MM/yyyy");
			clWeeklyPaymentStop2.Visible = false;
		}
	}

}