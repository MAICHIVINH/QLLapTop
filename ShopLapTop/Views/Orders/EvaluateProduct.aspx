<%@ Page Title="" Language="C#" MasterPageFile="~/Index.Master" AutoEventWireup="true" CodeBehind="EvaluateProduct.aspx.cs" Inherits="ShopLapTop.Views.Orders.EvaluateProduct" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <h1>Đánh Giá Sản Phẩm</h1>
        <table class="product-list">
            <thead>
                <tr>
                    <th width="100px">Mã đơn hàng</th>
                    <th width="150px">Hình ảnh</th>
                    <th width="250px">Tên sản phẩm</th>
                    <th width="350px">Chi tiết</th>
                    <th width="130px">Giá</th>
                    <th width="100px">Số lượng</th>
                    <th width="250px">Tổng tiền</th>
                </tr>
            </thead>
            <tbody>

                <tr>
                    <td>
                        <asp:Label ID="lblOrderID" runat="server" Text=""></asp:Label>
                    </td>
                    <td style="text-align: center">
                        <asp:Image ID="IMAGE" runat="server"  />
                    </td>
                    <td style="text-align: justify">
                       <asp:Label ID="lblProductName" runat="server" Text=""></asp:Label>

                    </td>
                    <td style="text-align: justify">
                        <asp:Label ID="lblDetails" runat="server" Text=""></asp:Label>
                    </td>
                    <td style="text-align: center">
                        <asp:Label ID="lblPrice" runat="server" Text=""></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lblQuantity" runat="server" Text=""></asp:Label>
                    </td>
                    <td style="text-align: center">
                        <asp:Label ID="lblTotalAmount" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
            </tbody>
        </table>


        <asp:RadioButtonList ID="rbRating" runat="server" RepeatDirection="Horizontal">
            <asp:ListItem Text="⭐" Value="1"></asp:ListItem>
            <asp:ListItem Text="⭐⭐" Value="2"></asp:ListItem>
            <asp:ListItem Text="⭐⭐⭐" Value="3"></asp:ListItem>
            <asp:ListItem Text="⭐⭐⭐⭐" Value="4"></asp:ListItem>
            <asp:ListItem Text="⭐⭐⭐⭐⭐" Value="5"></asp:ListItem>
        </asp:RadioButtonList>
        <asp:Label ID="lblTest" runat="server" Text=""></asp:Label>
        <asp:Button ID="btnEvaluate" runat="server" Text="Đánh Giá" OnClick="btnEvaluate_Click" />
    </div>
</asp:Content>
