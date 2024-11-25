<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Manager.Master" AutoEventWireup="true" CodeBehind="HomeCustomer.aspx.cs" Inherits="ShopLapTop.Admin.ManagerCustomer.HomeCustomer" %>
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
    <h1>Manager Customer</h1>
    <asp:TextBox ID="txtSearch" runat="server" placeholder="Nhập thông tin cần tìm..." CssClass="txtSearch"></asp:TextBox>
    <asp:Button ID="btnSearch" runat="server" Text="Tìm Kiếm" OnClick="btnSearch_Click" CssClass="btnSearch" />
<%--    <asp:Label ID="Label1" runat="server" Text="Search"></asp:Label>--%>
    <asp:Repeater ID="rptCustomerList" runat="server">
        <HeaderTemplate>
            <table class="status-table">
                <thead>
                    <tr>
                        <th width="130px">Mã Khách Hàng</th>
                        <th width="200px">Họ Tên Khách Hàng</th>
                        <th width="130px">Số Điện Thoại</th>
                        <th width="120px">Email</th>
                        <th width="150px">Địa Chỉ</th>
                        <th width="100px">Điểm</th>
                        <th width="150px">Trạng Thái</th>
                        <th width="150px">Chức Năng</th>
                    </tr>
                </thead>
                <tbody>
        </HeaderTemplate>
        <ItemTemplate>
            <tr>
                <td style="text-align: center">
                    <%# Eval("AccountID") %>

                </td>
                <td>
                    <%# Eval("FullName") %>
                </td>
               
                <td style="text-align: center">
                    <%# Eval("PhoneNumber") %>

                </td>
                 <td>
                    <%# Eval("Email")%>
                </td>
                <td style="text-align: center">
                    <%# Eval("Address")%>
                </td>
                 <td>
                     <%# Eval("Points")%>
                 </td>
                 <td>
                     <%# LoadStatus(bool.Parse(Eval("Status").ToString())) %>
                 </td>

                <td style="text-align: center">
                    <asp:Button ID="btnUpdate" runat="server" CssClass="btnEdit" CommandArgument='<%# Eval("AccountID") %>' OnClick="btnUpdate_Click" Text="Sửa" />
                    <asp:Button ID="btnDelete" runat="server" CssClass="btnDelete"  CommandArgument='<%# Eval("AccountID") %>' OnClick="btnDelete_Click" Text="Xóa" />
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
                <a href="HomeProduct.aspx?product=<%# txtSearch.Text %>&page=<%# Container.DataItem %>"
                    class="pagination-link <%# Request.QueryString["page"] != null && Request.QueryString["page"] == Container.DataItem.ToString() ? "active" : "" %>">
                    <%# Container.DataItem %>
                 </a>
            </ItemTemplate>
        </asp:Repeater>
</asp:Content>
