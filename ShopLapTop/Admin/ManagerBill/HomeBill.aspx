<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Manager.Master" AutoEventWireup="true" CodeBehind="HomeBill.aspx.cs" Inherits="ShopLapTop.Admin.ManagerBill.HomeBill" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Manager Bill</h1>
        <asp:TextBox ID="txtSearch" runat="server" placeholder="Nhập thông tin cần tìm..." CssClass="txtSearch"></asp:TextBox>
    <asp:Button ID="btnSearch" runat="server" Text="Tìm Kiếm" CssClass="btnSearch" />
    <asp:Button ID="btnLoad" runat="server" Text="Load" CssClass="btnSearch" />

<%--    <asp:Label ID="Label1" runat="server" Text="Search"></asp:Label>--%>
    <asp:Button ID="btnAddCategory" CssClass="btnAdd" runat="server" Text="Add Product" />
        <asp:Repeater ID="rptOrderList" runat="server">
        <HeaderTemplate>
            <table class="status-table">
                <thead>
                    <tr>
                        <th width="50px">Mã</th>
                        <th width="370px">Tên Người Dùng</th>
                        <th width="250px">Địa Chỉ</th>
                        <th width="150px">Ngày Đặt</th>
                         <th width="150px">Số Điện Thoại</th>
                        <th width="250px">Tổng Tiền</th>
                        <th width="150px">Ghi Chú</th>
                         <th width="150px">Trang Thái</th>
                         <th width="150px">Chức Năng</th>


                    </tr>
                </thead>
                <tbody>
        </HeaderTemplate>
        <ItemTemplate>
            <tr>
                <td>
                    <%# Eval("OrderID") %>

                </td>
                <td>
                    <%# Eval("FullName") %>
                </td>
                <td>
                    <%# Eval("Address") %>
                </td>
                 <td>
                    <%# Eval("OrderTime") %>
                </td>
                 <td>
                    <%# Eval("PhoneNumber") %>
                </td>
                <td>
                    <%# Eval("TotalAmount", "{0:N0}đ") %>
                </td>
                <td>
                    <%# Eval("Note") %>
                </td>
                <td>
                    <%# LoadStatus(int.Parse(Eval("Status").ToString())) %>
                </td>
                <td>
                    <asp:Button ID="btnUpdate" runat="server" Text="Sửa" CssClass="btnEdit" CommandArgument='<%# Eval("OrderID") %>' />
                    <asp:Button ID="btnDelete" runat="server" Text="Xóa" CssClass="btnDelete"  CommandArgument='<%# Eval("OrderID") %>' />
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

</asp:Content>
