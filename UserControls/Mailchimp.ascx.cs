using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserControls_Mailchimp : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
        //var y = AddOrUpdateListMember("us15", "52d196be9764a97c49153dac087520b2", "60b14a20c0", "tvu@ctc.usyd.edu.au", "thuyen", "vu");
    }

     private string GetLists(string dataCenter, string apiKey, string listId = "")
    {
        var uri = string.Format("https://{0}.api.mailchimp.com/3.0/lists/{1}", dataCenter, listId);
        try
        {
            using (var webClient = new WebClient())
            {
                webClient.Headers.Add("Accept", "application/json");
                webClient.Headers.Add("Authorization", "apikey " + apiKey);

                return webClient.DownloadString(uri);
            }
        }
        catch (WebException we)
        {
            using (var sr = new StreamReader(we.Response.GetResponseStream()))
            {
                return sr.ReadToEnd();
            }
        }
    }

    private static string GetListMember(string dataCenter, string apiKey, string listId, string subscriberEmail = "")
    {
        var hashedEmailAddress = string.IsNullOrEmpty(subscriberEmail) ? "" : CalculateMD5Hash(subscriberEmail.ToLower());
        var uri = string.Format("https://{0}.api.mailchimp.com/3.0/lists/{1}/members/{2}", dataCenter, listId, hashedEmailAddress);
        try
        {
            using (var webClient = new WebClient())
            {
                webClient.Headers.Add("Accept", "application/json");
                webClient.Headers.Add("Authorization", "apikey " + apiKey);

                return webClient.DownloadString(uri);
            }
        }
        catch (WebException we)
        {
            using (var sr = new StreamReader(we.Response.GetResponseStream()))
            {
                return sr.ReadToEnd();
            }
        }
    }

    private static string AddOrUpdateListMember(string dataCenter, string apiKey, string listId, string subscriberEmail, string firstname, string surname)
    {
        var sampleListMember = JsonConvert.SerializeObject(
            new
            {
                email_address = subscriberEmail,
                merge_fields =
                new
                {
                    FNAME = firstname,
                    LNAME = surname
                },
                status_if_new = "subscribed"
            });

        var hashedEmailAddress = string.IsNullOrEmpty(subscriberEmail) ? "" : CalculateMD5Hash(subscriberEmail.ToLower());
        var uri = string.Format("https://{0}.api.mailchimp.com/3.0/lists/{1}/members/{2}", dataCenter, listId, hashedEmailAddress);
        try
        {
            using (var webClient = new WebClient())
            {
                webClient.Headers.Add("Accept", "application/json");
                webClient.Headers.Add("Authorization", "apikey " + apiKey);

                return webClient.UploadString(uri, "PUT", sampleListMember);
            }
        }
        catch (WebException we)
        {
            using (var sr = new StreamReader(we.Response.GetResponseStream()))
            {
                return sr.ReadToEnd();
            }
        }
    }


    private static string CalculateMD5Hash(string input)
    {
        // Step 1, calculate MD5 hash from input.
        var md5 = System.Security.Cryptography.MD5.Create();
        byte[] inputBytes = System.Text.Encoding.ASCII.GetBytes(input);
        byte[] hash = md5.ComputeHash(inputBytes);

        // Step 2, convert byte array to hex string.
        var sb = new StringBuilder();
        foreach (var @byte in hash)
        {
            sb.Append(@byte.ToString("X2"));
        }
        return sb.ToString();
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        var y = AddOrUpdateListMember("us15", "52d196be9764a97c49153dac087520b2", "60b14a20c0", txtEmail.Text, txtFirst.Text, txtLast.Text);
    }
}
