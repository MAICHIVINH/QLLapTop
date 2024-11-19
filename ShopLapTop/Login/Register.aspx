<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="ShopLapTop.Login.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="../Style/Register.css" rel="stylesheet" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="illustration-section">
                <asp:Image ID="IllustrationImage" runat="server" ImageUrl="~/Image/logoVill.png" AlternateText="Illustration" />
            </div>
            <div class="form-section">
                <h2>Sign up</h2>
                <%--                Tên Người Dùng--%>
                <div class="input-group">
                    <div class="input-wrapper">
                        <label for="name"><i class="fas fa-user"></i></label>
                        <asp:TextBox ID="txtYourName" runat="server" CssClass="input-field" placeholder="Your Name" />
                    </div>
                </div>
                <%--                Email đăng nhập --%>
                <div class="input-group">
                    <div class="input-wrapper">
                        <label for="email"><i class="fas fa-envelope"></i></label>
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="input-field" TextMode="Email" placeholder="Your Email" />
                    </div>
                </div>
                <%--                    Số Điện thoại--%>
                <div class="input-group">
                    <div class="input-wrapper">
                        <label for="email"><i class="fa-solid fa-phone"></i></label>
                        <asp:TextBox ID="txtPhone" runat="server" CssClass="input-field" TextMode="Phone" placeholder="Số Điện Thoại" />
                    </div>
                </div>
                 <%--                Gioi tinh--%>
                <div class="input-group">
                    <asp:Label ID="lblGender" runat="server" Text="Giới tính:"></asp:Label>
                        <asp:checkbox ID="chkHis" runat="server" CssClass="input-field" text="Nam" />
                        <asp:checkbox ID="chkHer" runat="server" CssClass="input-field" text="Nữ" />
                </div>
                <%--                Địa chỉ nhà--%>
                <div class="input-group">
                    <div class="input-wrapper">
                        <label for="email"><i class="fa-solid fa-house"></i></label>
                        <asp:TextBox ID="txtAddress" runat="server" CssClass="input-field" placeholder="Địa chỉ nhà" />
                    </div>
                </div>
                <%--                Thành phố--%>
                <div class="input-group">
                    <div class="input-wrapper">
                        <label for="email"><i class="fa-solid fa-city"></i></label>
                        <asp:TextBox ID="txtCity" runat="server" CssClass="input-field" placeholder="Tỉnh/Thành Phố Bạn Sinh Sống" />
                    </div>
                </div>
                <%--                Mặt Khẩu đăng nhập--%>
                <div class="input-group">
                    <div class="input-wrapper">
                        <label for="password"><i class="fas fa-lock"></i></label>
                        <asp:TextBox ID="txtPassword" runat="server" CssClass="input-field" TextMode="Password" placeholder="Password" />
                    </div>
                </div>

                <div class="input-group">
                    <div class="input-wrapper">
                        <label for="confirm-password"><i class="fas fa-key"></i></label>
                        <asp:TextBox ID="txtConfirmPassword" runat="server" CssClass="input-field" TextMode="Password" placeholder="Repeat your password" />
                    </div>
                </div>

                <div class="terms">
                    <asp:CheckBox ID="ChkTerms" runat="server" />
                    <label for="terms">I agree all statements in <a href="#">Terms of service</a></label>
                </div>

                <asp:Button ID="btnRegister" runat="server" Text="REGISTER" CssClass="register-btn" OnClick="btnRegister_Click" />

                <asp:Literal ID="lblError" runat="server"></asp:Literal>

                <p>Have already an account? <a href="Login.aspx">Login here</a></p>
            </div>
            </div>
    </form>
</body>
</html>
