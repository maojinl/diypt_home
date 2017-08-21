using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI.HtmlControls;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;
using umbraco.NodeFactory;

public partial class UserControls_MemberLanding_ExerciseDayView : System.Web.UI.UserControl
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
        int.TryParse(Request["PlanWeekId"], out iPlanWeekId);   
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
        if (lblDayTypeName.Text.ToLower() == PrizeConstants.STR_NO_TRAINNING.ToLower())
		{
            divWarmup.Visible = divCooldown.Visible = false;
			divRest.Visible = true;
		}
		if(lblDayTypeName.Text == "Time to celebrate")
		{
            divWarmup.Visible = divCooldown.Visible = false;
			divRest.Visible = true;
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

        DivAdvanceEquipment.Visible = false;
        PrizeDataAccess db = new PrizeDataAccess();
        var memberExercisePlan = db.GetCurrentMemberPlanOrStartingPlan(PrizeMemberAuthUtils.GetMemberID());
        if (memberExercisePlan != null)
        {
            var exercisePlan = db.GetExercisePlan(memberExercisePlan.ExercisePlanId);
            if (exercisePlan != null)
            {
                if (exercisePlan.PlanName.ToLower().Contains("home")
                    && (exercisePlan.PlanName.ToLower().Contains("intermediate")
                    ||
                    exercisePlan.PlanName.ToLower().Contains("advanced"))
                    )
                {
                    DivAdvanceEquipment.Visible = true;
                }
            }
        }

        LoadDailyInfo(iPlanWeekId, iDay);

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
                counter = 0;
                divs[i].Visible = true;
                double dTimeDuration = 0;
                int iTimeDuration = 0;
                labels[i].Text = tblDayGroupInfo.Rows[i]["DayGroupName"].ToString();
                if (ds.Tables[labels[i].Text] != null)
                {
                    foreach (DataRow row in ds.Tables[labels[i].Text].Rows)
                    {
                        dTimeDuration += double.Parse(row["TimeDuration"].ToString());
                        tempScript += @"$( '#modalPopup" + (i+1) + "_" + counter + @"' ).click(function() {
				                    $('#theModal').load('/exercise/" + row["Exercise"].ToString().Replace(" ", "-").Replace(".", "") + @"');

                                    }); ";

                        tempScript += @"$( '#modalPopup" + (i + 1) + "A_" + counter + @"' ).click(function() {
				                    $('#theModal').load('/exercise/" + row["Exercise"].ToString().Replace(" ", "-").Replace(".", "") + @"');

                                    }); ";

                        tempScript += @"$( '#modalPopup" + (i + 1) + "B_" + counter + @"' ).click(function() {
				                    $('#theModal').load('/exercise/" + row["AlternateExercise"].ToString().Replace(" ", "-").Replace(".", "") + @"');

                                    }); ";
                        counter++;
                    }

                    iTimeDuration = (int)Math.Ceiling((double)dTimeDuration / 60);
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

    protected void DailyTaskRepeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        var nodeName = ((Image)e.Item.FindControl("image1")).ImageUrl;
        var node = new Node(1128);
        int nodeId = -1;
        foreach (Node childNode in node.Children)
        {
            var child = childNode;
            if (child.Name.ToLower().TrimEnd() == nodeName.ToLower().TrimEnd())
            {
                nodeId = child.Id;
                break;
            }
        }
        //Document doc = new Document(nodeId);

        // First Tell umbraco to  refresh node cache for geting uncahed value.
        //umbraco.library.UpdateDocumentCache(doc.Id);

        // Retrive content/node property value.
        //var HederTitle = Convert.ToString(doc.getProperty("HederTitle").Value);
        var newNode = new Node(nodeId);
        if (newNode.GetProperty("step1Image") != null)
        {
            var temp = newNode.GetProperty("step1Image").Value;
            var med = umbraco.uQuery.GetMedia(int.Parse(temp));
            if (med != null)
            {
                string url = med.getProperty("umbracoFile").Value.ToString();
                ((Image)e.Item.FindControl("image1")).ImageUrl = url;
            }
        }
    }

}