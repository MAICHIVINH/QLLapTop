<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Logins.aspx.cs" Inherits="ShopLapTop.Login.Logins" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" />
    <link href="../Style/Logins.css" rel="stylesheet" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="image">
                <asp:Image ID="Image" runat="server" ImageUrl="~/Style/Images/ảnh công nghệ số.png" AlternateText="Image" />
            </div>
            <div class="login-form">
                <h2>Đăng Nhập</h2>
                <asp:Panel ID="LoginForm" runat="server">
                    <asp:Label ID="lblUsername" runat="server" AssociatedControlID="txtEmail" Text="Tài khoản"></asp:Label>
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="input" placeholder="Nhập tài khoản" />

                    <asp:Label ID="lblPassword" runat="server" AssociatedControlID="txtPassword" Text="Mật khẩu"></asp:Label>
                    <asp:TextBox ID="txtPassword" runat="server" CssClass="input" TextMode="Password" placeholder="Nhập mật khẩu" />

                    <div class="links">
                        <a href="Register.aspx">Đăng ký tài khoản</a> |
                    <a href="ForgotPassword.aspx">Quên mật khẩu?</a>
                    </div>
                    <asp:Button ID="btnLogin" runat="server" Text="Đăng Nhập" CssClass="submit" OnClick="btnLogin_Click" />
                    <br />
                    <br />
                    <asp:Label ID="lblError" runat="server"></asp:Label>
                </asp:Panel>
            </div>
        </div>
    </form>
</body>
</html>
