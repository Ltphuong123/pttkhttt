package dao;

import java.sql.CallableStatement;
import java.sql.ResultSet;


public class ThanhvienDAO600 extends DAO600 {

    public ThanhvienDAO600() {
        super();
    }

    public String kiemTraDangNhap(String username, String password) {
        String vaitro = "";
        String sql = "SELECT id, vaitro FROM db.tblThanhVien WHERE username = ? AND password = ?;";
        String sql2 = "SELECT chucvu FROM db.tblnhanvien WHERE tblThanhVienid=?;";
        try {
        	CallableStatement  cs = con.prepareCall(sql);
        	cs.setString(1, username);
        	cs.setString(2, password);
            ResultSet rs = cs.executeQuery();
            if (rs.next()) {
            	vaitro = rs.getString("vaitro");
            	String id = rs.getString("id");
            	if (vaitro.equalsIgnoreCase("nhanvien")) {
            		
            		CallableStatement  cs2 = con.prepareCall(sql2);
            		cs2.setString(1, id);
            		ResultSet rs2 = cs2.executeQuery();
            		if (rs2.next()) {
            			vaitro = rs2.getString("chucvu");
            		}
            	}
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return vaitro;
    }
}
