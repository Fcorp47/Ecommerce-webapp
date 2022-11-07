using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient; 
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AUshop
{
    public partial class productdesc : System.Web.UI.Page
    {
        SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["conau"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["id"] != null)
            {
            string pid = Request.QueryString["id"];
            string query = "select * from tblproduct where PID=@pid";
            SqlCommand cmd = new SqlCommand(query, cn);

            cn.Open();
            cmd.Parameters.AddWithValue("@pid", pid);
             
            cmd.ExecuteNonQuery();
                SqlDataAdapter adp = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                adp.Fill(ds);

                DataList1.DataSource = ds;
                DataList1.DataBind();
                DataList2.DataSource = ds;
                DataList2.DataBind();
                cn.Close();

            }
        }
    }
}