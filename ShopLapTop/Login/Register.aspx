<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="ShopLapTop.Login.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="../Style/Register.css" rel="stylesheet" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server" style="position: fixed;">
        <div class="container">
            <div class="images">
                <asp:Image ID="img" runat="server" ImageUrl="../Style/Images/resignter.png" AlternateText="Illustration" />
            </div>
            <div class="form">
                <h1>Tạo tài khoản mới</h1>
                <%--                Tên Người Dùng--%>
                <div class="group">
                    <div class="wrapper">
                        <asp:TextBox ID="txtYourName" runat="server" CssClass="input-field" placeholder="Nhập tên" />
                    </div>
                </div>
                <%--                Email đăng nhập --%>
                <div class="group">
                    <div class="wrapper">
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="input-field" TextMode="Email" placeholder="Nhập email" />
                    </div>
                </div>
                <%--                    Số Điện thoại--%>
                <div class="group">
                    <div class="wrapper">
                        <asp:TextBox ID="txtPhone" runat="server" CssClass="input-field" TextMode="Phone" placeholder="Số Điện Thoại" />
                    </div>
                </div>
                <%--                Gioi tinh--%>
                <div class="group">
                    <%--<asp:Label ID="lblGender" runat="server" Text="Giới tính:"></asp:Label>--%>
                    <asp:CheckBox ID="chkHis" runat="server" CssClass="input-field" Text="Nam" />
                    <asp:CheckBox ID="chkHer" runat="server" CssClass="input-field" Text="Nữ" />
                </div>
                <%--                Địa chỉ nhà--%>
                <div class="group">
                    <div class="wrapper">
                        <asp:TextBox ID="txtAddress" runat="server" CssClass="input-field" placeholder="Nhập địa chỉ" />
                    </div>
                </div>
                <%--                Thành phố--%>
                <div class="group">
                    <div class="wrapper">
                        <asp:TextBox ID="txtCity" runat="server" CssClass="input-field" placeholder="Tỉnh/Thành Phố bạn sinh sống" />
                    </div>
                </div>
                <%--                Mặt Khẩu đăng nhập--%>
                <div class="group">
                    <div class="wrapper">
                        <asp:TextBox ID="txtPassword" runat="server" CssClass="input-field" TextMode="Password" placeholder="Nhập mật khẩu" />
                    </div>
                </div>

                <div class="group">
                    <div class="wrapper">
                        <asp:TextBox ID="txtConfirmPassword" runat="server" CssClass="input-field" TextMode="Password" placeholder="Nhập lại mật khẩu" />
                    </div>
                </div>

                <div class="terms">
                    <asp:CheckBox ID="ChkTerms" runat="server" />
                    <asp:Label ID="lblClause" runat="server" Text="Tôi đồng ý tất cả các tuyên bố trong"></asp:Label>
                        <a href="#" style="text-decoration: none; font-style: italic;">Điều khoản dịch vụ</a>
                </div>

                <asp:Button ID="btnRegister" runat="server" Text="Register" CssClass="btnregister" OnClick="btnRegister_Click" />

                <asp:Literal ID="lblError" runat="server"></asp:Literal>

                <asp:Label ID="lbl" runat="server" Text="Bạn đã có tài khoản?"></asp:Label>
                    <a href="Login.aspx" style="text-decoration: none;">Đăng nhập tại đây</a>
            </div>
        </div>
    </form>
</body>
</html>
