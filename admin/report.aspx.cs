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
    public partial class report : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                Session["date"] = "";
                Session["count"] = "";
                Session["total"] = "";
            }


        }
        SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["conau"].ConnectionString);

       
        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            string date = Calendar1.SelectedDate.ToString();


            string[] month = date.Split(' ');
            string x = month[0];

            Session["date"] = x;
            string query = "select *,tblcustomer.cname from tblorder inner join tblcustomer " +
                       "on tblcustomer.CID = tblorder.CID where order_date = @date";
            cn.Open();
            SqlCommand cmd = new SqlCommand(query, cn);
            cmd.Parameters.AddWithValue("@date", x);
            SqlDataAdapter ad = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            ad.Fill(ds);
            Repeater1.DataSource = ds;
            Repeater1.DataBind();
            DataTable dt = new DataTable();
            ad.Fill(dt);
            cn.Close();

            if (dt.Rows.Count > 0)
            {
                object sumObject;
                sumObject = dt.Compute("Sum(order_total)", string.Empty);
                string total = sumObject.ToString();
                Session["total"] = total;

                Session["count"] = dt.Rows.Count;
                Label1.Visible = false;
            }
            else
            {
                Session["count"] = dt.Rows.Count;

                Label1.Visible = true;
            }

        }
    }
}