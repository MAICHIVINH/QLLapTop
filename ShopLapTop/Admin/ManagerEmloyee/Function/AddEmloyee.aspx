<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Manager.Master" AutoEventWireup="true" CodeBehind="AddEmloyee.aspx.cs" Inherits="ShopLapTop.Admin.ManagerEmloyee.AddEmloyee" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../../../Style/AddEmloyee.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="wapper">
        <div class="container">
            <h1>Thêm Nhân Viên</h1>
            <div class="form-group">
                <asp:TextBox ID="txtLastName" CssClass="form-control" Placeholder="Nhập họ" runat="server"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:TextBox ID="txtFirstName" CssClass="form-control" Placeholder="Nhập tên" runat="server"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:TextBox ID="txtPhone" TextMode="Number" CssClass="form-control" Placeholder="Nhập số điện thoại" runat="server"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:TextBox ID="txtEmail" TextMode="Email" CssClass="form-control" Placeholder="Nhập email" runat="server"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:TextBox ID="txtAddress" CssClass="form-control" Placeholder="Nhập địa chỉ" runat="server"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:TextBox ID="txtPassword" TextMode="Password" CssClass="form-control" Placeholder="Nhập mật khẩu" runat="server"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:TextBox ID="txtChangePassword" TextMode="Password" CssClass="form-control" Placeholder="Nhập lại mật khẩu" runat="server"></asp:TextBox>
            </div>
            <div>
                <asp:Label ID="lblRole" runat="server" Text="Quyền:"></asp:Label>
            </div>
            <div class="form-groups">
                <asp:Repeater ID="rptRole" runat="server">
                    <ItemTemplate>
                        <div class="roles">
                                <asp:CheckBox ID="cbRole" runat="server" Style=" display: flex; gap: 20px;" CssClass="role" Text='<%# Eval("RoleName") %>' Value='<%# Eval("RoleID") %>' />
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
            <br />
            <div>
                <asp:Label ID="lblMessage" runat="server" CssClass="lbl-Error" Text=""></asp:Label>
            </div>
            <br />
            <div>
                <asp:Button ID="btnAddEmloyee" runat="server" Text="Thêm" CssClass="btn-save" OnClick="btnAddEmloyee_Click" />
                <asp:Button ID="btnHomeEmloyee" runat="server" CssClass="btn-cancel" Text="Quay về" OnClick="btnHomeEmloyee_Click" />
            </div>

        </div>
    </div>
</asp:Content>
