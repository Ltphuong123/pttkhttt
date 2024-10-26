package model;

import java.util.Date;

public class HoaDon600 {
    private int id;
    private Date thoiGianThanhToan;
    private DonHang600 donHang;
    private NhanVien600 nhanVien;
    private float tongtien;
    
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	public float getTongtien() {
		return tongtien;
	}
	public void setTongtien(float tongtien) {
		this.tongtien = tongtien;
	}
	public Date getThoiGianThanhToan() {
		return thoiGianThanhToan;
	}
	public void setThoiGianThanhToan(Date thoiGianThanhToan) {
		this.thoiGianThanhToan = thoiGianThanhToan;
	}
	public DonHang600 getDonHang() {
		return donHang;
	}
	public void setDonHang(DonHang600 donHang) {
		this.donHang = donHang;
	}
	public NhanVien600 getNhanVien() {
		return nhanVien;
	}
	public void setNhanVien(NhanVien600 nhanVien) {
		this.nhanVien = nhanVien;
	}

    
}
