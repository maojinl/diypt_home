﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Text;
using System.Web.UI.HtmlControls;

public partial class UserControls_MemberLanding_ProgressStatus : System.Web.UI.UserControl
{
    MemberExercisePlanWeek _MemberPlanWeek;
    PrizeExercisePlanWeek _PlanWeek;

    PrizeDataAccess dbAccess = new PrizeDataAccess();

    List<HtmlGenericControl> divs;
    List<List<Image>> imagesByWeek;
    int iWeekNum = 0;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (PrizeMemberAuthUtils.CurrentUserLogin() != true)
            return;

        InitPageControls();

        frontUpload.Attributes["onchange"] = "UploadFile(this)";
        sideUpload.Attributes["onchange"] = "UploadFile(this)";
        backUpload.Attributes["onchange"] = "UploadFile(this)";

        int memberId = PrizeMemberAuthUtils.GetMemberID();
        using (DIYPTEntities db = new DIYPTEntities())
        {

            _MemberPlanWeek = dbAccess.GetCurrentMemberPlanWeek(memberId); //(MemberExercisePlanWeek)Session["MemberPlanWeek"];

            if (_MemberPlanWeek == null)
            {
                return;
            }

            _PlanWeek = dbAccess.GetExercisePlanWeek(_MemberPlanWeek.ExercisePlanWeekId);

            if (_PlanWeek == null)
                iWeekNum = 1;
            else
                iWeekNum = _MemberPlanWeek.Week + 1;

            lblWeekNum.Text = iWeekNum.ToString();
            lblWeekNum2.Text = lblWeekNum.Text;
            lblWeekNum3.Text = lblWeekNum.Text;

            List<MemberPlanWeekResult> weekResults = dbAccess.GetMemberPlanResults(_MemberPlanWeek.MemberExercisePlanId);

            if (!IsPostBack)
            {
                LoadWeeklyResult(db);

                LoadMemberPhotos(iWeekNum, weekResults);

                DrawProgressGraph((int)_MemberPlanWeek.MemberExercisePlanId, weekResults);
            }

            db.Database.Connection.Close();
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
        using (DIYPTEntities db = new DIYPTEntities())
        {
            UpdateWeeklyResultToDB(db);
            List<MemberPlanWeekResult> weekResults = dbAccess.GetMemberPlanResults(_MemberPlanWeek.MemberExercisePlanId);
            LoadMemberPhotos(iWeekNum, weekResults);
            LoadWeeklyResult(db);
            DrawProgressGraph((int)_MemberPlanWeek.MemberExercisePlanId, weekResults);
        }
    }

    protected void UpdateWeeklyResultToDB(DIYPTEntities db)
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

    protected void LoadWeeklyResult(DIYPTEntities db)
    {
        if (_MemberPlanWeek == null)
            return;

        MemberPlanWeekResult weekResult;

        weekResult = (from c in db.MemberPlanWeekResults
                      where c.MemberExercisePlanWeekId == _MemberPlanWeek.Id
                      select c).FirstOrDefault();
        if (weekResult == null)
            throw new Exception();

        decimal iDiff = 0;
        if (weekResult.EndWeight.HasValue)
        {
            lblWeight.Text = weekResult.EndWeight.Value.ToString("0,0.00");
            if (weekResult.StartWeight.HasValue)
            {
                iDiff = weekResult.EndWeight.Value - weekResult.StartWeight.Value;
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
            if (weekResult.StartWaist.HasValue)
            {
                iDiff = weekResult.EndWaist.Value - weekResult.StartWaist.Value;
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
            if (weekResult.StartHip.HasValue)
            {
                iDiff = weekResult.EndHip.Value - weekResult.StartHip.Value;
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
            if (weekResult.StartChest.HasValue)
            {
                iDiff = weekResult.EndChest.Value - weekResult.StartChest.Value;
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
            if (weekResult.StartHeartRate.HasValue)
            {
                iDiff = weekResult.EndHeartRate.Value - weekResult.StartHeartRate.Value;
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
            if (weekResults[iWeekNum - 1] != null)
            {
                if (weekResults[iWeekNum - 1].FrontPhoto != null)
                    Image1.ImageUrl = weekResults[iWeekNum - 1].FrontPhoto;
                if (weekResults[iWeekNum - 1].BackPhoto != null)
                    Image2.ImageUrl = weekResults[iWeekNum - 1].BackPhoto;
                if (weekResults[iWeekNum - 1].SidePhoto != null)
                    Image3.ImageUrl = weekResults[iWeekNum - 1].SidePhoto;
            }
        }

        int i = PrizeConstants.WEEKS_NEEDS_RESULT.Length - 2;
        for(; i >= 0; i--)
        {
            if (iWeekNum > PrizeConstants.WEEKS_NEEDS_RESULT[i])
            {
                divs[i].Visible = true;
                if (weekResults[PrizeConstants.WEEKS_NEEDS_RESULT[i] - 1] != null)
                {
                    if (weekResults[PrizeConstants.WEEKS_NEEDS_RESULT[i] - 1].FrontPhoto != null)
                        imagesByWeek[i][0].ImageUrl = weekResults[PrizeConstants.WEEKS_NEEDS_RESULT[i] - 1].FrontPhoto;
                    if (weekResults[PrizeConstants.WEEKS_NEEDS_RESULT[i] - 1].BackPhoto != null)
                        imagesByWeek[i][1].ImageUrl = weekResults[PrizeConstants.WEEKS_NEEDS_RESULT[i] - 1].BackPhoto;
                    if (weekResults[PrizeConstants.WEEKS_NEEDS_RESULT[i] - 1].SidePhoto != null)
                        imagesByWeek[i][2].ImageUrl = weekResults[PrizeConstants.WEEKS_NEEDS_RESULT[i] - 1].SidePhoto;
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

        using (DIYPTEntities db = new DIYPTEntities())
        {
            List<MemberPlanWeekResult> weekResults = dbAccess.GetMemberPlanResults(_MemberPlanWeek.MemberExercisePlanId);
            LoadMemberPhotos(iWeekNum, weekResults);
            LoadWeeklyResult(db);
            DrawProgressGraph((int)_MemberPlanWeek.MemberExercisePlanId, weekResults, drawType);
        }
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
            //string uploadPath = @"d:\sites\jrguico\diypt.club\home\member_images";
            string uploadPath = @"C:\workspace\asp_project\diypt.club\home\member_images";
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
            List<MemberPlanWeekResult> weekResults = dbAccess.GetMemberPlanResults(_MemberPlanWeek.MemberExercisePlanId);
            LoadMemberPhotos(iWeekNum, weekResults);
            LoadWeeklyResult(db);
            DrawProgressGraph((int)_MemberPlanWeek.MemberExercisePlanId, weekResults);
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
}