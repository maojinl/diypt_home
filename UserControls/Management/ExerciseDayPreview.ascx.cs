using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.UI.HtmlControls;

public partial class UserControls_Management_ExerciseDayPreview : System.Web.UI.UserControl
{
    protected PrizeDataAccess dbAccess = new PrizeDataAccess();
    int iPlanWeekId = 0;
    int iMemberPlanWeekId = 0;
    int iDay = 0;
    List<HtmlGenericControl> divs;
    List<Repeater> repeaters;
    List<Label> labels;
    List<Label> labelsTimeDuration;
    int memberPlanWeekId;

    protected void InitPageControls()
    {
        if (divs == null)
        {
            divs = new List<HtmlGenericControl>();
            divs.Add(this.Div1);
            divs.Add(this.Div2);
            divs.Add(this.Div3);
        }
        foreach (HtmlGenericControl div in divs)
            div.Visible = false;

        if (repeaters == null)
        {
            repeaters = new List<Repeater>();
            repeaters.Add(this.DailyTaskRepeater1);
            repeaters.Add(this.DailyTaskRepeater2);
            repeaters.Add(this.DailyTaskRepeater3);
        }

        if (labels == null)
        {
            labels = new List<Label>();
            labels.Add(this.lblDayGroupName1);
            labels.Add(this.lblDayGroupName2);
            labels.Add(this.lblDayGroupName3);
        }

        if (labelsTimeDuration == null)
        {
            labelsTimeDuration = new List<Label>();
            labelsTimeDuration.Add(this.lblTimeDuration1);
            labelsTimeDuration.Add(this.lblTimeDuration2);
            labelsTimeDuration.Add(this.lblTimeDuration3);
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {

        if (!Page.IsPostBack)
        {
            using (DIYPTEntities db = new DIYPTEntities())
            {

                db.Database.Connection.Open();
                {
                    var ProgramQuery = from c in db.PrizeExercisePlans
                                       select new { c.PlanName, c.Id };
                    ddlProgram.DataValueField = "Id";
                    ddlProgram.DataTextField = "PlanName";
                    ddlProgram.DataSource = ProgramQuery.ToList();

                    ddlProgram.DataBind();
               

                }
                db.Database.Connection.Close();

            }
        }
        /*int.TryParse(Request["PlanWeekId"], out iPlanWeekId);
        int.TryParse(Request["PlanDayNumber"], out iDay);
        int.TryParse(Request["MemberPlanWeekId"], out memberPlanWeekId);

        MemberExercisePlanWeek memberPlanWeek = dbAccess.GetMemberPlanWeekById(memberPlanWeekId);
        if (memberPlanWeek != null)
        {
            lblDate.Text = PrizeCommonUtils.ParseDateToEnglish(memberPlanWeek.StartDate.AddDays(iDay - 1));
        }
        lblDayNum.Text = "" + iDay;
        lblDayTypeName.Text = PrizeConstants.STR_NO_TRAINNING;
        DataSet ds = dbAccess.GetMemberWeeklyInfo(iPlanWeekId);
        foreach (DataRow row in ds.Tables[0].Rows)
        {
            int iWeekDay = (int)row[0];
            if (iWeekDay == iDay)
                lblDayTypeName.Text = (String)row[2];
        }


        lblDay.Text = PrizeCommonUtils.ParseWeekDayToEnglish(iDay);
        if (iDay > 1)
        {
            preDay.NavigateUrl = (String.Format("{0}?PlanWeekId={1}&MemberPlanWeekId={2}&PlanDayNumber={3}", PrizeConstants.URL_MEMBER_DAY_VIEW, iPlanWeekId, memberPlanWeekId, iDay - 1));
            preDay.Text = "Previous Day " + PrizeCommonUtils.ParseWeekDayToEnglish(iDay - 1);
        }
        else
            preDay.Attributes.Add("class", "no-arrow");

        if (iDay < 7)
        {
            nextDay.NavigateUrl = (String.Format("{0}?PlanWeekId={1}&MemberPlanWeekId={2}&PlanDayNumber={3}", PrizeConstants.URL_MEMBER_DAY_VIEW, iPlanWeekId, memberPlanWeekId, iDay + 1));
            nextDay.Text = "Next Day " + PrizeCommonUtils.ParseWeekDayToEnglish(iDay + 1);
        }
        else
            nextDay.Attributes.Add("class", "no-arrow");

        InitPageControls();

        LoadDailyInfo(iPlanWeekId, iDay);
        */
        // nextDay.Text = "Next day tuesday";
        // nextDay.NavigateUrl = "/tuesday#?";
    }

    protected void LoadDailyInfo(int iPlanWeekId, int iDay)
    {
        DataSet ds = dbAccess.GetExerciseUnitsSetDetail(iPlanWeekId, iDay);
        DataTable tblDayGroupInfo = ds.Tables[0];
        string tempScript = "<script>";
        int counter = 0;

        if (tblDayGroupInfo != null)
        {
            for (int i = 0; i < tblDayGroupInfo.Rows.Count && i < divs.Count; i++)
            {
                divs[i].Visible = true;
                int iTimeDuration = 0;
                labels[i].Text = tblDayGroupInfo.Rows[i]["DayGroupName"].ToString();
                if (ds.Tables[labels[i].Text] != null)
                {
                    foreach (DataRow row in ds.Tables[labels[i].Text].Rows)
                    {
                        iTimeDuration += int.Parse(row["TimeDuration"].ToString());
                        tempScript += @"$( '#modalPopup" + (i + 1) + "_" + counter + @"' ).click(function() {
				                    $('#theModal').load('/exercise/" + row["Exercise"].ToString().Replace(" ", "").Replace(".", "") + @"');

                                    }); ";
                        counter++;
                    }
                    labelsTimeDuration[i].Text = "" + iTimeDuration;
                    repeaters[i].DataSource = ds.Tables[labels[i].Text].DefaultView;
                    repeaters[i].DataBind();
                }
            }
        }
        tempScript += "</script>";
        Page.ClientScript.RegisterStartupScript(this.GetType(), "modalPopup", tempScript, false);
        //DailyTasksList.DataSource = ds.Tables[0].DefaultView;
        //DailyTasksList.DataBind();
    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        InitPageControls();

        using (DIYPTEntities db = new DIYPTEntities())
        {

            db.Database.Connection.Open();
            {
                int planId = int.Parse(ddlProgram.SelectedValue);
                int weekId = int.Parse(ddlWeek.SelectedValue);
                var currentWeekId = (from c in db.PrizeExercisePlanWeeks
                                     where c.ExercisePlanId == planId
                                     && c.StartWeek <= weekId && c.EndWeek > weekId
                                     select c.Id).FirstOrDefault();

                LoadDailyInfo(currentWeekId, int.Parse(ddlDay.SelectedValue));
            }
            db.Database.Connection.Close();



        }
    }
}