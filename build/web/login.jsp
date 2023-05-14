<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport"
              content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Đăng nhập</title>
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css"
            rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT"
            crossorigin="anonymous">
        <script
            src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
            integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3"
            crossorigin="anonymous"></script>
        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.min.js"
            integrity="sha384-7VPbUDkoPSGFnVtYi0QogXtr74QeVeeIs99Qfg5YCF+TidwNdjvaKZX19NZ/e6oz"
            crossorigin="anonymous"></script>
        <style>
            .red {
                color: red;
            }
        </style>
        <!-- Custom styles for this template -->
        <!-- getScheme() là http hoặc https-->
        <!-- getServerName() là tên server-->
        <!-- getServerPort()là 8080 hoặc .. -->
        <!-- getContextPath())tên dự án -->
        <link href="css/signin.css" rel="stylesheet">
    </head>
    <body style="background: #95afc0">
        <main class="form-signin w-100 m-auto" style="background: whitesmoke;border-radius:25px;width: 800px">
            <!-- Tạo form đăng nhập -->
            <form class="text-center" action="dangnhap" method="post">
                <a href="home"><img class="mb-4" src="images/fruit1.png" alt="" width="80" height="60"/></a>
                
                <h1 class="h3 mb-3 fw-normal">ĐĂNG NHẬP</h1>
                <div class="text-center"></div><span class="red">${baoLoi}</span>
                <div class="form-floating">
                    <input type="text" class="form-control" id="tenDangNhap"
                           placeholder="Tên đăng nhập" name="tenDangNhap" required="required"> <label for="tenDangNhap">Tên đăng nhập</label>
                </div>
                <div class="form-floating">
                    <input type="password" class="form-control" id="matKhau"
                           placeholder="Mật khẩu" name="matKhau" required="required" required="required"> <label for="matKhau">Mật khẩu</label>
                </div>
                <div class="checkbox mb-3">
                    <label> <input type="checkbox" value="remember-me">
                        Ghi nhớ tài khoản này
                    </label>
                </div>
                <button class="w-100 btn btn-lg btn-primary" type="submit">Đăng nhập</button>
                <a href="resetpass.jsp">Quên mật khẩu</a><br>
                <a href="signin.jsp">Đăng ký tài khoản mới</a>
            </form>
        </main>
    </body>
    <script>     
    </script>
</html>