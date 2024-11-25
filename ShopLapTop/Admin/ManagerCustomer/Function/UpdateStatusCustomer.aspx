<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Manager.Master" AutoEventWireup="true" CodeBehind="UpdateStatusCustomer.aspx.cs" Inherits="ShopLapTop.Admin.ManagerCustomer.Function.UpdateStatusCustomer" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../../../Style/UpdateStatusCustomer.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="wapper">
        <div class="container">
            <h1>Cập nhật trạng thái Khách Hàng</h1>
            <div class="form-group">
                <asp:Label ID="lblCategory" runat="server" Text="Mã Khách Hàng" class="label"></asp:Label>
                <asp:TextBox ID="txtAccountId" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Label ID="Label1" runat="server" Text="Tên Khách Hàng" class="label"></asp:Label>
                <asp:TextBox ID="txtNameCustomer" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Label ID="lblStatus" runat="server" class="label" Text="Trạng Thái Khách Hàng"></asp:Label><br />
                <asp:CheckBox ID="chkHidden" runat="server" CssClass="input" AutoPostBack="true" Style="display: flex; gap: 20px;" Text="Mở Khách Hàng" OnCheckedChanged="chkHidden_CheckedChanged" /><br />
                <asp:CheckBox ID="chkPresently" runat="server" CssClass="input" AutoPostBack="true" Style="display: flex; gap: 20px;" Text="Khóa Khách Hàng" OnCheckedChanged="chkPresently_CheckedChanged" />
            </div>
            <br />
            <div>
                <asp:Label ID="lblMessage" runat="server" CssClass="lbl-Error" Text=""></asp:Label>
            </div>
            <br />
            <div>
                <asp:Button ID="btnUpdateSatus" runat="server" OnClientClick="return confirm('Bạn muốn thay đổi trạng thái của tài khoản này không?')" CssClass="btn-save" Text="Cập nhật" OnClick="btnUpdateSatus_Click" />
                <asp:Button ID="btnHomeCustomer" runat="server" CssClass="btn-cancel" Text="Quay về" OnClick="btnHomeCustomer_Click" />
            </div>
        </div>
    </div>

</asp:Content>
