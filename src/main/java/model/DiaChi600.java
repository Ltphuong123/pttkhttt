package model;

public class DiaChi600 {
    private int id;
    private String soNha;
    private String toaNha;
    private String xomPho;
    private String phuongXa;
    private String quanHuyen;
    private String tinhThanh;
    
    
    public DiaChi600(int id, String soNha, String toaNha, String xomPho, String phuongXa, String quanHuyen, String tinhThanh) {
        this.id = id;
        this.soNha = soNha;
        this.toaNha = toaNha;
        this.xomPho = xomPho;
        this.phuongXa = phuongXa;
        this.quanHuyen = quanHuyen;
        this.tinhThanh = tinhThanh;
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getSoNha() {
        return soNha;
    }

    public void setSoNha(String soNha) {
        this.soNha = soNha;
    }

    public String gettoaNha() {
        return toaNha;
    }

    public void settoaNha(String toaNha) {
        this.toaNha = toaNha;
    }

    public String getXomPho() {
        return xomPho;
    }

    public void setXomPho(String xomPho) {
        this.xomPho = xomPho;
    }

    public String getPhuongXa() {
        return phuongXa;
    }

    public void setPhuongXa(String phuongXa) {
        this.phuongXa = phuongXa;
    }

    public String getQuanHuyen() {
        return quanHuyen;
    }

    public void setQuanHuyen(String quanHuyen) {
        this.quanHuyen = quanHuyen;
    }

    public String getTinhThanh() {
        return tinhThanh;
    }

    public void setTinhThanh(String tinhThanh) {
        this.tinhThanh = tinhThanh;
    }
}

