<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>FruitShop</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet" >
        <script
        src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.min.js"
            integrity="sha384-Atwg2Pkwv9vp0ygtn1JAojH0nYbwNJLPhwyoVbhoPwBhjQPR5VtM2+xf0Uwh9KtT"
        crossorigin="anonymous"></script>
    </head>
    <body>
        <div class="container">
            <h1>Xác thực danh tính</h1>
            <span style="color: red">${err}
            </span>
            <form action="quenmatkhau" method="post">
                <div class="mb-3">
                    <label for="matKhauHienTai" class="form-label">Tài khoản</label>
                    <input type="text" class="form-control" id="taiKhoan" name="taiKhoan">
                </div>
                <div class="mb-3">
                    <label for="matKhauMoi" class="form-label">Họ và tên</label>
                    <input type="text" class="form-control" id="hoVaTen" name="hoVaTen">
                </div>
                <div class="mb-3">
                    <label for="matKhauMoiNhapLai" class="form-label">Ngày Sinh</label>
                    <input type="date" class="form-control" id="ngaySinh" name="ngaySinh">
                </div>
                <div class="mb-3">
                    <label for="matKhauMoi" class="form-label">Số điện thoại</label>
                    <input type="text" class="form-control" id="soDienThoai" name="soDienThoai">
                </div>
                <button type="submit" class="btn btn-primary">Tiếp</button>

            </form>
        </div>
    </body>
</html>