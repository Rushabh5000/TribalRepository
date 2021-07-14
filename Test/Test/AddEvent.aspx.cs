using Microsoft.SqlServer.Server;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Net.Mail;

public partial class AddEvent : System.Web.UI.Page
{
    MySqlConnection con;
    MySqlCommand cmd;
    String email;
    string name = "";
    string description = "";
    string venued = "";
    string startdate = "";
    string enddate = "";
    string cate = "";
    string email1="";
    protected void Page_Load(object sender, EventArgs e)
    {
        con = new MySqlConnection("Data Source=localhost;Database=Tribal_47_60;User ID=root;Password=");
        con.Open();
        email = Session["Email"].ToString();
    }
    protected void addTextBox_SelectedIndexChanged(object sender, EventArgs e)
    {
        string val = talent.SelectedValue;
        if (val == "Others")
        {
            tp.Style.Add("display", "block");
        }
        else
        {
            tp.Style.Add("display", "none");
        }
    }

    protected void add_Event(object sender, EventArgs e)
    {
        name = ename.Value;
        description = descp.Value;
        venued = venue.Value;
        startdate = sdate.Value;
        enddate = edate.Value;
        cate = talent.SelectedValue;
        email1 = email;
        byte[] bytes;
        int i; string val;

        if (cate == "Others")
        {
            val = txt.Value;
        }
        else
        {
            val = cate;
        }
        using (Stream fs = poster.PostedFile.InputStream)
        using (BinaryReader br = new BinaryReader(fs))
            bytes = br.ReadBytes((Int32)fs.Length);
        string contentType = poster.PostedFile.ContentType;
        string query = "insert into eventdetails(Email,Name,Description,Venue,Startdate,Enddate,Category,Data,Content) " +
            "values (@Email,@Name,@Description,@Venue,@Startdate,@Enddate,@Category,@Data,@Content)";
        using (cmd = new MySqlCommand(query, con))
        {
            cmd.Parameters.AddWithValue("@Email", email);
            cmd.Parameters.AddWithValue("@Name", name);
            cmd.Parameters.AddWithValue("@Description", description);
            cmd.Parameters.AddWithValue("@Venue", venued);
            cmd.Parameters.AddWithValue("@Startdate", startdate);
            cmd.Parameters.AddWithValue("@Enddate", enddate);
            cmd.Parameters.AddWithValue("@Category", val);
            cmd.Parameters.AddWithValue("@Data", bytes);
            cmd.Parameters.AddWithValue("@Content", contentType);
            i = cmd.ExecuteNonQuery();
        }
        if (i > 0)
        {
            string mainquery = "SELECT LAST_INSERT_ID()";
            cmd = new MySqlCommand(mainquery, con);
            MySqlDataReader read = cmd.ExecuteReader();
            read.Read();
            int id = read.GetInt32(0);
            read.Close();
            string countquery = "insert into usercountsforevents(Eid,Interested ,Going ) values ('" + id + "',0,0)";
            cmd = new MySqlCommand(countquery, con);
            int j = cmd.ExecuteNonQuery();
            if (j > 0)
            {
                Response.Write("<script>alert('Event Added Successfully')</script>");
            }

            MySqlCommand cmd1 = new MySqlCommand("SELECT Email FROM userregistrationdetails", con);
            MySqlDataReader rdr = cmd1.ExecuteReader();
            while (rdr.Read())
            {
                String em = rdr.GetString(0);
                PostMail(em, "New event, new Opportunity"); 
                //Response.Write("<script>alert('Mail Sent to "+em+"')</script>");
            }
            rdr.Close();
        }
        else
        {
            Response.Write("<script>alert('Error!')</script>");
        }
    }
    protected void PostMail(String email, String subject)
    {
        try
        {
            MailMessage message = new MailMessage();
            SmtpClient smtp = new SmtpClient();
            message.From = new MailAddress("tribalrepository@gmail.com");
            message.To.Add(new MailAddress(email));
            message.Subject = subject;
            message.IsBodyHtml = true; //to make message body as html  
            string htmlString = "<html><body><h2>Event Details</h2><h4><table border=1><tr><td> Event Name </td><td>" + name + "</td></tr><tr><td> Description </td><td>"+description+"</td></tr><tr><td> Venue </td><td>"+venued+"</td></tr><tr><td> Start Date </td><td>"+startdate+"</td></tr><tr><td> End Date </td><td>"+enddate+"</td></tr><tr><td> Category </td><td>"+cate+ "</td></tr><tr><td> Agency Contact </td><td>" + email1 + "</td></tr></table> </h5> <p>Log in to your Dashboard to mark your interest.</p></body></html> ";
            message.Body = htmlString;
            smtp.Port = 587;
            smtp.Host = "smtp.gmail.com"; //for gmail host  
            smtp.EnableSsl = true;
            smtp.UseDefaultCredentials = false;
            smtp.Credentials = new NetworkCredential("tribalrepository@gmail.com", "tralent@123");
            smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
            smtp.Send(message);
        }
        catch (Exception exp)
        {
            Response.Write(exp.Message);
        }
    }
}