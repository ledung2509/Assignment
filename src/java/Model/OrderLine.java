/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author ADMIN
 */
public class OrderLine {
    private String oid;
    private int maTraiCay;
    private int soLuong;
    private double gia;

    public OrderLine() {
    }

    public OrderLine(String oid, int maTraiCay, int soLuong, double gia) {
        this.oid = oid;
        this.maTraiCay = maTraiCay;
        this.soLuong = soLuong;
        this.gia = gia;
    }

    public String getOid() {
        return oid;
    }

    public void setOid(String oid) {
        this.oid = oid;
    }

    public int getMaTraiCay() {
        return maTraiCay;
    }

    public void setMaTraiCay(int maTraiCay) {
        this.maTraiCay = maTraiCay;
    }

    public int getSoLuong() {
        return soLuong;
    }

    public void setSoLuong(int soLuong) {
        this.soLuong = soLuong;
    }

    public double getGia() {
        return gia;
    }

    public void setGia(double gia) {
        this.gia = gia;
    }
}
