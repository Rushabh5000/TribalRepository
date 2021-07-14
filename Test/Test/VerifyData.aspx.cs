using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class VerifyData : System.Web.UI.Page
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

        ((BoundField)GridView1.Columns[0]).ReadOnly = true;
        ((BoundField)GridView1.Columns[1]).ReadOnly = true;
        ((BoundField)GridView1.Columns[2]).ReadOnly = true;
        ((BoundField)GridView1.Columns[3]).ReadOnly = true;
        ((BoundField)GridView1.Columns[4]).ReadOnly = true;
        ((BoundField)GridView1.Columns[5]).ReadOnly = true;
        ((BoundField)GridView1.Columns[6]).ReadOnly = true;
    }
    protected void getReportData()
    {
        DataTable dt = new DataTable();
        string constr = ConfigurationManager.ConnectionStrings["DefaultConnection"].ToString(); ;
        using (MySqlConnection conn = new MySqlConnection(constr))
        {
            using (MySqlDataAdapter sda = new MySqlDataAdapter("SELECT * FROM profiledetails WHERE Verification ='Unverified' ", conn))
            {
                sda.Fill(dt);
                GridView1.DataSource = dt;
                GridView1.DataBind();
                ViewState["dirState"] = dt;
                ViewState["sortdr"] = "Asc";
            }
        }
    }

    protected void OnRowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            byte[] bytes = (byte[])(e.Row.DataItem as DataRowView)["Document"];
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
        ((BoundField)GridView1.Columns[0]).ReadOnly = true;
       

        int rid = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString());
        GridViewRow row = (GridViewRow)GridView1.Rows[e.RowIndex];
        Label lblID = (Label)row.FindControl("lblID");

        //TextBox name = (TextBox)row.Cells[1].Controls[0];
        //TextBox age = (TextBox)row.Cells[2].Controls[0];
        //TextBox number = (TextBox)row.Cells[3].Controls[0];
        //TextBox address = (TextBox)row.Cells[4].Controls[0];
        //TextBox email = (TextBox)row.Cells[5].Controls[0];
        //TextBox role = (TextBox)row.Cells[6].Controls[0];
        TextBox status = (TextBox)row.Cells[7].Controls[0];
        TextBox comment = (TextBox)row.Cells[8].Controls[0];

        GridView1.EditIndex = -1;
        conn.Open();
        MySqlCommand cmd = new MySqlCommand("UPDATE profiledetails SET Status='" + status.Text + "'," + "Comment ='" + comment.Text + "' WHERE pid='" + rid + "'", conn);
        
        cmd.ExecuteNonQuery();
        conn.Close();
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
            int pid = Convert.ToInt32(GridView1.DataKeys[rowIndex].Values[0]);
            Response.Write("<script>window.open ('ViewDocument.aspx?rid=" + pid + "','_blank');</script>");
        }
        else if (e.CommandName == "Verify")
        {  
            int rowIndex = Convert.ToInt32(e.CommandArgument);
            int pid = Convert.ToInt32(GridView1.DataKeys[rowIndex].Values[0]);
            GridView1.EditIndex = -1;
            conn.Open();
            MySqlCommand cmd = new MySqlCommand("UPDATE profiledetails SET Verification='Verified' AND Status='Active' WHERE pid=" + pid + "", conn);
            cmd.ExecuteNonQuery();
            conn.Close();
            getReportData();
            
        }
    }
}