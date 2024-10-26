package model;

import java.util.Date;

public class MonAnDonHang600 {
    private int id;
    private int soluong;
    private float tongtien;
    private Monan600 monan;
    private Date thoiGianDat;
    
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getSoluong() {
		return soluong;
	}
	public void setSoluong(int soluong) {
		this.soluong = soluong;
	}
	public Monan600 getMonan() {
		return monan;
	}
	public void setMonan(Monan600 monan) {
		this.monan = monan;
	}
	public Date getThoiGianDat() {
		return thoiGianDat;
	}
	public void setThoiGianDat(Date thoiGianDat) {
		this.thoiGianDat = thoiGianDat;
	}
	public float getTongtien() {
		return tongtien;
	}
	public void setTongtien(float tongtien) {
		this.tongtien = tongtien;
	}
	



}
