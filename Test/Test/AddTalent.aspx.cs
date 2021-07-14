using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;

public partial class AddTalent : System.Web.UI.Page
{
    MySqlConnection con;
    MySqlCommand cmd;
    string email;
    string Talent;

    protected void Page_Load(object sender, EventArgs e)
    {
        con = new MySqlConnection("Data Source=localhost;Database=Tribal_47_60;User ID=root;Password=");
        con.Open();
        email = Session["Email"].ToString();
    }

    protected void add_Talent(object sender, EventArgs e)
    {
        int rc = 0;
        Talent = talent.SelectedValue;
        string mainquery;
        int i;
        if (Talent == "others")
        {
            string Others = txt.Value;
            mainquery = "insert into talent (Email,Talent) values ('" + email + "','" + Others + "')";
            cmd = new MySqlCommand(mainquery, con);
            i = cmd.ExecuteNonQuery();
        }
        else
        {
            mainquery = "insert into talent (Email,Talent) values ('" + email + "','" + Talent + "')";
            cmd = new MySqlCommand(mainquery, con);
            i = cmd.ExecuteNonQuery();
        }
        if (i > 0)
        {
            mainquery = "SELECT LAST_INSERT_ID()";
            cmd = new MySqlCommand(mainquery, con);
            MySqlDataReader read = cmd.ExecuteReader();
            read.Read();
            int id = read.GetInt32(0);
            read.Close();
            foreach (HttpPostedFile postedFile in images.PostedFiles)
            {
                string filename = Path.GetFileName(postedFile.FileName);

                using (Stream fs = postedFile.InputStream)
                {
                    using (BinaryReader br = new BinaryReader(fs))
                    {
                        byte[] bytes = br.ReadBytes((Int32)fs.Length);
                        string contentType = postedFile.ContentType;
                        string query = "insert into images values (@Id,@Email,@Talent,@FileName, @Data,@Content)";
                        using (cmd = new MySqlCommand(query, con))
                        {
                            cmd.Parameters.AddWithValue("@Id", id);
                            cmd.Parameters.AddWithValue("@Email", email);
                            cmd.Parameters.AddWithValue("@Talent", Talent);
                            cmd.Parameters.AddWithValue("@FileName", filename);
                            cmd.Parameters.AddWithValue("@Data", bytes);
                            cmd.Parameters.AddWithValue("@Content", contentType);
                            i = cmd.ExecuteNonQuery();

                        }

                    }
                }
            }
            if (videos.HasFile)
            {
                using (BinaryReader br = new BinaryReader(videos.PostedFile.InputStream))
                {
                    byte[] bytes = br.ReadBytes((int)videos.PostedFile.InputStream.Length);
                    string contentType = videos.PostedFile.ContentType;
                    string query = "insert into images (Id,Email,Talent,FileName,Data,Content)values (@Id,@Email,@Talent,@FileName, @Data,@Content)";
                    using (cmd = new MySqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@Id", id);
                        cmd.Parameters.AddWithValue("@Email", email);
                        cmd.Parameters.AddWithValue("@Talent", Talent);
                        cmd.Parameters.AddWithValue("@FileName", Path.GetFileName(videos.PostedFile.FileName));
                        cmd.Parameters.AddWithValue("@Data", bytes);
                        cmd.Parameters.AddWithValue("@Content", contentType);
                        i = cmd.ExecuteNonQuery();
                    }
                }
            }
        }
        if (i > 0)
        {
            Response.Write("<script>alert{'Data Stored Successfully'}</script>");
        }

    }
    protected void addTextBox_SelectedIndexChanged(object sender, EventArgs e)
    {
        string val = talent.SelectedValue;
        if (val == "Others")
        {
            tp.Style.Add("display", "block");
        }
        else
        {
            tp.Style.Add("display", "none");
        }
    }
}