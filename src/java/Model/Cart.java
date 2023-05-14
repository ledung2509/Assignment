/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.util.ArrayList;
import java.util.List;

public class Cart {

    private List<Items> items;

    public List<Items> getItems() {
        return items;
    }

    public void setItems(List<Items> items) {
        this.items = items;
    }

    public Cart() {
        items = new ArrayList<>();
    }

    public Cart(List<Items> items) {
        this.items = items;
    }

    private Items getItemById(int id) {
        for (Items i : items) {
            if (i.getSanpham().getMaTraiCay() == id) {
                return i;
            }
        }
        return null;
    }

    public int getQuantityById(int id) {
        return getItemById(id).getSoLuong();
    }

    //Thêm vào giỏ hàng
    public void addItems(Items t) {
        //Có  ở trong cart r
        if (getItemById(t.getSanpham().getMaTraiCay()) != null) {
            Items i = getItemById(t.getSanpham().getMaTraiCay());
            i.setSoLuong(i.getSoLuong() + t.getSoLuong());
        } else {//Chưa có trong giỏ hàng
            items.add(t);
        }
    }

    //xóa sp trong giỏ hàng
    public void removeItem(int id) {
        //Nếu sản phẩm tồn tại
        if (getItemById(id) != null) {
            items.remove(getItemById(id));
        }
    }

    //Tổng tiền trong giỏ hàng
    public double getTotalMoney() {
        double t = 0;
        for (Items i : items) {
            t += (i.getSoLuong() * i.getSanpham().getGia());
        }
        return t;
    }

    private SanPham getProductById(List<SanPham> list, int id) {
        for (SanPham sanPham : list) {
            if (sanPham.getMaTraiCay() == id) {
                return sanPham;
            }
        }
        return null;
    }

    public Cart(String txt, List<SanPham> list) {
        items = new ArrayList<>();
        try {
            if (txt != null && txt.length() != 0) {
                String[] s = txt.split(",");
                for (String i : s) {
                    String[] n = i.split(":");
                    int id = Integer.parseInt(n[0]);
                    int soLuong = Integer.parseInt(n[1]);
                    SanPham p = getProductById(list, id);
                    Items t = new Items(p, soLuong,p.getGia());
                    addItems(t);
                }
            } else {

            }
        } catch (Exception e) {

        }
    }
}
