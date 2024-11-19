using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShopLapTop.Admin.ManagerProduct.Function
{
    public partial class UpdateProduct : System.Web.UI.Page
    {
        ShopDataContext data = new ShopDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadCategories();
                LoadBrand();
                int id = int.Parse(Request.QueryString["id"]);
                LoadPage(id);
            }
        }

        private void LoadCategories()
        {
            var categories = data.ProductCategories.ToList();
            foreach (var item in categories)
            {
                // Thêm Tên và ID tương ứng với Categories
                ListItem listItem = new ListItem(item.CategoryName, item.CategoryID.ToString());
                ddlCategories.Items.Add(listItem);
            }
        }
        private void LoadBrand()
        {
            var brand = data.Brands.ToList();
            foreach (var item in brand)
            {
                // Thêm Tên và ID tương ứng với Categories
                ListItem listItem = new ListItem(item.BrandName, item.BrandID.ToString());
                ddlBrand.Items.Add(listItem);
            }
        }

        private void LoadPage(int id)
        {
            var Product = data.Products.SingleOrDefault(p => p.ProductID == id);
            txtDetails.Text = Product.Details;
            txtDiscount.Text = Product.Discount.ToString();
            txtProductName.Text = Product.ProductName;
            txtPrice.Text = ((int)Product.Price).ToString();
            txtStockQuantity.Text = Product.StockQuantity.ToString();
            txtNameFile.Text = Product.Image; 
            // Sử dụng ClientScript để inject giá trị vào textarea

            addScript.Text = $"<script src=\"https://cdn.tiny.cloud/1/oeu3yhycyrj0lqa722zpeyqh5xj7r8imoh31ctunafgvtgmz/tinymce/7/tinymce.min.js\" referrerpolicy=\"origin\"></script>\r\n" +
             "<script>" +
             "tinymce.init({" +
             "    selector: '#tiny'," +
             "    plugins: 'advcode advtable autocorrect autolink checklist codesample editimage emoticons image link linkchecker lists media mediaembed powerpaste table tinymcespellchecker'," +
             "    toolbar: 'bold italic forecolor backcolor | numlist bullist | link image emoticons codesample blockquote '," +
             "    placeholder: 'Add a comment...'," +
             "    setup: (editor) => { " +
             "        editor.on('init', () => {" +
             $"            editor.setContent('{HttpUtility.JavaScriptStringEncode(Product.Description)}');" + // Chèn nội dung từ C#
             "        });" +
             "    }" +
             "});" +
             "</script>";

            ddlBrand.SelectedValue = Product.BrandID.ToString();
            ddlCategories.SelectedValue = Product.CategoryID.ToString();
        }


        private bool UpdateProducts(int id, string product_name, 
                                    string details, int discount, decimal price, 
                                    int stock_quantity, string description, int brand, int category, string image)
        {
            try
            {
                var product = data.Products.SingleOrDefault(p => p.ProductID == id);

                product.ProductName = product_name;
                product.Details = details;
                product.Discount = discount;
                product.Price = price;
                product.StockQuantity = stock_quantity;
                product.Description = description;
                product.BrandID = brand;
                product.CategoryID = category;
                product.Image = image;
                data.SubmitChanges();
                return true;
            } catch (Exception ex)
            {
                lblMessage.Text = "Lỗi : " + ex.Message;
                return false;
            }
        }
        private string UploadFileImage(string Upload)
        {
            string NameFile = Upload;
            string[] array = { ".jpg", ".png" };

            if (!string.IsNullOrWhiteSpace(NameFile) && FileImage.HasFiles)
            {
                if (FileImage.HasFiles)
                {
                    string tailFileUpload = Path.GetExtension(FileImage.FileName).ToLower(); // lấy đuôi file
                    if (array.Contains(tailFileUpload))
                    {
                        NameFile += tailFileUpload;
                        string path = Server.MapPath("~") + "Style/Images/" + NameFile;
                        FileImage.SaveAs(path);
                        txtNameFile.Visible = true;
                    }

                } else
                {
                    txtNameFile.Visible = false;
                }
            }
            return NameFile;
        }
        protected void btnUpdateProduct_Click(object sender, EventArgs e)
        {
            int discount = 0;
            if (string.IsNullOrWhiteSpace(txtPrice.Text) || string.IsNullOrWhiteSpace(txtDiscount.Text))
            {
                lblMessage.Text = "Vui lòng bạn nhập đầy đủ thông tin cần thiết!";
                return;
            }
            else
            {
                if (!int.TryParse(txtDiscount.Text, out discount))
                {
                    lblMessage.Text = "Giảm giá phải là một số hợp lệ!";
                    return;
                }
            }
            int id = int.Parse(Request.QueryString["id"]);
            string productname = txtProductName.Text;
            decimal price = decimal.Parse(txtPrice.Text);
            string ImageName = UploadFileImage(txtNameFile.Text);
            string Details = txtDetails.Text;
            string Description = Request.Unvalidated["content"];
            int IdCategories = int.Parse(ddlCategories.SelectedValue);
            int IdBrand = int.Parse(ddlBrand.SelectedValue);
            int quantity = int.Parse(txtStockQuantity.Text);
            if (string.IsNullOrWhiteSpace(productname)
               || string.IsNullOrWhiteSpace(Details) || string.IsNullOrWhiteSpace(Description))
            {
                lblMessage.Text = "Vui lòng bạn nhập đầy đủ thông tin cần thiết!";
                btnHomeProduct.Visible = false;
                return;
            }
            else
            {
                if (UpdateProducts(id, productname, Details, discount, price, quantity,
                    Description, IdBrand, IdCategories, ImageName))
                {
                    lblMessage.Text = "Dữ liệu đã được cập nhật";
                    btnHomeProduct.Visible = true;
                }
            }
            LoadPage(id);
        }

        protected void btnHomeProduct_Click(object sender, EventArgs e)
        {
            Response.Redirect("../HomeProduct.aspx");
        }
    }
}