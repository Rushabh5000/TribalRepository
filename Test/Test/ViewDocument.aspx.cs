using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ViewDocument : System.Web.UI.Page
{
    string sess = "";
    string em;

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
        Label2.Text = Convert.ToString(Request["Email"]);
        em = Label2.Text;
        MySqlConnection conn = new MySqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ToString());

        if (!this.IsPostBack)
        {
            getReportData();
        }
    }

    protected void getReportData()
    {
        string constr = ConfigurationManager.ConnectionStrings["DefaultConnection"].ToString(); ;
        using (MySqlConnection conn = new MySqlConnection(constr))
        {
            using (MySqlDataAdapter sda = new MySqlDataAdapter("SELECT * FROM images WHERE Email='" + em + "' AND content LIKE 'image%'", conn))
            {
                DataTable dt = new DataTable();
                sda.Fill(dt);
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
            conn.Close();
        }
    }

    protected void OnRowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            byte[] bytes = (byte[])(e.Row.DataItem as DataRowView)["Data"];
            string base64String = Convert.ToBase64String(bytes, 0, bytes.Length);
            (e.Row.FindControl("Image1") as Image).ImageUrl = "data:image/png;base64," + base64String;
        }
    }
}