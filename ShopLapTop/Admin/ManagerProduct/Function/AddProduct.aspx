<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Manager.Master" AutoEventWireup="true" CodeBehind="AddProduct.aspx.cs" Inherits="ShopLapTop.Admin.ManagerProduct.Function.AddProduct" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="https://cdn.tiny.cloud/1/1ltwngmor0as1pm1fyqud4iuiz9xu5p3es2xwfwtg7rh12zk/tinymce/7/tinymce.min.js" referrerpolicy="origin"></script>
    <link href="../../../Style/AddProduct.css" rel="stylesheet" />
 <script>
     tinymce.init({
         selector: '#tiny',
         plugins: [
             'a11ychecker', 'advlist', 'advcode', 'advtable', 'autolink', 'checklist', 'markdown',
             'lists', 'link', 'image', 'charmap', 'preview', 'anchor', 'searchreplace', 'visualblocks',
             'powerpaste', 'fullscreen', 'formatpainter', 'insertdatetime', 'media', 'table', 'help', 'wordcount'
         ],
         toolbar: 'undo redo | a11ycheck casechange blocks | bold italic backcolor | alignleft aligncenter alignright alignjustify |' +
             'bullist numlist checklist outdent indent | removeformat | code table help'
     });
 </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="wapper">
        <div class="container">
            <h1>Thêm Sản Phẩm</h1>
            <div class="form-group">
                <asp:TextBox ID="txtProductName" CssClass="form-control" Placeholder="Nhập tên sản phẩm" runat="server"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Label ID="lblPrice" runat="server" Text="Giá:" class="label"></asp:Label>
                <asp:TextBox ID="txtPrice" CssClass="form-control" TextMode="Number" runat="server" Text="0"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Label ID="lblFileName" runat="server" Text="Tên hình ảnh:" class="label"></asp:Label>
                <asp:TextBox ID="txtNameFile" CssClass="form-control" runat="server"></asp:TextBox>

                <asp:FileUpload ID="FileImage" CssClass="form-control" runat="server" />
            </div>
            <div class="form-group">
                <asp:Label ID="lblImageDetail" runat="server" Text="Hình ảnh chi tiết:" class="label"></asp:Label>
                <asp:FileUpload ID="FileImagePermistion" CssClass="form-control" AllowMultiple="true" runat="server" />
            </div>
            <div class="form-group">
                <asp:Label ID="lblDetail" runat="server" Text="Chi tiết:" class="label"></asp:Label>
                <asp:TextBox ID="txtDetails" TextMode="MultiLine" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:TextBox ID="txtStockQuantity" TextMode="Number" Placeholder="Nhập số lượng sản phẩm" CssClass="form-control" runat="server"></asp:TextBox>
            </div>

            <div class="form-group">
                <asp:Label ID="lblDescription" runat="server" Text="Mô tả sản phẩm:" class="label">Description</asp:Label>
                <div>
                    <textarea id="tiny" CssClass="form-control" name="content"></textarea>
                </div>
            </div>
            <div class="form-group">
                <asp:Label ID="lblCategory" runat="server" Text="Nhóm sản phẩm:" class="label"></asp:Label>
                <asp:DropDownList ID="ddlCategories" CssClass="form-control" runat="server"></asp:DropDownList>
            </div>
            <div class="form-group">
                <asp:Label ID="lblBrand" runat="server" Text="Thương hiệu:" class="label"></asp:Label>
                <asp:DropDownList ID="ddlBrand" CssClass="form-control" runat="server"></asp:DropDownList>
            </div>
            <div class="form-group">
                <asp:Label ID="lblDiscount" runat="server" Text="Giảm giá:" class="label"></asp:Label>
                <asp:TextBox ID="txtDiscount" Text="0" TextMode="Number" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
            <br />
            <div>
                <asp:Label ID="lblMessage" CssClass="lbl-Error" runat="server" Text=""></asp:Label>
            </div>
            <br />
            <div>
                <asp:Button ID="btnAddProduct" runat="server" CssClass="btn-save" Text="Thêm" OnClick="btnAddProduct_Click" />
                <asp:Button ID="btnHomeProduct" runat="server" CssClass="btn-cancel" Text="Quay về" OnClick="btnHomeProduct_Click" Visible="False" />
            </div>
            
        </div>
    </div>
</asp:Content>
