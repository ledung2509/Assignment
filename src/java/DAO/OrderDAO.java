/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Database.DBContext;
import Model.Cart;
import Model.Items;
import Model.KhachHang;
import Model.Order;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;

/**
 *
 * @author ADMIN
 */
public class OrderDAO extends DBContext {
    public void addOrder(KhachHang u,Cart cart){
        LocalDate curDate = java.time.LocalDate.now();
        String date= curDate.toString();
        try {
            //Thêm vào order
            String sql="insert into [Order] values(?,?,?)";
            Connection con =new DBContext().makeConnection();
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, date);
            st.setString(2, u.getMaKhachHang());
            st.setDouble(3, cart.getTotalMoney());
            st.executeUpdate();
            //Lấy ra id của order vừa add
            String sql1="select top 1 id from [Order] order by id desc";
            PreparedStatement st1 = con.prepareStatement(sql1);
            ResultSet rs = st1.executeQuery();
            //add vào bảng OrderLine
            if (rs.next()) {
                int oid = rs.getInt("id");
                for (Items i : cart.getItems()) {
                    String sql2 = "insert into [OrderLine] values(?,?,?,?)";
                    PreparedStatement st2 = con.prepareStatement(sql2);
                    st2.setInt(1,oid);
                    st2.setInt(2,i.getSanpham().getMaTraiCay());
                    st2.setInt(3, i.getSoLuong());
                    st2.setDouble(4, i.getGia());
                    st2.executeUpdate();
                }
            }
            //Cạp nhật số lượng sản phẩm
            String sql3="update SanPham set SoLuong=SoLuong- ? where MaTraiCay=?";
            PreparedStatement st3 = con.prepareStatement(sql3);
            for (Items i : cart.getItems()) {
                st3.setInt(1, i.getSoLuong());
                st3.setInt(2, i.getSanpham().getMaTraiCay());
                st3.executeUpdate();
            }
        } catch (Exception e) {
            System.out.println("check:"+e.getMessage());
        }
    }
}
