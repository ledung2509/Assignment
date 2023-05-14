/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Database.DBContext;
import Model.SanPham;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ADMIN
 */
public class SanPhamDAO {
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    
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
}
