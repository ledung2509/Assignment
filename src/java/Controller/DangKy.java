package Controller;

import Database.KhachHangDAO;
import Model.KhachHang;
import Model.MaHoa;
import Model.SendEmail;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Random;
import java.util.Scanner;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DangKy extends HttpServlet {

    private String checkDate() {
        Scanner sc = new Scanner(System.in);
        //set format of date
        SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
        dateFormat.setLenient(false);
        //force user input exectly a date
        while (true) {
            String input = sc.nextLine();
            try {
                Date date = (Date) dateFormat.parse(input);
                //get current date
                Date curDate = (Date) Calendar.getInstance().getTime();
                //check range of date
                if (curDate.compareTo(date) < 0) {
                    System.out.print("Please input date that before current date: ");
                    continue;
                }
                dateFormat = new SimpleDateFormat("dd-MMM-yyyy");
                return dateFormat.format(date);
            } catch (Exception e) {
                System.out.print("Please input valid date (dd-MM-yyyy): ");
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String tenDangNhap = req.getParameter("tenDangNhap");
        String matKhau = req.getParameter("matKhau");
        String matKhauNhapLai = req.getParameter("matKhauNhapLai");
        String hoVaTen = req.getParameter("hoVaTen");
        String gioiTinh = req.getParameter("gioiTinh");
        String ngaySinh = req.getParameter("ngaySinh");
        String diaChiKhachHang = req.getParameter("diaChiKhachHang");
        String diaChiNhanHang = req.getParameter("diaChiNhanHang");
        String dienThoai = req.getParameter("dienThoai");
        String email = req.getParameter("email");
        String dongYNhanMail = req.getParameter("dongYNhanMail");
        String url = "";
        String baoLoi = "";
        KhachHangDAO khachHangDAO = new KhachHangDAO();

        try {
            if (khachHangDAO.kiemTraTenDangNhap(tenDangNhap)) {
                baoLoi += "Tên đăng nhập đã tồn tại, vui lòng chọn tên đăng nhập khác.<br/>";
            }
        } catch (ClassNotFoundException ex) {
        }

        if (!matKhau.equals(matKhauNhapLai)) {
            baoLoi += "Mẫu khẩu không khớp.<br/>";
        } else {
            matKhau = MaHoa.toSHA1(matKhau);
        }
        if (hoVaTen.isEmpty()) {
            baoLoi += "Họ và tên không được để trống";
        }
        if (gioiTinh.isEmpty()) {
            baoLoi += "Giới tính trống";
        }
        if (ngaySinh.isEmpty()) {
            baoLoi += "Ngày sinh không để trống";
        }
        if (diaChiKhachHang.isEmpty()) {
            baoLoi += "";
        }
        if (diaChiNhanHang.isEmpty()) {
            baoLoi += "Địa chỉ nhận hàng không để trống";
        }
        if (dienThoai.isEmpty()) {
            baoLoi += "Số điện thoại không để trống";
        }
        if (email.isEmpty()) {
            baoLoi += "Email không để trống";
        }
        req.setAttribute("baoLoi", baoLoi);

        if (baoLoi.length() > 0) {
            url = "/signin.jsp";
        } else {
            SendEmail sm = new SendEmail();
            String code = sm.getRandom();
            KhachHang kh = new KhachHang(code, hoVaTen, email);
            boolean test = sm.send("ledungb12509@gmail.com", "begagbngrmebbdco", kh.getEmail(), "User Email Verification", "Registered successfully.Please verify your account using this code: " + kh.getCode());
            if (true) {
                HttpSession session = req.getSession();
                session.setAttribute("authcode", kh);
                resp.sendRedirect("verify.jsp");
                
                Random rd = new Random();
                String maKhachHang = System.currentTimeMillis() + rd.nextInt(1) + "";
                KhachHang k = new KhachHang(maKhachHang, tenDangNhap, matKhau, hoVaTen, gioiTinh, diaChiKhachHang, diaChiNhanHang, ngaySinh, dienThoai, email, dongYNhanMail != null);
                session.setAttribute("acc", k);
            }else{
                System.out.println("Again!!!");
            }
        }

//        } else {
//            Random rd = new Random();
//            String maKhachHang = System.currentTimeMillis() + rd.nextInt(1) + "";
//            KhachHang kh = new KhachHang(maKhachHang, tenDangNhap, matKhau, hoVaTen, gioiTinh, diaChiKhachHang, diaChiNhanHang, ngaySinh, dienThoai, email, dongYNhanMail != null);
//            try {
//                khachHangDAO.insert(kh);
//            } catch (ClassNotFoundException ex) {
//                Logger.getLogger(DangKy.class.getName()).log(Level.SEVERE, null, ex);
//            }
//            url = "/success.jsp";
//        }
//        RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
//        rd.forward(req, resp);
    }
}
