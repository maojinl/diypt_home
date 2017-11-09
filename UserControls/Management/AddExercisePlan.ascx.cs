using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserControls_Management_AddExercisePlan : System.Web.UI.UserControl
{
	protected void Page_Load(object sender, System.EventArgs e)
	{
		if (!this.IsPostBack)
		{
			ViewState["Filter"] = "ALL";
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
				var ProgramQuery = from c in db.PrizePlanPrograms
								   select new { c.Name, c.Id };
				ddlProgram.DataValueField = "Id";
				ddlProgram.DataTextField = "Name";
				ddlProgram.DataSource = ProgramQuery.ToList();

				ddlProgram.DataBind();


				var LocationQuery = from d in db.PrizePlanLocations
									select new { d.Name, d.Id };
				ddlLocation.DataValueField = "Id";
				ddlLocation.DataTextField = "Name";
				ddlLocation.DataSource = LocationQuery.ToList();

				ddlLocation.DataBind();

				var LevelQuery = from e in db.PrizePlanLevels
								 select new { e.Name, e.Id };
				ddlLevel.DataValueField = "Id";
				ddlLevel.DataTextField = "Name";
				ddlLevel.DataSource = LevelQuery.ToList();

				ddlLevel.DataBind();


				var ExperienceQuery = from f in db.PrizePlanExperiences
									  select new { f.Name, f.Id };
				ddlExperience.DataValueField = "Id";
				ddlExperience.DataTextField = "Name";
				ddlExperience.DataSource = ExperienceQuery.ToList();

				ddlExperience.DataBind();


				ddlProgram.Items.Insert(0, new ListItem(string.Empty, string.Empty));
				ddlProgram.SelectedIndex = 0;

				ddlLocation.Items.Insert(0, new ListItem(string.Empty, string.Empty));
				ddlLocation.SelectedIndex = 0;


				ddlLevel.Items.Insert(0, new ListItem(string.Empty, string.Empty));
				ddlLevel.SelectedIndex = 0;


				ddlExperience.Items.Insert(0, new ListItem(string.Empty, string.Empty));
				ddlExperience.SelectedIndex = 0;




				db.Database.Connection.Close();
			}
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

				if (ViewState["Filter"].ToString() == "ALL")
				{
					var excerciseplan = from ExercisePlan in db.PrizeExercisePlans
										join Program in db.PrizePlanPrograms on ExercisePlan.ProgramId equals Program.Id
										join Location in db.PrizePlanLocations on ExercisePlan.LocationId equals Location.Id
										join Experience in db.PrizePlanExperiences on ExercisePlan.ExperienceId equals Experience.Id
										join Level in db.PrizePlanLevels on ExercisePlan.LevelId equals Level.Id
										orderby Program.Sequence, Location.Sequence, Level.Sequence, Experience.Sequence
										select new
										{
											Id = ExercisePlan.Id,
											programename = Program.Name,
											locationname = Location.Name,
											levelname = Level.Name,
											experiencename = Experience.Name,
											Price = ExercisePlan.Price,
											IsTrialPlan = ExercisePlan.IsTrialPlan,
											PlanName = Program.Name + "_" + Location.Name + "_" + Level.Name + "_" + Experience.Name,
										};
					GridView1.DataSource = excerciseplan.ToList();
				}
				else
				{
					int filtervalue = Convert.ToInt32(ViewState["Filter"]);
					var excerciseplan = from ExercisePlan in db.PrizeExercisePlans
										join Program in db.PrizePlanPrograms on ExercisePlan.ProgramId equals Program.Id
										join Location in db.PrizePlanLocations on ExercisePlan.LocationId equals Location.Id
										join Experience in db.PrizePlanExperiences on ExercisePlan.ExperienceId equals Experience.Id
										join Level in db.PrizePlanLevels on ExercisePlan.LevelId equals Level.Id
										where Program.Id == filtervalue
										select new
										{
											Id = ExercisePlan.Id,
											programename = Program.Name,
											locationname = Location.Name,
											levelname = Level.Name,
											experiencename = Experience.Name,
											Price = ExercisePlan.Price,
											IsTrialPlan = ExercisePlan.IsTrialPlan,
											PlanName = Program.Name + "_" + Location.Name + "_" + Level.Name + "_" + Experience.Name,
										};
					GridView1.DataSource = excerciseplan.ToList();
				}


				GridView1.DataBind();
				DropDownList ddlhdprg =
(DropDownList)GridView1.HeaderRow.FindControl("ddlhdprg");
				this.BindProgramList(ddlhdprg);

			}

			db.Database.Connection.Close();

		}
	}


	private void BindProgramList(DropDownList ddlhdprg)
	{
		using (DIYPTEntities db = new DIYPTEntities())
		{

			db.Database.Connection.Open();
			{
				var ProgramQuery = from c in db.PrizePlanPrograms
								   select new { c.Name, c.Id };
				ddlhdprg.DataValueField = "Id";
				ddlhdprg.DataTextField = "Name";
				ddlhdprg.DataSource = ProgramQuery.ToList();

				ddlhdprg.DataBind();
				ddlhdprg.Items.FindByValue(ViewState["Filter"].ToString())
	  .Selected = true;

			}
			db.Database.Connection.Close();

		}
	}

	protected void ProgramChanged(object sender, EventArgs e)
	{
		DropDownList ddlhdprg = (DropDownList)sender;
		ViewState["Filter"] = ddlhdprg.SelectedValue;
		this.BindGrid();
	}

	protected void OnRowEditing(object sender, GridViewEditEventArgs e)
	{
		GridView1.EditIndex = e.NewEditIndex;
		this.BindGrid();
	}

	protected void OnRowUpdating(object sender, GridViewUpdateEventArgs e)
	{
		GridViewRow row = GridView1.Rows[e.RowIndex];
		int Id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);
		double price = Convert.ToDouble((row.FindControl("txtPrice") as TextBox).Text);
		int isTrial = Convert.ToInt16((row.FindControl("txtTrialOrNot") as CheckBox).Checked);

		using (DIYPTEntities db = new DIYPTEntities())
		{
			db.Database.Connection.Open();
			PrizeExercisePlan plan = (from c in db.PrizeExercisePlans
									  where c.Id == Id
									  select c).FirstOrDefault();

			plan.Price = price;
			plan.IsTrialPlan = isTrial;
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


				string pname = ddlProgram.SelectedItem.Text;
				string plevel = ddlLevel.SelectedItem.Text;
				string plocation = ddlLocation.SelectedItem.Text;
				string pexpericen = ddlExperience.SelectedItem.Text;

				PrizePlanProgram planprogram = (from c in db.PrizePlanPrograms
												where c.Name == pname
												select c).FirstOrDefault();

				int pid = planprogram.Id;


				PrizePlanLocation planlocation = (from d in db.PrizePlanLocations
												  where d.Name == plocation
												  select d).FirstOrDefault();

				int locationid = planlocation.Id;


				PrizePlanLevel planlevel = (from g in db.PrizePlanLevels
											where g.Name == plevel
											select g).FirstOrDefault();

				int levelid = planlevel.Id;

				PrizePlanExperience planexperience = (from f in db.PrizePlanExperiences
													  where f.Name == pexpericen
													  select f).FirstOrDefault();

				int expid = planexperience.Id;

				double dPrice;
				if (!double.TryParse(txtPrice.Text, out dPrice))
					dPrice = 0;
				PrizeExercisePlan exerciseplan;
				int trialFlag = 0;

				if (cbTrialFlag.Checked)
				{
					exerciseplan = (
												  from ExercisePlan in db.PrizeExercisePlans
												  join Program in db.PrizePlanPrograms on ExercisePlan.ProgramId equals Program.Id
												  join Location in db.PrizePlanLocations on ExercisePlan.LocationId equals Location.Id
												  join Experience in db.PrizePlanExperiences on ExercisePlan.ExperienceId equals Experience.Id
												  join Level in db.PrizePlanLevels on ExercisePlan.LevelId equals Level.Id
												  where Program.Name == pname &&
												  Level.Name == plevel && Location.Name == plocation && Experience.Name == pexpericen && ExercisePlan.IsTrialPlan == 1
												  select ExercisePlan).FirstOrDefault();
					trialFlag = 1;
				}
				else
					exerciseplan = (
								  from ExercisePlan in db.PrizeExercisePlans
								  join Program in db.PrizePlanPrograms on ExercisePlan.ProgramId equals Program.Id
								  join Location in db.PrizePlanLocations on ExercisePlan.LocationId equals Location.Id
								  join Experience in db.PrizePlanExperiences on ExercisePlan.ExperienceId equals Experience.Id
								  join Level in db.PrizePlanLevels on ExercisePlan.LevelId equals Level.Id
								  where Program.Name == pname &&
								  Level.Name == plevel && Location.Name == plocation && Experience.Name == pexpericen && ExercisePlan.IsTrialPlan == 0
								  select ExercisePlan).FirstOrDefault();




				if (exerciseplan != null)
				{
					string errorText = "Exercise plan already exist!";
					Response.Write(
						@"<SCRIPT LANGUAGE=""JavaScript"">alert('" + errorText + "')</SCRIPT>");
				}
				else
				{
					string planname = ddlProgram.SelectedItem.Text + "_" + ddlLocation.SelectedItem.Text
									  + "_" + ddlExperience.SelectedItem.Text + "_" + ddlLevel.SelectedItem.Text;
					PrizeExercisePlan addplan = new PrizeExercisePlan();
					addplan.PlanName = planname;
					addplan.ProgramId = pid;
					addplan.LevelId = levelid;
					addplan.ExperienceId = expid;
					addplan.LocationId = locationid;
					addplan.Price = dPrice;
					addplan.IsTrialPlan = trialFlag;
					addplan.Description = "";
					db.PrizeExercisePlans.Add(addplan);
					db.SaveChanges();
					this.BindGrid();
					ddlProgram.SelectedIndex = 0;
					ddlLocation.SelectedIndex = 0;
					ddlLevel.SelectedIndex = 0;
					ddlExperience.SelectedIndex = 0;
					
				}

			}

			//   transaction.Complete();
			db.Database.Connection.Close();

		}

	}

	protected void OnRowCancelingEdit(object sender, EventArgs e)
	{
		GridView1.EditIndex = -1;
		this.BindGrid();
	}

	protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
	{
		if (e.CommandName == "Select")
		{
			string[] arg = new string[2];
			arg = e.CommandArgument.ToString().Split(';');

			Session["PLANID"] = Convert.ToString(arg[0]);
			Session["PLANNAME"] = arg[1];

			Response.Redirect("/management/exercise-plan-week-detail.aspx");
		}
	}


	protected void OnRowDataBound(object sender, GridViewRowEventArgs e)
	{

	}

}