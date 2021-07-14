using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class gridView : System.Web.UI.Page
{
    MySqlConnection con;
    MySqlCommand cmd;
    string sess = "admin@tralent.com";
    string uid = "";
    
    protected void Page_Load(object sender, EventArgs e)
    {
        con = new MySqlConnection("Data Source=localhost;Database=Tribal_47_60;User ID=root;Password=");
        con.Open();
        if (!this.IsPostBack)
        {
            getReportData();

        }
        string uname = sess;
    }

    protected void getReportData()
    {
        string constr = "Data Source = localhost; Database = Tribal_47_60; User ID = root; Password = " ;
        using (MySqlConnection conn = new MySqlConnection(constr))
        {
            using (MySqlDataAdapter sda = new MySqlDataAdapter("SELECT * FROM eventdetails", conn))
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
    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;
        getReportData();
    }
    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        int rid = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString());
        GridViewRow row = (GridViewRow)GridView1.Rows[e.RowIndex];
        Label lblID = (Label)row.FindControl("lblID");
        TextBox name = (TextBox)row.Cells[1].Controls[0];
        TextBox address = (TextBox)row.Cells[2].Controls[0];
        TextBox role = (TextBox)row.Cells[4].Controls[0];
        TextBox status = (TextBox)row.Cells[5].Controls[0];
        TextBox comment = (TextBox)row.Cells[6].Controls[0];
        GridView1.EditIndex = -1;
        con.Open();
        MySqlCommand cmd = new MySqlCommand("UPDATE register SET status='" + status.Text + "'," + "comment ='" + comment.Text + "' WHERE rid='" + rid + "'", con);
        cmd.ExecuteNonQuery();
        con.Close();
        getReportData();
        GridView1.DataBind();
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        getReportData();
    }
    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;
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

    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        Response.Write(e.CommandArgument);
        if (e.CommandName == "Select")
        {
            int rowIndex = Convert.ToInt32(e.CommandArgument);
            int rid = Convert.ToInt32(GridView1.DataKeys[rowIndex].Values[0]);
            Response.Write("<script>window.open ('ViewDocument.aspx?rid=" + rid + "','_blank');</script>");
        }
        else if (e.CommandName == "Verify")
        {
            int rowIndex = Convert.ToInt32(e.CommandArgument);
            int rid = Convert.ToInt32(GridView1.DataKeys[rowIndex].Values[0]);
            GridView1.EditIndex = -1;
            con.Open();
            MySqlCommand cmd = new MySqlCommand("UPDATE register SET status='Verified' WHERE rid='" + rid + "'", con);
            cmd.ExecuteNonQuery();
            con.Close();
            getReportData();
        }
    }
}