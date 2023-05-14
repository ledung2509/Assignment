/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Database;
import Model.KhachHang;
import java.sql.SQLException;
/**
 *
 * @author ADMIN
 */
public class Test {
    
    public static void main(String[] args) throws SQLException, ClassNotFoundException {
        KhachHangDAO dao = new KhachHangDAO();
        System.out.println(dao.getAccount("admin", "1234"));
    }

}
