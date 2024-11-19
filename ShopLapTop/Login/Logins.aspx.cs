using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShopLapTop.Login
{
    public partial class Logins : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string email = txtEmail.Text;
            string password = txtPassword.Text;
            ShopDataContext data = new ShopDataContext();
            var Json = data.Accounts.SingleOrDefault(tk => tk.Email == email && tk.Password == password);
            if (Json != null)
            {
                Session["name"] = Json.FullName;
                Session["id"] = Json.AccountID;
                Server.Transfer("~/SubPage.aspx");
            }
            else
            {
                lblError.Text = "Lỗi";
            }
        }
    }
}