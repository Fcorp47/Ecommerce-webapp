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
    public partial class yourorders : System.Web.UI.Page
    {
        SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["conau"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["CID"] == null)
            {
                Response.Redirect("login.aspx");
            }

            if (!this.IsPostBack)
            {
               
                string fetchorder = "select* from tblorder where CID = @cid and order_status NOT IN('CANCELLED') order by OID desc";
                //"select *,o.order_date,o.order_time,o.order_total,o.order_status,tblproduct.pname from tblorderhistory innerjoin tblorder o on o.OID = tblorderhistory.OID innerjoin tblproduct on tblorderhistory.PID = tblproduct.PID where CID = @cid";
                SqlCommand cmd = new SqlCommand(fetchorder, cn);
                cmd.Parameters.AddWithValue("@cid", Session["CID"]);
                cn.Open();
                SqlDataAdapter sda = new SqlDataAdapter();
                sda.SelectCommand = cmd;
                DataSet ds = new DataSet();
                sda.Fill(ds);
                Repeater1.DataSource = ds;
                Repeater1.DataBind();

                DataTable dt = new DataTable();
                sda.Fill(dt);



                if (dt.Rows.Count == 0)
                {
                    Label1.Text = "NO ORDERS PLACED";
                    Label1.Visible = true;

                }
                cn.Close();



                if (Request.QueryString["operation"] == "cancelorder")
                {
                    if (Request.QueryString["status"] == "PLACED")
                    {
                        string update_status = "update tblorder set order_status = @status where OID = @oid and CID = @cid";
                        cn.Open();
                        SqlCommand cmdd = new SqlCommand(update_status, cn);
                        string status = "CANCELLED";
                        cmdd.Parameters.AddWithValue("@status", status);
                        cmdd.Parameters.AddWithValue("@oid", Request.QueryString["oid"]);
                        cmdd.Parameters.AddWithValue("@cid", Session["CID"]);
                        cmdd.ExecuteNonQuery();


                        cn.Close();


                    }
                    else
                    {
                        Response.Write("<script>alert('*PRODUCT ALREADY DELIVERED !! CANNOT CANCEL ORDER !!*')</script>");

                    }
                }
                else
                {

                }
              

                if (Request.QueryString["stat"] == "cancellist")
                {
                    Label1.Text = "CANCELLED ORDERS";
                  

                    string listcancel = "select* from tblorder where CID = @cid and order_status='CANCELLED' order by OID desc";
                    //"select *,o.order_date,o.order_time,o.order_total,o.order_status,tblproduct.pname from tblorderhistory innerjoin tblorder o on o.OID = tblorderhistory.OID innerjoin tblproduct on tblorderhistory.PID = tblproduct.PID where CID = @cid";
                    SqlCommand cmdd = new SqlCommand(listcancel, cn);
                    cmdd.Parameters.AddWithValue("@cid", Session["CID"]);
                    cn.Open();
                    SqlDataAdapter sdaa = new SqlDataAdapter();
                    sdaa.SelectCommand = cmdd;
                    DataSet dss = new DataSet();
                    sdaa.Fill(dss);
                    Repeater1.DataSource = dss;
                    Repeater1.DataBind();

                    DataTable dtt = new DataTable();
                    sdaa.Fill(dtt);



                }
            }

        }

        protected void Repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if(e.Item.ItemType == ListItemType.AlternatingItem || e.Item.ItemType == ListItemType.Item)
            {
                var OID = (HiddenField)e.Item.FindControl("hiddenOID");
                var Repeater2 = (Repeater)e.Item.FindControl("Repeater2");
                string fetchprod = "SELECT *, tblproduct.image1,tblproduct.pname FROM tblorderhistory INNER JOIN tblproduct ON " +
               "tblorderhistory.PID = tblproduct.PID where CID = @cid and OID = @oid";

                SqlCommand cmdd = new SqlCommand(fetchprod, cn);
                cmdd.Parameters.AddWithValue("@oid", Convert.ToInt32(OID.Value));
                cmdd.Parameters.AddWithValue("@cid", Session["CID"]);
                
                SqlDataAdapter sd = new SqlDataAdapter();
                sd.SelectCommand = cmdd;
                DataSet dss = new DataSet();
                sd.Fill(dss);
                Repeater2.DataSource = dss;
                Repeater2.DataBind();
                cn.Close();


            }
        }

      
    }
}