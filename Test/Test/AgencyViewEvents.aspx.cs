using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AgencyViewEvents : System.Web.UI.Page
{
    string constr;
    MySqlConnection con;
    string email;
    string sess = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        sess = Session["Email"].ToString();
        con = new MySqlConnection("Data Source=localhost;Database=Tribal_47_60;User ID=root;Password=");
        con.Open();
        getReportData();

    }
    protected void getReportData()
    {

        email = sess;
        string query = "select E.id,E.Name,E.Venue,E.Startdate,E.Enddate,C.Interested,C.Going from eventdetails E, usercountsforevents C where E.Email = '" + email + "' AND E.id=C.Eid";

        using (MySqlDataAdapter sda = new MySqlDataAdapter(query, con))
        {
            DataTable dt = new DataTable();
            sda.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
        con.Close();
    }

    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        getReportData();
    }

    void ShowMessage(string msg)
    {
        ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('" + msg + "');</script>");
    }
    protected void GridView1_Sorting(object sender, GridViewSortEventArgs e)
    {
        DataTable dtrslt = (DataTable)ViewState["dirState"];
        if (dtrslt.Rows.Count > 0)
        {
            if (Convert.ToString(ViewState["sortdr"]) == "Asc")
            {
                dtrslt.DefaultView.Sort = e.SortExpression + " Desc";
                ViewState["sortdr"] = "Desc";
            }
            else
            {
                dtrslt.DefaultView.Sort = e.SortExpression + " Asc";
                ViewState["sortdr"] = "Asc";
            }
            GridView1.DataSource = dtrslt;
            GridView1.DataBind();
        }

    }
}