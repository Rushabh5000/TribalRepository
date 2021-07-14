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

public partial class ReportAgency : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            getReportData();
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string contentType = string.Empty;
        if (ddlFileFormat.SelectedValue.Equals(".pdf"))
            contentType = "application/pdf";
        if (ddlFileFormat.SelectedValue.Equals(".doc"))
            contentType = "application/ms-word";
        if (ddlFileFormat.SelectedValue.Equals(".xls"))
            contentType = "application/xls";

        DataTable dsData = new DataTable();
        dsData = getReportData();

        string FileName = "File_" + DateTime.Now.ToString("ddMMyyyyhhmmss") + ddlFileFormat.SelectedValue;
        string extension;
        string encoding;
        string mimeType;
        string[] streams;
        Warning[] warnings;

        LocalReport report = new LocalReport();
        report.ReportPath = Server.MapPath("~/ReportAgency.rdlc");
        ReportDataSource rds = new ReportDataSource();
        rds.Name = "DataSet1";//This refers to the dataset name in the RDLC file  
        rds.Value = dsData;
        report.DataSources.Add(rds);

        Byte[] mybytes = report.Render(ddlFileFormat.SelectedItem.Text, null,
                        out extension, out encoding,
                        out mimeType, out streams, out warnings); //for exporting to PDF  
        using (FileStream fs = File.Create(Server.MapPath("~/Reports/") + FileName))
        {
            fs.Write(mybytes, 0, mybytes.Length);
        }

        Response.ClearHeaders();
        Response.ClearContent();
        Response.Buffer = true;
        Response.Clear();
        Response.ContentType = contentType;
        Response.AddHeader("Content-Disposition", "attachment; filename=" + FileName);
        Response.WriteFile(Server.MapPath("~/Reports/" + FileName));
        Response.Flush();
        Response.Close();
        Response.End();
    }

    private DataTable getReportData()
    {
        DataTable dt = new DataTable();
        string constr = ConfigurationManager.ConnectionStrings["DefaultConnection"].ToString(); ;
        using (MySqlConnection conn = new MySqlConnection(constr))
        {
            using (MySqlDataAdapter sda = new MySqlDataAdapter("SELECT * FROM profiledetails WHERE Role= 'Agency'", conn))
            {
                sda.Fill(dt);
                GridView1.DataSource = dt;
                GridView1.DataBind();
                ViewState["dirState"] = dt;
                ViewState["sortdr"] = "Asc";
            }
        }
        return dt;
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
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        getReportData();
    }
}