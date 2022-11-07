using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AUshop
{
    public partial class signin : System.Web.UI.Page
    {
        SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["conau"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void addbtn_Click(object sender, EventArgs e)
        {

            if (DataValidate())
            {
                Session["user"] = txtuser.Text;
                Session["email"] = txtemail.Text;
                Session["pwd"] = txtpwd.Text;
                try
                {
                    cn.Open();
                    string SELECT_QUERY = "select * from tblcustomer where cemail='" + txtemail.Text + "'";
                    SqlCommand cmd = new SqlCommand(SELECT_QUERY, cn);
                    //cmd.ExecuteNonQuery(); 
                    int result = cmd.ExecuteNonQuery();
                    DataTable dtlogin = new DataTable();
                    SqlDataAdapter adp = new SqlDataAdapter(cmd);
                    cmd.Dispose();
                    adp.Fill(dtlogin);



                    if (dtlogin.Rows.Count == 0)
                    {
                        Random r = new Random();
                        string otp = r.Next(100001, 999999).ToString();
                        Session["otp"] = otp;



                        using (MailMessage mm = new MailMessage("aushop47@gmail.com", txtemail.Text))
                        {
                            mm.Subject = "your OTP for creating account at AUSHOP";

                            string msg = " your otp is " + otp;
                            mm.Body = msg.ToString();
                            mm.IsBodyHtml = true;
                            SmtpClient smtp = new SmtpClient();
                            smtp.Host = "smtp.gmail.com";
                            smtp.EnableSsl = true;
                            NetworkCredential NetworkCred = new NetworkCredential("aushop47@gmail.com", "Eatadick$6969");
                            smtp.UseDefaultCredentials = true;
                            smtp.Credentials = NetworkCred;
                            smtp.Port = 587;
                            smtp.Send(mm);
                            ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Email send');", true);

                            Response.Redirect("otp.aspx");

                        }




                    }
                    else
                    {
                        Response.Write("<script>alert('E-mail already exist !!')</script>");
                    }




                }

                catch (Exception ex)
                {
                    Response.Write("error" + ex.ToString());
                }




            }
        }
        private bool DataValidate()
        {
            Error.Visible = false;
            if (txtemail.Text == "")
            {
                Error.Visible = true;
                Error.Text = "Please enter E-mail";
                txtemail.Focus();
                return false;
            }
            if (txtuser.Text == "")
            {
                Error.Visible = true;
                Error.Text = "Please enter UserName";
                txtuser.Focus();
                return false;
            }
            if (txtpwd.Text == "")
            {
                Error.Visible = true;
                Error.Text = "Please enter Password";
                txtpwd.Focus();
                return false;
            }

            return true;



        }
    }


}