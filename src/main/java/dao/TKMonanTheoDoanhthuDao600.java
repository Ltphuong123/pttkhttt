package dao;

import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import model.TKMonAnTheoDoanhThu600;

public class TKMonanTheoDoanhthuDao600 extends DAO600 {

    public TKMonanTheoDoanhthuDao600() {
        super();
    }
    
    public List<TKMonAnTheoDoanhThu600> getMonAnTheoDoanhThu(String startDate, String endDate) {
        List<TKMonAnTheoDoanhThu600> monanList = new ArrayList<>();
     
        String sql = "SELECT m.id AS mon_an_id, m.ten AS mon_an_ten, m.gia AS gia_mon_an, SUM(mad.soluong) AS tong_so_luong_mon_an, SUM(mad.soluong * m.gia) AS tong_tien_mon_an FROM db.tblMonAn m JOIN db.tblMonAnDonHang mad ON m.id = mad.tblMonAnid JOIN db.tblDonHang d ON mad.tblDonHangid = d.id WHERE d.thoigiandat BETWEEN ? AND ? AND d.trangthai = 'Đã hoàn thành' GROUP BY m.id, m.ten, m.gia, m.mota, m.thanhphan ORDER BY tong_tien_mon_an DESC;";
        	

        try {
        	CallableStatement  cs = con.prepareCall(sql);
        	cs.setString(1, startDate);
        	cs.setString(2, endDate);
            ResultSet rs = cs.executeQuery();

            while (rs.next()) {
            	TKMonAnTheoDoanhThu600 monan = new TKMonAnTheoDoanhThu600();
            	
            	monan.setId(rs.getInt("mon_an_id"));
            	monan.setTen(rs.getString("mon_an_ten"));
            	monan.setGia(rs.getFloat("gia_mon_an"));
            	monan.setSoLuong(rs.getInt("tong_so_luong_mon_an"));
            	monan.setTongTien(rs.getFloat("tong_tien_mon_an"));
            	monan.setStartDate(startDate);
            	monan.setEndDate(endDate);
            
                monanList.add(monan);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        
        return monanList;
    }
    
 

}




