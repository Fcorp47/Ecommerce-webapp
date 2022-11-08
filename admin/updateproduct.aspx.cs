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
    public partial class updateproduct : System.Web.UI.Page
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

              
                string sqlquery = "select*from tblcategory";
                SqlCommand cmd = new SqlCommand(sqlquery, cn);
                cn.Open();
                SqlDataAdapter sda = new SqlDataAdapter();
                sda.SelectCommand = cmd;
                DataSet ds = new DataSet();
                sda.Fill(ds);
                category_list.DataTextField = ds.Tables[0].Columns["catname"].ToString(); // text field name of table dispalyed in dropdown       
                category_list.DataValueField = ds.Tables[0].Columns["CATID"].ToString();

                category_list.DataSource = ds.Tables[0];
                category_list.DataBind();
                category_list.Items.Insert(0, new ListItem("---SELECT CATEGORY---"));
                //datalist_cat.DataSource = ds;
                //datalist_cat.DataBind();

                cn.Close();


                string brand = "select*from tblbrand";
                SqlCommand cmdd = new SqlCommand(brand, cn);
                cn.Open();
                SqlDataAdapter sdd = new SqlDataAdapter();
                sdd.SelectCommand = cmdd;
                DataSet dd = new DataSet();
                sdd.Fill(dd);
                brand_list.DataTextField = dd.Tables[0].Columns["bname"].ToString(); // text field name of table dispalyed in dropdown       
                brand_list.DataValueField = dd.Tables[0].Columns["BID"].ToString();
                // to retrive specific  textfield name   
                brand_list.DataSource = dd.Tables[0];
                brand_list.DataBind();
                brand_list.Items.Insert(0, new ListItem("---SELECT BRAND---"));
                //datalist_cat.DataSource = ds;
                //datalist_cat.DataBind();

                cn.Close();



                if (Request.QueryString["operation"] == "edit")
                {
                    Session["required"] = "";
                    string sqlquer = "select *,tblcategory.catname,tblsubcategory.subname,tblbrand.bname from tblproduct inner join tblcategory on tblcategory.CATID=tblproduct.CATID inner join tblsubcategory on tblproduct.SUBID = tblsubcategory.SUBID inner join tblbrand on tblbrand.BID = tblproduct.BID where PID = @pid";
                    SqlCommand cmddd = new SqlCommand(sqlquer, cn);
                    cmddd.Parameters.AddWithValue("@pid", Request.QueryString["pid"]);
                    cn.Open();
                    SqlDataAdapter adp = new SqlDataAdapter(cmddd);
                    adp.SelectCommand = cmddd;
                    DataTable dt = new DataTable();
                    adp.Fill(dt);

                    hdncat.Value = dt.Rows[0]["CATID"].ToString();
                    hdnsub.Value = dt.Rows[0]["SUBID"].ToString();
                    hdnbrand.Value = dt.Rows[0]["BID"].ToString();
                    txtpname.Text = dt.Rows[0]["pname"].ToString();
                    txtspec.Text = dt.Rows[0]["pspec"].ToString();
                    txtdetailspec.Text = dt.Rows[0]["pdetail_spec"].ToString();
                    txtprice.Text = dt.Rows[0]["pprice"].ToString();


                }


            }





        }

        protected void btnsave_Click(object sender, EventArgs e)
        {


            if (Request.QueryString["operation"] == "edit")
            {

                if (subcategory_list.SelectedValue == "0")
                {

                    if (FileUpload1.HasFile & FileUpload2.HasFile & FileUpload3.HasFile)
                    {
                        string file1name = Path.GetFileNameWithoutExtension(FileUpload1.PostedFile.FileName);
                        string file2name = Path.GetFileNameWithoutExtension(FileUpload2.PostedFile.FileName);
                        string file3name = Path.GetFileNameWithoutExtension(FileUpload3.PostedFile.FileName);

                        string extension1 = Path.GetExtension(FileUpload1.PostedFile.FileName);
                        string extension2 = Path.GetExtension(FileUpload2.PostedFile.FileName);
                        string extension3 = Path.GetExtension(FileUpload3.PostedFile.FileName);

                        int size1 = FileUpload1.PostedFile.ContentLength;
                        int size2 = FileUpload2.PostedFile.ContentLength;
                        int size3 = FileUpload3.PostedFile.ContentLength;
                        if (size1 < 10097512 && size2 < 10097512 && size3 < 10097512)
                        {


                            if ((extension1 == ".jpg") || (extension1 == ".jpeg") || (extension1 == ".png"))
                            {
                                if ((extension2 == ".jpg") || (extension2 == ".jpeg") || (extension2 == ".png"))
                                {

                                    if ((extension3 == ".jpg") || (extension3 == ".jpeg") || (extension3 == ".png"))
                                    {
                                        Random rand = new Random();


                                        string img1link = file1name + rand.Next(1000, 9999).ToString() + extension1;
                                        FileUpload1.PostedFile.SaveAs(Server.MapPath("~/images/") + img1link);
                                        string img2link = file2name + rand.Next(1000, 9999).ToString() + extension2;
                                        FileUpload2.PostedFile.SaveAs(Server.MapPath("~/images/") + img2link);
                                        string img3link = file3name + rand.Next(1000, 9999).ToString() + extension3;
                                        FileUpload3.PostedFile.SaveAs(Server.MapPath("~/images/") + img3link);

                                        string update = "update tblproduct set CATID=@cid,SUBID=@subid,BID=@bid,pname=@pname" +
                       ",pspec=@pspec,pdetail_spec=@pds,pprice=@pprice,image1=@img1,image2=@img2,image3=@img3 where PID=@pid";
                                        SqlCommand sc = new SqlCommand(update, cn);
                                        sc.Parameters.AddWithValue("@pid", Request.QueryString["pid"]);
                                        sc.Parameters.AddWithValue("@cid", hdncat.Value);
                                        sc.Parameters.AddWithValue("@subid", hdnsub.Value);
                                        sc.Parameters.AddWithValue("@bid", hdnbrand.Value);
                                        sc.Parameters.AddWithValue("@pname", txtpname.Text);
                                        sc.Parameters.AddWithValue("@pspec", txtspec.Text);
                                        sc.Parameters.AddWithValue("@pds", txtdetailspec.Text);
                                        sc.Parameters.AddWithValue("@pprice", txtprice.Text);
                                        sc.Parameters.AddWithValue("@img1", "~/images/" + img1link);
                                        sc.Parameters.AddWithValue("@img2", "~/images/" + img2link);
                                        sc.Parameters.AddWithValue("@img3", "~/images/" + img3link);
                                        cn.Open();
                                        int r = sc.ExecuteNonQuery();
                                        cn.Close();



                                        if (r > 0)
                                        {

                                            Response.Write("<script>alert(' PRODUCT UPDATED SUCCESSFULLY !! ')</script>");


                                        }
                                    }

                                    else
                                    {
                                        Response.Write("<script>alert(' Only JPEG/JPG/PNG Image File Acceptable - Please Upload Image File Again ')</script>");

                                    }
                                }
                                else
                                {
                                    Response.Write("<script>alert(' Only JPEG/JPG/PNG Image File Acceptable - Please Upload Image File Again ')</script>");

                                }

                            }
                            else
                            {
                                Response.Write("<script>alert(' Only JPEG/JPG/PNG Image File Acceptable - Please Upload Image File Again ')</script>");

                            }


                        }
                        else
                        {
                            Response.Write("<script>alert(' File size should not exceed 10mb. Choose file again! ')</script>");

                        }
                    }
                    else if(FileUpload1.HasFile || FileUpload2.HasFile || FileUpload3.HasFile)
                    {
                        Response.Write("<script>alert(' ALL IMAGES MUST BE UPLOADED FOR UPDATE !! ')</script>");

                    }
                    else
                    {
                        Response.Write("step 1");
                        string update = "update tblproduct set CATID=@cid,SUBID=@subid,BID=@bid,pname=@pname" +
                            ",pspec=@pspec,pdetail_spec=@pds,pprice=@pprice where PID=@pid";
                        SqlCommand sc = new SqlCommand(update, cn);
                        sc.Parameters.AddWithValue("@pid", Request.QueryString["pid"]);
                        sc.Parameters.AddWithValue("@cid", hdncat.Value);
                        sc.Parameters.AddWithValue("@subid", hdnsub.Value);
                        sc.Parameters.AddWithValue("@bid", hdnbrand.Value);
                        sc.Parameters.AddWithValue("@pname", txtpname.Text);
                        sc.Parameters.AddWithValue("@pspec", txtspec.Text);
                        sc.Parameters.AddWithValue("@pds", txtdetailspec.Text);
                        sc.Parameters.AddWithValue("@pprice", txtprice.Text);
                        cn.Open();
                        int r = sc.ExecuteNonQuery();
                        cn.Close();

                        if (r > 0)
                        {
                            Response.Write("<script>alert(' PRODUCT UPDATED SUCCESSFULLY !! ')</script>");
                        }
                    }


                }
                else if (subcategory_list.SelectedValue != "0")
                {

                    if (FileUpload1.HasFile & FileUpload2.HasFile & FileUpload3.HasFile)
                    {
                        Response.Write("step 2");
                        string file1name = Path.GetFileNameWithoutExtension(FileUpload1.PostedFile.FileName);
                        string file2name = Path.GetFileNameWithoutExtension(FileUpload2.PostedFile.FileName);
                        string file3name = Path.GetFileNameWithoutExtension(FileUpload3.PostedFile.FileName);

                        string extension1 = Path.GetExtension(FileUpload1.PostedFile.FileName);
                        string extension2 = Path.GetExtension(FileUpload2.PostedFile.FileName);
                        string extension3 = Path.GetExtension(FileUpload3.PostedFile.FileName);

                        int size1 = FileUpload1.PostedFile.ContentLength;
                        int size2 = FileUpload2.PostedFile.ContentLength;
                        int size3 = FileUpload3.PostedFile.ContentLength;
                        if (size1 < 10097512 && size2 < 10097512 && size3 < 10097512)
                        {


                            if ((extension1 == ".jpg") || (extension1 == ".jpeg") || (extension1 == ".png"))
                            {
                                if ((extension2 == ".jpg") || (extension2 == ".jpeg") || (extension2 == ".png"))
                                {

                                    if ((extension3 == ".jpg") || (extension3 == ".jpeg") || (extension3 == ".png"))
                                    {
                                        Random rand = new Random();


                                        string img1link = file1name + rand.Next(1000, 9999).ToString() + extension1;
                                        FileUpload1.PostedFile.SaveAs(Server.MapPath("~/images/") + img1link);
                                        string img2link = file2name + rand.Next(1000, 9999).ToString() + extension2;
                                        FileUpload2.PostedFile.SaveAs(Server.MapPath("~/images/") + img2link);
                                        string img3link = file3name + rand.Next(1000, 9999).ToString() + extension3;
                                        FileUpload3.PostedFile.SaveAs(Server.MapPath("~/images/") + img3link);

                                        string update = "update tblproduct set CATID=@cid,SUBID=@subid,BID=@bid,pname=@pname" +
                       ",pspec=@pspec,pdetail_spec=@pds,pprice=@pprice,image1=@img1,image2=@img2,image3=@img3 where PID=@pid";
                                        SqlCommand sc = new SqlCommand(update, cn);
                                        sc.Parameters.AddWithValue("@pid", Request.QueryString["pid"]);
                                        sc.Parameters.AddWithValue("@cid", category_list.SelectedValue);
                                        sc.Parameters.AddWithValue("@subid", subcategory_list.SelectedValue);
                                        sc.Parameters.AddWithValue("@bid", brand_list.SelectedValue);
                                        sc.Parameters.AddWithValue("@pname", txtpname.Text);
                                        sc.Parameters.AddWithValue("@pspec", txtspec.Text);
                                        sc.Parameters.AddWithValue("@pds", txtdetailspec.Text);
                                        sc.Parameters.AddWithValue("@pprice", txtprice.Text);
                                        sc.Parameters.AddWithValue("@img1", "~/images/" + img1link);
                                        sc.Parameters.AddWithValue("@img2", "~/images/" + img2link);
                                        sc.Parameters.AddWithValue("@img3", "~/images/" + img3link);
                                        cn.Open();
                                        int r = sc.ExecuteNonQuery();
                                        cn.Close();



                                        if (r > 0)
                                        {

                                            Response.Write("<script>alert(' PRODUCT UPDATED SUCCESSFULLY !! ')</script>");


                                        }
                                    }

                                    else
                                    {
                                        Response.Write("<script>alert(' Only JPEG/JPG/PNG Image File Acceptable - Please Upload Image File Again ')</script>");

                                    }
                                }
                                else
                                {
                                    Response.Write("<script>alert(' Only JPEG/JPG/PNG Image File Acceptable - Please Upload Image File Again ')</script>");

                                }

                            }
                            else
                            {
                                Response.Write("<script>alert(' Only JPEG/JPG/PNG Image File Acceptable - Please Upload Image File Again ')</script>");

                            }


                        }
                        else
                        {
                            Response.Write("<script>alert(' File size should not exceed 10mb. Choose file again! ')</script>");

                        }
                    }

                    else
                    {
                        Response.Write("step 3");

                        string update = "update tblproduct set CATID=@cid,SUBID=@subid,BID=@bid,pname=@pname" +
                       ",pspec=@pspec,pdetail_spec=@pds,pprice=@pprice where PID=@pid";
                        SqlCommand sc = new SqlCommand(update, cn);
                        sc.Parameters.AddWithValue("@pid", Request.QueryString["pid"]);
                        sc.Parameters.AddWithValue("@cid", category_list.SelectedValue);
                        sc.Parameters.AddWithValue("@subid", subcategory_list.SelectedValue);
                        sc.Parameters.AddWithValue("@bid", brand_list.SelectedValue);
                        sc.Parameters.AddWithValue("@pname", txtpname.Text);
                        sc.Parameters.AddWithValue("@pspec", txtspec.Text);
                        sc.Parameters.AddWithValue("@pds", txtdetailspec.Text);
                        sc.Parameters.AddWithValue("@pprice", txtprice.Text);

                        cn.Open();
                        int r = sc.ExecuteNonQuery();
                        cn.Close();

                        if (r > 0)
                        {
                            Response.Write("<script>alert(' PRODUCT UPDATED SUCCESSFULLY !! ')</script>");
                        }
                    }


                }
                else
                {
                    Response.Write("<script>alert(' product not updated ')</script>");

                }



            }

        }

        protected void category_list_SelectedIndexChanged(object sender, EventArgs e)
        {

            int catid = Convert.ToInt32(category_list.SelectedValue);

            cn.Open();
            SqlCommand cmd = new SqlCommand("select * from tblsubcategory where CATID = '" + catid + "' ", cn);
            cmd.CommandType = CommandType.Text;
            subcategory_list.DataSource = cmd.ExecuteReader();
            subcategory_list.DataTextField = "subname";
            subcategory_list.DataValueField = "SUBID";
            subcategory_list.DataBind();
        }
    }
}