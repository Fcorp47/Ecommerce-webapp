using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AUshop.admin
{
    public partial class addcategory : System.Web.UI.Page
    {

        SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["conau"].ConnectionString);


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                if (Session["username"] == null)
                {
                    Response.Redirect("../login.aspx");
                }
                if (Request.QueryString["catid"] != null)
                {
                    btnaddcat.Text = "UPDATE";

                    string sqlquer = "select * from tblcategory where CATID=@cid";
                    SqlCommand cmddd = new SqlCommand(sqlquer, cn);
                    cmddd.Parameters.AddWithValue("@cid", Request.QueryString["catid"]);
                    cn.Open();
                    SqlDataAdapter adp = new SqlDataAdapter(cmddd);
                    adp.SelectCommand = cmddd;
                    DataTable dt = new DataTable();
                    adp.Fill(dt);
                    cn.Close();
                    txtcatname.Text = dt.Rows[0]["catname"].ToString();

                }

            }
        }

        protected void btnaddcat_Click(object sender, EventArgs e)
        {
            if (Request.QueryString["catid"] != null)
            {

                if (FileUpload1.HasFile)
                {
                    FileUpload1.SaveAs(Server.MapPath("~/images/") + Path.GetFileName(FileUpload1.FileName));
                    string img1link = "~/images/" + Path.GetFileName(FileUpload1.FileName);


                    string catid = Request.QueryString["catid"];

                    string query = "update tblcategory set catname='" + txtcatname.Text + "',catimage='" + img1link + "' where catid = '" + catid + "'";


                    SqlCommand cmd = new SqlCommand(query, cn);
                    cn.Open();
                    cmd.ExecuteNonQuery();
                    cn.Close();
                    Response.Write("<script>alert(' Updated Successfully ')</script>");

                }
                else
                {

                    string catid = Request.QueryString["catid"];

                    string query = "update tblcategory set catname='" + txtcatname.Text + "' where catid = '" + catid + "'";


                    SqlCommand cmd = new SqlCommand(query, cn);
                    cn.Open();
                    cmd.ExecuteNonQuery();
                    cn.Close();

                    Response.Write("<script>alert(' Updated Successfully ')</script>");
                }

            }
            else
            {

                string extension1 = Path.GetExtension(FileUpload1.FileName);

                if (FileUpload1.HasFile)
                {
                    if ((extension1 == ".jpg") || (extension1 == ".jpeg") || (extension1 == ".png"))
                    {

                        FileUpload1.SaveAs(Server.MapPath("~/images/") + Path.GetFileName(FileUpload1.FileName));
                        string img1link = "~/images/" + Path.GetFileName(FileUpload1.FileName);


                        string query = "insert into tblcategory(catname,catimage,catstatus) values('" + txtcatname.Text + "','" + img1link + "','" + 1 + "')";


                        SqlCommand cmd = new SqlCommand(query, cn);
                        cn.Open();
                        int r = cmd.ExecuteNonQuery();
                        cn.Close();

                        if (r > 0)
                        {
                            Label1.Text = "category added successfully";
                            Label1.Visible = true;
                            Response.Write("<script>alert('category added successfully')</script>");

                        }
                    }
                    else
                    {
                        Response.Write("<script>alert('Selected file must be in ( jpg/jpeg or png format ')</script>");
                    }
                }
                else
                {
                    Response.Write("<script>alert(' please select an image to upload ')</script>");
                }
            }

        }
    }
}