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
    public partial class cartqty : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["CID"] == null)
            {
                Response.Redirect("login.aspx");
            }

            SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["conau"].ConnectionString);


            if (Request.QueryString["cartid"] != null )
            {
                if(Request.QueryString["op"] == "add")
                {
                    string query = "select *,tblproduct.pprice from tblcart inner join tblproduct " +
                       "on tblcart.PID = tblproduct.PID where CARTID = @cartid";
                    cn.Open();
                    SqlCommand cmd = new SqlCommand(query, cn);
                    cmd.Parameters.AddWithValue("@cartid", Request.QueryString["cartid"]);
                    SqlDataAdapter ad = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    ad.Fill(dt);
                    cn.Close();
                    int qty = Convert.ToInt32(dt.Rows[0]["pqty"]);
                    int price = Convert.ToInt32(dt.Rows[0]["pprice"]);
                    int pqty = qty + 1;
                    int total = Convert.ToInt32(price) * pqty;



                    string update = "update tblcart set pqty=@pqty,ptotal=@total where CARTID=@carid";
                    cn.Open();
                    SqlCommand cmdd = new SqlCommand(update, cn);
                    cmdd.Parameters.AddWithValue("@carid", Request.QueryString["cartid"]);
                    cmdd.Parameters.AddWithValue("@pqty", pqty);
                    cmdd.Parameters.AddWithValue("@total", total);
                    cmdd.ExecuteNonQuery();
                    cn.Close();


                    Response.Redirect("cart.aspx");
                }
               else if(Request.QueryString["op"] == "sub")
                {
                    string query = "select *,tblproduct.pprice from tblcart inner join tblproduct " +
                      "on tblcart.PID = tblproduct.PID where CARTID = @cartid";
                    cn.Open();
                    SqlCommand cmd = new SqlCommand(query, cn);
                    cmd.Parameters.AddWithValue("@cartid", Request.QueryString["cartid"]);
                    SqlDataAdapter ad = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    ad.Fill(dt);
                    cn.Close();
                    int qty = Convert.ToInt32(dt.Rows[0]["pqty"]);
                    int price = Convert.ToInt32(dt.Rows[0]["pprice"]);
                    int pqty = qty - 1;
                    int total = Convert.ToInt32(price) * pqty;

                    if(pqty == 0)
                    {
                        string delete = "delete from tblcart where CARTID=@cartid";
                        cn.Open();
                        SqlCommand com = new SqlCommand(delete, cn);
                        com.Parameters.AddWithValue("@cartid", Request.QueryString["cartid"]);
                        com.ExecuteNonQuery();
                        cn.Close();
                    }
                    else
                    {
                        string update = "update tblcart set pqty=@pqty,ptotal=@total where CARTID=@cartid";
                        cn.Open();
                        SqlCommand cmdd = new SqlCommand(update, cn);
                        cmdd.Parameters.AddWithValue("@cartid", Request.QueryString["cartid"]);
                        cmdd.Parameters.AddWithValue("@pqty", pqty);
                        cmdd.Parameters.AddWithValue("@total", total);
                        cmdd.ExecuteNonQuery();
                        cn.Close();
                    }
                   


                    Response.Redirect("cart.aspx");

                }




            }

        }
    }
}