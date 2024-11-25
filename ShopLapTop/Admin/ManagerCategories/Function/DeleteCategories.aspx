<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Manager.Master" AutoEventWireup="true" CodeBehind="DeleteCategories.aspx.cs" Inherits="ShopLapTop.Admin.ManagerCategories.Function.DeleteCategories" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../../../Style/DeleteBrand.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="wapper">
        <div class="container">
            <h1>Xóa Loại Sản Phẩm</h1>
            <div class="form-group">
                <asp:Label ID="lblCategory" runat="server" Text="Tên nhóm snar phẩm:" class="label"> </asp:Label>
                <asp:TextBox ID="txtCategoriesName" CssClass="form-control" runat="server" ReadOnly="True"></asp:TextBox>
            </div>
            <div class="input-group">
                <asp:Label ID="lblStatus" runat="server" class="label" Text="Trạng Thái Dữ Liệu"></asp:Label><br />
                <asp:CheckBox ID="chkHidden" runat="server" CssClass="input" AutoPostBack="true" Style="display: flex; gap: 20px;" Text="Ẩn Dữ Liệu" Enabled="False" /><br />
                <br />
                <asp:CheckBox ID="chkPresently" runat="server" CssClass="input" AutoPostBack="true" Style="display: flex; gap: 20px;" Text="Hiển Thị Dữ Liệu" Enabled="False" />
            </div>
            <br />
            <div>
                <asp:Label ID="lblMessage" runat="server" CssClass="lbl-Error" Text=""></asp:Label>
            </div>
            <br />
            <div>
                <asp:Button ID="btnDeleteCategories" runat="server" CssClass="btn-delete" Text="Xóa" OnClientClick="return confirm('Bạn có chắc muốn xóa dữ liệu này không? nếu xóa thì các sản phẩm liên quan cũng sẽ được xóa')" OnClick="btnDeleteCategories_Click" />
                <asp:Button ID="btnHomeCategories" runat="server" CssClass="btn-cancel" Text="Quay về" OnClick="btnHomeCategories_Click" />
            </div>
        </div>
    </div>
</asp:Content>
