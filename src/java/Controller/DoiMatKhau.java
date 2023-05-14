package Controller;

import Database.KhachHangDAO;
import Model.KhachHang;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DoiMatKhau extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String matKhauHienTai = req.getParameter("matKhauHienTai");
        String matKhauMoi = req.getParameter("matKhauMoi");
        String matKhauMoiNhapLai = req.getParameter("matKhauMoiNhapLai");
        HttpSession session = req.getSession();
        if (matKhauHienTai == null || matKhauMoi == null || matKhauMoiNhapLai == null || matKhauHienTai.isEmpty() || matKhauMoi.isEmpty() || matKhauMoiNhapLai.isEmpty()) {
            req.setAttribute("errorMessage", "Vui lòng nhập đầy đủ thông tin.");
            req.getRequestDispatcher("/doi-mat-khau.jsp").forward(req, resp);
            return;
        }
        //Kiểm tra mật khẩu cũ có đúng hay không
        KhachHang khachHang = (KhachHang) req.getSession().getAttribute("khachHang");
        if (!khachHang.getMatKhau().equals(matKhauHienTai)) {
            req.setAttribute("err", "Mật khẩu hiện tại không đúng.");
            req.getRequestDispatcher("changepass.jsp").forward(req, resp);
            return;
        }else{
            //Kiểm tra mật khẩu mới với mật khẩu nhập lại có trùng khớp nhau không
            if (!matKhauMoi.equals(matKhauMoiNhapLai)) {
                req.setAttribute("err", "Mật khẩu mới nhập lại không khớp.");
                req.getRequestDispatcher("changepass.jsp").forward(req, resp);
                return;
            }else{
                khachHang.setMatKhau(matKhauMoi);
                KhachHang kh= new KhachHang();
                if (req.getParameter("")!=null) {
                    kh.updatepass();
                }
                req.getRequestDispatcher("home1.jsp").forward(req, resp);
            }
            
        }
       
    }

}
