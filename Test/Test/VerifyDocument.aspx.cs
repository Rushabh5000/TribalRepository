using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class VerifyDocument : System.Web.UI.Page
{
    string sess = "";
    string email = "";
    MySqlConnection conn = new MySqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ToString());
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            getReportData();

        }
        string uname = sess;
    }

    protected void getReportData()
    {
        string constr = ConfigurationManager.ConnectionStrings["DefaultConnection"].ToString(); ;
        using (MySqlConnection conn = new MySqlConnection(constr))
        {
            using (MySqlDataAdapter sda = new MySqlDataAdapter("SELECT * FROM profiledetails WHERE Email IN (SELECT Email from images)", conn))
            {
                DataTable dt = new DataTable();
                sda.Fill(dt);
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
            conn.Close();
        }
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

    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        Response.Write(e.CommandArgument);
        if (e.CommandName == "Select")
        {
            int rowIndex = Convert.ToInt32(e.CommandArgument);
            email = (GridView1.DataKeys[rowIndex].Values[0]).ToString();
            Response.Write("<script>window.open ('ViewDocument.aspx?Email=" + email + "','_blank');</script>");
        }
    }
}