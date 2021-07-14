using Microsoft.AspNet.Identity;
using System;
using System.Linq;
using System.Web.UI;
using Test;
using MySql.Data.MySqlClient;

public partial class Account_Register : Page
{
    MySqlConnection con;
    MySqlCommand cmd,cmd1,cmd2;
    protected void CreateUser_Click(object sender, EventArgs e)
    {
        string name = fnm.Value + " " + mnm.Value + " " + lnm.Value;
        string fname = fnm.Value;
        string phone = phn.Value;
        string Urole = role.SelectedValue; 
        int City = Convert.ToInt32(city.SelectedValue);
        int State = Convert.ToInt32(state.SelectedValue);
        cmd = new MySqlCommand("select name from states where id='" + State + "'", con);
        MySqlDataReader read = cmd.ExecuteReader();
        read.Read();
        string st = read.GetString(0);
        read.Close();
        cmd = new MySqlCommand("select city from cities where id='" + City + "'", con);
        MySqlDataReader read1 = cmd.ExecuteReader();
        read1.Read();
        string ct = read1.GetString(0);
        read1.Close();
        string address = addr.Value + "," + ct + "," + st + "," + pcd.Value; ;
        string Email = email.Text;
        string password = Password.Text;
        if (Urole == "Agency")
        {
            string agencyname = an.Value;
            string query = "insert into agencyregistrationdetails(FirstName,Name,PhoneNumber,AgencyName,Address,Email,Password) " +
                "values ('" + fname + "','" + name + "','" + phone + "','"+agencyname+"','" + address + "','" + Email + "','" + password + "')";
            cmd = new MySqlCommand(query, con);
            int i = cmd.ExecuteNonQuery();

            string query2 = "INSERT INTO profiledetails(Name,PhoneNumber,Address,Email,Status,Role) " +
                "values ('" + agencyname + "','" + phone + "','" + address + "','" + Email + "', 'Active', 'Agency')";
            cmd1 = new MySqlCommand(query2, con);
            cmd1.ExecuteNonQuery();

            if (i > 0)
            {
                string query1 = "insert into agencylogindetails(Email,Password) " +
                "values ('" + Email + "','" + password + "')";
                cmd = new MySqlCommand(query1, con);
                int j = cmd.ExecuteNonQuery();
                if (j > 0)
                {
                    Response.Write("<script>alert('Registration successful')</script>");
                    Response.Redirect("~/Account/Login.aspx");
                }

            }
        }
        else
        {
            int Age = Convert.ToInt32(age.Value);
            string query = "insert into userregistrationdetails(FirstName,Name,Age,PhoneNumber,Address,Email,Password) " +
                "values ('" + fname + "','" + name + "','"+Age+"','"+phone+"','"+address+ "','" + Email + "','"+password+"')";
            cmd = new MySqlCommand(query, con);

            string query2 = "insert into profiledetails(Name, Age, PhoneNumber, Address, Email, Status, Role) " +
                "values ('" + name + "','" + Age + "','" + phone + "','" + address + "','" + Email + "', 'Active', 'Youth')";
            cmd2 = new MySqlCommand(query2, con);
            cmd2.ExecuteNonQuery();

            int i = cmd.ExecuteNonQuery();

            if (i > 0)
            {
                string query1 = "insert into userlogindetails(Email,Password) " +
                "values ('" + Email + "','" + password + "')";
                cmd = new MySqlCommand(query1, con);
                int j = cmd.ExecuteNonQuery();
                if (j>0)
                {
                    Response.Write("<script>alert('Registration Successful')</script>");
                }
                
            }
        }
        Response.Redirect("~/SendMail.aspx?Email=" + Email + "&Subject=Registration Successful&Body=You have successfully registered to Tralent, a Tribal Repository Portal. Your profile will be verified soon.");
        /*ScriptManager.RegisterClientScriptBlock(Page, this.GetType(), "Alert1", "alert('" + name + "');", true);
         var manager = new UserManager();
         var user = new ApplicationUser() { UserName = UserName.Text };
         IdentityResult result = manager.Create(user, Password.Text);
         if (result.Succeeded)
         {
             IdentityHelper.SignIn(manager, user, isPersistent: false);
             IdentityHelper.RedirectToReturnUrl(Request.QueryString["ReturnUrl"], Response);
         }
         else
         {
             ErrorMessage.Text = result.Errors.FirstOrDefault();
         }*/
    }
   
    protected void Page_Load(object sender, EventArgs e)
    {

        con = new MySqlConnection("Data Source=localhost;Database=Tribal_47_60;User ID=root;Password=");
        con.Open();
        if (!IsPostBack)
        {
            fillState();
        }
        
    }
    protected void role_SelectedIndexChanged(object sender, EventArgs e)
    {
        string val = role.SelectedValue;
        if (val == "Agency")
        {
            agn.Style.Add("display", "block");
            dobdiv.Style.Add("display", "none");
        }
        else
        {
            agn.Style.Add("display", "none");
            dobdiv.Style.Add("display", "block");
        }
    }
   
    protected void state_SelectedIndexChanged(object sender, EventArgs e)
    {
        int val = Convert.ToInt32(state.SelectedValue);
        string str = "select id,city from cities where state_id=" + val;
        cmd = new MySqlCommand(str, con);
        MySqlDataReader dr1 = cmd.ExecuteReader();
        city.DataSource = dr1;
        city.DataTextField = "city";
        city.DataValueField = "id";
        city.DataBind();
        city.Items.Insert(0, "Select  City");
    }
    protected void fillState()
    {
        string str = "select id,name from states";
        cmd = new MySqlCommand(str, con);
        MySqlDataReader dr = cmd.ExecuteReader();
        state.DataSource = dr;
        state.DataTextField = "name";
        state.DataValueField = "id";
        state.DataBind();
        state.Items.Insert(0, "<-- Select  State-->");
        dr.Close();
    }

}