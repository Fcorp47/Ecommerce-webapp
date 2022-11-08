using AUshop.BAL;
using AUshop.DAL;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AUshop.admin
{
    public partial class pendingorder : System.Web.UI.Page
    {
        SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["conau"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {

           
            if (!this.IsPostBack)
            {

                


                if (Request.QueryString["ordertype"] != "todays")
                {
                    string type = Request.QueryString["ordertype"];
                    string query = "select *,tblcustomer.cname,tblcustomer.cemail,tblcustomer.caddress from tblorder inner join tblcustomer on tblorder.CID = tblcustomer.CID where order_status = @type";
                    SqlCommand cmd = new SqlCommand(query, cn);

                    cn.Open();
                    cmd.Parameters.AddWithValue("@type", type);
                    cn.Close();

                    SqlDataAdapter adp = new SqlDataAdapter(cmd);
                    DataSet ds = new DataSet();
                    adp.Fill(ds);

                    DataList1.DataSource = ds;
                    DataList1.DataBind();
                    DataTable dt = new DataTable();
                    adp.Fill(dt);
                    labeltodays.Text = type.ToUpper();
                    labeltodays.Visible = true;

                    if(dt.Rows.Count > 0 )
                    {
                        Label1.Visible = false;
                    }
                    

                }
                else if(Request.QueryString["ordertype"] == "todays")
                {
                    string type = Request.QueryString["ordertype"];
                    string date = DateTime.Now.ToString("dd-MM-yyyy");
                    string query = "select *,tblcustomer.cname,tblcustomer.cemail,tblcustomer.caddress from tblorder inner join tblcustomer on tblorder.CID = tblcustomer.CID where order_date = @date";
                    SqlCommand cmd = new SqlCommand(query, cn);

                    cn.Open();
                    cmd.Parameters.AddWithValue("@date", date);
                    cn.Close();

                    SqlDataAdapter adp = new SqlDataAdapter(cmd);
                    DataSet ds = new DataSet();
                    adp.Fill(ds);
                    DataTable dt = new DataTable();
                    adp.Fill(dt);
                    DataList1.DataSource = ds;
                    DataList1.DataBind();
                    labeltodays.Text = "TODAYS ORDERS";
                    labeltodays.Visible = true;

                    if (dt.Rows.Count > 0)
                    {
                       
                        Label1.Visible = false;
                    }
                    else
                    {
                        Label1.Visible = true;
                    }
                }
                else
                {
                    Response.Write("ERROR WHILE OPENING PAGE: CHECK FOR ERRORS ");
                }


           


            }



        }

        protected void searchbtn_Click(object sender, EventArgs e)
        {
            string searchquery = "select *,tblcustomer.cname,tblcustomer.cemail,tblcustomer.caddress from tblorder inner join tblcustomer on tblorder.CID = tblcustomer.CID where OID = @oid";
            SqlCommand cmd = new SqlCommand(searchquery, cn);
            cmd.Parameters.AddWithValue("@oid", txtsearch.Text);
            cn.Open();
            cmd.ExecuteNonQuery();
            cn.Close();
            SqlDataAdapter a = new SqlDataAdapter(cmd);
            DataSet d = new DataSet();
            a.Fill(d);
            DataList1.DataSource = d;
            DataList1.DataBind();
            
        }
    }
}