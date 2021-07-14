using Microsoft.Reporting.WebForms;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ViewReports : System.Web.UI.Page
{
    string sess = "";
    string report = "";
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
        report = reportFor.SelectedValue;
    }

    protected void GenerateReport(object sender, EventArgs e)
    {
        if (report == "Select Role")
        {
            Response.Write("<script>alert('Select Role')</script>");
        }
        else
        {
            Server.Transfer("Report" + report + ".aspx");
        }
    }
}