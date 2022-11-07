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
    public partial class forgotpass : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["conau"].ConnectionString);


        protected void forgotbtn_Click(object sender, EventArgs e)
        {
           
            if(txtnew.Text == txtconfirm.Text)
            {

                cn.Open();
                
                String pwdnew = txtnew.Text.ToString();
                String pwdencrypt = EasyEncryption.MD5.ComputeMD5Hash(pwdnew);
                String pwd = pwdencrypt;
                string SELECT_QUERY = "update tblcustomer set cpassword='"+pwdencrypt+"' where cemail='" + Session["getemail"]+ "'";
                SqlCommand cmd = new SqlCommand(SELECT_QUERY, cn);
                //cmd.ExecuteNonQuery();
                int result = cmd.ExecuteNonQuery();
                DataTable dtlogin = new DataTable();
                SqlDataAdapter adp = new SqlDataAdapter(cmd);
                cmd.Dispose();
                adp.Fill(dtlogin);

                Response.Redirect("login.aspx");

            }
            else
            {
                Response.Write("new and confirm password doesnt match!");
            }
        }
    }
}