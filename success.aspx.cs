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
    public partial class success : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string OID = string.Empty;

            
            if (Session["ORDER_ID"] != null)
            {
                OID = Session["ORDER_ID"].ToString();

                

               Session.Remove("ORDER_ID");


            }

            
           
            string phrase = OID;
            string[] words = phrase.Split('-');
            string x = words[1];
            lblOrderID.Text = x;
        }
    }
}