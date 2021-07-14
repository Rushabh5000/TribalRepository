using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class RaiseQuery : System.Web.UI.Page
{
    string sess = "";
    MySqlConnection conn = new MySqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ToString());
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["Email"] == null)
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
            sess = Session["Email"].ToString();
        }

        TextBox1.Text = Session["Email"].ToString();
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        conn.Open();
        MySqlCommand cmd = new MySqlCommand("INSERT INTO queries(email,message) VALUES ('" + TextBox1.Text + "' , '" + TextBox2.Text + "')", conn);
        cmd.ExecuteNonQuery();
        conn.Close();
        Response.Write("<script>alert('Query Raised Successfully')</script>");
        Response.Redirect("SendMail.aspx?Email=" + TextBox1.Text + "&Subject=TribalRepository&Body=Query Raised Successfully. Your query was "+ TextBox2.Text);
    }
}