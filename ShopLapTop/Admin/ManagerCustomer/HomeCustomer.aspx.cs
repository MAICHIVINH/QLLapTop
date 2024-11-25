using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShopLapTop.Admin.ManagerCustomer
{
    public partial class HomeCustomer : System.Web.UI.Page
    {
        ShopDataContext data = new ShopDataContext();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadCustomers();
            }
        }

        public string LoadStatus(bool status)
        {
            if(status == true)
            {
                return "Đang bị Khóa";
            } else
            {
                return "Đang Hoạt Động";
            }
        }

        private void LoadCustomers()
        {
            var customer = data.Accounts.OrderByDescending(p => p.AccountID).ToList();
            rptCustomerList.DataSource = customer;
            rptCustomerList.DataBind();
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            Button button = (Button)sender;
            int id = int.Parse(button.CommandArgument);
            Response.Redirect("Function/UpdateStatusCustomer.aspx?id=" + id);

        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {

        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {

        }
    }
}