<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Manager.Master" AutoEventWireup="true" CodeBehind="HomeProduct.aspx.cs" Inherits="ShopLapTop.Admin.ManagerProduct.HomeProduct" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .img {
            width: 100px;
        }

        .txtSearch {
            padding: 8px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 4px;
            width: 200px;
        }

        .btnSearch {
            margin-left: 10px;
            padding: 8px 12px;
            background-color: #5cb85c;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .btnAdd {
            margin-left: 10px;
            padding: 8px 12px;
            background-color: #5cb85c;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            float: right;
        }

        h1 {
            margin: 10px 0;
            font-size: 35px;
            color: hotpink;
            text-align: center;
        }

        .btnEdit {
            margin-left: 10px;
            padding: 8px 12px;
            background-color: #5cb85c;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .btnDelete {
            margin-left: 10px;
            padding: 8px 12px;
            background-color: #f80000;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Quản lý sản phẩm</h1>
    <asp:TextBox ID="txtSearch" runat="server" placeholder="Nhập thông tin cần tìm..." CssClass="txtSearch"></asp:TextBox>
    <asp:Button ID="btnSearch" runat="server" Text="Tìm Kiếm" OnClick="btnSearch_Click" CssClass="btnSearch" />
<%--    <asp:Label ID="Label1" runat="server" Text="Search"></asp:Label>--%>
    <asp:Button ID="Button1" CssClass="btnAdd" runat="server" Text="Add Product" OnClick="btnAddProduct_Click" />
    <asp:Repeater ID="rptOrderList" runat="server">
        <HeaderTemplate>
            <table class="status-table">
                <thead>
                    <tr>
                        <th width="50px">Mã</th>
                        <th width="100px">Hình Ảnh</th>
                        <th width="300px">Tên Sản Phẩm</th>
                        <th width="120px" text-align="center">Giá</th>
                        <th width="250px">Chi tiết</th>
<%--                        <th width="300px">Mô tả</th>--%>
                        <th width="110px">Nhóm</th>
                        <th width="130px">Thương hiệu</th>
                        <th width="150px">Chức Năng</th>
                    </tr>
                </thead>
                <tbody>
        </HeaderTemplate>
        <ItemTemplate>
            <tr>
                <td>
                    <%# Eval("ProductID") %>

                </td>
                 <td>
                    <asp:Image ID="Image1" CssClass="img" ImageUrl='<%# "~/Style/Images/" + Eval("Image") %>' runat="server" />
                </td>
                <td>
                    <%# Eval("ProductName") %>
                </td>
               
                <td>
                    <%# Eval("Price") %>

                </td>
                 <td>
                    <%# Eval("Details").ToString().Trim().Replace("\n", "<br />") %>

                </td>
<%--                <td>
                    <%# Eval("Description") %>
                </td>--%>
                 <td>
                        <asp:Label ID="lblCategory" runat="server" Text='<%# category(Convert.ToInt32(Eval("CategoryID"))) %>'></asp:Label>

                </td>
                <td>
                        <asp:Label ID="lblBrand" runat="server" Text='<%# brand(Convert.ToInt32(Eval("BrandID"))) %>'></asp:Label>

                </td>
                <td>
                    <asp:Button ID="btnUpdate" runat="server" CssClass="btnEdit" CommandArgument='<%# Eval("ProductID") %>' OnClick="btnUpdate_Click" Text="Sửa" />
                    <asp:Button ID="btnDelete" runat="server" CssClass="btnDelete"  CommandArgument='<%# Eval("ProductID") %>' OnClick="btnDelete_Click1" Text="Xóa" />
                </td>
            </tr>
        </ItemTemplate>
        <FooterTemplate>
            </tbody>
                    </table>
               
        </FooterTemplate>
    </asp:Repeater>
    <br />
    <br />
    <asp:Repeater ID="RepeaterPagination" runat="server">
            <ItemTemplate>
                <a href="HomeProduct.aspx?product=<%# Request.QueryString["product"] %>&page=<%# Container.DataItem %>"
                    class="pagination-link <%# Request.QueryString["page"] != null && Request.QueryString["page"] == Container.DataItem.ToString() ? "active" : "" %>">
                    <%# Container.DataItem %>
                 </a>
            </ItemTemplate>
        </asp:Repeater>
</asp:Content>
