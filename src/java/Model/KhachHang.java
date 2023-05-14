package Model;

import Database.DBContext;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class KhachHang {

    private String maKhachHang;
    private String tenDangNhap;
    private String matKhau;
    private String hoVaTen;
    private String gioiTinh;
    private String diaChi; // xa, huyen, tinh
    private String diaChiNhanHang;
    private String ngaySinh;
    private String soDienThoai;
    private String email;
    private boolean dangKyNhanBangTin;

    public KhachHang() {
        connect();
    }

    public KhachHang(String tenDangNhap, String matKhau) {
        this.tenDangNhap = tenDangNhap;
        this.matKhau = matKhau;
        connect();
    }

    public KhachHang(String maKhachHang, String tenDangNhap, String matKhau, String hoVaTen, String gioiTinh,
            String diaChi, String diaChiNhanHang, String ngaySinh, String soDienThoai, String email,
            boolean dangKyNhanBangTin) {
        this.maKhachHang = maKhachHang;
        this.tenDangNhap = tenDangNhap;
        this.matKhau = matKhau;
        this.hoVaTen = hoVaTen;
        this.gioiTinh = gioiTinh;
        this.diaChi = diaChi;
        this.diaChiNhanHang = diaChiNhanHang;
        this.ngaySinh = ngaySinh;
        this.soDienThoai = soDienThoai;
        this.email = email;
        this.dangKyNhanBangTin = dangKyNhanBangTin;
        connect();
    }

    public String getMaKhachHang() {
        return maKhachHang;
    }

    public void setMaKhachHang(String maKhachHang) {
        this.maKhachHang = maKhachHang;
    }

    public String getTenDangNhap() {
        return tenDangNhap;
    }

    public void setTenDangNhap(String tenDangNhap) {
        this.tenDangNhap = tenDangNhap;
    }

    public String getMatKhau() {
        return matKhau;
    }

    public void setMatKhau(String matKhau) {
        this.matKhau = matKhau;
    }

    public String getHoVaTen() {
        return hoVaTen;
    }

    public void setHoVaTen(String hoVaTen) {
        this.hoVaTen = hoVaTen;
    }

    public String getGioiTinh() {
        return gioiTinh;
    }

    public void setGioiTinh(String gioiTinh) {
        this.gioiTinh = gioiTinh;
    }

    public String getDiaChi() {
        return diaChi;
    }

    public void setDiaChi(String diaChi) {
        this.diaChi = diaChi;
    }

    public String getDiaChiNhanHang() {
        return diaChiNhanHang;
    }

    public void setDiaChiNhanHang(String diaChiNhanHang) {
        this.diaChiNhanHang = diaChiNhanHang;
    }

    public String getNgaySinh() {
        return ngaySinh;
    }

    public void setNgaySinh(String ngaySinh) {
        this.ngaySinh = ngaySinh;
    }

    public String getSoDienThoai() {
        return soDienThoai;
    }

    public void setSoDienThoai(String soDienThoai) {
        this.soDienThoai = soDienThoai;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public boolean isDangKyNhanBangTin() {
        return dangKyNhanBangTin;
    }

    public void setDangKyNhanBangTin(boolean dangKyNhanBangTin) {
        this.dangKyNhanBangTin = dangKyNhanBangTin;
    }

    public boolean checkUser() {
        try {
            String strSelect = "select * from KhachHang "
                    + "where TenDangNhap= ? "
                    + "and MatKhau=?";
            pstm = cnn.prepareStatement(strSelect);
            pstm.setString(1, tenDangNhap);
            pstm.setString(2, matKhau);
            rs = pstm.executeQuery();
            while (rs.next()) {
                return true;
            }
        } catch (Exception e) {
            System.out.println("checkUser:" + e.getMessage());
        }
        return false;
    }

    Connection cnn;//Kết nối DB
    Statement stm;//Thực thi câu lệnh SQL
    PreparedStatement pstm;//Thực thi câu lệnh SQL
    ResultSet rs;//Lưu trữ và xử lý dữ liệu

    private void connect() {
        try {
            cnn = (new DBContext()).makeConnection();
            if (cnn != null) {
                System.out.println("Connect success");
            }
        } catch (Exception e) {
            System.out.println("Fail:" + e.getMessage());
        }
    }

    public boolean checkAccountReset(String tenDangNhap, String hoVaTen, String ngaySinh, String dienThoai) {
        try {
            String strSelect = "Select * from KhachHang where TenDangNhap=? \n"
                    + "and Hoten=? and NgaySinh=? and SoDienThoai=?";
            pstm = cnn.prepareStatement(strSelect);
            pstm.setString(1, tenDangNhap);
            pstm.setString(2, hoVaTen);
            pstm.setDate(3, java.sql.Date.valueOf(ngaySinh));
            pstm.setString(4, dienThoai);
            rs = pstm.executeQuery();
            if (rs.next()) {
                return true;
            }

        } catch (Exception e) {
            System.out.println("checkAccountReset: " + e.getMessage());
        }
        return false;
    }

    public void changePassword() {
        try {
            String strSelect = "update KhachHang set MatKhau=? where TenDangNhap=?";
            pstm = cnn.prepareStatement(strSelect);
            pstm.setString(1, matKhau);
            pstm.setString(2, tenDangNhap);
            pstm.execute();

        } catch (Exception e) {
            System.out.println("changePassword: " + e.getMessage());
        }
    }

    public String getNamebyAccount(String tenDangNhap) {
        try {
            String strSelect = "select Hoten from KhachHang "
                    + " where TenDangNhap='" + tenDangNhap + "' ";
            stm = cnn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            rs = stm.executeQuery(strSelect);
            if (rs.next()) {
                String hoVaTen = rs.getString(1);
                return hoVaTen;
            }
        } catch (Exception e) {
            System.out.println("getNamebyAccount:" + e.getMessage());
        }
        return "";
    }

    public void updatepass() {
        try {
            String strUpdate = "update KhachHang "
                    + "set MatKhau=? "
                    + " where TenDangNhap=? ";
            pstm = cnn.prepareStatement(strUpdate);
            pstm.setString(1, matKhau);
            pstm.setString(2, tenDangNhap);
            pstm.execute();

        } catch (Exception e) {
            System.out.println("update:" + e.getMessage());
        }
    }

    @Override
    public String toString() {
        return "KhachHang{" + "maKhachHang=" + maKhachHang + ", tenDangNhap=" + tenDangNhap + ", matKhau=" + matKhau + ", hoVaTen=" + hoVaTen + ", gioiTinh=" + gioiTinh + ", diaChi=" + diaChi + ", diaChiNhanHang=" + diaChiNhanHang + ", ngaySinh=" + ngaySinh + ", soDienThoai=" + soDienThoai + ", email=" + email + ", dangKyNhanBangTin=" + dangKyNhanBangTin + ", cnn=" + cnn + ", stm=" + stm + ", pstm=" + pstm + ", rs=" + rs + '}';
    }
    
    
}
