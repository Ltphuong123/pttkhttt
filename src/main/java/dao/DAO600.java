package dao;

import java.sql.Connection;
import java.sql.DriverManager;

public class DAO600 {
    public static Connection con;

    public DAO600() {
        if (con == null) {
            String dbUrl = "jdbc:mysql://localhost:3306/db";
            String user = "root";
            String password = "123456";
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                con = DriverManager.getConnection(dbUrl, user, password);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}
