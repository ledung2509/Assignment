<%-- 
    Document   : loginAcc.jsp
    Created on : Mar 10, 2023, 12:57:58 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Bạn đã đổi mật khẩu thành công.Vui lòng đăng nhập lại</h1>
        <script>
            setTimeout(function () {
                window.location.href = 'login.jsp';
            }, 4500);
        </script>
    </body>
</html>
