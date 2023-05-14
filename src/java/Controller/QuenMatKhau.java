/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller;

import Database.KhachHangDAO;
import Model.KhachHang;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author ADMIN
 */
public class QuenMatKhau extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String tenDangNhap = req.getParameter("taiKhoan");
        String hoVaTen = req.getParameter("hoVaTen");
        String ngaySinh = req.getParameter("ngaySinh");
        String dienThoai = req.getParameter("soDienThoai");

        KhachHang u = new KhachHang();
        if (u.checkAccountReset(tenDangNhap, hoVaTen, ngaySinh, dienThoai)) {
            req.setAttribute("taiKhoan", tenDangNhap);
            req.getRequestDispatcher("forgetpass.jsp").forward(req, resp);
        } else {
           req.setAttribute("err", "Thông tin không chính xác");
           req.getRequestDispatcher("resetpass.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String taiKhoan = req.getParameter("taiKhoan");
        String matKhauMoi = req.getParameter("matKhauMoi");
        String matKhauMoiNhapLai = req.getParameter("matKhauMoiNhapLai");
         KhachHangDAO khachHangDAO = new KhachHangDAO();
        try {
            if (khachHangDAO.kiemTraTenDangNhap(taiKhoan)) {
                req.setAttribute("err", "Tên đăng nhập không đúng.<br/>");
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(QuenMatKhau.class.getName()).log(Level.SEVERE, null, ex);
        }
        if (matKhauMoi.isEmpty() || matKhauMoiNhapLai.isEmpty()) {
            req.setAttribute("err", "Mật khẩu và mật khẩu nhập lại trống");
            req.getRequestDispatcher("resetPassword.jsp").forward(req, resp);
        } else if (!matKhauMoi.equals(matKhauMoiNhapLai)) {
            req.setAttribute("err", "Mật khẩu nhập lại phải đúng ");
            req.getRequestDispatcher("forgetpass.jsp").forward(req, resp);
        } else {
            KhachHang u = new KhachHang(taiKhoan, matKhauMoi);
            u.changePassword();;
            req.getRequestDispatcher("loginsuccess.jsp").forward(req, resp);
        }
    }
}
