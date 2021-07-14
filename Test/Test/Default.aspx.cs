using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;

public partial class _Default : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string status = "Valid";
        MySqlConnection conn = new MySqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ToString());

        conn.Open();

        MySqlCommand cmd = new MySqlCommand("INSERT INTO total_users(status) VALUES @status", conn);

        cmd.CommandText = "INSERT INTO total_users(status) VALUES (@status)";
        cmd.Parameters.AddWithValue("@status", status);

        cmd.ExecuteNonQuery();
        conn.Close();
    }
}