package model;

public class TKMonAnTheoDoanhThu600 extends Monan600 {
	private int soLuong;  
    private float tongTien;  
    private String startDate;
    private String endDate;

	public TKMonAnTheoDoanhThu600() {
        super();
    }
	
	

    public String getStartDate() {
		return startDate;
	}



	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}



	public String getEndDate() {
		return endDate;
	}



	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}



	public int getSoLuong() {
        return soLuong;
    }

    public void setSoLuong(int soLuong) {
        this.soLuong = soLuong;
    }

    public double getTongTien() {
        return tongTien;
    }

    public void setTongTien(float tongTien) {
        this.tongTien = tongTien;
    }


}
