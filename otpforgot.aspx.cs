using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AUshop
{
    public partial class otpforgot : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        protected void otpwrite_Click(object sender, EventArgs e)
        {

            string omtp = txtforgot.Text;

            if(omtp == Session["otp"].ToString())
            {
                Response.Redirect("forgotpass.aspx");
            }
            else
            {
                Response.Write("<script>alert('otp doesnt match')</script>");
            }

            

        }
    }
}