using AUshop.DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace AUshop.BAL
{
    public class storeBAL
    {
    
             storeDAL objDal = new storeDAL();
        public DataSet ProductDetails(int ProductID)
        {
            return objDal.GetProductDetails(ProductID);
        }
    }
}