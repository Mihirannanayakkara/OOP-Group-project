package laundry;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;



public class orderdbutil {
	
	private static boolean isSuccess;
	private static Connection con = null;
	private static Statement stmt = null;
	private static ResultSet rs = null;
	
	 public static boolean insertOrder(int custid, double weight, String orderdate, String deliverydate, String name) {
		 
		 	boolean isSuccess = false;
		 	 
		   try {
			   	
			    con = dbconnect.getConnection();
	    		stmt = con.createStatement();
			   	
	    		
	    		String sql = "INSERT INTO laundry_orders (custid, weight, orderdate, deliverydate,name) VALUES ('" + custid + "', '" + weight + "', '" + orderdate + "', '" + deliverydate + "','"+name+"');";


				int rs = stmt.executeUpdate(sql);
				
				if (rs > 0) {
					isSuccess = true;
				} else {
					isSuccess = false;
				}
			} 
			catch (Exception e) {
					e.printStackTrace();
			}
			
			return isSuccess;
		
		}
	 
	 
	
	 
	 public static order getLastAddedOrder() {
	        order lastAddedOrder = null;

	        try {
	            con = dbconnect.getConnection();
	            stmt = con.createStatement();
	            String sql = "SELECT * FROM laundry_orders ORDER BY orderid DESC LIMIT 1";

	            rs = stmt.executeQuery(sql);

	            if (rs.next()) {
	                int orderid = rs.getInt("orderid");
	                int custid = rs.getInt("custid");
	                double weight = rs.getDouble("weight");
	                String orderdate = rs.getString("orderdate");
	                String deliverydate = rs.getString("deliverydate");
	                String name = rs.getString("name");

	                lastAddedOrder = new order(orderid, custid, weight, orderdate, deliverydate,name);
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        }

	        return lastAddedOrder;
	    }
	 
	 
	 
	 
	 public static boolean updateOrder(String oid , String cid ,String weight,String orderdate,String deliverydate,String name) {
		 
		 
		 try {
	            con = dbconnect.getConnection();
	            stmt = con.createStatement();
	            String sql = "update laundry_orders set custid='"+cid+"',weight='"+weight+"',orderdate='"+orderdate+"',deliverydate='"+deliverydate+"',name='"+name+"' where orderid='"+oid+"' ";

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
	 
	 public static List<order> getUpdatedDetails(String orderId){
		 
		 
		 int convertedID = Integer.parseInt(orderId);
		 
		 ArrayList<order> od = new ArrayList();
		 
		 try {
			 
			 con =dbconnect.getConnection();
			 stmt=con.createStatement();
			 
			 String sql ="select * from laundry_orders where orderid='"+convertedID+"'"; 
			 
			 rs = stmt.executeQuery(sql);
			 
			 while(rs.next()) {
				 
				 int orderid = rs.getInt(1);
				 int custid = rs.getInt(2);
				 double weight = rs.getDouble(3);
				 String orderdate = rs.getString(4);
				 String deliverydate = rs.getString(5);
				 String name = rs.getString(6);
				 
				 order o = new order(orderid,custid,weight,orderdate,deliverydate,name);
				 od.add(o);
				 
			 }
			 
		 }catch(Exception e) {
			 e.printStackTrace();
		 }
		 
		 
		 
		 return od;
	 }
	 
	 public static boolean deleteOrder(String orderId) {
		 
		 int convertedID = Integer.parseInt(orderId);	
		 
		 try {
			 
			 con = dbconnect.getConnection();
			 stmt = con.createStatement();
			 String sql = "delete from laundry_orders where orderid='"+convertedID+"'";
			 int rs = stmt.executeUpdate(sql);
			 
			 if(rs>0) {
				 
				 isSuccess = true;
				 
			 }else {
				 
				 isSuccess = false;
			 }
			 
		 }catch(Exception e) {
			 e.printStackTrace();
			 
		 }
		 
		 return isSuccess;
	 }

	 
	 public static List<order> orderedetails() {
		    ArrayList<order> order = new ArrayList<>();
		    try {
		        Connection connection = dbconnect.getConnection();
		        PreparedStatement pst = connection.prepareStatement("select * from laundry_orders"); 
		        ResultSet rs = pst.executeQuery();
		        while (rs.next()) {
		            int id = rs.getInt("orderid");
		            int custid = rs.getInt("custid");
		            double weight = rs.getDouble("weight");
		            String orderdate = rs.getString("orderdate");
		            String deliverydate = rs.getString("deliverydate");
		            String name = rs.getString("name");
		            
		            order ee = new order(id, custid, weight, orderdate, deliverydate, name);
		            order.add(ee);
		            System.out.println("\n");
		        }
		    } catch (Exception e) {
		        e.printStackTrace();
		    }
		    return order;
		}

	 
	 
}


