<%@ Page Title="" Language="C#" MasterPageFile="../../Manager.Master" AutoEventWireup="true" CodeBehind="UpdateCategories.aspx.cs" Inherits="ShopLapTop.Admin.ManagerCategories.Function.UpdateCategories" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Thêm Loại Sản Phẩm</h1>
    <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
    <asp:Button ID="btnHomeCategories" runat="server" Text="Tro lai trang chu" OnClick="btnHomeCategories_Click" />

    <div class="input-group mb-3">
        <span class="input-group-text" id="inputGroup-sizing-default">Categories Name </span>
        <asp:TextBox ID="txtCategoriesName" CssClass="form-control" runat="server"></asp:TextBox>
    </div>
    <div class="input-group">
        <asp:Label ID="lblStatus" runat="server" Text="Trạng Thái Dữ Liệu"></asp:Label><br />
        <asp:CheckBox ID="chkHidden" runat="server" CssClass="input-field" AutoPostBack="true" Text="Ẩn Dữ Liệu" OnCheckedChanged="chkHidden_CheckedChanged" /><br />
        <asp:CheckBox ID="chkPresently" runat="server" CssClass="input-field" AutoPostBack="true" Text="Hiển Thị Dữ Liệu" OnCheckedChanged="chkPresently_CheckedChanged" />
    </div>

    <asp:Button ID="btnUpdateCategories" runat="server" Text="Thêm " OnClick="btnUpdateCategories_Click" />

</asp:Content>
