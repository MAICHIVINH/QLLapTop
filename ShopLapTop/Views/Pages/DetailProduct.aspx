﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Index.Master"  AutoEventWireup="true" CodeBehind="DetailProduct.aspx.cs" Inherits="ShopLapTop.Views.Pages.DetailProduct" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../../Style/DetailProduct.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="Container">
        <div class="Detail">
            <div class="image">
                <asp:Label ID="lblImage" runat="server" Visible="false"></asp:Label>
                <asp:Image ID="ImageMain" runat="server" CssClass="product-img" />
                <div class="imagebottom">
                    <div class="imagebottom">
                        <asp:Repeater ID="ChooseImage" runat="server" OnItemCommand="ChooseImage_ItemCommand">
                            <ItemTemplate>
                                <asp:ImageButton
                                    ID="imgThumbnails"
                                    CssClass="imagebottom-img"
                                    runat="server"
                                    CommandArgument='<%# Eval("ImagePath") %>'
                                    ImageUrl='<%# "~/Style/Images/" + Eval("ImagePath") %>'
                                    CommandName="ChangeImage" />
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </div>
            </div>
            <div class="info">
                <h1>
                    <asp:Label ID="lblTenSanPham" runat="server" Text="" /></h1>
                <p class="Price">
                    Giá: 
                    <asp:Label ID="lblGia" runat="server" Text="" />
                    đ
                </p>
                <p class="Description">
                    <asp:Label ID="lblChiTiet" runat="server" Text="" />
                </p>
                <div class="action">
                    <div class="quantity">
                        <asp:TextBox ID="txtquantity" runat="server" TextMode="Number" min="1" max="100" value="1" CssClass="txtquantity" />
                    </div>
                    <asp:Button ID="btnAddToCart" runat="server" Text="ADD TO CART" CssClass="addcart" OnClick="btnAddToCart_Click" />
                </div>
                <div class="share">
                    <label>Share on:</label>
                    <a href="https://www.facebook.com" target="_blank"><i class="fab fa-facebook-f"></i></a>
                    <a href="https://www.twitter.com" target="_blank"><i class="fab fa-twitter"></i></a>
                    <a href="https://www.instagram.com" target="_blank"><i class="fab fa-instagram"></i></a>
                    <a href="https://www.google.com" target="_blank"><i class="fab fa-google"></i></a>
                </div>
            </div>
        </div>
        <div class="content">
            <h2>Mô tả</h2>
            <p>
                <asp:Label ID="lblThongTin" runat="server" />
            </p>
        </div>
        <div class="related-products">
            <h2>Related Products</h2>
            <div class="item">
                <asp:Repeater ID="RelatedRepeater" runat="server" OnItemCommand="RelatedRepeater_ItemCommand">
                    <ItemTemplate>
                        <div class="relatedimage">
                            <asp:Image ID="RelatedProductImage" CssClass="img" runat="server" ImageUrl='<%# "~/Style/Images/" + Eval("Image")%>' AlternateText="Laptop" />
                            <div class="relatedproduct">
                                <asp:HyperLink ID="name" runat="server" class="relatedname" Text='<%# Eval("ProductName") %>' NavigateUrl='<%# "DetailProduct.aspx?idp=" + Eval("ProductID") %>'></asp:HyperLink>
                                <p class="relatedprice"><%# Eval("Price"," {0:N0}đ") %></p>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
    </div>
</asp:Content>