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
    public partial class invoice1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           

            SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["conau"].ConnectionString);

            if(Session["CID"] == null)
            {
                Response.Redirect("login.aspx");
            }
            
            if (Request.QueryString["oid"] != null)
            {
                Label1.Text = Request.QueryString["oid"].ToString();
                Label2.Text = Request.QueryString["amount"].ToString();
                string squery = "select * from tblcustomer where CID = '" + Session["CID"] + "'";  //"select *,tblcustomer.cemail,tblcustomer.cphone,tblcustomer.cname,tblcustomer.caddress from tblorder inner join tblproduct on tblorder.CID = tblcustomer.CID where OID = '" +1+ "'";

                SqlCommand cmdd = new SqlCommand(squery, cn);
                cn.Open();
                SqlDataAdapter sdaa = new SqlDataAdapter();
                sdaa.SelectCommand = cmdd;
                DataSet dss = new DataSet();
                sdaa.Fill(dss);
                DataList2.DataSource = dss;
                DataList2.DataBind();
                cn.Close();
                

                string oid = Request.QueryString["oid"];

                string sqlquery = "select *,tblproduct.pname,tblproduct.pprice from tblorderhistory inner join tblproduct on tblorderhistory.PID = tblproduct.PID where OID = '" + oid + "'";

                SqlCommand cmd = new SqlCommand(sqlquery, cn);
                cn.Open();
                SqlDataAdapter sda = new SqlDataAdapter();
                sda.SelectCommand = cmd;
                DataSet ds = new DataSet();
                sda.Fill(ds);
                DataList1.DataSource = ds;
                DataList1.DataBind();
                cn.Close();
            



            }
            else
            {
                Response.Redirect("yourorders.aspx");
            }

        }
    }
}