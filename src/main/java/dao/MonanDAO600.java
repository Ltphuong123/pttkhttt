package dao;

import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import model.Monan600;

public class MonanDAO600 extends DAO600 {

    public MonanDAO600() {
        super();
    }

    public List<Monan600> getDanhSachMonAn(String keyword) {
        List<Monan600> monanList = new ArrayList<>();
     
        String sql = "SELECT id, ten, gia FROM db.tblmonan WHERE ten LIKE ?";

        try {
        	CallableStatement  cs = con.prepareCall(sql);
        	cs.setString(1, "%" + keyword + "%");
            ResultSet rs = cs.executeQuery();

            while (rs.next()) {
            	Monan600 monan = new Monan600();
            	monan.setId(rs.getInt("id"));
            	monan.setTen(rs.getString("ten"));
            	monan.setGia(rs.getFloat("gia"));
                monanList.add(monan);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return monanList;
    }
    
    public Monan600 getThongTinMonAn(int id) {
    	Monan600 monan = new Monan600();
        String sql = "SELECT * FROM db.tblmonan WHERE id = ?";

        try{
        	CallableStatement  cs = con.prepareCall(sql);
        	cs.setInt(1, id);

            ResultSet rs = cs.executeQuery();

            if (rs.next()) {
            	monan.setId(rs.getInt("id"));
            	monan.setTen(rs.getString("ten"));
            	monan.setGia(rs.getFloat("gia"));
            	monan.setMota(rs.getString("mota"));
            	monan.setThanhphan(rs.getString("thanhphan"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return monan;
    }

    
    
}
