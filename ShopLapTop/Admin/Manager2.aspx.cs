using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShopLapTop.Admin
{
    public partial class Manager2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadProduct();
        }



        private void LoadProduct()
        {
            ShopDataContext data = new ShopDataContext();
            var category = data.Products.ToList();
            rptOrderList.DataSource = category;
            rptOrderList.DataBind();

        }


    }
}