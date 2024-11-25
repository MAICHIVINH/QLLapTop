using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShopLapTop.Views.Orders
{
    public partial class OrderStatus : System.Web.UI.Page
    {
        ShopDataContext data = new ShopDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string OrderID = "";
                if (Session["idOrder"] != null)
                {
                    OrderID = Session["idOrder"].ToString();
                }
                if (Session["id"] != null)
                {
                    int id = int.Parse(Session["id"].ToString());
                    if (CheckLoadOrderID(id))
                    {
                        OrderID = LoadOrderID(id);
                    }
                }
                LoadOrderStatus(OrderID);
            }
        }

        private string LoadOrderID(int iduser)
        {
            var orderstatus = (from p in data.Products
                               join ord in data.OrderDetails on p.ProductID equals ord.ProductID
                               join o in data.Orders on ord.OrderID equals o.OrderID
                               where o.AccountID == iduser
                               select
                                   o.OrderID
                               ).FirstOrDefault();

            return orderstatus;
        }
        private bool CheckLoadOrderID(int iduser)
        {
            var orderstatus = (from p in data.Products
                               join ord in data.OrderDetails on p.ProductID equals ord.ProductID
                               join o in data.Orders on ord.OrderID equals o.OrderID
                               where o.AccountID == iduser
                               select 
                                   o.OrderID
                               ).FirstOrDefault();
            if(orderstatus != null)
            {
                return true;
            }
            return false;
        }

        private void LoadOrderStatus(string Order)
        {
            // sql: select * from Product p join OrderDetails ord on p.Product_id = ord.Product_id
                             // join orders o on o.Order_id = ord.Order_id where order_id = ...
            // aspx = (From p in data.Product join ord in data.OrderDetails on p.Product_id equals ord.Product_id
            // //           join o in data.Orders on o.Order_id equals ord.Order_Details).ToList();
            var orderstatus = (from p in data.Products join ord in data.OrderDetails on p.ProductID equals ord.ProductID
                       join o in data.Orders on ord.OrderID equals o.OrderID  where o.OrderID == Order
                               select new 
                       {
                           Product = p,
                           OrderDetails = ord,
                           Orders = o,
                       } ).ToList();
            if(orderstatus == null)
            {
                lblError.Text = "Bạn cần nhập mã đơn để biết thông tin của đơn mình!";
                return;
            }
            rptCart.DataSource = orderstatus;
            rptCart.DataBind(); 

        }
        public string LoadStatus(int status)
        {
            var statusorder = data.StatusOrders.SingleOrDefault(p => p.status_id == status);
            return statusorder.status_name;
        }

        protected void btnStatus_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            int id = int.Parse(btn.CommandArgument);
            RepeaterItem item = (RepeaterItem)btn.NamingContainer;
            Label lblQuantity = item.FindControl("lblQuantity") as Label;
            Label lblProductId = item.FindControl("lblProductId") as Label;
            Label lblOrdersID = item.FindControl("lblOrderID") as Label;
            Label lbltotalprice = item.FindControl("lbltotalprice") as Label;
            Session["lblQuantity"] = lblQuantity.Text;
            Session["lblOrdersID"] = lblOrdersID.Text;
            Session["lbltotalprice"] = lbltotalprice.Text;
            Response.Redirect("EvaluateProduct.aspx?id=" + id);
        }

        protected void btnSearchOrder_Click(object sender, EventArgs e)
        {
            string OrderSearch = txtSearchOrder.Text;
            LoadOrderStatus(OrderSearch);
        }
    }
}