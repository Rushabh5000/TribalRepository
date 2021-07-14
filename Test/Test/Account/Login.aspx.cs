using Microsoft.AspNet.Identity;
using Microsoft.Owin.Security;
using System;
using System.Web;
using System.Web.UI;
using Test;
using MySql.Data.MySqlClient;

public partial class Account_Login : Page
{
    MySqlConnection con;
    MySqlCommand cmd;
    protected void Page_Load(object sender, EventArgs e)
    {
        con = new MySqlConnection("Data Source=localhost;Database=Tribal_47_60;User ID=root;Password=");
        con.Open();
        RegisterHyperLink.NavigateUrl = "Register";
        /*OpenAuthLogin.ReturnUrl = Request.QueryString["ReturnUrl"];
        var returnUrl = HttpUtility.UrlEncode(Request.QueryString["ReturnUrl"]);
        if (!String.IsNullOrEmpty(returnUrl))
        {
            RegisterHyperLink.NavigateUrl += "?ReturnUrl=" + returnUrl;
        }
        */
    }

    protected void LogIn(object sender, EventArgs e)
    {
        int flag = 0;
        string Email = email.Text;
        string Password = pwd.Text;
        string Role = role.SelectedValue;
        if (Role == "Agency")
        {           
            string query = "select * from agencylogindetails";
            cmd = new MySqlCommand(query, con);
            MySqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                if (reader.GetString(0) == Email && reader.GetString(1) == Password)
                {
                    flag = 1;
                    break;
                }
            }
            if (flag == 1)
            {
                Session["Email"] = Email;
                Response.Redirect("~/AgencyDashBoard.aspx");
            }
            else
            {
                Response.Write("<script>alert('Invalid Credentials')</script>");
            }
        }
        else if (Role == "User")
        {
            string query = "select * from userlogindetails";
            cmd = new MySqlCommand(query, con);
            MySqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                if (reader.GetString(0) == Email && reader.GetString(1) == Password)
                {
                    flag = 1;
                    break;
                }
            }
            if (flag == 1)
            {
                Session["Email"] = Email;
                Response.Redirect("~/UserDashBoard.aspx");
            }
            else
            {
                Response.Write("<script>alert('Invalid Credentials')</script>");
            }

        }
        else if (Role == "Admin")
        {
            string query = "select * from adminlogindetails";
            cmd = new MySqlCommand(query, con);
            MySqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                if (reader.GetString(0) == Email && reader.GetString(1) == Password)
                {
                    flag = 1;
                    break;
                }
            }
            if (flag == 1)
            {
                Session["Email"] = Email;
                Response.Redirect("~/AdminDashBoard.aspx");
            }
            else
            {
                Response.Write("<script>alert('Invalid Credentials')</script>");
            }

        }
        else
        {
            Response.Write("<script>alert('Please select role')</script>");
        }
    }
}