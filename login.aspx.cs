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
    public partial class login : System.Web.UI.Page
    {
        SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["conau"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            

        }

        protected void btn_Click(object sender, EventArgs e)
        {

            cn.Open();
            String pwd1 = txtpwd.Text.ToString();
            String pwdencrypt = EasyEncryption.MD5.ComputeMD5Hash(pwd1);
            String pwd = pwdencrypt;

           

            string SELECT_QUERY = "select * from tblcustomer where cemail='" + txtmail.Text + "' and cpassword='" + pwd + "'";
            SqlCommand cmd = new SqlCommand(SELECT_QUERY, cn);
            //cmd.ExecuteNonQuery();
            int result = cmd.ExecuteNonQuery();
            DataTable dtlogin = new DataTable();
            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            cmd.Dispose();
            adp.Fill(dtlogin);

           


         
            if (dtlogin.Rows.Count > 0)
            {

                if(dtlogin.Rows[0]["type"].ToString() == "1")
                {
                    Session["adminname"] = "ADMIN";
                    Response.Write("success login");
                    Response.Redirect("~/admin/Dashboard.aspx");
                }
                else
                {
                    String name1 = dtlogin.Rows[0]["cname"].ToString();
                    String id = dtlogin.Rows[0]["CID"].ToString();
                    String email = dtlogin.Rows[0]["cemail"].ToString();
                    Session["username"] = name1;
                    Session["CID"] = id;
                    Session["Cemail"] = email;

                    Response.Write("success login");
                    Response.Redirect("index.aspx");

                }

            }

            else
            {
                Response.Write("<script>alert('* email or password does not match *')</script>");
            }
            cn.Close();



        }
    }
}