using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Logout : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.ClearHeaders();
        Response.AddHeader("Cache-Control", "no-cache, no-store, max-age=0, must-revalidate");
        Response.AddHeader("Pragma", "no-cache");
        Session.Abandon();
        Session.Clear();
        try
        {
            Label1.Text = Session["name"].ToString();
        }
        catch
        {
            Response.Redirect("~/Account/Login.aspx");
        }
        Response.Redirect("~/Default.aspx");
    }
}