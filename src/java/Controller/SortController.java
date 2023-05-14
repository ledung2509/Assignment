/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller;

import DAO.DAO;
import Model.SanPham;
import Model.TheLoai;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

/**
 *
 * @author ADMIN
 */
public class SortController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String op = req.getParameter("op");
        DAO dao = new DAO();
        List<TheLoai> listCC = dao.getAllCategory();

        req.setAttribute("listCC", listCC);
        if (op.equals("0")) {
            List<SanPham> data = dao.sortByName();
            Collections.sort(data, new Comparator<SanPham>() {
                @Override
                public int compare(SanPham o1, SanPham o2) {
                    return o1.getTenTraiCay().compareTo(o2.getTenTraiCay());
                }

            });
            req.setAttribute("data", data);
            req.getRequestDispatcher("sortproduct.jsp").forward(req, resp);
        } else if (op.equals("1")) {
            List<SanPham> data = dao.sortByPrice();
//            Collections.sort(data, new Comparator<SanPham>(){
//                @Override
//                public int compare(SanPham o1, SanPham o2) {
//                    return (int) (o1.getGia()-o2.getGia());
//                }
//                
//            });
            req.setAttribute("data", data);
            req.getRequestDispatcher("sortproduct.jsp").forward(req, resp);
        } else if (op.equals("2")) {
            List<SanPham> data = dao.getMaxProduct();
            req.setAttribute("data", data);
            req.getRequestDispatcher("sortproduct.jsp").forward(req, resp);
        } else if (op.equals("3")) {
            List<SanPham> data = dao.getMinProduct();
            req.setAttribute("data", data);
            req.getRequestDispatcher("sortproduct.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    }
}
