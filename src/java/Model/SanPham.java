package Model;
public class SanPham {
   private int maTraiCay;
   private String tenTraiCay;
   private String anh;
   private double gia;
   private String maTheLoai;
   private int soLuong;
   private String moTa;

    public SanPham() {
    }

    public SanPham(int maTraiCay, String tenTraiCay, String anh, double gia, String maTheLoai, int soLuong, String moTa) {
        this.maTraiCay = maTraiCay;
        this.tenTraiCay = tenTraiCay;
        this.anh = anh;
        this.gia = gia;
        this.maTheLoai = maTheLoai;
        this.soLuong = soLuong;
        this.moTa = moTa;
    }

    public int getMaTraiCay() {
        return maTraiCay;
    }

    public void setMaTraiCay(int maTraiCay) {
        this.maTraiCay = maTraiCay;
    }

    public String getTenTraiCay() {
        return tenTraiCay;
    }

    public void setTenTraiCay(String tenTraiCay) {
        this.tenTraiCay = tenTraiCay;
    }

    public String getAnh() {
        return anh;
    }

    public void setAnh(String anh) {
        this.anh = anh;
    }

    public double getGia() {
        return gia;
    }

    public void setGia(double gia) {
        this.gia = gia;
    }

    public String getMaTheLoai() {
        return maTheLoai;
    }

    public void setMaTheLoai(String maTheLoai) {
        this.maTheLoai = maTheLoai;
    }

    public int getSoLuong() {
        return soLuong;
    }

    public void setSoLuong(int soLuong) {
        this.soLuong = soLuong;
    }

    public String getMoTa() {
        return moTa;
    }

    public void setMoTa(String moTa) {
        this.moTa = moTa;
    }

    @Override
    public String toString() {
        return "SanPham{" + "maTraiCay=" + maTraiCay + ", tenTraiCay=" + tenTraiCay + ", anh=" + anh + ", gia=" + gia + ", maTheLoai=" + maTheLoai + ", soLuong=" + soLuong + ", moTa=" + moTa + '}';
    }
}
