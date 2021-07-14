using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminDashboard : System.Web.UI.Page
{
    string sess = "";
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
        
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("ViewReports.aspx");
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("ManageProfiles.aspx");
    }

    protected void Button5_Click(object sender, EventArgs e)
    {
        Response.Redirect("VerifyData.aspx");
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        Response.Redirect("Statistics.aspx");
    }

    protected void Button6_Click(object sender, EventArgs e)
    {
        Response.Redirect("AllQueries.aspx");
    }

    protected void Button7_Click(object sender, EventArgs e)
    {
        Response.Redirect("ResolveQueries.aspx");
    }
}