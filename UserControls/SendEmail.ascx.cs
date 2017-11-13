using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using umbraco.presentation.nodeFactory;
public partial class UserControls_SendEmail : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        var node = Node.GetCurrent();
        var templateNode = new Node(5332);
        string header = templateNode.GetProperty("templateheader").Value;
        string footer = templateNode.GetProperty("templateFooter").Value;
        string body = node.GetProperty("bodyContent").Value;
  
        PrizeEmail.SendTestEmail((header + body + footer).Replace("/images/", "http://diypt.com.au/images/"), node.NiceUrl);
    }
}