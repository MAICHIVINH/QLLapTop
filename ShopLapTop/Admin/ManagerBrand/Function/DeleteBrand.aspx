<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Manager.Master" AutoEventWireup="true" CodeBehind="DeleteBrand.aspx.cs" Inherits="ShopLapTop.Admin.ManagerBrand.Function.DeleteBrand" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
                <h1>Xóa Loại Sản Phẩm</h1>
    <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
    <asp:Button ID="btnHomeBrand" runat="server" Text="Tro lai trang chu" OnClick="btnHomeBrand_Click" />

    <div class="input-group mb-3">
        <span class="input-group-text" id="inputGroup-sizing-default">Categories Name </span>
        <asp:TextBox ID="txtBrandName" CssClass="form-control" runat="server" ReadOnly="True"></asp:TextBox>
    </div>
    <div class="input-group">
        <asp:Label ID="lblStatus" runat="server" Text="Trạng Thái Dữ Liệu"></asp:Label><br />
        <asp:CheckBox ID="chkHidden" runat="server" CssClass="input-field" AutoPostBack="true" Text="Ẩn Dữ Liệu" Enabled="False" /><br />
        <asp:CheckBox ID="chkPresently" runat="server" CssClass="input-field" AutoPostBack="true" Text="Hiển Thị Dữ Liệu" Enabled="False" />
    </div>
        <asp:Button ID="btnDeleteBrand" runat="server" Text="Xóa" OnClientClick="return confirm('Bạn có chắc muốn xóa dữ liệu này không? nếu xóa thì các sản phẩm liên quan cũng sẽ được xóa')" OnClick="btnDeleteBrand_Click" />
</asp:Content>
