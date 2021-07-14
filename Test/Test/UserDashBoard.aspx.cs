using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserDashBoard : System.Web.UI.Page
{
    string sess = "";
    MySqlConnection con;
    MySqlCommand cmd;
    String email;
    public string _content;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["email"] == null)
                Response.Redirect("~/Account/Login.aspx");
            else
            {
                Response.ClearHeaders();
                Response.AddHeader("Cache-Control", "no-cache, no-store, max-age=0, must-revalidate");
                Response.AddHeader("Pragma", "no-cache");
            }
        }
        else
        {
            sess = Session["email"].ToString();
        }

        con = new MySqlConnection("Data Source=localhost;Database=Tribal_47_60;User ID=root;Password=");
        con.Open();
        email = Session["Email"].ToString();
        string query = "select FirstName from userregistrationdetails where Email='" + email + "'";
        cmd = new MySqlCommand(query, con);
        MySqlDataReader r = cmd.ExecuteReader();
        r.Read();
        string name = r.GetString(0);
        _content = "<h2> Welcome" + " " + name.ToUpper() + "</h2>";


    }
}