using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace AUshop.DAL
{
    public class storeDAL
    {
        SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["conau"].ConnectionString);



        public DataSet GetProductDetails(int ProductID)
        {
            try
            {
                string selectq = "select* from tblgame where ProductID=@ProductID";
                SqlCommand objcmd = new SqlCommand(selectq, cn);

                objcmd.Parameters.AddWithValue("@ProductID", ProductID);


                cn.Open();
                SqlDataAdapter adapter = new SqlDataAdapter(objcmd);
                DataSet ds = new DataSet();
                adapter.Fill(ds);
                return ds;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                cn.Close();
            }
        }
    }
}