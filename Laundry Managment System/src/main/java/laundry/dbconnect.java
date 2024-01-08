package laundry;

import java.sql.Connection;
import java.sql.DriverManager;

public class dbconnect {
	
	   private static String url = "jdbc:mysql://localhost:3306/laundry";
	    private static String username = "root";
	    private static String password = "Thamindu#12345";
	    private static Connection con;

	    public static Connection getConnection() {

	        try {

	            Class.forName("com.mysql.jdbc.Driver");

	            con = DriverManager.getConnection(url,username, password);

	        } catch (Exception e) {
	            System.out.println("Database connection is not success!!!");
	        }

	        return con;
	    }

}
