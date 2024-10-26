package model;

import java.util.List;

public class DonHang600 {
    private int id;
    private String thoigiandat;
    private float tongtien;
    private String trangthai;
    private String loai;
    private KhachHang600 khachHang;
    private List<BanDuocDat600> listBan;
    private List<MonAnDonHang600> listMonAn;
    private List<ComboDonHang600> listCombo;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getThoigiandat() {
		return thoigiandat;
	}
	public void setThoigiandat(String thoigiandat) {
		this.thoigiandat = thoigiandat;
	}
	public float getTongtien() {
		return tongtien;
	}
	public void setTongtien(float tongtien) {
		this.tongtien = tongtien;
	}
	public String getTrangthai() {
		return trangthai;
	}
	public void setTrangthai(String trangthai) {
		this.trangthai = trangthai;
	}
	public String getLoai() {
		return loai;
	}
	public void setLoai(String loai) {
		this.loai = loai;
	}
	public KhachHang600 getKhachHang() {
		return khachHang;
	}
	public void setKhachHang(KhachHang600 khachHang) {
		this.khachHang = khachHang;
	}
	public List<BanDuocDat600> getListBan() {
		return listBan;
	}
	public void setListBan(List<BanDuocDat600> listBan) {
		this.listBan = listBan;
	}
	public List<MonAnDonHang600> getListMonAn() {
		return listMonAn;
	}
	public void setListMonAn(List<MonAnDonHang600> listMonAn) {
		this.listMonAn = listMonAn;
	}
	public List<ComboDonHang600> getListCombo() {
		return listCombo;
	}
	public void setListCombo(List<ComboDonHang600> listCombo) {
		this.listCombo = listCombo;
	}
	
}
