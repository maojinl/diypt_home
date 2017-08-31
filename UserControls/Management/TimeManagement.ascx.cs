using System;
using System.Collections.Generic;
using System.Data.Common;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserControls_Management_TimeManagement : System.Web.UI.UserControl
{
    DateTime currentTime;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            using (DIYPTEntities db = new DIYPTEntities())
            {
                db.Database.Connection.Open();
                {

                    PrizeSysConfig conf = (from a in db.PrizeSysConfigs
                                           select a).FirstOrDefault();
                    string s = "";
                    if (conf != null && conf.SystemDate.HasValue)
                        currentTime = conf.SystemDate.Value;
                    else
                        currentTime = DateTime.Now;

                    s = currentTime.ToString("yyyy-MM-dd");
                    txtDate.Text = s;

                }
            }
            lblError.Text = "";
        }
    }
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        using (DIYPTEntities db = new DIYPTEntities())
        {
            db.Database.Connection.Open();


            /*PrizeSysConfig conf = (from a in db.PrizeSysConfigs
                                    select a).FirstOrDefault();
            string s = TextBox1.Text;
            DateTime dt = DateTime.Parse(s);
            if (conf != null)
                conf.SystemDate = dt;
            DateTime start = DateTime.Parse(dt.ToString("yyyy-MM-dd") + " 00:00:00");
            DateTime end = DateTime.Parse(dt.ToString("yyyy-MM-dd") + " 23:59:59");

            IQueryable<PrizePollingTask> tasks = (from c in db.PrizePollingTasks
                                                    where c.TaskDate < end && c.TaskDate > start
                                                    select c);
            foreach (PrizePollingTask task in tasks)
                db.PrizePollingTasks.Remove(task);
            db.SaveChanges();*/
            string s = txtDate.Text;
            DateTime dt = DateTime.Parse(s);
/*
            if (dt < currentTime)
            {
                Response.Write("<script>alert('Time can't go backward.');</script>");
                return;
            }
*/
            DateTime start = DateTime.Parse(dt.ToString("yyyy-MM-dd") + " 00:00:00");
            DateTime end = DateTime.Parse(dt.ToString("yyyy-MM-dd") + " 23:59:59");
            DbCommand cmd = db.Database.Connection.CreateCommand();
            cmd.CommandText = "UPDATE PrizeSysConfigs set SystemDate='" + s + "'";
            cmd.ExecuteNonQuery();

            cmd.CommandText = "DELETE FROM PrizePollingTasks WHERE TaskDate >= '" + start + "'";
            cmd.ExecuteNonQuery();
            db.Database.Connection.Close();
            lblError.Text = "Update successful";

        }
    }
}