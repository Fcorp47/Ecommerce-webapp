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
    public partial class wish : System.Web.UI.Page
    {

        SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["conau"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["CID"] == null)
            {
                Response.Redirect("login.aspx");
            }

            string fetch_cart = "select *,tblproduct.pname,tblproduct.pname,tblproduct.image1 from" +
               " tblwishlist INNER JOIN tblproduct ON tblproduct.PID = tblwishlist.PID";
            SqlCommand cmd = new SqlCommand(fetch_cart, cn);
            cn.Open();
            SqlDataAdapter sda = new SqlDataAdapter();
            sda.SelectCommand = cmd;
            DataSet ds = new DataSet();
            sda.Fill(ds);
            DataList1.DataSource = ds;
            DataList1.DataBind();
            cn.Close();



            cn.Open();
            string SELECT_QUERY = "select*from tblwishlist";
            SqlCommand cm = new SqlCommand(SELECT_QUERY, cn);
            //cmd.ExecuteNonQuery();
            int result = cm.ExecuteNonQuery();
            DataTable dtlogin = new DataTable();
            SqlDataAdapter adp = new SqlDataAdapter(cm);
            cm.Dispose();
            adp.Fill(dtlogin);
            cn.Close();

            ////gonna retrieve all the fields from the tblcart 






            //////found the total amount
            ////object sumObject;
            ////sumObject = dtlogin.Compute("Sum(ptotal)", string.Empty);


            ////string total = sumObject.ToString();
            ////Session["totalcart"] = total;
            ////cn.Close();
            if (Request.QueryString["cartid"] != null)
            {


                string cartid = Request.QueryString["cartid"];
                cn.Open();
                string INSERT_QUERY = "delete from tblwishlist where WID ='" + cartid + "' ";
                SqlCommand cmdd = new SqlCommand(INSERT_QUERY, cn);

                cmdd.ExecuteNonQuery();

                Response.Write("product removed from cart");
                Response.Redirect("wish.aspx");

                cn.Close();
                //}


            }
            
        }
    }
}
    

