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
    public partial class cart : System.Web.UI.Page
    {


        SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["conau"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {



                if (Session["CID"] == null)
                {
                    Response.Redirect("login.aspx");
                }

                string fetch_cart = "select *,tblproduct.pname,tblproduct.pname,tblproduct.image1 from" +
                    " tblcart INNER JOIN tblproduct ON tblproduct.PID = tblcart.PID where CID = '" + Session["CID"] + "' ";
                SqlCommand cmd = new SqlCommand(fetch_cart, cn);
                cn.Open();
                SqlDataAdapter sda = new SqlDataAdapter();
                sda.SelectCommand = cmd;
                DataSet ds = new DataSet();
                sda.Fill(ds);
                DataList1.DataSource = ds;
                DataList1.DataBind();
                DataTable dt = new DataTable();
                sda.Fill(dt);
                cn.Close();
                if (dt.Rows.Count > 0)
                {
                    Label2.Visible = false;
                }
                else
                {
                    Label2.Text = "CART IS EMPTY";

                    Label2.Visible = true;
                }


                cn.Open();
                string SELECT_QUERY = "select*from tblcart where CID ='" + Session["CID"] + "' ";
                SqlCommand cm = new SqlCommand(SELECT_QUERY, cn);
                //cmd.ExecuteNonQuery();
                int result = cm.ExecuteNonQuery();
                DataTable dtlogin = new DataTable();
                SqlDataAdapter adp = new SqlDataAdapter(cm);
                cm.Dispose();
                adp.Fill(dtlogin);



                //gonna retrieve all the fields from the tblcart 






                //found the total amount
                object sumObject;
                sumObject = dtlogin.Compute("Sum(ptotal)", string.Empty);


                string total = sumObject.ToString();
                Session["subtotal"] = total;

                // int tomtal = Convert.ToInt32(total);






                cn.Close();
                if (Request.QueryString["cartid"] != null)
                {

                    string cartid = Request.QueryString["cartid"];
                    cn.Open();
                    string INSERT_QUERY = "delete from tblcart where CARTID ='" + cartid + "' ";
                    SqlCommand cmdd = new SqlCommand(INSERT_QUERY, cn);

                    cmdd.ExecuteNonQuery();

                    cn.Close();
                    //Response.Write("<script> alert('product removed from cart') </script>");
                    Response.Redirect("cart.aspx");

                }

            }
        
           }

        protected void cart_list_SelectedIndexChanged(object sender, EventArgs e)
        {
            
            
        //   string cyx = cart.SelectedItem.Value;
        }
    }
}