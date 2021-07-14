using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ResolveQueries : System.Web.UI.Page
{
    string sess = "";
    string uid = "";
    string em = "", msg = "", qid = "";
    MySqlConnection conn = new MySqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ToString());
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
            if (!this.IsPostBack)
            { getReportData(); }
        }
        else
        {
            sess = Session["email"].ToString();
        }

    }
    protected void getReportData()
    {
        string query = "SELECT * FROM queries WHERE status = 'Processing'";

        MySqlCommand cmd = new MySqlCommand(query, conn);
        MySqlDataReader dbr;
        conn.Open();
        dbr = cmd.ExecuteReader();
        while (dbr.Read())
        {
            int qid = (int)dbr["query_id"]; ; //name is coming from database
            ListBox1.Items.Add(qid.ToString());
            //ListBox1.Items.Va
        }
        conn.Close();
    }

    protected void ListBox1_SelectedIndexChanged(object sender, EventArgs e)
    {
        
        qid = ListBox1.SelectedItem.ToString();
        conn.Open();
        MySqlCommand cmd = new MySqlCommand("SELECT email FROM queries where query_id=" + qid + "", conn);
        MySqlDataReader rdr = cmd.ExecuteReader();
        while (rdr.Read())
        {
            em = rdr.GetString(0);
        }
        rdr.Close();

        MySqlCommand cmd1 = new MySqlCommand("SELECT message FROM queries where query_id=" + qid + "", conn);
        MySqlDataReader rdr1 = cmd1.ExecuteReader();
        while (rdr1.Read())
        {
            msg = rdr1.GetString(0);
        }
        rdr1.Close();
        TextBox1.Text = em;
        TextBox2.Text = msg;

        conn.Close();
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        conn.Open();
        MySqlCommand cmd = new MySqlCommand("UPDATE queries SET resolution='" + TextBox3.Text + "' , status='Resolved' where query_id='" + ListBox1.SelectedItem.ToString() + "'", conn);
        cmd.ExecuteNonQuery();
        conn.Close();
        Response.Redirect(Request.RawUrl);

        Response.Redirect("SendMail.aspx?Email=" + em + "&Subject=Query Resolved&Body=Query: "+msg+"     Resolution Provided: "+TextBox3.Text);
    }

}