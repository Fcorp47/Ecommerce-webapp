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
    public partial class operations : System.Web.UI.Page
    {

        SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["conau"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["CID"] == null)
            {
                Response.Redirect("login.aspx");
            }

            if (Request.QueryString["operation"] == "addtocart")
            {
                string pid = Request.QueryString["pid"];
                string price = Request.QueryString["price"];


                cn.Open();

                string fetch_cart = "select * from tblcart where PID ='" + pid + "' and CID = '"+Session["CID"]+"' ";
                SqlCommand cmd = new SqlCommand(fetch_cart, cn);
                int result = cmd.ExecuteNonQuery();
                DataTable dtcart = new DataTable();
                SqlDataAdapter adp = new SqlDataAdapter(cmd);
                cmd.Dispose();
                adp.Fill(dtcart);
                //  cn.Close();
                if (dtcart.Rows.Count > 0)
                {
                    int quantity = Convert.ToInt32(dtcart.Rows[0]["pqty"]) + 1;
                    int total = Convert.ToInt32(price) * quantity;


                    //  cn.Open();
                    string update_qty = "update tblcart set pqty = '" + quantity + "' where PID = '" + pid + "' and CID = '" + Session["CID"] + "' ";
                    string update_total = "update tblcart set ptotal = '" + total + "' where PID ='" + pid + "' and CID = '" + Session["CID"] + "' ";

                    SqlCommand cmdd = new SqlCommand(update_qty, cn);
                    SqlCommand totalcmd = new SqlCommand(update_total, cn);

                    cmdd.ExecuteNonQuery();
                    totalcmd.ExecuteNonQuery();

                    cn.Close();

                    Response.Redirect("product.aspx");

                }
                else if (dtcart.Rows.Count == 0)
                {
                    string select_prod = "select * from tblproduct where PID ='" + pid + "'";
                    SqlCommand procmd = new SqlCommand(select_prod, cn);
                    int resultt = procmd.ExecuteNonQuery();
                    DataTable dtpro = new DataTable();
                    SqlDataAdapter adpp = new SqlDataAdapter(procmd);
                    procmd.Dispose();
                    adpp.Fill(dtpro);




                    String ptotal = dtpro.Rows[0]["pprice"].ToString();



                    string insert_cart = "INSERT INTO tblcart (CID,PID,pqty,ptotal" +
                        ") VALUES ('"+Session["CID"]+"','" + pid + "','" + 1 + "','" + ptotal + "')";

                    SqlCommand pro = new SqlCommand(insert_cart, cn);

                    pro.ExecuteNonQuery();
                    cn.Close();



                    Response.Redirect("product.aspx");



                }


            }

            else if (Request.QueryString["operation"] == "addtowish")
            {

                string pid = Request.QueryString["pid"];

                string cid = Session["CID"].ToString();





                string insert_wish = "INSERT INTO tblwishlist (CID,PID" +
                    ") VALUES ('" + cid + "','" + pid + "')";

                SqlCommand pro = new SqlCommand(insert_wish, cn);
                cn.Open();
                pro.ExecuteNonQuery();
                cn.Close();



                Response.Redirect("product.aspx");

            }
            else if (Request.QueryString["operation"] == "cancelorder")
            {
             //   if(Request.QueryString["status"] == "PLACED")
                
               string update_status = "update tblorder set order_status = @status where OID = @oid and CID = @cid";

                cn.Open();
                SqlCommand cmdd = new SqlCommand(update_status, cn);
                string status = "CANCELLED";
                cmdd.Parameters.AddWithValue("@status", status);
                cmdd.Parameters.AddWithValue("@oid", Request.QueryString["oid"]);
                cmdd.Parameters.AddWithValue("@cid", Session["CID"]);
                cmdd.ExecuteNonQuery();
               

                cn.Close();

                Response.Redirect("yourorders.aspx?message=abc");
            }
            else
            {
                Response.Redirect("index.aspx");
            }

        }

    }

        }
    
