using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShopLapTop.Login
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void btnRegister_Click(object sender, EventArgs e)
        {
            

            string name = txtYourName.Text;
            string email = txtEmail.Text;
            string phone = txtPhone.Text;
            string address = txtAddress.Text;
            string city = txtCity.Text;
            string password = txtPassword.Text;
            string confirm = txtConfirmPassword.Text;
            bool gender;
            if(chkHis.Checked == true)
            {
                gender = false;
            }
            else
            {
                gender = true;
            }

            if (!string.IsNullOrEmpty(name) && !string.IsNullOrEmpty(email) && !string.IsNullOrEmpty(phone)
                    && !string.IsNullOrEmpty(address) && !string.IsNullOrEmpty(city) && !string.IsNullOrEmpty(password))
            {
                
                if (password == confirm)
                {
                   
                    
                    ShopDataContext data = new ShopDataContext();
                    var existingCustomer = data.Accounts.SingleOrDefault(p => p.Email == email);

                    if (existingCustomer == null)
                    {
                        Account account = new Account();
                        account.Email = email;
                        account.Address = address;
                        account.City = city;
                        account.Password = password;
                        account.FullName = name;
                        account.PhoneNumber = phone;
                        account.Gender = gender;
                        try
                        {
                            data.Accounts.InsertOnSubmit(account);
                            data.SubmitChanges();
                            lblError.Text = "Đã thêm thành công !";

                            Response.Redirect("Logins.aspx");
                        }
                        catch (Exception ex)
                        {
                            lblError.Text = "<p style='color:red;'>Đã có lỗi xảy ra trong quá trình đăng ký. Vui lòng thử lại.</p>";
                            // Optional: Ghi log lỗi nếu cần
                            Console.WriteLine(ex.Message); ;
                        }
                    }
                    else
                    {
                        lblError.Text = "<p style='color:red;'>Tài Khoản Đã Tồn Tại</p>"; ;
                    }
                }
                else
                {
                    lblError.Text = "<p style = 'color:red;'> Mật Khẩu Không trùng Khớp </p> ";
                }
            }
            else
            {
                lblError.Text = "<p style='color:red;'>Bạn Cần Nhập Đầy Đủ Thông tin</p>";
            }

        }
    }
}