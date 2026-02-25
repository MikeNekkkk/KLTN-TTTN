package connection;

import java.io.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DatabaseConnection {
    public static Connection getConnection() {
        try {
            String dbUrl = "jdbc:mysql://localhost:3307/cafe"; 
            String dbUsername = "root"; 
            String dbPassword = "maihuyenhi1"; 
            Class.forName("com.mysql.cj.jdbc.Driver");
            return DriverManager.getConnection(dbUrl, dbUsername, dbPassword);
        } catch (Exception e) {
            e.printStackTrace();
            return null; 
        }
    }

public void testConnection() {
    try (Connection conn = getConnection()) {
        if (conn != null) {
            System.out.println("Kết nối cơ sở dữ liệu thành công!");
        } else {
            System.out.println("Kết nối cơ sở dữ liệu thất bại!");
        }
    } catch (SQLException e) {
        System.out.println("Lỗi trong quá trình kiểm tra kết nối!");
        e.printStackTrace();
    }
}

public static void main(String[] args) {
    DatabaseConnection dbConn = new DatabaseConnection();
    dbConn.testConnection(); // Gọi hàm kiểm tra kết nối
}
}