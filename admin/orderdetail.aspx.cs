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
    public partial class orderdetail : System.Web.UI.Page
    {

        SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["conau"].ConnectionString);


        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            { 
            if (Request.QueryString["oid"] != null)
            {
                string query = "select *, tblproduct.pname from tblorderhistory inner join tblproduct on tblproduct.PID = tblorderhistory.PID where OID = @oid";
                SqlCommand cmd = new SqlCommand(query, cn);
                cmd.Parameters.AddWithValue("@oid", Request.QueryString["oid"]);
                cn.Open();
                cmd.ExecuteNonQuery();
                cn.Close();

                SqlDataAdapter adp = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                adp.Fill(ds);
                DataList1.DataSource = ds;
                DataList1.DataBind();

                string q = "select * from tblorder where OID = @orderid";
                SqlCommand cmdd = new SqlCommand(q, cn);
                cmdd.Parameters.AddWithValue("@orderid", Request.QueryString["oid"]);
                cn.Open();
                cmdd.ExecuteNonQuery();
                cn.Close();

                SqlDataAdapter adpp = new SqlDataAdapter(cmdd);
                DataSet dss = new DataSet();
                adpp.Fill(dss);
                DataList2.DataSource = dss;
                DataList2.DataBind();



            }
            else
            {
                Response.Redirect("dashboard.aspx");
            }
          }
        }

        protected void save_Click(object sender, EventArgs e)
        {
            string query = "update tblorder set order_status = @status, order_remark = @remark where OID =  @oid   ";
           
            SqlCommand cmd = new SqlCommand(query, cn);
            cmd.Parameters.AddWithValue("@status", DropDownList1.SelectedValue);
            cmd.Parameters.AddWithValue("@remark", TextBox1.Text);
            cmd.Parameters.AddWithValue("@oid", Request.QueryString["oid"]);
            cn.Open();
            cmd.ExecuteNonQuery();
            cn.Close();
        }
    }
}