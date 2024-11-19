<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Manager.Master" AutoEventWireup="true" CodeBehind="HomeCategories.aspx.cs" Inherits="ShopLapTop.Admin.ManagerCategories.HomeCategories" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
  
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
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
    <h1>Manager Categories</h1>
        <asp:TextBox ID="txtSearch" runat="server" placeholder="Nhập thông tin cần tìm..." CssClass="txtSearch"></asp:TextBox>
    <asp:Button ID="btnSearch" runat="server" Text="Tìm Kiếm" OnClick="btnSearch_Click" CssClass="btnSearch" />
    <asp:Button ID="btnLoad" runat="server" Text="Load" OnClick="btnLoad_Click" CssClass="btnSearch" />

<%--    <asp:Label ID="Label1" runat="server" Text="Search"></asp:Label>--%>
    <asp:Button ID="btnAddCategory" CssClass="btnAdd" runat="server" Text="Add Product" OnClick="btnAddCategory_Click" />
        <asp:Repeater ID="rptCategoriesList" runat="server">
        <HeaderTemplate>
            <table class="status-table">
                <thead>
                    <tr>
                        <th width="50px">Mã</th>
                        <th width="370px">Tên Loại Sản Phẩm</th>
                        <th width="250px">Trang Thái</th>
                        <th width="250px">Tổng Số Lượng Sản Phẩm</th>
                        <th width="250px">Chức Năng</th>
                    </tr>
                </thead>
                <tbody>
        </HeaderTemplate>
        <ItemTemplate>
            <tr>
                <td>
                    <%# Eval("CategoryID") %>

                </td>
                <td>
                    <%# Eval("CategoryName") %>
                </td>
                <td>
                    <%# LoadStatus(bool.Parse(Eval("Status").ToString())) %>
                </td>
                <td>
                    <%# TotalQuantityProductCategories(int.Parse(Eval("CategoryID").ToString())) %>
                </td>
                <td>
                    <asp:Button ID="btnUpdate" runat="server" CssClass="btnEdit" CommandArgument='<%# Eval("CategoryID") %>' OnClick="btnUpdate_Click" Text="Sửa" />
                    <asp:Button ID="btnDelete" runat="server" CssClass="btnDelete"  CommandArgument='<%# Eval("CategoryID") %>' OnClick="btnDelete_Click" Text="Xóa" />
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
                <a href="HomeProduct.aspx?categories=<%# Request.QueryString["product"] %>&page=<%# Container.DataItem %>"
                    class="pagination-link <%# Request.QueryString["page"] != null && Request.QueryString["page"] == Container.DataItem.ToString() ? "active" : "" %>">
                    <%# Container.DataItem %>
                 </a>
            </ItemTemplate>
        </asp:Repeater>
        <asp:Button ID="btnExel" CssClass="btnAdd" runat="server" Text="Xuất File Exel" OnClick="btnExel_Click" />

</asp:Content>
