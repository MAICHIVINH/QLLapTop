<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Manager.Master" AutoEventWireup="true" CodeBehind="Manager2.aspx.cs" Inherits="ShopLapTop.Admin.Manager2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
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
    <h1>Main</h1>
    <asp:Repeater ID="rptOrderList" runat="server">
        <HeaderTemplate>
            <table class="status-table">
                <thead>
                    <tr>
                        <th>Mã Đơn Hàng</th>
                        <th>Ngày Đặt Hàng</th>
                        <th>Trạng Thái</th>
                        <th>Chức Năng</th>
                    </tr>
                </thead>
                <tbody>
        </HeaderTemplate>
        <ItemTemplate>
            <tr>
                <td><%# Eval("ProductID") %></td>
                <td><%# Eval("ProductName") %></td>
                <td><%# Eval("Price") %></td>
                <td>
                    <asp:Button ID="btnUpdate" runat="server" Text="Sửa" CssClass="btnEdit" />
                    <asp:Button ID="btnDelete" runat="server" Text="Xóa" CssClass="btnDelete" />
                </td>
            </tr>
        </ItemTemplate>
        <FooterTemplate>
            </tbody>
                    </table>
        </FooterTemplate>
    </asp:Repeater>
</asp:Content>
