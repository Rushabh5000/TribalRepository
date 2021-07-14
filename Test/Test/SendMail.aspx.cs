using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SendMail : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string email = Request["Email"];
        string subject = Request["Subject"];
        string body = Request["Body"];
        PostMail(email,subject,body);
    }
    protected void PostMail(String email, String subject, String body)
    {
        try
        {
            MailMessage message = new MailMessage();
            SmtpClient smtp = new SmtpClient();
            message.From = new MailAddress("tribalrepository@gmail.com");
            message.To.Add(new MailAddress(email));
            message.Subject = subject;
            message.IsBodyHtml = true; //to make message body as html  
            message.Body = body;
            smtp.Port = 587;
            smtp.Host = "smtp.gmail.com"; //for gmail host  
            smtp.EnableSsl = true;
            smtp.UseDefaultCredentials = false;
            smtp.Credentials = new NetworkCredential("tribalrepository@gmail.com", <PASSWORD>);
            smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
            smtp.Send(message);

            Response.Redirect(Request.UrlReferrer.ToString());
        }
        catch (Exception exp)
        {
            Response.Write(exp.Message);
        }
    }
}
