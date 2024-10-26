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
        try {
        	CallableStatement  cs = con.prepareCall(sql);
        	cs.setString(1, username);
        	cs.setString(2, password);
            ResultSet rs = cs.executeQuery();
            if (rs.next()) {
            	vaitro = rs.getString("vaitro");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return vaitro;
    }
}
