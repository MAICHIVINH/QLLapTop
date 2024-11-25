<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Manager.Master" AutoEventWireup="true" CodeBehind="UpdateStatusOrder.aspx.cs" Inherits="ShopLapTop.Admin.ManagerBill.UpdateStatusOrder" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../../../Style/UpdateStatusOrder.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="wapper">
        <div class="form-container">
            <div class="form-group">
                <span class="input-group-text" >Mã đơn hàng:</span>
                <asp:TextBox ID="txtOrderID" Enabled="False" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
            <div class="form-group">
                <span class="input-group-text" >Họ tên khách hàng: </span>
                <asp:TextBox ID="txtFullName" Enabled="False" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
            <div class="form-group">
                <span class="input-group-text" >Địa chỉ:</span>
                <asp:TextBox ID="txtAddress" Enabled="False" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
            <div class="form-group">
                <span class="input-group-text" >Số điện thoại:</span>
                <asp:TextBox ID="txtPhone" Enabled="False" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
            <div class="form-group">
                <span class="input-group-text" >Ghi chú: </span>
                <asp:TextBox ID="txtNote" Enabled="False" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
            <div class="form-group">
                <span class="input-group-text">Trạng thái:</span>
                <asp:TextBox ID="txtStatus" Enabled="False" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
            <asp:Button ID="btnUpdateStatus" runat="server" CssClass="btn-update" Text="Cập nhật" OnClick="btnUpdateStatus_Click" />
            <asp:Label ID="lblMessage" runat="server" CssClass="lbl-Error" Text=""></asp:Label>
        </div>
    </div>
</asp:Content>
