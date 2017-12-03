using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Globalization;

public partial class UserControls_Management_Orders : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, System.EventArgs e)
    {
        if (!this.IsPostBack)
        {



            this.BindGrid();


        }
    }


    private void BindGrid()
    {
        using (DIYPTEntities db = new DIYPTEntities())
        {
            db.Database.Connection.Open();
            {

                var gamename = from a in db.PrizeOrders
                               join b in db.PrizeExercisePlans on a.ExercisePlanId equals b.Id
                               join dic in db.PrizeMembers on a.Email equals dic.Email
                               select new
                               {
                                   FirstName = dic.Firstname,
                                   LastName = dic.Surname,
                                   Email = a.Email,
                                   Total = a.Total,
                                   PaymentTransactionId = a.PaymentTransactionId,
                                   OrderDate = a.OrderDate,
                                   PlanName = b.PlanName,
                               };

                if (tbFrom.Text != "" && tbFrom.Text != null)
                {

                    DateTime st = DateTime.ParseExact(tbFrom.Text, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                    //Convert.ToDateTime(TextBoxDate.Text);
                    gamename = gamename.Where(m => m.OrderDate >= st);

                }
                if (tbTo.Text != "" && tbTo.Text != null)
                {

                    DateTime ed = DateTime.ParseExact(tbTo.Text, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                    //Convert.ToDateTime(tbTo.Text);
                    gamename = gamename.Where(m => m.OrderDate <= ed);
                }


                if (gamename != null)
                {
                    GridView1.DataSource = gamename.ToList();
                    GridView1.DataBind();
                }






            }
            db.Database.Connection.Close();
        }
    }



    protected void refresh(object sender, EventArgs e)
    {
        tbFrom.Text = string.Empty;
        tbTo.Text = string.Empty;

        this.BindGrid();

    }

    protected void search(object sender, EventArgs e)
    {
        this.BindGrid();

    }
    protected void ImageButtonCalendar_Click(object sender, ImageClickEventArgs e)
    {
        Calendar.Visible = true;
    }

    /// <summary>
    /// Gets the selected date on the Calendar control and writes in TextBox
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
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

    /// <summary>
    /// Gets the selected date on the Calendar control and writes in TextBox
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    {
        DateTime dt = Calendar1.SelectedDate;
        tbTo.Text = dt.ToString("dd/MM/yyyy");
        Calendar1.Visible = false;
    }

    protected void OnRowDataBound(object sender, GridViewRowEventArgs e)
    {

    }
    protected void OnPaging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        this.BindGrid();
    }


    protected void Button1_Click(object sender, EventArgs e)
    {
		/*
        int i = (int)PrizeConstants.EmailType.WelcomeEmail;
        int end = (int)PrizeConstants.EmailType.ReviveMeEmail;
        
        for (; i <= end; i++ )
        {
            PrizeMember member = PrizeMemberAuthUtils.GetMemberData(10779);
            PrizeEmailWrapper.PrepareSimpleEmailByType(member, (PrizeConstants.EmailType)i, "", member.Firstname, "", "", "", "");
            member = PrizeMemberAuthUtils.GetMemberData(10815);
            PrizeEmailWrapper.PrepareSimpleEmailByType(member, (PrizeConstants.EmailType)i, "", member.Firstname, "", "", "", "");
            member = PrizeMemberAuthUtils.GetMemberData(10798);
            PrizeEmailWrapper.PrepareSimpleEmailByType(member, (PrizeConstants.EmailType)i, "", member.Firstname, "", "", "", "");
            member = PrizeMemberAuthUtils.GetMemberData(10796);
            PrizeEmailWrapper.PrepareSimpleEmailByType(member, (PrizeConstants.EmailType)i, "", member.Firstname, "", "", "", "");
        }
		*/
    }
}