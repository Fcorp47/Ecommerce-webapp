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
    public partial class masterf : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] == null)
            {
                Session["username"] = "";
            }
            if (Session["CID"] == null)
            {
                labellogout.Visible = false;

            }
            else if (Session["CID"] != null)
            {
                labelsignup.Visible = false;
                labellogout.Visible = true;
                labellogin.Visible = false;
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