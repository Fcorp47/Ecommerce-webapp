using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AUshop
{
    public partial class otp : System.Web.UI.Page
    {
        SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["conau"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void otpbtn_Click(object sender, EventArgs e)
        {
            string otp = txtotp.Text;
            
            if (Session["otp"].ToString() != otp)
            {
                Response.Write("<script>alert('otp does not match !!')</script>");
            }
            else
            {
                String pwd1 = Session["pwd"].ToString();
                String pwdencrypt = EasyEncryption.MD5.ComputeMD5Hash(pwd1);

                String pwd = pwdencrypt;

                cn.Open();
             string INSERT_QUERY = "INSERT INTO tblcustomer (cname,cemail,cpassword,type" +
                        ") VALUES ('" + Session["user"] + "','" + Session["email"] + "','" + pwd + "','"+0+"')";
                SqlCommand cmd = new SqlCommand(INSERT_QUERY, cn);

                cmd.ExecuteNonQuery();

                cn.Close();

                Response.Write("<script>alert('otp is correct')</script>");
                Response.Redirect("login.aspx");
            }
        }
    }
}