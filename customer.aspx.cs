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
    public partial class customer : System.Web.UI.Page
    {
        SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["conau"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["CID"] == null)
            {
                Response.Redirect("login.aspx");
            }
            txtemail.Text = Session["Cemail"].ToString();

        }

        protected void btnsubmit_Click1(object sender, EventArgs e)
        {

            string SELECT_QUERY = "update tblcustomer set cname=@cname, caddress=@caddress ,cphone=@ph,cpincode=@pin where CID=@cid";
            SqlCommand cmd = new SqlCommand(SELECT_QUERY, cn);
            cmd.Parameters.AddWithValue("@cname", txtname.Text);
            cmd.Parameters.AddWithValue("@caddress", txtadd.Text);
            cmd.Parameters.AddWithValue("@ph", txtph.Text);
            cmd.Parameters.AddWithValue("@pin", txtzip.Text);
            cmd.Parameters.AddWithValue("@cid", Session["CID"]);
            cn.Open();
            cmd.ExecuteNonQuery();
            cn.Close();
            DataTable dtlogin = new DataTable();
            SqlDataAdapter adp = new SqlDataAdapter(cmd);
         
            adp.Fill(dtlogin);
        }
       
    }
}