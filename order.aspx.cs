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
    public partial class order : System.Web.UI.Page
    {

        SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["conau"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if(!this.IsPostBack)
            {
                if (Session["CID"] == null)
                {
                    Response.Redirect("login.aspx");
                }

                


                string fetch_cartt = "select *,tblproduct.pname,tblproduct.pname,tblproduct.image1 from" +
                 " tblcart INNER JOIN tblproduct ON tblproduct.PID = tblcart.PID where CID = '" + Session["CID"] + "' ";
                SqlCommand command = new SqlCommand(fetch_cartt, cn);
                cn.Open();
                SqlDataAdapter sdaa = new SqlDataAdapter();
                sdaa.SelectCommand = command;
                DataSet ds = new DataSet();
                sdaa.Fill(ds);
                Repeater1.DataSource = ds;
                Repeater1.DataBind();
                cn.Close();

                string fetch_cart = "select * from tblcart where CID = '" + Session["CID"] + "' ";
                SqlCommand cmdo = new SqlCommand(fetch_cart, cn);
                cn.Open();
                SqlDataAdapter sda = new SqlDataAdapter();
                sda.SelectCommand = cmdo;
               
              
                DataTable dt = new DataTable();
                sda.Fill(dt);
                cn.Close();
                if (dt.Rows.Count > 0)
                {
                   
                }
                else
                {
                    Response.Redirect("cart.aspx");
                }

                cn.Open();
                string query = "select*from tblcustomer where CID = @cid";
                SqlCommand cmdd = new SqlCommand(query, cn);
                //cmd.ExecuteNonQuery();
                cmdd.Parameters.AddWithValue("@cid", Session["CID"]);
                int resultt = cmdd.ExecuteNonQuery();
                DataTable dtcust = new DataTable();
                SqlDataAdapter adpp = new SqlDataAdapter(cmdd);
                cmdd.Dispose();
                adpp.Fill(dtcust);

                txtshipaddress.Text = dtcust.Rows[0]["caddress"].ToString();
                txtphone.Text = dtcust.Rows[0]["cphone"].ToString();
                txtpin.Text = dtcust.Rows[0]["cpincode"].ToString();

                //cn.Open();
                string SELECT_QUERY = "select*from tblcart where CID = '" + Session["CID"] + "' ";
                SqlCommand cmd = new SqlCommand(SELECT_QUERY, cn);
                //cmd.ExecuteNonQuery();
                int result = cmd.ExecuteNonQuery();
                DataTable dtlogin = new DataTable();
                SqlDataAdapter adp = new SqlDataAdapter(cmd);
                cmd.Dispose();
                adp.Fill(dtlogin);

                //gonna retrieve all the fields from the tblcart
                //found the total amount

                object sumObject;
                sumObject = dtlogin.Compute("Sum(ptotal)", string.Empty);

                string total = sumObject.ToString();
                // Session["totalcart"] = total;
                Session["totalcart"] = (Convert.ToInt32(total) + (Convert.ToInt32(total) * 18) / 100);
                cn.Close();

            }
           

        }

        protected void btn_order_Click(object sender, EventArgs e)
        {

            string CID = Session["CID"].ToString();

            //  string email = txtemail.Text;
            string address = txtshipaddress.Text;
            string phone = txtphone.Text;
            string pincode = txtpin.Text;
            cn.Open();
            string update_cust = "update tblcustomer set caddress='" + address + "',cphone ='" + phone + "'" +
                ",cpincode = '" + pincode + "' where CID = '"+CID+"'";
                      

            SqlCommand customercmd = new SqlCommand(update_cust, cn);

            customercmd.ExecuteNonQuery();
            cn.Close();




           
            cn.Open();
            string SELECT_QUERY = "select*from tblcart where CID = '" + Session["CID"] + "' ";
            SqlCommand cmd = new SqlCommand(SELECT_QUERY, cn);
            //cmd.ExecuteNonQuery();
            int result = cmd.ExecuteNonQuery();
            DataTable dtlogin = new DataTable();
            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            cmd.Dispose();
            adp.Fill(dtlogin);



            //gonna retrieve all the fields from the tblcart 






            //found the total amount
            object sumObject;
            sumObject = dtlogin.Compute("Sum(ptotal)", string.Empty);
          

            string total = sumObject.ToString();
         //   Session["totalcart"] = total;
            cn.Close();

            // Response.Write("<script>alert('"+tomtal+"')</script>");

           

            //going to make entry into the order table 

            string date = DateTime.Now.ToString("dd-MM-yyyy");
            string time = DateTime.Now.ToString("h:mm");
            string status = "PLACED";

            cn.Open();
            string order_insert = "INSERT INTO tblorder (CID,order_date,order_time,order_total,order_status" +
                       ") VALUES ('" + CID + "','" + date + "','" + time + "','" + Session["totalcart"] + "','" + status + "')";

            SqlCommand pro = new SqlCommand(order_insert, cn);

            pro.ExecuteNonQuery();
            cn.Close();



            cn.Open();
            string select_order = "select*from tblorder where CID='" + CID + "' and order_date= '" + date + "' and order_time = '" + time + "' ";
            SqlCommand cmdd = new SqlCommand(select_order, cn);
            //cmd.ExecuteNonQuery();
            int resultt = cmdd.ExecuteNonQuery();
            DataTable dtorder = new DataTable();
            SqlDataAdapter adpp = new SqlDataAdapter(cmdd);
            cmdd.Dispose();
            adpp.Fill(dtorder);
       
            string OID = dtorder.Rows[0]["OID"].ToString();
            Session["orderid"] = OID;
            cn.Close();
         
            for (int i = 0; i < dtlogin.Rows.Count; i++)
           {
                string quantity = dtlogin.Rows[i]["pqty"].ToString();
                string pid = dtlogin.Rows[i]["PID"].ToString();

                cn.Open();

                string insert_ohistory = "INSERT INTO tblorderhistory(OID,CID,PID,qty" +
                         ") VALUES ('" + OID + "','" + CID + "','" + pid + "','" + quantity + "')";

                SqlCommand proo = new SqlCommand(insert_ohistory, cn);

                proo.ExecuteNonQuery();
                cn.Close();


            }

            cn.Open();
            string deletecart = "delete from tblcart where CID = '" + Session["CID"] + "' ";
            SqlCommand cartcmd = new SqlCommand(deletecart, cn);

            cartcmd.ExecuteNonQuery();

            cn.Close();








            Random r = new Random();
            string oid = r.Next(10000001, 99999999).ToString();

            string merchantKey = "rKFy9v9vGjp7ajt5";  //Change this constant's value with Merchant key

            Dictionary<string, string> parameters = new Dictionary<string, string>();

            parameters.Add("MID", "TYmwCE61492093834199");
            parameters.Add("CHANNEL_ID", "WEB");
            parameters.Add("INDUSTRY_TYPE_ID", "Retail");
            parameters.Add("WEBSITE", "WEBSTAGING");
            //parameters.Add("EMAIL", txtemailid.Text);
            //parameters.Add("MOBILE_NO", txtcontactno.Text);
            parameters.Add("CUST_ID", CID);
          //  parameters.Add("O_ID", OID);
            parameters.Add("ORDER_ID","order-"+ OID);
            parameters.Add("TXN_AMOUNT", Session["totalcart"].ToString());
            parameters.Add("CALLBACK_URL", "https://localhost:44377/PaytmResponse.aspx");


            string checksum = Paytm.Checksum.generateSignature(parameters, merchantKey);

            //bool verifySignature = Paytm.Checksum.verifySignature(parameters, merchantKey, checksum);
            //Response.Write(checksum + "<br>");
            //Response.Write(verifySignature+"<br>");

            //if (verifySignature.ToString() == "True" )
            //{
            string paytmURL = "https://securegw-stage.paytm.in/theia/processTransaction";
            string outputHTML = "<html>";
            outputHTML += "<head>";
            outputHTML += "<title>Merchant check out page</title>";
            outputHTML += "</head>";
            outputHTML += "<body>";
            outputHTML += "<center><h1>Please do not refresh this page...</h1></center>";
            outputHTML += "<form method='post' action='" + paytmURL + "' name='f1'>";
            outputHTML += "<table border='1'>";
            outputHTML += "<tbody>";
            foreach (string Key in parameters.Keys)
            {
                outputHTML += "<input type='hidden' name='" + Key + "' value='" + parameters[Key] + "'>";
            }
            outputHTML += "<input type='hidden' name='CHECKSUMHASH' value='" + checksum + "'>";
            outputHTML += "</tbody>";
            outputHTML += "</table>";
            outputHTML += "<script type='text/javascript'>";
            outputHTML += "document.f1.submit();";
            outputHTML += "</script>";
            outputHTML += "</form>";
            outputHTML += "</body>";
            outputHTML += "</html>";
            Response.Write(outputHTML);



        }
    }
}