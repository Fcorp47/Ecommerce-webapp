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
    public partial class feedback : System.Web.UI.Page
    {
        SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["conau"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {

            }

                if (Session["CID"] == null)
            {
                Response.Redirect("login.aspx");


            }
            txtname.Text = Session["username"].ToString();
            txtemail.Text = Session["Cemail"].ToString();

            string subqueryy = "select*from tblfeedback";
            SqlCommand cmdddd = new SqlCommand(subqueryy, cn);
            cn.Open();
            SqlDataAdapter sdaaa = new SqlDataAdapter();
            sdaaa.SelectCommand = cmdddd;
            DataSet dsss = new DataSet();
            sdaaa.Fill(dsss);

            DataList1.DataSource = dsss;
            DataList1.DataBind();



            cn.Close();

        }

        protected void Give_Feedback_Click(object sender, EventArgs e)
        {
            string queryf = "insert into tblfeedback (CID,freason,fdesc)values (@cid,@fre,@desc)";
            SqlCommand cmd = new SqlCommand(queryf, cn);
            cn.Open();
            cmd.Parameters.AddWithValue("@cid", Session["CID"]);
            cmd.Parameters.AddWithValue("@fre", txtreson.Text);
            cmd.Parameters.AddWithValue("@desc",txtadd.Text);
            cmd.ExecuteNonQuery();
            cn.Close();
        }
    }
}
