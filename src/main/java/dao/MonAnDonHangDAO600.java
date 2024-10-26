package dao;

import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import model.MonAnDonHang600;
import model.Monan600;

public class MonAnDonHangDAO600 extends DAO600 {

    public MonAnDonHangDAO600() {
        super();
    }


    public List<MonAnDonHang600> getLichSuDatMon(String startDate, String endDate, int monAnId) {
        List<MonAnDonHang600> listMonAnDonHang = new ArrayList<>();
        
        
        String sql = "SELECT mad.id, mad.soluong, mad.tblMonAnid, d.thoigiandat, d.tongtien, m.ten AS ten_mon_an, m.gia AS gia_mon_an FROM db.tblMonAnDonHang mad JOIN db.tblDonHang d ON mad.tblDonHangid = d.id JOIN db.tblMonAn m ON mad.tblMonAnid = m.id WHERE mad.tblMonAnid = ? AND d.thoigiandat BETWEEN ? AND ? AND d.trangthai = 'Đã hoàn thành';";
        
        try {
        	
        	CallableStatement  cs = con.prepareCall(sql);
            cs.setInt(1, monAnId);
            cs.setString(2, startDate);
            cs.setString(3, endDate);
            
            ResultSet rs = cs.executeQuery();

            while (rs.next()) {
            	MonAnDonHang600 monAnDonHang = new MonAnDonHang600();
            	monAnDonHang.setId(rs.getInt("id"));
            	monAnDonHang.setSoluong(rs.getInt("soluong"));
            	monAnDonHang.setThoiGianDat(rs.getDate("thoigiandat"));
            	monAnDonHang.setTongtien(rs.getInt("soluong") * rs.getFloat("gia_mon_an"));
            	Monan600 monAn= new Monan600();
            	monAn.setId(rs.getInt("tblMonAnid"));
            	monAn.setTen(rs.getString("ten_mon_an"));
            	monAn.setGia(rs.getFloat("gia_mon_an"));
            	
            	monAnDonHang.setMonan(monAn);
                  
            	listMonAnDonHang.add(monAnDonHang);
                }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listMonAnDonHang;
    }
    
    
    
    
}

