using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShopLapTop
{
    public partial class Index : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadThuongHieu();
            if (!IsPostBack)
            {
                if (Request.Cookies["uid"] == null)
                {
                    HttpCookie myCookie = new HttpCookie("uid");
                    Random random = new Random();
                    myCookie.Value = random.Next(100000).ToString();
                    myCookie.Expires = DateTime.Now.AddDays(365);
                    Response.Cookies.Add(myCookie);

                }
            } 
            if (Session["name"] != null) //Kiểm tra xe ngdung đăng nhập hay chưa.Session["name"] != NULLngdung da dăng nhập 
            {
                lblTaiKhoan.Text = Session["name"].ToString();//Hiển thị tên tk đăng nhập trên lable
                btnLogOut.Visible = true;
            }



            if (Session["id"] != null)
            {
                int id = int.Parse(Session["id"].ToString());
            }

            else
            {
                lblTaiKhoan.Text = "<a href='~/Login/Logins.aspx'class='Login'></a>";
                btnLogOut.Visible = false;
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string query = txtSearch.Text;
            Response.Redirect($"~/Views/Pages/Search.aspx?search={query}");

        }

        private void LoadThuongHieu()
        {
            ShopDataContext data = new ShopDataContext();
            var Json = data.Brands.ToList();

            RepeaterThuongHieu.DataSource = Json;
            RepeaterThuongHieu.DataBind();
        }

        protected void btnLogOut_Click(object sender, EventArgs e)
        {
            Session.Clear();//Xóa hết dữ liêu trong sesion hiện tại (LogOut)
            Session.Abandon();

            Server.Transfer("~/SubPage.aspx");
        }
    }
}