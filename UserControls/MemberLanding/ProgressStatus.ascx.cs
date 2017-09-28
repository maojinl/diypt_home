using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Text;
using System.Web.UI.HtmlControls;

public partial class UserControls_MemberLanding_ProgressStatus : BaseOrientation
{
    MemberExercisePlanWeek _MemberPlanWeek;
    PrizeExercisePlanWeek _PlanWeek;
    int memberPlanWeekId;

    PrizeDataAccess dbAccess = new PrizeDataAccess();

    List<HtmlGenericControl> divs;
    List<List<Image>> imagesByWeek;
    int iWeekNum = 0;
    List<MemberPlanWeekResult> WeekResults;

    protected void Page_Load(object sender, EventArgs e)
    {
        int memberId = PrizeMemberAuthUtils.GetMemberID();

		var exercisePlan = dbAccess.GetCurrentMemberPlanOrStartingPlan(memberId);
        if (exercisePlan == null)
		{
            PrizeMember member = PrizeMemberAuthUtils.GetMemberData(memberId);
            PrizeMemberPlanManager planMan = new PrizeMemberPlanManager();
            Response.Redirect(planMan.GetEmptyPlanJumpURL(member));
        }

        if (int.TryParse(Request["MemberPlanWeekId"], out memberPlanWeekId))
            _MemberPlanWeek = dbAccess.GetMemberPlanWeekById(memberPlanWeekId);

        if (_MemberPlanWeek == null)
            _MemberPlanWeek = dbAccess.GetCurrentMemberPlanWeek(memberId); 

        if (_MemberPlanWeek == null)
        {
            divMeasurement.Visible = false;
            btnUpdateProgress.Enabled = false;
            return;
        }

        InitPageControls();

        frontUpload.Attributes["onchange"] = "UploadFile(this)";
        sideUpload.Attributes["onchange"] = "UploadFile(this)";
        backUpload.Attributes["onchange"] = "UploadFile(this)";

        _PlanWeek = dbAccess.GetExercisePlanWeek(_MemberPlanWeek.ExercisePlanWeekId);

        iWeekNum = this.GetLatestMeasurementWeekNum(_MemberPlanWeek.Week);

        if (iWeekNum != _MemberPlanWeek.Week)
            _MemberPlanWeek = dbAccess.GetMemberPlanWeekByMemberPlanAndWeek(_MemberPlanWeek.MemberExercisePlanId, iWeekNum);

        if (!PrizeConstants.WEEKS_NEEDS_RESULT.Contains(iWeekNum))
            divMeasurement.Visible = false;

        lblWeekNum.Text = iWeekNum.ToString();
        //lblWeekNum2.Text = lblWeekNum.Text;
        lblWeekNum3.Text = iWeekNum.ToString();

        if (!IsPostBack)
        {
            WeekResults = dbAccess.GetMemberPlanResults(_MemberPlanWeek.MemberExercisePlanId);

            LoadWeeklyResult(WeekResults);

            LoadMemberPhotos(iWeekNum, WeekResults);

            DrawProgressGraph((int)_MemberPlanWeek.MemberExercisePlanId, WeekResults);

            LoadPreNextLinks();
        }

			
	    MemberExercisePlan myPlan = dbAccess.GetCurrentMemberPlan(PrizeMemberAuthUtils.GetMemberID());
		if(myPlan != null)
		{
			PrizeExercisePlan plan = dbAccess.GetExercisePlan(myPlan.ExercisePlanId);
			if(plan != null)
			{
				if (plan.PlanName.ToLower().Contains("muscle"))
				{
					lblMeasurement3.Text = "Right arm biceps (cm)";
					lblMeasurementGraph3.Text = "Right arm biceps";
					lblMeasurementMetricGraph3.Text = "(cm)";
					lblMeasurement4.Text = "Chest (cm)";
					lblMeasurementGraph4.Text = "Chest";
					lblMeasurementMetricGraph4.Text = "(cm)";
					lblMeasurement5.Text = "Right thigh (cm)";
					lblMeasurementGraph5.Text = "Right thigh";
					lblMeasurementMetricGraph5.Text = "(cm)";
				}
				if (plan.PlanName.ToLower().Contains("tone"))
				{
					lblMeasurement3.Text = "Right arm biceps (cm)";
					lblMeasurementGraph3.Text = "Right arm biceps";
					lblMeasurementMetricGraph3.Text = "(cm)";
					lblMeasurement4.Text = "Hips (cm)";
					lblMeasurementGraph4.Text = "Hips";
					lblMeasurementMetricGraph4.Text = "(cm)";
					lblMeasurement5.Text = "Right thigh (cm)";
					lblMeasurementGraph5.Text = "Right thigh";
					lblMeasurementMetricGraph5.Text = "(cm)";
				}
				if (plan.PlanName.ToLower().Contains("weight"))
				{
					lblMeasurement3.Text = "Chest (cm)";
					lblMeasurementGraph3.Text = "Chest";
					lblMeasurementMetricGraph3.Text = "(cm)";
					lblMeasurement4.Text = "Hips (cm)";
					lblMeasurementGraph4.Text ="Hips";
					lblMeasurementMetricGraph4.Text = "(cm)";
					lblMeasurement5.Text = "Heart rate (per min)";
					lblMeasurementGraph5.Text = "Heart rate";
					lblMeasurementMetricGraph5.Text = "(per min)";
				}
			}

        }
    }

    protected void InitPageControls()
    {
        if (divs == null)
        {
            divs = new List<HtmlGenericControl>();
            divs.Add(this.divProgressPhotoWeek1);
            divs.Add(this.divProgressPhotoWeek5);
            divs.Add(this.divProgressPhotoWeek8);
            divs.Add(this.divProgressPhotoWeek11);
        }

        if (imagesByWeek == null)
        {
            imagesByWeek = new List<List<Image>>();
            imagesByWeek.Add(new List<Image>());
            imagesByWeek[0].Add(this.Image11);
            imagesByWeek[0].Add(this.Image12);
            imagesByWeek[0].Add(this.Image13);
            imagesByWeek.Add(new List<Image>());
            imagesByWeek[1].Add(this.Image51);
            imagesByWeek[1].Add(this.Image52);
            imagesByWeek[1].Add(this.Image53);
            imagesByWeek.Add(new List<Image>());
            imagesByWeek[2].Add(this.Image81);
            imagesByWeek[2].Add(this.Image82);
            imagesByWeek[2].Add(this.Image83);
            imagesByWeek.Add(new List<Image>());
            imagesByWeek[3].Add(this.Image111);
            imagesByWeek[3].Add(this.Image112);
            imagesByWeek[3].Add(this.Image113);
        }

        foreach (var div in divs)
            div.Visible = false;

    }

    protected void btnUpdateProgress_Click(object sender, EventArgs e)
    {
        UpdateWeeklyResultToDB();
        LoadMemberPhotos(iWeekNum, WeekResults);
        LoadWeeklyResult(WeekResults);
        DrawProgressGraph((int)_MemberPlanWeek.MemberExercisePlanId, WeekResults);
    }

    protected void UpdateWeeklyResultToDB()
    {
        using (DIYPTEntities db = new DIYPTEntities())
        {
            if (_MemberPlanWeek == null)
                return;

            MemberPlanWeekResult weekResult;

            weekResult = (from c in db.MemberPlanWeekResults
                          where c.MemberExercisePlanWeekId == _MemberPlanWeek.Id
                          select c).FirstOrDefault();
            if (weekResult == null)
                throw new Exception();

            decimal weight = 0;
            if (txtWeight.Text != "" && decimal.TryParse(txtWeight.Text, out weight))
            {
                if (!weekResult.StartWeight.HasValue)
                    weekResult.StartWeight = weight;
                weekResult.EndWeight = weight;
            }

            decimal hip = 0;
            if (txtHip.Text != "" && decimal.TryParse(txtHip.Text, out hip))
            {
                if (!weekResult.StartHip.HasValue)
                    weekResult.StartHip = hip;
                weekResult.EndHip = hip;
            }

            decimal waist = 0;
            if (txtWaist.Text != "" && decimal.TryParse(txtWaist.Text, out waist))
            {
                if (!weekResult.StartWaist.HasValue)
                    weekResult.StartWaist = waist;
                weekResult.EndWaist = waist;
            }

            decimal chest = 0;
            if (txtChest.Text != "" && decimal.TryParse(txtChest.Text, out chest))
            {
                if (!weekResult.StartChest.HasValue)
                    weekResult.StartChest = chest;
                weekResult.EndChest = chest;
            }

            decimal heartRate = 0;
            if (txtHeartRate.Text != "" && decimal.TryParse(txtHeartRate.Text, out heartRate))
            {
                if (!weekResult.StartHeartRate.HasValue)
                    weekResult.StartHeartRate = heartRate;
                weekResult.EndHeartRate = heartRate;
            }
            db.SaveChanges();
        }

        WeekResults = dbAccess.GetMemberPlanResults(_MemberPlanWeek.MemberExercisePlanId);
    }

    protected void LoadPreNextLinks()
    {
        int iWeek = this.GetLatestMeasurementWeekNum(iWeekNum - 1);
        MemberExercisePlanWeek prevWeek = null;
        if (iWeek != iWeekNum && iWeek >= 0)
        {
            prevWeek = dbAccess.GetMemberPlanWeekByMemberPlanAndWeek(_MemberPlanWeek.MemberExercisePlanId, iWeek);
            dayPre.NavigateUrl = "/my-account/progress-status?MemberPlanWeekID=" + prevWeek.Id;
            dayPre.Text = "Week " + (iWeek);
        }
        else
            dayPre.Attributes.Add("class", "no-arrow");

        iWeek = this.GetNextMeasurementWeekNum(iWeekNum);
        if (iWeek != iWeekNum)
        {
            var nextWeek = dbAccess.GetMemberPlanWeekByMemberPlanAndWeek(_MemberPlanWeek.MemberExercisePlanId, iWeek);
            if (nextWeek != null && !nextWeek.Status.Equals(PrizeConstants.STATUS_PLAN_NOT_STARTED))
            {
                dayNext.NavigateUrl = "/my-account/progress-status?MemberPlanWeekID=" + nextWeek.Id;
                dayNext.Text = "Week " + (iWeek);
            }
            else
                dayNext.Attributes.Add("class", "no-arrow");
        }
        else
            dayNext.Attributes.Add("class", "no-arrow");
    }

    protected void LoadWeeklyResult(List<MemberPlanWeekResult> weekResults)
    {
        if (_MemberPlanWeek == null)
            return;

        MemberPlanWeekResult weekResult = weekResults[iWeekNum];
        MemberPlanWeekResult prevWeekResult = null;

        int iWeek = this.GetLatestMeasurementWeekNum(iWeekNum - 1);
        if (iWeek >= 0)
            prevWeekResult = weekResults[iWeek];
        if (weekResult == null)
            throw new Exception();

        decimal iDiff = 0;
        if (weekResult.EndWeight.HasValue)
        {
            lblWeight.Text = weekResult.EndWeight.Value.ToString("0,0.00");
            if (prevWeekResult != null && prevWeekResult.EndWeight.HasValue)
            {
                iDiff = weekResult.EndWeight.Value - prevWeekResult.EndWeight.Value;
                lblWeightDiff.Text = iDiff.ToString("0,0.00");
            }
            else
                lblWeightDiff.Text = PrizeCommonUtils.FormatExerciseNumber(0);
        }
        else if (weekResult.StartWeight.HasValue)
            lblWeight.Text = weekResult.StartWeight.Value.ToString("0,0.00");
        else
        {
            lblWeight.Text = PrizeCommonUtils.FormatExerciseNumber(0);
            lblWeightDiff.Text = PrizeCommonUtils.FormatExerciseNumber(0);
        }

        if (weekResult.EndWaist.HasValue)
        {
            lblWaist.Text = weekResult.EndWaist.Value.ToString("0,0.00");
            if (prevWeekResult != null && prevWeekResult.EndWaist.HasValue)
            {
                iDiff = weekResult.EndWaist.Value - prevWeekResult.EndWaist.Value;
                lblWaistDiff.Text = iDiff.ToString("0,0.00");
            }
            else
                lblWaistDiff.Text = PrizeCommonUtils.FormatExerciseNumber(0);
        }
        else if (weekResult.StartWaist.HasValue)
            lblWaist.Text = weekResult.StartWaist.Value.ToString("0,0.00");
        else
        {
            lblWaist.Text = PrizeCommonUtils.FormatExerciseNumber(0);
            lblWaistDiff.Text = PrizeCommonUtils.FormatExerciseNumber(0);
        }

        if (weekResult.EndHip.HasValue)
        {
            lblHip.Text = weekResult.EndHip.Value.ToString("0,0.00");
            if (prevWeekResult != null && prevWeekResult.EndHip.HasValue)
            {
                iDiff = weekResult.EndHip.Value - prevWeekResult.EndHip.Value;
                lblHipDiff.Text = iDiff.ToString("0,0.00");
            }
            else
                lblHipDiff.Text = PrizeCommonUtils.FormatExerciseNumber(0);
        }
        else if (weekResult.StartHip.HasValue)
            lblHip.Text = weekResult.StartHip.Value.ToString("0,0.00");
        else
        {
            lblHip.Text = PrizeCommonUtils.FormatExerciseNumber(0);
            lblHipDiff.Text = PrizeCommonUtils.FormatExerciseNumber(0);
        }

        if (weekResult.EndChest.HasValue)
        {
            lblChest.Text = weekResult.EndChest.Value.ToString("0,0.00");
            if (prevWeekResult != null && prevWeekResult.EndChest.HasValue)
            {
                iDiff = weekResult.EndChest.Value - prevWeekResult.EndChest.Value;
                lblChestDiff.Text = iDiff.ToString("0,0.00");
            }
            else
                lblChestDiff.Text = PrizeCommonUtils.FormatExerciseNumber(0);
        }
        else if (weekResult.StartChest.HasValue)
            lblChest.Text = weekResult.StartChest.Value.ToString("0,0.00");
        else
        {
            lblChest.Text = PrizeCommonUtils.FormatExerciseNumber(0);
            lblChestDiff.Text = PrizeCommonUtils.FormatExerciseNumber(0);
        }

        if (weekResult.EndHeartRate.HasValue)
        {
            lblHeartRate.Text = weekResult.EndHeartRate.Value.ToString("0,0.00");
            if (prevWeekResult != null && prevWeekResult.EndHeartRate.HasValue)
            {
                iDiff = weekResult.EndHeartRate.Value - prevWeekResult.EndHeartRate.Value;
                lblHeartRateDiff.Text = iDiff.ToString("0,0.00");
            }
            else
                lblHeartRateDiff.Text = PrizeCommonUtils.FormatExerciseNumber(0);
        }
        else if (weekResult.StartHeartRate.HasValue)
            lblHeartRate.Text = PrizeCommonUtils.FormatExerciseNumber(weekResult.StartHeartRate.Value);
        else
        {
            lblHeartRate.Text = PrizeCommonUtils.FormatExerciseNumber(0);
            lblHeartRateDiff.Text = PrizeCommonUtils.FormatExerciseNumber(0);
        }
    }

    protected void LoadMemberPhotos(int iWeekNum,  List<MemberPlanWeekResult> weekResults)
    {
        if (!PrizeConstants.WEEKS_NEEDS_RESULT.Contains(iWeekNum))
        {
            this.photoPanelUpload.Visible = false;
        }
        else
        {
            this.photoPanelUpload.Visible = true;
            if (weekResults[iWeekNum] != null)
            {
                if (weekResults[iWeekNum].FrontPhoto != null)
                    Image1.ImageUrl = weekResults[iWeekNum].FrontPhoto;
                if (weekResults[iWeekNum].BackPhoto != null)
                    Image2.ImageUrl = weekResults[iWeekNum].BackPhoto;
                if (weekResults[iWeekNum].SidePhoto != null)
                    Image3.ImageUrl = weekResults[iWeekNum].SidePhoto;
            }
        }

        int i = PrizeConstants.WEEKS_NEEDS_RESULT.Length - 2;
        for(; i >= 0; i--)
        {
            if (iWeekNum > PrizeConstants.WEEKS_NEEDS_RESULT[i])
            {
                divs[i].Visible = true;
                if (weekResults[PrizeConstants.WEEKS_NEEDS_RESULT[i]] != null)
                {
                    if (weekResults[PrizeConstants.WEEKS_NEEDS_RESULT[i]].FrontPhoto != null)
                        imagesByWeek[i][0].ImageUrl = weekResults[PrizeConstants.WEEKS_NEEDS_RESULT[i]].FrontPhoto;
                    if (weekResults[PrizeConstants.WEEKS_NEEDS_RESULT[i]].BackPhoto != null)
                        imagesByWeek[i][1].ImageUrl = weekResults[PrizeConstants.WEEKS_NEEDS_RESULT[i]].BackPhoto;
                    if (weekResults[PrizeConstants.WEEKS_NEEDS_RESULT[i]].SidePhoto != null)
                        imagesByWeek[i][2].ImageUrl = weekResults[PrizeConstants.WEEKS_NEEDS_RESULT[i]].SidePhoto;
                }
            }  
        }
    }

    protected void DrawProgressGraph(int memberPlanId, List<MemberPlanWeekResult> weekResults,
        PrizeConstants.GraphDrawType drawType = PrizeConstants.GraphDrawType.DrawWeight)
    {
        string csName = "PopupScript";
        Type csType = this.GetType();
        ClientScriptManager csm = Page.ClientScript;
  
        if (!csm.IsStartupScriptRegistered(csType, csName))
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("<script type='text/javascript'>            " + Environment.NewLine);

            sb.Append("google.setOnLoadCallback(drawChart);" + Environment.NewLine);

            sb.Append("function drawChart() {" + Environment.NewLine);
            sb.Append("var data = google.visualization.arrayToDataTable([" + Environment.NewLine);
            sb.Append("['WEEK', '" + GetDrawText(drawType) + "']," + Environment.NewLine);

            /* Chart Values here */
            CreateChart(sb, memberPlanId, weekResults, drawType);

            sb.Append("var options = {" + Environment.NewLine);
            sb.Append("title: 'Progress'," + Environment.NewLine);
            sb.Append("curveType: 'function'," + Environment.NewLine);
            sb.Append("hAxis:" + Environment.NewLine);
            sb.Append("{" + Environment.NewLine);
            sb.Append("title: 'Weeks'," + Environment.NewLine);
            sb.Append("viewWindow:" + Environment.NewLine);
            sb.Append("{" + Environment.NewLine);
            sb.Append("min: 0," + Environment.NewLine);
            sb.Append("max:" + Environment.NewLine);
            sb.Append("12" + Environment.NewLine);
            sb.Append("}," + Environment.NewLine);
            sb.Append("ticks: [0, 3, 6, 9, 12] // display labels every 25" + Environment.NewLine);
            sb.Append("}," + Environment.NewLine);
            sb.Append("vAxis:" + Environment.NewLine);
            sb.Append("{" + Environment.NewLine);
            sb.Append("minValue: 0," + Environment.NewLine);

            sb.Append("title: '" + GetDrawText(drawType) + "'," + Environment.NewLine);

            sb.Append("viewWindow:" + Environment.NewLine);
            sb.Append("{" + Environment.NewLine);
            sb.Append("min:" + Environment.NewLine);
            sb.Append("0" + Environment.NewLine);
            sb.Append("}" + Environment.NewLine);

            sb.Append("}," + Environment.NewLine);
            sb.Append("legend: { position: 'out' }" + Environment.NewLine);
            sb.Append("};" + Environment.NewLine);

            sb.Append("var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));" + Environment.NewLine);

            sb.Append("chart.draw(data, options);" + Environment.NewLine);
            sb.Append("}" + Environment.NewLine);
            sb.Append("</script>" + Environment.NewLine);

            csm.RegisterStartupScript(csType, csName, sb.ToString());
        }
    }

    protected void CreateChart(StringBuilder sb, int memberPlanId, List<MemberPlanWeekResult> weekResults, PrizeConstants.GraphDrawType drawType)
    {
        List<decimal> dataList = GetGraphData(memberPlanId, weekResults, drawType);

        if (dataList == null || dataList.Count == 0)
        {
            sb.Append("[0, 0," + Environment.NewLine);
        }
        else
        {
            for (int i = 0; i < dataList.Count; i++)
            {
                if (dataList[i] == 0)
                    continue;
                sb.Append("[" + i + ", " + dataList[i] + "]," + Environment.NewLine);
                /*switch (i)
                {
                    case 0:
                        sb.Append("[0, " + dataList[i] + "]," + Environment.NewLine);
                        break;
                    case 3:
                        sb.Append("[3, 60]," + Environment.NewLine);
                        break;
                    case 6:
                        sb.Append("[6, 59]," + Environment.NewLine);
                        break;
                    case 9:
                        sb.Append("[9, 55]" + Environment.NewLine);
                        break;
                }*/
            }
        }
        sb.Append("]);" + Environment.NewLine);
    }

    protected void btnDrawWeight_Click(object sender, EventArgs e)
    {
        if (_MemberPlanWeek == null)
            return;
        PrizeConstants.GraphDrawType drawType = PrizeConstants.GraphDrawType.DrawWeight;
        if (sender == this.btnDrawWeight)
            drawType = PrizeConstants.GraphDrawType.DrawWeight;
        if (sender == this.btnDrawWaist)
            drawType = PrizeConstants.GraphDrawType.DrawWaist;
        if (sender == this.btnDrawHip)
            drawType = PrizeConstants.GraphDrawType.DrawHip;
        if (sender == this.btnDrawChest)
            drawType = PrizeConstants.GraphDrawType.DrawChest;
        if (sender == this.btnDrawHeartRate)
            drawType = PrizeConstants.GraphDrawType.DrawHeartRate;

        WeekResults = dbAccess.GetMemberPlanResults(_MemberPlanWeek.MemberExercisePlanId);
        LoadMemberPhotos(iWeekNum, WeekResults);
        LoadWeeklyResult(WeekResults);
        DrawProgressGraph((int)_MemberPlanWeek.MemberExercisePlanId, WeekResults, drawType);
    }

    public List<decimal> GetGraphData(int memberPlanId, List<MemberPlanWeekResult> weekResults, PrizeConstants.GraphDrawType type)
    {
        List<decimal> graphDataList = new List<decimal>();

        switch (type)
        {
            case PrizeConstants.GraphDrawType.DrawWeight:
                foreach (MemberPlanWeekResult week in weekResults)
                {
                    if (!week.EndWeight.HasValue)
                        graphDataList.Add(0);
                    else
                        graphDataList.Add((decimal)week.EndWeight);
                }
                break;
            case PrizeConstants.GraphDrawType.DrawWaist:
                foreach (MemberPlanWeekResult week in weekResults)
                {
                    if (!week.EndWaist.HasValue)
                        graphDataList.Add(0);
                    else
                        graphDataList.Add((decimal)week.EndWaist);
                }
                break;
            case PrizeConstants.GraphDrawType.DrawHip:
                foreach (MemberPlanWeekResult week in weekResults)
                {
                    if (!week.EndHip.HasValue)
                        graphDataList.Add(0);
                    else
                        graphDataList.Add((decimal)week.EndHip);
                }
                break;
            case PrizeConstants.GraphDrawType.DrawChest:
                foreach (MemberPlanWeekResult week in weekResults)
                {
                    if (!week.EndChest.HasValue)
                        graphDataList.Add(0);
                    else
                        graphDataList.Add((decimal)week.EndChest);
                }
                break;
            case PrizeConstants.GraphDrawType.DrawHeartRate:
                foreach (MemberPlanWeekResult week in weekResults)
                {
                    if (!week.EndHeartRate.HasValue)
                        graphDataList.Add(0);
                    else
                        graphDataList.Add((decimal)week.EndHeartRate);
                }
                break;
            default:
                break;
        }
        return graphDataList;
    }

    protected string UpdateMemberPlanWeekPhoto(MemberExercisePlanWeek memberPlanWeek, FileUpload loader, int iType = 0)
    {
        FileUpload tempFileupload = loader;
        string sPhotoTypeName = "";
        string attachmentServerPath = "";

        if (iType == 0)
        {
            sPhotoTypeName = "front";
        }
        if (iType == 1)
        {
            sPhotoTypeName = "side";
        }
        if (iType == 2)
        {
            sPhotoTypeName = "back";
        }

        string sSuffix = tempFileupload.FileName.Substring(tempFileupload.FileName.Length - 4);
        string sServerFileName = memberPlanWeek.MemberId + "_" + PrizeCommonUtils.ParseDateTimeSimple(memberPlanWeek.StartDate) + "_" + sPhotoTypeName + sSuffix;

        if (tempFileupload != null && !string.IsNullOrEmpty(tempFileupload.FileName))
        {
            string uploadPath = @"d:\sites\jrguico\diypt.club\home\member_images";
            //string uploadPath = @"C:\workspace\asp_project\diypt.club\home\member_images";
            attachmentServerPath = String.Format(@"http://{0}/member_images/{1}", HttpContext.Current.Request.Url.Authority, sServerFileName);
            decimal attachmentFileSize = Math.Round(Convert.ToDecimal(tempFileupload.PostedFile.ContentLength / 1024), 2);

            //if (attachmentFileSize + Helper.GetTrialTotalAttachmentSize(TrialId) < Convert.ToDecimal(ConfigurationManager.AppSettings["TotalAttachmentSizeLimit"]))
            if (attachmentFileSize < 15000)
            {
                string[] dirs = Directory.GetFiles(uploadPath);
                string folderPath = String.Format(@"\{0}", sServerFileName);
                string fullFilePath = uploadPath + folderPath;

                tempFileupload.SaveAs(fullFilePath);

                using (DIYPTEntities db = new DIYPTEntities())
                {
                    MemberPlanWeekResult weekResult = (from c in db.MemberPlanWeekResults
                                                       where c.MemberExercisePlanWeekId == memberPlanWeek.Id
                                                       select c).FirstOrDefault();
                    if (weekResult != null)
                    {
                        switch (iType)
                        {
                            case 0:
                                weekResult.FrontPhoto = attachmentServerPath;
                                break;
                            case 1:
                                weekResult.SidePhoto = attachmentServerPath;
                                break;
                            case 2:
                                weekResult.BackPhoto = attachmentServerPath;
                                break;
                            default:
                                break;
                        }
                        db.SaveChanges();
                    }
                }
            }
            else
            {
                Response.Write("<script>alert('You cannot attach this file. The maximum file size limit is 15mb.');</script>");
                return "";
            }
        }
        else
        {
            Response.Write("<script>alert('Please choose a file to attach.');</script>");
        }

        WeekResults = dbAccess.GetMemberPlanResults(_MemberPlanWeek.MemberExercisePlanId);

        return attachmentServerPath;
    }

    protected void btnUpload_Click(object sender, EventArgs e)
    {
        string sImageUrl = "";
        if (!string.IsNullOrEmpty(frontUpload.FileName))
        {
            sImageUrl = this.UpdateMemberPlanWeekPhoto(_MemberPlanWeek, frontUpload, 0);
            Image1.ImageUrl = sImageUrl;
        }
        if (!string.IsNullOrEmpty(sideUpload.FileName))
        {
            sImageUrl = this.UpdateMemberPlanWeekPhoto(_MemberPlanWeek, sideUpload, 1);
            Image2.ImageUrl = sImageUrl;
        }
        if (!string.IsNullOrEmpty(backUpload.FileName))
        {
            sImageUrl = this.UpdateMemberPlanWeekPhoto(_MemberPlanWeek, backUpload, 2);
            Image3.ImageUrl = sImageUrl;
        }

        using (DIYPTEntities db = new DIYPTEntities())
        {
            LoadMemberPhotos(iWeekNum, WeekResults);
            LoadWeeklyResult(WeekResults);
            DrawProgressGraph((int)_MemberPlanWeek.MemberExercisePlanId, WeekResults);
        }

    }

    protected string GetDrawText(PrizeConstants.GraphDrawType drawType)
    {
        string s = "";
        if (drawType == PrizeConstants.GraphDrawType.DrawWeight)
            s = "Weight (kg)";
        else if (drawType == PrizeConstants.GraphDrawType.DrawWaist)
            s = "Waist (cm)";
        else if (drawType == PrizeConstants.GraphDrawType.DrawHip)
            s = "Hip";
        else if (drawType == PrizeConstants.GraphDrawType.DrawHeartRate)
            s = "Heart Rate";
        else if (drawType == PrizeConstants.GraphDrawType.DrawChest)
            s = "Chest (cm)";
        return s;
    }

    protected int GetLatestMeasurementWeekNum(int iWeek)
    {
        int i = PrizeConstants.WEEKS_NEEDS_RESULT.Length - 1;
        for (; i >= 0; i--)
        {
            if (iWeek >= PrizeConstants.WEEKS_NEEDS_RESULT[i])
            {
                iWeek = PrizeConstants.WEEKS_NEEDS_RESULT[i];
                return iWeek;
            }
        }
        return iWeek;
    }

    protected int GetNextMeasurementWeekNum(int iWeek)
    {
        for (int i = 0; i < PrizeConstants.WEEKS_NEEDS_RESULT.Length; i++)
        {
            if (iWeek < PrizeConstants.WEEKS_NEEDS_RESULT[i])
            {
                iWeek = PrizeConstants.WEEKS_NEEDS_RESULT[i];
                return iWeek;
            }
        }
        return iWeek;
    }

}