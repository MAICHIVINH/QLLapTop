using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShopLapTop.Admin.ManagerBill
{
    public partial class HomeBill : System.Web.UI.Page
    {
        ShopDataContext data = new ShopDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadOrder(0);

            }
        }

        public string LoadStatus(int statusid)
        {
            var status = data.StatusOrders.SingleOrDefault(p => p.status_id == statusid);
            return status.status_name;
        }

        private void LoadOrder(int page)
        {
            {
                var Order = data.Orders.ToList();
                // Lấy tổng số sản phẩm
                int totalProducts = Order.Count();
                //số trang muốn hiển thị
                int PageSize = 5;
                // Tính toán số trang và làm tròn
                int totalPages = (int)Math.Ceiling((double)totalProducts / PageSize);

                // Truy vấn sản phẩm theo thứ tự ID giảm dần và phân trang
                var order = Order.OrderByDescending(p => p.OrderID).Skip((page - 1) * PageSize).Take(PageSize).ToList();

                // Gán sản phẩm vào Repeater
                rptOrderList.DataSource = order;
                rptOrderList.DataBind();

                // Gán số trang vào phần phân trang
                List<int> pages = new List<int>();
                for (int i = 1; i <= totalPages; i++)
                {
                    pages.Add(i);
                }
                RepeaterPagination.DataSource = pages;
                RepeaterPagination.DataBind();

            }
        }
        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            LoadOrder(e.NewPageIndex);
        }
    }
}