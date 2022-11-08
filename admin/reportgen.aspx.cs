using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AUshop.admin
{
    public partial class reportgen : System.Web.UI.Page
    {

        SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["conau"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if(Request.QueryString["date"] != null)
            {
                string date = Request.QueryString["date"];

                string query = "select *,tblcustomer.cname from tblorder inner join tblcustomer " +
                       "on tblcustomer.CID = tblorder.CID where order_date = @date";
                cn.Open();
                SqlCommand cmd = new SqlCommand(query, cn);
                cmd.Parameters.AddWithValue("@date", date);
                SqlDataAdapter ad = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                ad.Fill(ds);
                DataList1.DataSource = ds;
                DataList1.DataBind();
                DataTable dt = new DataTable();
                ad.Fill(dt);
                cn.Close();

                
            }
        }
    }
}