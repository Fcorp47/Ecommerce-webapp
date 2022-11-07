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
    public partial class orederinvoice : System.Web.UI.Page
    {

        SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["conau"].ConnectionString);


        protected void Page_Load(object sender, EventArgs e)
        {
            //Session["orderid"] 
            string OID = string.Empty;
            if (Session["ORDER_ID"] != null)
            {
                OID = Session["ORDER_ID"].ToString();
                Session.Remove("ORDER_ID");
            }
            string phrase = OID;
            string[] words = phrase.Split('-');
            string x = words[1];

            string squery = "select *,tblcustomer.CID,tblcustomer.cname,tblcustomer.cphone,tblcustomer.caddress,tblcustomer.cemail from tblorder inner join tblcustomer on tblcustomer.CID = tblorder.CID where OID = '"+x+"'";  
            SqlCommand cmdd = new SqlCommand(squery, cn);
            cn.Open();
            SqlDataAdapter sdaa = new SqlDataAdapter();
            sdaa.SelectCommand = cmdd;
            DataSet dss = new DataSet();
            sdaa.Fill(dss);
            DataList2.DataSource = dss;
            DataList2.DataBind();
            DataTable dt = new DataTable();
            
            Session["CID"] = dt.Rows[0]["CID"].ToString();
            Session["username"] = dt.Rows[0]["cname"].ToString();
            Session["Cemail"] = dt.Rows[0]["cemail"].ToString();


            cn.Close();
            

            



            string sqlquery = "select *,tblproduct.pname,tblproduct.pprice from tblorderhistory inner join tblproduct on tblorderhistory.PID = tblproduct.PID where OID = '"+x+"'";

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
    }
}