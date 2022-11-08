using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AUshop.admin
{
    public partial class feedback : System.Web.UI.Page
    {
        SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["conau"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] == null)
            {
                Response.Redirect("../login.aspx");
            }

            string q = "select *,tblcustomer.cname,tblcustomer.cemail" +
                " from tblfeedback INNER JOIN tblcustomer ON tblcustomer.CID = tblfeedback.CID";
            SqlCommand cmdd = new SqlCommand(q, cn);
           
            cn.Open();
            cmdd.ExecuteNonQuery();
            cn.Close();

            SqlDataAdapter adpp = new SqlDataAdapter(cmdd);
            DataSet dss = new DataSet();
            adpp.Fill(dss);
            Repeater1.DataSource = dss;
            Repeater1.DataBind();

        }
    }
}