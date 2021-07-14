using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Linq;
using System.ServiceModel.Security;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserViewEvent : System.Web.UI.Page
{
    MySqlConnection con;
    MySqlCommand cmd;
    String Email;
    protected void Page_Load(object sender, EventArgs e)
    {
        Email = Session["Email"].ToString();
        con = new MySqlConnection("Data Source=localhost;Database=Tribal_47_60;User ID=root;Password=");
        con.Open();
        using (MySqlDataAdapter sda = new MySqlDataAdapter("select * from eventdetails", con))
        {
            DataTable dt = new DataTable();
            sda.Fill(dt);

            Repeater1.DataSource = dt;
        }
        Repeater1.DataBind();
        con.Close();
    }
    public string GetImage(object img)
    {
        return "data:image/jpg;base64," + Convert.ToBase64String((byte[])img);
    }
    public Color GetColorIntr(object id)
    {
        con.Close();
        con.Open();

        string query = "select Interested from usereventdetails where eid='" + id + "' and email='" + Email + "'";
        cmd = new MySqlCommand(query, con);
        MySqlDataReader r = cmd.ExecuteReader();
        if (r.HasRows)
        {
            r.Read();
            if (r.GetUInt16(0) == 1)
            {
                r.Close();
                return Color.FromName(" YellowGreen");
            }
            else
            {
                r.Close();
                return Color.FromName("white");
            }

        }
        else
        {
            r.Close();
            return Color.FromName("white");

        }
    }
    public Color GetColorGoing(object id)
    {

        string query = "select Going from usereventdetails where eid='" + id + "' and email='" + Email + "'";
        cmd = new MySqlCommand(query, con);
        MySqlDataReader r1 = cmd.ExecuteReader();
        if (r1.HasRows)
        {
            r1.Read();
            if (r1.GetUInt16(0) == 1)
            {
                r1.Close();
                return Color.FromName(" YellowGreen");
            }
            else
            {
                r1.Close();
                return Color.FromName("white");
            }

        }
        else
        {
            r1.Close();
            return Color.FromName("white");
        }
    }
    protected void check_interested(object sender, EventArgs e)
    {
        con.Close();
        con.Open();
        var btn = (Button)sender;
        var item = (RepeaterItem)btn.NamingContainer;
        var IdValue = ((Label)item.FindControl("lblID")).Text;
        string query = "select Interested from usereventdetails where eid='" + IdValue + "' and email='" + Email + "'";
        cmd = new MySqlCommand(query, con);
        MySqlDataReader r = cmd.ExecuteReader();
        if (r.HasRows)
        {
            r.Read();
            if (r.GetUInt16(0) == 1)
            {
                r.Close();
                Response.Write("<script>alert('You Have Already Marked Your status for this event')</script>");
            }
            else
            {
                r.Close();
                string query1 = "update usereventdetails set Interested='" + 1 + "',Going='" + 0 + "' where eid='" + IdValue + "' and email='" + Email + "'";
                cmd = new MySqlCommand(query1, con);
                int i = cmd.ExecuteNonQuery();
                if (i > 0)
                {
                    string query4 = "update usercountsforevents set Interested=Interested+1,Going=Going-1 where eid='" + IdValue + "'";
                    cmd = new MySqlCommand(query4, con);
                    int j = cmd.ExecuteNonQuery();
                    if (j > 0)
                    {
                        Response.Redirect(Request.Url.AbsoluteUri);
                    }
                }
            }
        }
        else
        {
            r.Close();
            string query2 = "insert into usereventdetails (eid,email,Interested,Going) values ('" + IdValue + "'," +
                "'" + Email + "',1,0)";
            cmd = new MySqlCommand(query2, con);
            int i = cmd.ExecuteNonQuery();
            if (i > 0)
            {
                string query4 = "update usercountsforevents set Interested=Interested+1 where eid='" + IdValue + "'";
                cmd = new MySqlCommand(query4, con);
                int j = cmd.ExecuteNonQuery();
                if (j > 0)
                {
                    Response.Redirect(Request.Url.AbsoluteUri);
                }
            }
        }
    }
    protected void check_Going(object sender, EventArgs e)
    {
        con.Close();
        con.Open();
        var btn = (Button)sender;
        var item = (RepeaterItem)btn.NamingContainer;
        var IdValue = ((Label)item.FindControl("lblID")).Text;
        string query = "select Going from usereventdetails where eid='" + IdValue + "' and email='" + Email + "'";
        cmd = new MySqlCommand(query, con);
        MySqlDataReader r = cmd.ExecuteReader();
        if (r.HasRows)
        {
            r.Read();
            if (r.GetUInt16(0) == 1)
            {
                r.Close();
                Response.Write("<script>alert('You Have Already Marked Your status for this event')</script>");
            }
            else
            {
                r.Close();
                string query1 = "update usereventdetails set Interested='" + 0 + "',Going='" + 1 + "' where eid='" + IdValue + "' and email='" + Email + "'";
                cmd = new MySqlCommand(query1, con);
                int i = cmd.ExecuteNonQuery();
                if (i > 0)
                {
                    string query4 = "update usercountsforevents set Interested=Interested-1,Going=Going+1 where eid='" + IdValue + "'";
                    cmd = new MySqlCommand(query4, con);
                    int j = cmd.ExecuteNonQuery();
                    if (j > 0)
                    {
                        Response.Redirect(Request.Url.AbsoluteUri);
                    }
                }
            }
        }
        else
        {
            r.Close();
            string query2 = "insert into usereventdetails (eid,email,Interested,Going) values ('" + IdValue + "'," +
                "'" + Email + "',0,1)";
            cmd = new MySqlCommand(query2, con);
            int i = cmd.ExecuteNonQuery();
            if (i > 0)
            {
                string query4 = "update usercountsforevents set Going=Going+1 where eid='" + IdValue + "'";
                cmd = new MySqlCommand(query4, con);
                int j = cmd.ExecuteNonQuery();
                if (j > 0)
                {
                    Response.Redirect(Request.Url.AbsoluteUri);
                }
            }
        }
    }
}