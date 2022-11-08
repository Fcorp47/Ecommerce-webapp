using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AUshop.admin
{
    public partial class delete : System.Web.UI.Page
    {
        SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["conau"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] == null)
            {
                Response.Redirect("../login.aspx");
            }


            if (Request.QueryString["operation"] == "delete" && Request.QueryString["pid"] != null)
            {
                string pid = Request.QueryString["pid"];


                cn.Open();
                string delete_sql = "delete from tblproduct where PID='" + pid + "'";

                SqlCommand cmd = new SqlCommand(delete_sql, cn);

                cmd.ExecuteNonQuery();
                cn.Close();

                Response.Redirect("product.aspx");
            }
            else if (Request.QueryString["operation"] == "status" && Request.QueryString["pid"] != null)
            {
                string pid = Request.QueryString["pid"];
                string stat = Request.QueryString["status"];
                if (stat == "1")
                {

                    cn.Open();
                    string status_sql = "update tblproduct set pstatus='" + 0 + "' where PID='" + pid + "' ";

                    SqlCommand cmd = new SqlCommand(status_sql, cn);

                    cmd.ExecuteNonQuery();
                    cn.Close();

                    Response.Redirect("product.aspx");
                }
                else if (stat == "0")
                {

                    cn.Open();
                    string status_sql = "update tblproduct set pstatus='" + 1 + "' where PID='" + pid + "' ";

                    SqlCommand cmd = new SqlCommand(status_sql, cn);

                    cmd.ExecuteNonQuery();
                    cn.Close();

                    Response.Redirect("product.aspx");
                }
            }
            else if (Request.QueryString["operation"] == "delete" && Request.QueryString["catid"] != null)
            {


                string catid = Request.QueryString["catid"];


                cn.Open();
                string delete_sql = "delete from tblcategory where CATID='" + catid + "'";

                SqlCommand cmd = new SqlCommand(delete_sql, cn);

                cmd.ExecuteNonQuery();
                cn.Close();

                Response.Redirect("category.aspx");
            }
            else if (Request.QueryString["subid"] != null)
            {


                string catid = Request.QueryString["subid"];


                cn.Open();
                string delete_sql = "delete from tblsubcategory where SUBID='" + catid + "'";

                SqlCommand cmd = new SqlCommand(delete_sql, cn);

                cmd.ExecuteNonQuery();
                cn.Close();

                Response.Redirect("subcat.aspx");
            }
            else if(Request.QueryString["catstatus"] != null)
            {
                if(Request.QueryString["catstatus"] == "1")
                {
                    string query = "update tblcategory set catstatus='" + 0 + "' where catid = '" + Request.QueryString["CATID"] + "'";


                    SqlCommand cmd = new SqlCommand(query, cn);
                    cn.Open();
                    cmd.ExecuteNonQuery();
                    cn.Close();

                    Response.Redirect("category.aspx");
                }else
                {
                    string query = "update tblcategory set catstatus='" + 1 + "' where catid = '" + Request.QueryString["CATID"] + "'";


                    SqlCommand cmd = new SqlCommand(query, cn);
                    cn.Open();
                    cmd.ExecuteNonQuery();
                    cn.Close();

                    Response.Redirect("category.aspx");
                }
            }
            else if (Request.QueryString["bid"] != null)
            {


                string bid = Request.QueryString["bid"];


                cn.Open();
                string delete_sql = "delete from tblbrand where BID='" + bid + "'";

                SqlCommand cmd = new SqlCommand(delete_sql, cn);

                cmd.ExecuteNonQuery();
                cn.Close();

                Response.Redirect("subcat.aspx");
            }
        }
    }
}