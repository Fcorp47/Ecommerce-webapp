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
    public partial class Dashboard : System.Web.UI.Page
    {
        public object DataListcat { get; private set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] == null)
            {
                Response.Redirect("../login.aspx");
            }

            SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["conau"].ConnectionString);

            string sqlquery = "SELECT COUNT(*) FROM tblcategory";
            string productsql = "SELECT COUNT(*) FROM tblproduct";
            string ordersql = "SELECT COUNT(*) FROM tblorder";
            //string customersql = "SELECT COUNT(*) FROM tblcustomer";
            SqlCommand cmd = new SqlCommand(sqlquery, cn);
            SqlCommand procmd = new SqlCommand(productsql, cn);
            SqlCommand ordcmd = new SqlCommand(ordersql, cn);
            //SqlCommand custcmd = new SqlCommand(customersql, cn);

            cn.Open();
            //SqlDataAdapter sda = new SqlDataAdapter();
            //sda.SelectCommand = cmd;
            //DataSet ds = new DataSet();
            //sda.Fill(ds);
            int rowsAmount = (int)cmd.ExecuteScalar();
            int procount = (int)procmd.ExecuteScalar();
            int ordercount = (int)ordcmd.ExecuteScalar();
            //int customercount = (int)custcmd.ExecuteScalar();
            Session["catcount"] = rowsAmount;
            Session["procount"] = procount;
            Session["ordercount"] = ordercount;
           // Session["customercount"] = customercount;

            cn.Close();
           
        }
    }
}