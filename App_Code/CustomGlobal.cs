using System;
using Umbraco.Web;

public class CustomGlobal : UmbracoApplication
	{
		/*
		public void Init(HttpApplication application)
		{
			application.PreRequestHandlerExecute += application_PreRequestHandlerExecute;
			application.BeginRequest += this.Application_BeginRequest;
			application.EndRequest += this.Application_EndRequest;
			application.Error += Application_Error;
		}
*/
		protected override void OnApplicationStarted(object sender, EventArgs ee)
		{
			base.OnApplicationStarted(sender, ee);

			// Your code here
		}

		private void application_PreRequestHandlerExecute(object sender, EventArgs e)
		{
			/*
			try
			{
				if (Session != null && Session.IsNewSession)
				{
					// Your code here
				}
			}
			catch (Exception ex) { }
			*/
		}

		private void Application_BeginRequest(object sender, EventArgs e)
		{
			try
			{
				// You begin request code here
			}
			catch { }
		}

		private void Application_EndRequest(object sender, EventArgs e)
		{
			// Your code here
		}

		protected new void Application_Error(object sender, EventArgs e)
		{
			
			Exception objErr = Server.GetLastError().GetBaseException();
			string errMsg = String.Format("<br /><b>Error in: </b>{0}<br /><b>Error Message: </b>{1}<br /><br /><b>Stack Trace: </b><br />{2}<br /><br />", Request.Url.PathAndQuery, objErr.Message, objErr.ToString().Replace(Environment.NewLine, "<br />").Replace("line", "<b>line</b>"));
			PrizeEmail.SendEmail("thuyen.vu@gmail.com", "Error on DIYPT", errMsg);
		}
	}