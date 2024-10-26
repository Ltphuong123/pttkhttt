package dao;

import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import model.Combo600;
import model.ComboDonHang600;
import model.DonHang600;
import model.HoaDon600;
import model.KhachHang600;
import model.MonAnDonHang600;
import model.Monan600;
import model.NhanVien600;

public class HoaDonDao600 extends DAO600 {

    public HoaDonDao600() {
        super();
    }

    public HoaDon600 getHoaDon(int monAnDonHangId) {
        String sql = "SELECT kh.id AS khach_hang_id, tv.username AS ten_khach_hang, nv.id AS nhan_vien_id, tv_nv.username AS ten_nhan_vien, hd.thoigianthanhtoan, dh.id AS don_hang_id, hd.id AS hoa_don_id FROM db.tblMonAnDonHang mad JOIN db.tblDonHang dh ON mad.tblDonHangid = dh.id JOIN db.tblHoaDon hd ON dh.id = hd.tblDonHangid JOIN db.tblKhachHang kh ON dh.tblKhachHangid = kh.id JOIN db.tblThanhVien tv ON kh.tblThanhVienid = tv.id JOIN db.tblNhanVien nv ON hd.tblNhanVienid = nv.id JOIN db.tblThanhVien tv_nv ON nv.tblThanhVienid = tv_nv.id WHERE mad.id = ?;";
        HoaDon600 hoaDon = new HoaDon600();
        try {
            CallableStatement cs = con.prepareCall(sql);
            cs.setInt(1, monAnDonHangId);
            ResultSet rs = cs.executeQuery();
            if (rs.next()) {
            	
            	hoaDon.setId(rs.getInt("hoa_don_id"));
            	hoaDon.setThoiGianThanhToan(rs.getDate("thoigianthanhtoan"));
            	
            	NhanVien600 nhanVien = new NhanVien600();
            	nhanVien.setId(rs.getInt("nhan_vien_id"));
            	nhanVien.setUsername(rs.getString("ten_nhan_vien"));
	            hoaDon.setNhanVien(nhanVien);
	            
	            DonHang600 donHang = new DonHang600();
	            
	            
	            donHang.setId(rs.getInt("don_hang_id"));
	            
	            KhachHang600 khachHang = new KhachHang600();
	            khachHang.setId(rs.getInt("khach_hang_id"));
	            khachHang.setUsername(rs.getString("ten_khach_hang"));
	            donHang.setKhachHang(khachHang);
	            
	            float tongtien=0;
	            
	            List<MonAnDonHang600> listMonAnDonHang =  new ArrayList<>();
	            
	            String sqlmonan = "SELECT ma.id as idMonAn, ma.ten AS tenMonAn, mad.soluong, ma.gia, (mad.soluong * ma.gia) AS tongTienMonAn FROM db.tblMonAnDonHang mad JOIN db.tblMonAn ma ON mad.tblMonAnid = ma.id WHERE mad.tblDonHangid = ?;";

		        try {
		             CallableStatement csma = con.prepareCall(sqlmonan);
		             csma.setInt(1, rs.getInt("don_hang_id")); 
		             ResultSet rsma = csma.executeQuery();
	
		             while (rsma.next()) {
		                 MonAnDonHang600 monAnDonHang = new MonAnDonHang600();
		                 
		                 Monan600 monAn = new Monan600();
		                 monAn.setId(rsma.getInt("idMonAn"));
		                 monAn.setTen(rsma.getString("tenMonAn"));
		                 monAn.setGia(rsma.getFloat("gia"));
		                 
		                 monAnDonHang.setSoluong(rsma.getInt("soluong"));
		                 monAnDonHang.setTongtien(rsma.getFloat("gia")*rsma.getInt("soluong"));
		                 monAnDonHang.setMonan(monAn);	                 
		                 listMonAnDonHang.add(monAnDonHang);
		                 tongtien+=rsma.getFloat("gia")*rsma.getInt("soluong");
		             }
		         } catch (Exception e) {
		             e.printStackTrace();
		         }
		        donHang.setListMonAn(listMonAnDonHang);
		        
		        
		        List<ComboDonHang600> listComboDonHang =  new ArrayList<>();
	            
	            String sqlCombo = "SELECT c.id as id_combo, c.ten AS ten_combo, c.gia AS gia_combo, cdh.soluong AS so_luong_combo FROM db.tblComboDonHang cdh JOIN db.tblCombo c ON cdh.tblComboid = c.id WHERE cdh.tblDonHangid = ?;";

		        try {
		             CallableStatement cscb = con.prepareCall(sqlCombo);
		             cscb.setInt(1, rs.getInt("don_hang_id")); 
		             ResultSet rscb = cscb.executeQuery();
		             
		             while (rscb.next()) {
		                 ComboDonHang600 comboDonHang = new ComboDonHang600();
		                 
		                 Combo600 combo = new Combo600();	
		                 
		                 combo.setId(rscb.getInt("id_combo"));
		                 combo.setTen(rscb.getString("ten_combo"));
		                 combo.setGia(rscb.getFloat("gia_combo"));
		                 
		                 comboDonHang.setSoluong(rscb.getInt("so_luong_combo"));
		                 comboDonHang.setGia(rscb.getInt("so_luong_combo")*rscb.getFloat("gia_combo"));
		                 comboDonHang.setCombo(combo);	                 
		                 listComboDonHang.add(comboDonHang);
		                 tongtien+=rscb.getFloat("gia_combo")*rscb.getInt("so_luong_combo");
		             }
		         } catch (Exception e) {
		             e.printStackTrace();
		         }
		        donHang.setTongtien(tongtien);
		        donHang.setListCombo(listComboDonHang);
	            hoaDon.setDonHang(donHang);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return hoaDon;
    }
}
