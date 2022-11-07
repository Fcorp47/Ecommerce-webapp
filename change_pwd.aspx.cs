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
    public partial class change_pwd : System.Web.UI.Page
    {
        SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["conau"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["CID"]==null)
            {
                Response.Redirect("login.aspx");
            }
        }

        protected void change_Click(object sender, EventArgs e)
        {


            String pwd1 = oldpwd.Text.ToString();
            String pwdencrypt = EasyEncryption.MD5.ComputeMD5Hash(pwd1);
            String pwd = pwdencrypt;



            string SELECT_QUERY = "select * from tblcustomer where cid='" + Session["CID"] + "'";
            SqlCommand cmd = new SqlCommand(SELECT_QUERY, cn);
            //cmd.ExecuteNonQuery();
            cn.Open();
            int result = cmd.ExecuteNonQuery();
            DataTable dtlogin = new DataTable();
            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            cmd.Dispose();
            adp.Fill(dtlogin);
            cn.Close();
            
            if (dtlogin.Rows[0]["cpassword"].ToString()== pwd)
            {
                String pwdnew = newpwd.Text.ToString();
                String pwdencryptnew = EasyEncryption.MD5.ComputeMD5Hash(pwdnew);
                String pwdn = pwdencryptnew;

                string update = "update tblcustomer set cpassword='"+ pwdn + "' where cid='" + Session["CID"] + "'";
                SqlCommand cmdd = new SqlCommand(update, cn);
                cn.Open();
                cmdd.ExecuteNonQuery();
                cn.Close();


                Response.Redirect("index.aspx");

            }

            else
            {
                Response.Write("<script>alert('* email or password does not match *')</script>");
            }

            cn.Close();



        }
    }
}