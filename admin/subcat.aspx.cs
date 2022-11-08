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
    public partial class subcat : System.Web.UI.Page
    {
        SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["conau"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {



                string sqlquery = "select*from tblcategory";
                SqlCommand cmd = new SqlCommand(sqlquery, cn);
                cn.Open();
                SqlDataAdapter sda = new SqlDataAdapter();
                sda.SelectCommand = cmd;
                DataSet ds = new DataSet();
                sda.Fill(ds);
                cat_list.DataTextField = ds.Tables[0].Columns["catname"].ToString(); // text field name of table dispalyed in dropdown       
                cat_list.DataValueField = ds.Tables[0].Columns["CATID"].ToString();



                cat_list.DataSource = ds;
                cat_list.DataBind();

                cn.Close();


                string subquery = "select*from tblsubcategory";
                SqlCommand cmdd = new SqlCommand(subquery, cn);
                cn.Open();
                SqlDataAdapter sdaa = new SqlDataAdapter();
                sdaa.SelectCommand = cmdd;
                DataSet d = new DataSet();
                sdaa.Fill(d);

                subcatlist.DataSource = d;
                subcatlist.DataBind();



                cn.Close();




                string subquer = "select*from tblbrand";
                SqlCommand cm = new SqlCommand(subquer, cn);
                cn.Open();
                SqlDataAdapter sd = new SqlDataAdapter();
                sd.SelectCommand = cm;
                DataSet dss = new DataSet();
                sd.Fill(dss);

                DataList1.DataSource = dss;
                DataList1.DataBind();



                cn.Close();




            }
        }

        protected void submit_Click(object sender, EventArgs e)
        {
            string catid = cat_list.SelectedValue;

            string query = "insert into tblsubcategory(CATID,subname) values('" + catid + "','" + subname.Text + "')";


            SqlCommand cmd = new SqlCommand(query, cn);
            cn.Open();
            cmd.ExecuteNonQuery();
            cn.Close();
        }

       
        protected void btnn_Click(object sender, EventArgs e)
        {
       

            string query = "insert into tblbrand(bname) values('" + TextBox1.Text + "')";


            SqlCommand cmd = new SqlCommand(query, cn);
            cn.Open();
            cmd.ExecuteNonQuery();
            cn.Close();
        }
    }
}