
package Model;

public class Order {
    private String id;
    private String ngay;
    private String maKhachHang;
    private double tong;

    public Order() {
    }

    public Order(String id, String ngay, String maKhachHang, double tong) {
        this.id = id;
        this.ngay = ngay;
        this.maKhachHang = maKhachHang;
        this.tong = tong;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getNgay() {
        return ngay;
    }

    public void setNgay(String ngay) {
        this.ngay = ngay;
    }

    public String getMaKhachHang() {
        return maKhachHang;
    }

    public void setMaKhachHang(String maKhachHang) {
        this.maKhachHang = maKhachHang;
    }

    public double getTong() {
        return tong;
    }

    public void setTong(double tong) {
        this.tong = tong;
    }
}
