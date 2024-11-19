<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Manager.Master" AutoEventWireup="true" CodeBehind="UpdateProduct.aspx.cs" Inherits="ShopLapTop.Admin.ManagerProduct.Function.UpdateProduct" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <script src="https://cdn.tiny.cloud/1/1ltwngmor0as1pm1fyqud4iuiz9xu5p3es2xwfwtg7rh12zk/tinymce/7/tinymce.min.js" referrerpolicy="origin"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
 
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
    <style>
        .btnSave {
            margin: 20px 0;
            padding: 10px 15px;
            background-color: #5cb85c;
            border: 1px solid black;
            border-radius: 5px;
            color: white;
            cursor: pointer;
        }

            .btnSave:hover {
                background-color: #4cae4c;
            }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Update Product</h1>
    <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
    <asp:Button ID="btnHomeProduct" runat="server" Text="Tro lai trang chu" Visible="False" OnClick="btnHomeProduct_Click" />
    <div class="container">
        <div class="input-group mb-3">
            <span class="input-group-text" id="inputGroup-sizing-default">Product Name </span>
            <asp:TextBox ID="txtProductName" CssClass="form-control" runat="server"></asp:TextBox>
        </div>
        <div class="input-group mb-3">
            <span class="input-group-text" id="inputGroup-sizing-default">Price</span>
            <asp:TextBox ID="txtPrice" CssClass="form-control" TextMode="Number" runat="server" Text=""></asp:TextBox>
        </div>
        <div class="input-group mb-3">
            <span class="input-group-text" id="inputGroup-sizing-default">Details</span>
            <asp:TextBox ID="txtDetails" TextMode="MultiLine" CssClass="form-control" runat="server"></asp:TextBox>
        </div>
        <div class="input-group mb-3">
            <span class="input-group-text" id="inputGroup-sizing-default">Stock Quantity</span>
            <asp:TextBox ID="txtStockQuantity" TextMode="Number" CssClass="form-control" runat="server"></asp:TextBox>
        </div>

        <div class="input-group mb-3">
            <span class="input-group-text" id="inputGroup-sizing-default">File Image</span>
            <asp:TextBox ID="txtNameFile" Visible="true" CssClass="form-control" runat="server"></asp:TextBox>

            <asp:FileUpload ID="FileImage" CssClass="form-control" runat="server" />
        </div>

        <div class="input-group mb-3">
            <span class="input-group-text" id="inputGroup-sizing-default">Description</span>
            <div>
                <textarea id="tiny" name="content"></textarea>
            </div>
        </div>
        <div class="input-group mb-3">
            <span class="input-group-text" id="inputGroup-sizing-default">Categories</span>
            <asp:DropDownList ID="ddlCategories" CssClass="form-control" runat="server"></asp:DropDownList>
        </div>
        <div class="input-group mb-3">
            <span class="input-group-text" id="inputGroup-sizing-default">Brand</span>
            <asp:DropDownList ID="ddlBrand" CssClass="form-control" runat="server"></asp:DropDownList>
        </div>
        <div class="input-group mb-3">
            <span class="input-group-text" id="inputGroup-sizing-default">Discount</span>
            <asp:TextBox ID="txtDiscount" Text="0" TextMode="Number" CssClass="form-control" runat="server"></asp:TextBox>
        </div>
        <asp:Button ID="btnUpdateProduct" runat="server" Text="AddProduct" OnClick="btnUpdateProduct_Click" />
    </div>


    <asp:Literal ID="addScript" runat="server"></asp:Literal>
    <script>
        setup: (editor) => {
            editor.on('change', () => {
                editor.save(); // Đồng bộ nội dung về <textarea>
            });
        }

    </script>
</asp:Content>
