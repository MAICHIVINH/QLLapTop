<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Manager.Master" AutoEventWireup="true" CodeBehind="UpdateBrand.aspx.cs" Inherits="ShopLapTop.Admin.ManagerBrand.Function.UpdateBrand" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <h1>Cập Nhật Thương Hiệu Sản Phẩm</h1>
    <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
    <asp:Button ID="btnHomeBrand" runat="server" Text="Tro lai trang chu" OnClick="btnHomeBrand_Click" />

    <div class="input-group mb-3">
        <span class="input-group-text" id="inputGroup-sizing-default">Categories Name </span>
        <asp:TextBox ID="txtBrandName" CssClass="form-control" runat="server"></asp:TextBox>
    </div>
    <div class="input-group">
        <asp:Label ID="lblStatus" runat="server" Text="Trạng Thái Dữ Liệu"></asp:Label><br />
        <asp:CheckBox ID="chkHidden" runat="server" CssClass="input-field" AutoPostBack="true" Text="Ẩn Dữ Liệu" OnCheckedChanged="chkHidden_CheckedChanged" /><br />
        <asp:CheckBox ID="chkPresently" runat="server" CssClass="input-field" AutoPostBack="true" Text="Hiển Thị Dữ Liệu" OnCheckedChanged="chkPresently_CheckedChanged" />
    </div>

    <asp:Button ID="btnUpdateBrand" runat="server" Text="Thêm " OnClick="btnUpdateBrand_Click" />

</asp:Content>
