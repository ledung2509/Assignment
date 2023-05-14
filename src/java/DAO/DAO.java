package DAO;

import Database.DBContext;
import Model.Cart;
import Model.Items;
import Model.KhachHang;
import Model.SanPham;
import Model.TheLoai;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class DAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    //Lấy sản phẩm
    public List<SanPham> getAllProduct() {
        List<SanPham> list = new ArrayList<>();
        String query = "select * from SanPham where MaTraiCay<9";
        try {
            conn = new DBContext().makeConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                int maSanPham = rs.getInt(1);
                String tenTraiCay = rs.getString(2);
                String anh = rs.getString(3);
                double gia = rs.getDouble(4);
                String maTheLoai = rs.getString(5);
                int soLuong = rs.getInt(6);
                String moTa = rs.getString(7);
                list.add(new SanPham(maSanPham, tenTraiCay, anh, gia, maTheLoai, soLuong, moTa));
            }
        } catch (Exception e) {
            System.out.println("checkProduct:" + e.getMessage());
        }
        return list;
    }

    //Lấy tất cả các sản phẩm có trong database
    public List<SanPham> getAllProductShop() {
        List<SanPham> list = new ArrayList<>();
        String query = "select * from SanPham";
        try {
            conn = new DBContext().makeConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                int maSanPham = rs.getInt(1);
                String tenTraiCay = rs.getString(2);
                String anh = rs.getString(3);
                double gia = rs.getDouble(4);
                String maTheLoai = rs.getString(5);
                int soLuong = rs.getInt(6);
                String moTa = rs.getString(7);
                list.add(new SanPham(maSanPham, tenTraiCay, anh, gia, maTheLoai, soLuong, moTa));
            }
        } catch (Exception e) {
            System.out.println("checkProductShop:" + e.getMessage());
        }
        return list;
    }

    //Lấy sản phẩm
    public List<SanPham> getProduct() {
        List<SanPham> list = new ArrayList<>();
        String query = "select * from SanPham where MaTraiCay BETWEEN 19 AND 26";
        try {
            conn = new DBContext().makeConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                int maSanPham = rs.getInt(1);
                String tenTraiCay = rs.getString(2);
                String anh = rs.getString(3);
                double gia = rs.getDouble(4);
                String maTheLoai = rs.getString(5);
                int soLuong = rs.getInt(6);
                String moTa = rs.getString(7);
                list.add(new SanPham(maSanPham, tenTraiCay, anh, gia, maTheLoai, soLuong, moTa));
            }
        } catch (Exception e) {
            System.out.println("checkProduct1:" + e.getMessage());
        }
        return list;
    }

    //In ra các thể loại
    public List<TheLoai> getAllCategory() {
        List<TheLoai> list = new ArrayList<>();
        String query = "select * from TheLoai";
        try {
            conn = new DBContext().makeConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                String maTheLoai = rs.getString(1);
                String tenTheLoai = rs.getString(2);
                list.add(new TheLoai(maTheLoai, tenTheLoai));
            }
        } catch (Exception e) {
            System.out.println("checkCategory:" + e.getMessage());
        }
        return list;
    }

    //Lấy sản phẩm theo thể loại
    public List<SanPham> getProductByID(String maTheLoai) {
        List<SanPham> list = new ArrayList<>();
        String query = "select*from SanPham  where MaTheLoai= ?";
        try {
            conn = new DBContext().makeConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, maTheLoai);
            rs = ps.executeQuery();
            while (rs.next()) {
                int maSanPham = rs.getInt(1);
                String tenTraiCay = rs.getString(2);
                String anh = rs.getString(3);
                double gia = rs.getDouble(4);
                maTheLoai = rs.getString(5);
                int soLuong = rs.getInt(6);
                String moTa = rs.getString(7);
                list.add(new SanPham(maSanPham, tenTraiCay, anh, gia, maTheLoai, soLuong, moTa));
            }
        } catch (Exception e) {
            System.out.println("checkProductByID:" + e.getMessage());
        }
        return list;
    }

    //Sắp xếp theo tên
    public List<SanPham> sortByName() {
        List<SanPham> list = new ArrayList<>();
        String query = "select * from SanPham";
        try {
            conn = new DBContext().makeConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                int maSanPham = rs.getInt(1);
                String tenTraiCay = rs.getString(2);
                String anh = rs.getString(3);
                double gia = rs.getDouble(4);
                String maTheLoai = rs.getString(5);
                int soLuong = rs.getInt(6);
                String moTa = rs.getString(7);
                list.add(new SanPham(maSanPham, tenTraiCay, anh, gia, maTheLoai, soLuong, moTa));
            }
        } catch (Exception e) {
            System.out.println("checkName:" + e.getMessage());
        }
        return list;
    }

    //Sắp xếp theo giá
    public List<SanPham> sortByPrice() {
        List<SanPham> list = new ArrayList<>();
        String query = "select * from SanPham order by Gia asc";
        try {
            conn = new DBContext().makeConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                int maSanPham = rs.getInt(1);
                String tenTraiCay = rs.getString(2);
                String anh = rs.getString(3);
                double gia = rs.getDouble(4);
                String maTheLoai = rs.getString(5);
                int soLuong = rs.getInt(6);
                String moTa = rs.getString(7);
                list.add(new SanPham(maSanPham, tenTraiCay, anh, gia, maTheLoai, soLuong, moTa));
            }
        } catch (Exception e) {
            System.out.println("checkPrice:" + e.getMessage());
        }
        return list;
    }

    //Lấy sản phẩm theo mã
    public SanPham getProductByFID(String maTraiCay) {
        String query = "select*from SanPham where "
                + " MaTraiCay= ? ";
        try {
            conn = new DBContext().makeConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, maTraiCay);
            rs = ps.executeQuery();
            while (rs.next()) {
                int maSanPham = rs.getInt(1);
                String tenTraiCay = rs.getString(2);
                String anh = rs.getString(3);
                double gia = rs.getDouble(4);
                String maTheLoai = rs.getString(5);
                int soLuong = rs.getInt(6);
                String moTa = rs.getString(7);
                return new SanPham(maSanPham, tenTraiCay, anh, gia, maTheLoai, soLuong, moTa);
            }
        } catch (Exception e) {
            System.out.println("checkProductByID:" + e.getMessage());
        }
        return null;
    }

    public List<SanPham> getMaxProduct() {
        List<SanPham> list = new ArrayList<>();
        String query = "select*from SanPham where Gia >= (select MAX(Gia) from SanPham )";
        try {
            conn = new DBContext().makeConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                int maSanPham = rs.getInt(1);
                String tenTraiCay = rs.getString(2);
                String anh = rs.getString(3);
                double gia = rs.getDouble(4);
                String maTheLoai = rs.getString(5);
                int soLuong = rs.getInt(6);
                String moTa = rs.getString(7);
                list.add(new SanPham(maSanPham, tenTraiCay, anh, gia, maTheLoai, soLuong, moTa));
            }
        } catch (Exception e) {
            System.out.println("Maxproduct: " + e.getMessage());
        }
        return list;
    }

    public List<SanPham> getMinProduct() {
        List<SanPham> list = new ArrayList<>();
        String query = "select*from SanPham where Gia <= (select MIN(Gia) from SanPham )";
        try {
            conn = new DBContext().makeConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                int maSanPham = rs.getInt(1);
                String tenTraiCay = rs.getString(2);
                String anh = rs.getString(3);
                double gia = rs.getDouble(4);
                String maTheLoai = rs.getString(5);
                int soLuong = rs.getInt(6);
                String moTa = rs.getString(7);
                list.add(new SanPham(maSanPham, tenTraiCay, anh, gia, maTheLoai, soLuong, moTa));
            }
        } catch (Exception e) {
            System.out.println("Maxproduct: " + e.getMessage());
        }
        return list;
    }

    public static void main(String[] args) {
        DAO dao = new DAO();
        List<SanPham> p = dao.getMaxProduct();
        for (SanPham sanPham : p) {
            System.out.println(sanPham);
        }
    }

    //TÌm kiếm sản phẩm
    public List<SanPham> searchByName(String txtSearch) {
        List<SanPham> list = new ArrayList<>();
        String query = "select*from SanPham where [Ten]  like ? ";
        try {
            conn = new DBContext().makeConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, "%" + txtSearch + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                int maSanPham = rs.getInt(1);
                String tenTraiCay = rs.getString(2);
                String anh = rs.getString(3);
                double gia = rs.getDouble(4);
                String maTheLoai = rs.getString(5);
                int soLuong = rs.getInt(6);
                String moTa = rs.getString(7);
                list.add(new SanPham(maSanPham, tenTraiCay, anh, gia, maTheLoai, soLuong, moTa));
            }
        } catch (Exception e) {
            System.out.println("checkProductByID:" + e.getMessage());
        }
        return list;
    }

    public KhachHang getUserByName(String hoVaTen) {
        String query = "select*from KhachHang where "
                + " Hoten like ? ";
        try {
            conn = new DBContext().makeConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, "%" + hoVaTen + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                String maKhachHang = rs.getString(1);
                String tenDangNhap = rs.getString(2);
                String matKhau = rs.getString(3);
                hoVaTen = rs.getString(4);
                String gioiTinh = rs.getString(5);
                String diaChi = rs.getString(6); // xa, huyen, tinh
                String diaChiNhanHang = rs.getString(7);
                String ngaySinh = rs.getString(8);
                String soDienThoai = rs.getString(9);
                String email = rs.getString(10);
                boolean dangKyNhanBangTin = rs.getBoolean(11);
                return new KhachHang(maKhachHang, tenDangNhap, matKhau, hoVaTen, gioiTinh, diaChi, diaChiNhanHang, ngaySinh, soDienThoai, email, dangKyNhanBangTin);
            }
        } catch (Exception e) {
            System.out.println("checkProductByID:" + e.getMessage());
        }
        return null;
    }

    public KhachHang getAccount(String tenDangNhap, String matKhau) {
        String query = "SELECT * FROM KhachHang WHERE TenDangNhap = ? AND MatKhau = ?";
        try {
            conn = new DBContext().makeConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, tenDangNhap);
            ps.setString(2, matKhau);
            rs = ps.executeQuery();
            while (rs.next()) {
                String maKhachHang = rs.getString(1);
                tenDangNhap = rs.getString(2);
                matKhau = rs.getString(3);
                String hoVaTen = rs.getString(4);
                String gioiTinh = rs.getString(5);
                String diaChi = rs.getString(6); // xa, huyen, tinh
                String diaChiNhanHang = rs.getString(7);
                String ngaySinh = rs.getString(8);
                String soDienThoai = rs.getString(9);
                String email = rs.getString(10);
                boolean dangKyNhanBangTin = rs.getBoolean(11);
                return new KhachHang(maKhachHang, tenDangNhap, matKhau, hoVaTen, gioiTinh, diaChi, diaChiNhanHang, ngaySinh, soDienThoai, email, dangKyNhanBangTin);
            }
        } catch (Exception e) {
            System.out.println("checkLogIn:" + e.getMessage());
        }
        return null;
    }

    public List<SanPham> getProductByAdmin() {
        List<SanPham> list = new ArrayList<>();
        String query = "select * from SanPham";
        try {
            conn = new DBContext().makeConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                int maSanPham = rs.getInt(1);
                String tenTraiCay = rs.getString(2);
                String anh = rs.getString(3);
                double gia = rs.getDouble(4);
                String maTheLoai = rs.getString(5);
                int soLuong = rs.getInt(6);
                String moTa = rs.getString(7);
                list.add(new SanPham(maSanPham, tenTraiCay, anh, gia, maTheLoai, soLuong, moTa));
            }
        } catch (Exception e) {
            System.out.println("checkProductShop:" + e.getMessage());
        }
        return list;
    }

    public void delete(String maTraiCay) {
        String strDelete = "delete SanPham "
                + " where MaTraiCay=? ";
        try {
            conn = new DBContext().makeConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(strDelete);
            ps.setString(1, maTraiCay);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("delete:" + e.getMessage());
        }
    }

    public void UpdateProduct() {
        String strUpdate = "update SanPham "
                + "set Ten=?, "
                + " Anh=?, "
                + " Gia=?, "
                + " MaTheLoai=? "
                + " SoLuong=? "
                + " MoTa=? "
                + " where MaTraiCay=? ";
        try {
            conn = new DBContext().makeConnection();
            ps = conn.prepareStatement(strUpdate);
            int maSanPham = rs.getInt(1);
            String tenTraiCay = rs.getString(2);
            String anh = rs.getString(3);
            double gia = rs.getDouble(4);
            String maTheLoai = rs.getString(5);
            int soLuong = rs.getInt(6);
            String moTa = rs.getString(7);
            ps.executeUpdate();

        } catch (Exception e) {
            System.out.println("update:" + e.getMessage());
        }
    }

    public void add(int maTraiCay, String ten, double gia, String soLuong,
            String theLoai, String moTa, String anh) {
        String strAdd = "insert into SanPham(MaTraiCay, Ten,Anh,Gia,MaTheLoai,SoLuong,MoTa)"
                + " values(?,?,?,?,?,?,?)";
        try {
            conn = new DBContext().makeConnection();
            ps = conn.prepareStatement(strAdd);
            ps.setInt(1, maTraiCay);
            ps.setString(2, ten);
            ps.setDouble(3, gia);
            ps.setString(4, soLuong);
            ps.setString(5, theLoai);
            ps.setString(6, moTa);
            ps.setString(7, anh);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("add:" + e.getMessage());
        }
    }

    public void addOrder(KhachHang u, Cart cart) {
        LocalDate curDate = java.time.LocalDate.now();
        String date = curDate.toString();
        try {
            //Thêm vào order
            String sql = "insert into [Order] values(?,?,?)";
            Connection con = new DBContext().makeConnection();
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, date);
            st.setString(2, u.getMaKhachHang());
            st.setDouble(3, cart.getTotalMoney());
            st.executeUpdate();
            //Lấy ra id của order vừa add
            String sql1 = "select top 1 id from [Order] order by id desc";
            PreparedStatement st1 = con.prepareStatement(sql1);
            ResultSet rs = st1.executeQuery();
            //add vào bảng OrderLine
            if (rs.next()) {
                int oid = rs.getInt("id");
                for (Items i : cart.getItems()) {
                    String sql2 = "insert into [OrderLine] values(?,?,?,?)";
                    PreparedStatement st2 = con.prepareStatement(sql2);
                    //st2.setInt(1,oid);
                    st2.setInt(1, i.getSanpham().getMaTraiCay());
                    st2.setInt(2, i.getSoLuong());
                    st2.setDouble(3, i.getGia());
                    st2.executeUpdate();
                }
            }
            //Cạp nhật số lượng sản phẩm
            String sql3 = "update SanPham set SoLuong=SoLuong- ? where MaTraiCay=?";
            PreparedStatement st3 = con.prepareStatement(sql3);
            for (Items i : cart.getItems()) {
                st3.setInt(1, i.getSoLuong());
                st3.setInt(2, i.getSanpham().getMaTraiCay());
                st3.executeUpdate();
            }
        } catch (Exception e) {
            System.out.println("check:" + e.getMessage());
        }
    }
}
