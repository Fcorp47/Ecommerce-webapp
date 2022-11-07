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
    public partial class product : System.Web.UI.Page
    {


        SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["conau"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["catid"] != null)
            {

                string catid = Request.QueryString["catid"];
              string sqlquery = "select*from tblproduct where CATID = '" + catid + "' and pstatus=1";
                SqlCommand cmd = new SqlCommand(sqlquery, cn);
                cn.Open();
                SqlDataAdapter sda = new SqlDataAdapter();
                sda.SelectCommand = cmd;
                DataSet ds = new DataSet();
                sda.Fill(ds);
                DataList1.DataSource = ds;
                DataList1.DataBind();
                cn.Close();
            }
            else
            {
                Response.Redirect("product.aspx?catid=1");

            }
        }

       
    }
}