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
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
                if(Session["username"]==null)
                 {
                Session["username"] = "";
                 }


            SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["conau"].ConnectionString);
            
            string sqlquery = "select*from tblcategory where catstatus=1";
            SqlCommand cmd = new SqlCommand(sqlquery, cn);
            cn.Open();
            SqlDataAdapter sda = new SqlDataAdapter();
            sda.SelectCommand = cmd;
            DataSet ds = new DataSet();
            sda.Fill(ds);
            DataListcat.DataSource = ds;
            DataListcat.DataBind();
            cn.Close();


           



        }
    }
}