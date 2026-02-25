package Controller; // Đổi thành package thực tế của bạn nếu khác

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import com.mysql.cj.jdbc.AbandonedConnectionCleanupThread;
import java.sql.Driver;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Enumeration;

@WebListener // Bắt buộc phải có dòng này để Tomcat nhận diện
public class AppContextListener implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        // Code chạy khi server bắt đầu (không cần làm gì ở đây)
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        // 1. Hủy đăng ký Driver để tránh rò rỉ bộ nhớ
        Enumeration<Driver> drivers = DriverManager.getDrivers();
        while (drivers.hasMoreElements()) {
            Driver driver = drivers.nextElement();
            try {
                DriverManager.deregisterDriver(driver);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        // 2. Tắt luồng dọn dẹp của MySQL (Đây là thuốc đặc trị lỗi của bạn)
        try {
            AbandonedConnectionCleanupThread.checkedShutdown();
            System.out.println("Đã tắt MySQL AbandonedConnectionCleanupThread thành công!");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}