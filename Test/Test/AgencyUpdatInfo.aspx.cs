using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AgencyUpdatInfo : System.Web.UI.Page
{
    MySqlConnection con;
    MySqlCommand cmd;
    string emailid;
    protected void Page_Load(object sender, EventArgs e)
    {
        emailid = Session["Email"].ToString();
        con = new MySqlConnection("Data Source=localhost;Database=Tribal_47_60;User ID=root;Password=");
        con.Open();
        string query = "select * from agencyregistrationdetails where Email='" + emailid + "'";
        cmd = new MySqlCommand(query, con);
        MySqlDataReader read = cmd.ExecuteReader();
        read.Read();
        email.Text = read.GetString(5);
        string st = read.GetString(1);
        string[] name = st.Split(null);
        fnm.Value = name[0];
        mnm.Value = name[1];
        lnm.Value = name[2];
        phn.Value = read.GetString(2);
        agn.Value = read.GetString(3);
        addr.Value = read.GetString(4);
        read.Close();
    }
    protected void update_Info(object sender, EventArgs e)
    {

        string n = Request.Form["fnm"] + " " + Request.Form["mnm"] + " " + Request.Form["lnm"];
        string fname = Request.Form["fnm"];
        string phone = Request.Form["phn"];
        string agency = Request.Form["agn"];
        string address = Request.Form["addr"];
        string password = Password.Text;
        string query = "update agencyregistrationdetails set FirstName='" + fname + "',Name='" + n + "',Address='" + address + "'," +
            "PhoneNumber='" + phone + "',AgencyName='" + agency + "',Password='" + password + "' where Email='" + emailid + "'";
        cmd = new MySqlCommand(query, con);
        int i = cmd.ExecuteNonQuery();
        if (i > 0)
        {
            string query1 = "update agencylogindetails set Password ='" + password + "' " +
            "where Email='" + emailid + "'";
            cmd = new MySqlCommand(query1, con);
            int j = cmd.ExecuteNonQuery();
            if (j > 0)
            {
                Response.Write("<script>alert('Record Updated successfully')</script>");
            }

        }
    }
}