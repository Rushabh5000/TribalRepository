using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ManageProfiles : System.Web.UI.Page
{
    string sess = "";
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
        }
        else
        {
            sess = Session["email"].ToString();
        }
        if (!this.IsPostBack)
        {
            getReportData();
        }
    }
    protected void getReportData()
    {
        DataTable dt = new DataTable();
        string constr = ConfigurationManager.ConnectionStrings["DefaultConnection"].ToString(); ;
        using (MySqlConnection conn = new MySqlConnection(constr))
        {
            using (MySqlDataAdapter sda = new MySqlDataAdapter("SELECT * FROM profiledetails WHERE status ='Active' ", conn))
            {
                sda.Fill(dt);
                GridView1.DataSource = dt;
                GridView1.DataBind();
                ViewState["dirState"] = dt;
                ViewState["sortdr"] = "Asc";
            }
        }
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        GridViewRow row = (GridViewRow)GridView1.Rows[e.RowIndex];
        Label lbldeleteid = (Label)row.FindControl("lblID");
        conn.Open();
        MySqlCommand cmd = new MySqlCommand("UPDATE profiledetails SET status = 'Deleted' WHERE pid=" + Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString()) + "", conn);
        cmd.ExecuteNonQuery();
        conn.Close();
        getReportData();
    }
    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;
        getReportData();
    }
    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {        

        int pid = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString());
        GridViewRow row = (GridViewRow)GridView1.Rows[e.RowIndex];
        Label lblID = (Label)row.FindControl("lblID");
        TextBox name = (TextBox)row.Cells[1].Controls[0];
        TextBox age = (TextBox)row.Cells[2].Controls[0];
        TextBox ph = (TextBox)row.Cells[3].Controls[0];
        TextBox add = (TextBox)row.Cells[4].Controls[0];
        TextBox em = (TextBox)row.Cells[5].Controls[0];
        TextBox role = (TextBox)row.Cells[6].Controls[0];
        GridView1.EditIndex = -1;
        conn.Open();
        MySqlCommand cmd = new MySqlCommand("UPDATE profiledetails SET Name='" + name.Text + "'," + "Age='" + age.Text + "', PhoneNumber='" + ph.Text + "', Address='" + add.Text + "', Email='" + em.Text + "', role='" + role.Text + "' WHERE pid='" + pid + "'", conn);
        cmd.ExecuteNonQuery();
        conn.Close();
        getReportData();
        //GridView2.DataBind();  
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
}