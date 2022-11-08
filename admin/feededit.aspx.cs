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
    public partial class feededit : System.Web.UI.Page
    {
        SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["conau"].ConnectionString);


        protected void Page_Load(object sender, EventArgs e)
        {

           

                string q = "select * from tblfeedback where FID = @fid";
                SqlCommand cmdd = new SqlCommand(q, cn);
                cmdd.Parameters.AddWithValue("@fid", Request.QueryString["fid"]);
                cn.Open();
                cmdd.ExecuteNonQuery();
                cn.Close();

                SqlDataAdapter adpp = new SqlDataAdapter(cmdd);
                DataSet dss = new DataSet();
                adpp.Fill(dss);
                DataList2.DataSource = dss;
                DataList2.DataBind();



        }

        protected void save_Click(object sender, EventArgs e)
        {
            string query = "update tblfeedback set freply = @st where FID =  @fid   ";
           

            SqlCommand cmd = new SqlCommand(query, cn);
            
            cmd.Parameters.AddWithValue("@st", TextBox1.Text);
            cmd.Parameters.AddWithValue("@fid", Request.QueryString["fid"]);
            cn.Open();
            cmd.ExecuteNonQuery();
            cn.Close();
        }
    }
}