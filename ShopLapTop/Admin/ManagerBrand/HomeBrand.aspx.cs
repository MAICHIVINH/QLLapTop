﻿using OfficeOpenXml;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShopLapTop.Admin.ManagerBrand
{
    public partial class HomeBrand : System.Web.UI.Page
    {
        ShopDataContext data = new ShopDataContext();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int page = 1;
                if (Request.QueryString["page"] != null)
                {
                    int.TryParse(Request.QueryString["page"], out page);
                }
                LoadAllBrands(page);
            }
        }

        protected void btnAddBrand_Click(object sender, EventArgs e)
        {
            Response.Redirect("./Function/AddBrand.aspx");
        }

        public string LoadStatus(bool status)
        {
            if (status == true)
            {
                return "Dữ Liệu Đang Hiển Thị";
            }
            else
            {
                return "Dữ Liệu Đang Ẩn";
            }
        }

        public int TotalQuantityProductBrands(int BrandId)
        {
            var CountBrand = data.Products.Where(p => p.BrandID == BrandId).Count();
            return CountBrand;
        }

        private void LoadAllBrands(int page)
        {
            var brand = data.Brands.ToList();
            // Lấy tổng số sản phẩm
            int totalProducts = brand.Count();
            //số trang muốn hiển thị
            int PageSize = 5;
            // Tính toán số trang và làm tròn
            int totalPages = (int)Math.Ceiling((double)totalProducts / PageSize);

            // Truy vấn sản phẩm theo thứ tự ID giảm dần và phân trang
            var brands = brand.OrderByDescending(p => p.BrandID).Skip((page - 1) * PageSize).Take(PageSize).ToList();

            // Gán sản phẩm vào Repeater
            rptBrandsList.DataSource = brand;
            rptBrandsList.DataBind();

            // Gán số trang vào phần phân trang
            List<int> pages = new List<int>();
            for (int i = 1; i <= totalPages; i++)
            {
                pages.Add(i);
            }
            RepeaterPagination.DataSource = pages;
            RepeaterPagination.DataBind();
        }


        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            Button button = (Button)sender;
            int id = int.Parse(button.CommandArgument);
            Response.Redirect("./Function/UpdateBrand.aspx?id=" + id);
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            Button button = (Button)sender;
            int id = int.Parse(button.CommandArgument);
            Response.Redirect("./Function/DeleteBrand.aspx?id=" + id);
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string NameSearch = txtSearch.Text;
            var ProductSearch = data.ProductCategories.Where(p => p.CategoryName.Contains(NameSearch) || p.CategoryID.ToString().Contains(NameSearch))
                .OrderByDescending(p => p.CategoryID).ToList();
            rptBrandsList.DataSource = ProductSearch;
            rptBrandsList.DataBind();
        }
                protected void btnExel_Click(object sender, EventArgs e)
        {
            try
            {
                ExcelPackage.LicenseContext = LicenseContext.NonCommercial;
                var pages = data.ProductCategories.OrderByDescending(p => p.CategoryID).ToList();

                using (ExcelPackage excel = new ExcelPackage())
                {
                    var sheet = excel.Workbook.Worksheets.Add("Sheet1");

                    // Thêm tiêu đề cột
                    sheet.Cells[1, 1].Value = "Mã Loại Sản Phẩm";
                    sheet.Cells[1, 2].Value = "Tên Loại Sản Phẩm";
                    sheet.Cells[1, 3].Value = "Trạng Thái";
                    sheet.Cells[1, 4].Value = "Tổng Số Lượng Sản Phẩm";

                    int row = 2;
                    foreach (var item in pages)
                    {
                        sheet.Cells[row, 1].Value = item.CategoryID;
                        sheet.Cells[row, 2].Value = item.CategoryName;
                        sheet.Cells[row, 3].Value = LoadStatus(bool.Parse(item.Status.ToString()));
                        sheet.Cells[row, 4].Value = TotalQuantityProductBrands(item.CategoryID);
                        row++;
                    }

                    // Tự động điều chỉnh độ rộng các cột
                    sheet.Cells[sheet.Dimension.Address].AutoFitColumns();

                    // Cấu hình phản hồi và tải file Excel
                    Response.Clear();
                    Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
                    Response.AddHeader("Content-Disposition", "attachment; filename=ExportedData.xlsx");
                    Response.BinaryWrite(excel.GetAsByteArray());
                    Response.End();
                }
            }
            catch (Exception ex)
            {
                // Hiển thị thông báo lỗi nếu có
                Response.Write($"<script>alert('Đã xảy ra lỗi: {ex.Message}');</script>");
            }

        }

        protected void btnLoad_Click(object sender, EventArgs e)
        {
            LoadAllBrands(0);
        }
    }
}