package Database;

import Database.DBContext;
import Model.KhachHang;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class KhachHangDAO implements Serializable {

    public KhachHang getAccount(String tenDangNhap, String matKhau) throws SQLException, ClassNotFoundException {
        String SQL = "SELECT * FROM KhachHang WHERE TenDangNhap = ? AND MatKhau = ?";

        KhachHang account = null;

        Connection con = null;
        PreparedStatement pre = null;

        ResultSet res = null;
        try {
            con = DBContext.makeConnection();
            pre = con.prepareStatement(SQL);
            // code go la phai nam duoi pre = con.pre
            pre.setString(1, tenDangNhap);
            pre.setString(2, matKhau);
            res = pre.executeQuery();
            while (res.next()) {
                // output tu database
                account = new KhachHang(tenDangNhap, matKhau);
            }
        } finally {
            if (con != null) {
                con.close();
            }

            if (pre != null) {
                pre.close();
            }

            if (res != null) {
                res.close();
            }

        }
        return account;
    }

    public KhachHang getAccount(String tenDangNhap) throws SQLException, ClassNotFoundException {
        String SQL = "SELECT * FROM KhachHang WHERE TenDangNhap = ?";

        KhachHang account = null;

        Connection con = null;
        PreparedStatement pre = null;

        ResultSet res = null;
        try {
            con = DBContext.makeConnection();
            pre = con.prepareStatement(SQL);
            // code go la phai nam duoi pre = con.pre
            pre.setString(1, tenDangNhap);
            res = pre.executeQuery();
            while (res.next()) {
                // output tu database
                String password = res.getString("password");
                String fullname = res.getString("fullname");
                boolean role = res.getBoolean("role");
                account = new KhachHang(tenDangNhap, fullname);
            }
        } finally {
            if (con != null) {
                con.close();
            }

            if (pre != null) {
                pre.close();
            }

            if (res != null) {
                res.close();
            }

        }
        return account;
    }

    public boolean kiemTraTenDangNhap(String tenDangNhap) throws ClassNotFoundException {
        boolean ketQua = false;
        try {
            // Bước 1: tạo kết nối đến CSDL
            Connection con = DBContext.makeConnection();

            // Bước 2: tạo ra đối tượng statement
            String sql = "SELECT * FROM KhachHang WHERE TenDangNhap=?";
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, tenDangNhap);

            // Bước 3: thực thi câu lệnh SQL
            ResultSet rs = st.executeQuery();

            // Bước 4:
            while (rs.next()) {
                ketQua = true;
            }

            // Bước 5:
            DBContext.closeConnection(con);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            System.out.println("checkAccount: " + e.getMessage());
        }
        return ketQua;
    }

    public int insert(KhachHang t) throws ClassNotFoundException {
        int ketQua = 0;
        try {
            // Bước 1: tạo kết nối đến CSDL
            Connection con = DBContext.makeConnection();

            // Bước 2: tạo ra đối tượng statement
            String sql = "INSERT INTO KhachHang (MaKhachHang, TenDangNhap, MatKhau, Hoten, GioiTinh, DiaChi, DiaChiNhanHang, NgaySinh, SoDienThoai, Email, Dangkynhanbangtin) "
                    + " VALUES (?,?,?,?,?,?,?,?,?,?,?)";

            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, t.getMaKhachHang());
            st.setString(2, t.getTenDangNhap());
            st.setString(3, t.getMatKhau());
            st.setString(4, t.getHoVaTen());
            st.setString(5, t.getGioiTinh());
            st.setString(6, t.getDiaChi());
            st.setString(7, t.getDiaChiNhanHang());
            st.setString(8, t.getNgaySinh());
            st.setString(9, t.getSoDienThoai());
            st.setString(10, t.getEmail());
            st.setBoolean(11, t.isDangKyNhanBangTin());

            // Bước 3: thực thi câu lệnh SQL
            ketQua = st.executeUpdate();

            // Bước 4:
            // Bước 5:
            DBContext.closeConnection(con);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            System.out.println("checkAddUser: " + e.getMessage());
        }

        return ketQua;
    }
}
