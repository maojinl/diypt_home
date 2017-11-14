using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserControls_Management_MemberResult : System.Web.UI.UserControl
{
	int memberId;
	PrizeDataAccess dbAccess = new PrizeDataAccess();
	protected void Page_Load(object sender, System.EventArgs e)
	{
		memberId = Convert.ToInt32(Session["MID"]);
		this.BindGrid();
		this.BindDropDownList();
	}

	private void BindDropDownList()
	{
		PrizeExercisePlan plan = dbAccess.GetCurrentOrStartingExercisePlanInfo(memberId);
		if (plan == null)
		{
			return;
		}


		using (DIYPTEntities db = new DIYPTEntities())
		{
			db.Database.Connection.Open();
			{
				var ProgramQuery = from c in db.PrizePlanPrograms
								   select new { c.Name, c.Id };
				ddlProgram.DataValueField = "Id";
				ddlProgram.DataTextField = "Name";
				ddlProgram.DataSource = ProgramQuery.ToList();

				ddlProgram.DataBind();

				ddlProgram.Items.FindByValue("" + plan.ProgramId).Selected = true;

				var LevelQuery = from e in db.PrizePlanLevels
								 select new { e.Name, e.Id };
				ddlLevel.DataValueField = "Id";
				ddlLevel.DataTextField = "Name";
				ddlLevel.DataSource = LevelQuery.ToList();

				ddlLevel.DataBind();

				ddlLevel.Items.FindByValue("" + plan.LevelId).Selected = true;

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
		var sTargetLevel = ddlLevel.SelectedItem.Text;
		PrizeMemberPlanManager man = new PrizeMemberPlanManager();
		PrizeDataAccess dbAccess = new PrizeDataAccess();
		MemberExercisePlan myPlan = dbAccess.GetCurrentMemberPlanOrStartingPlan(memberId);
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
		this.BindGrid();
	}

	protected void btnChangeProgram_Click(object sender, EventArgs e)
	{
		var sTargetProgram = ddlProgram.SelectedItem.Text;
		PrizeMemberPlanManager man = new PrizeMemberPlanManager();
		PrizeDataAccess dbAccess = new PrizeDataAccess();
		MemberExercisePlan myPlan = dbAccess.GetCurrentMemberPlanOrStartingPlan(memberId);
		if (myPlan == null)
		{
			Response.Write("<script>alert('Can't find the user's plan.');</script>");
		}
		else
		{
			if (!man.ChangeMemberPlanProgram(myPlan.Id, sTargetProgram))
				Response.Write("<script>alert('The level of the current program not in the database.');</script>");
			else
				Response.Write("<script>alert('The user's program has been changed to " + sTargetProgram + ");</script>");
		}
		this.BindGrid();
	}

	protected void btnPauseResume_Click(object sender, EventArgs e)
	{
		PrizeDataAccess dbAccess = new PrizeDataAccess();
		if (this.ddlPauseResume.Text.Equals("Pause"))
		{
			MemberExercisePlan myPlan = dbAccess.GetCurrentMemberPlanOrStartingPlan(memberId);
			PrizeMemberPlanManager man = new PrizeMemberPlanManager();
			if (myPlan == null)
			{
				Response.Write("<script>alert('Can't find the user's available plan.');</script>");
			}
			else
			{
				if (!man.PauseMemberPlan(myPlan.Id))
					Response.Write("<script>alert('Error happens when pausing the plan.');</script>");
				else
					Response.Write("<script>alert('The plan is paused);</script>");
			}
		}
		else if (this.ddlPauseResume.Text.Equals("Resume"))
		{
			MemberExercisePlan myPlan = dbAccess.GetCurrentMemberPausedPlan(memberId);
			PrizeMemberPlanManager man = new PrizeMemberPlanManager();
			if (myPlan == null)
			{
				Response.Write("<script>alert('Can't find the user's paused plan.');</script>");
			}
			else
			{
				if (!man.ResumeMemberPlan(myPlan.Id))
					Response.Write("<script>alert('Error happens when resuming the plan.');</script>");
				else
					Response.Write("<script>alert('The plan is resumed);</script>");
			}
		}
		this.BindGrid();
		return;
	}

	protected string ReplaceWebSiteUrl(object url)
	{
		string s = null;
		if (url != null)
		{
			s = url as string;
		}
		if (s != null)
		{
			return s.Replace("http://web106.sand.studiocoast.com.au", "http://diypt.com.au");
		}
		return s;
	}
}