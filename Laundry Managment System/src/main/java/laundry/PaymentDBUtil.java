package laundry;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class PaymentDBUtil {
	
	private static boolean isSuccess ;
	private static Connection con = null ;
	private static Statement stmt = null ;
	private static ResultSet rs = null ;

	public static boolean insertPayment(int cardnumber,
			String cardholdername,String exdate,int cvv,double amount	) {
		
		boolean isSuccess = false ;
		
		
		
		try {
			con = dbconnect.getConnection() ;
			stmt = con.createStatement() ;
 			String sql = "INSERT INTO payment (cardnumber,cardholdername,exdate,cvv,amount) VALUES('"+cardnumber+"' ,'"+cardholdername+"' , '"+exdate+"' , '"+cvv+"' , '"+amount+"');" ;
 			int rs = stmt.executeUpdate(sql) ;
			
			if(rs > 0) {
				isSuccess = true ;
			}else {
				isSuccess = false ;
			}
			
		}catch(Exception e){
			e.printStackTrace() ;
		}
		
		return isSuccess;
	}
	
	
	

	
	public static payment getLastAddedPayment() {
		payment lastAddedPayment = null;

        try {
            con = dbconnect.getConnection();
            stmt = con.createStatement();
            String sql = "SELECT * FROM payment ORDER BY paymentid DESC LIMIT 1";

            rs = stmt.executeQuery(sql);

            if (rs.next()) {
                int paymentid = rs.getInt("paymentid");
               
                int cardnumber = rs.getInt("cardnumber");
                String cardholdername = rs.getString("cardholdername");
                String exdate = rs.getString("exdate");
                int cvv = rs.getInt("cvv");
                double amount = rs.getDouble("amount");

                lastAddedPayment = new payment(paymentid, cardnumber, cardholdername, exdate, cvv,amount);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return lastAddedPayment;
    }
	
	
	
	
	
	public static boolean updatePayment(String paymentid, String cardnumber, String cardholdername, String exdate, String cvv,String amount) {
		 
		try {
	            con = dbconnect.getConnection();
	            stmt = con.createStatement();
	            String sql = "update payment set cardnumber='"+cardnumber+"',cardholdername='"+cardholdername+"',exdate='"+exdate+"',cvv='"+cvv+"',amount='"+amount+"' where paymentid='"+paymentid+"' ";

	            int rs = stmt.executeUpdate(sql);

	            if(rs>0) {
	            	isSuccess = true;
	            	
	            }else {
	            	isSuccess = false;
	            }
	            
	            
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
		 
		 return isSuccess;
		 
	 }
	
	
public static List<payment> getUpdatedPaymentDetails(String paymentId) {
    	
    	int convertedID = Integer.parseInt(paymentId);
    	
    	ArrayList<payment> pay = new ArrayList<>();
    	
    	try {
    		
    		con = dbconnect.getConnection();
    		stmt = con.createStatement();
    		String sql = "select * from payment where paymentid='"+convertedID+"'";
    		rs = stmt.executeQuery(sql);
    		
    		while(rs.next()) {
    			int paymentid = rs.getInt(1);
    			int cardnumber = rs.getInt(2);
    			String cardholdername = rs.getString(3);
    			String exdate = rs.getString(4);
    			int cvv = rs.getInt(5);
    			Double amount = rs.getDouble(6);
    			
    			payment c = new payment(paymentid,cardnumber,cardholdername,exdate,cvv,amount);
    			pay.add(c);
    		}
    		
    	}
    	catch(Exception e) {
    		e.printStackTrace();
    	}	
    	return pay;	
    }

public static boolean deletePayment(String paymentid) {
	 
	try {
            con = dbconnect.getConnection();
            stmt = con.createStatement();
            String sql = "delete from payment where paymentid='"+paymentid+"'";

            int rs = stmt.executeUpdate(sql);

            if(rs>0) {
            	isSuccess = true;
            	
            }else {
            	isSuccess = false;
            }
            
            
        } catch (Exception e) {
            e.printStackTrace();
        }
	 
	 return isSuccess;
	 
 }
	

public static List<payment> employeedetails() {
    ArrayList<payment> payment = new ArrayList<>();
    try {
        Connection connection = dbconnect.getConnection();
        PreparedStatement pst = connection.prepareStatement("select * from payment"); 
        ResultSet rs = pst.executeQuery();
        while (rs.next()) {
            int id = rs.getInt("paymentid");
            int cardnumber = rs.getInt("cardnumber");
            String cardholdername = rs.getString("cardholdername");
            String exdate = rs.getString("exdate");
            int cvv = rs.getInt("cvv");
            double amount = rs.getDouble("amount");
           
            payment ee = new payment(id, cardnumber, cardholdername, exdate, cvv, amount);
            payment.add(ee);
            System.out.println("\n");
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return payment;
}

}