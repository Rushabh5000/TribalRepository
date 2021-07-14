using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.DataVisualization.Charting;
using System.Web.UI.WebControls;

public partial class Statistics_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            GetChartData();
            GetChartTypes();
        }
    }
    private void GetChartTypes()
    {
        foreach (int chartType in Enum.GetValues(typeof(SeriesChartType)))
        {
            ListItem li = new ListItem(Enum.GetName(typeof(SeriesChartType), chartType), chartType.ToString());
            ddlChart.Items.Add(li);
        }
    }

    private void GetChartData()
    {
        string CS = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
        using (MySqlConnection con = new MySqlConnection(CS))
        {
            MySqlCommand cmd = new MySqlCommand("SELECT talent_name, total FROM talent_stats", con);
            //cmd.CommandType = CommandType.;
            con.Open();
            MySqlDataReader rdr = cmd.ExecuteReader();
            // Retrieve the Series to which we want to add DataPoints  
            Series series = Chart1.Series["Series1"];
            // Loop thru each Student record  
            while (rdr.Read())
            {
                // Add X and Y values using AddXY() method  
                series.Points.AddXY(rdr["talent_name"].ToString(),
                rdr["total"]);
            }
        }
    }

    protected void ddlChart_SelectedIndexChanged(object sender, EventArgs e)
    {
        // Call Get ChartData() method when the user select a different chart type  
        GetChartData();
        this.Chart1.Series["Series1"].ChartType = (SeriesChartType)Enum.Parse(typeof(SeriesChartType), ddlChart.SelectedValue);
    }
}