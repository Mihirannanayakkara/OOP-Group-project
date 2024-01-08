package laundry;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;



public class employeeDBUtil {
public static boolean addemployee(String fname,String lname,String address,String dob,String phone,String eid) {
		
		boolean isSuccess=false;
		
	
		try {
			Connection connection = dbconnect.getConnection();
			PreparedStatement pst=connection.prepareStatement("insert into employee(fname,lname,address,dob,phone,eid) values(?,?,?,?,?,?)");
			
			pst.setNString(1, fname);
			pst.setNString(2, lname);
			pst.setNString(3, address);
			pst.setNString(4, dob);
			pst.setNString(5, phone);
			pst.setNString(6, eid);
			
			int rs=pst.executeUpdate();
			
			if(rs>0) {
				isSuccess=true;
			}else {
				isSuccess=false;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return isSuccess;
	}

public static List<employee> employeedetails() {
    ArrayList<employee> emp = new ArrayList<>();
    try {
        Connection connection = dbconnect.getConnection();
        PreparedStatement pst = connection.prepareStatement("select * from employee"); 
        ResultSet rs = pst.executeQuery();
        while (rs.next()) {
            int id = rs.getInt("id");
            String fname = rs.getString("fname");
            String lname = rs.getString("lname");
            String address = rs.getString("address");
            String dob = rs.getString("dob");
            String phone = rs.getString("phone");
            String eid = rs.getString("eid");
            employee ee = new employee(id, fname, lname, address, dob, phone, eid);
            emp.add(ee);
            System.out.println("\n");
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return emp;
}

public static boolean updateemployee(String id, String fname, String lname, String address, String dob, String phone, String eid) {
	boolean isSuccess=false;
	try {
		Connection connection = dbconnect.getConnection();
		PreparedStatement pst = connection.prepareStatement("update employee set fname=?, lname=?, address=?, dob=?, phone=?, eid=? where id=?");

		
		pst.setString(1, fname);
		pst.setString(2, lname);
		pst.setString(3, address);
		pst.setString(4, dob);
		pst.setString(5, phone);
		pst.setString(6, eid);
		pst.setString(7, id);
		
		int rs=pst.executeUpdate();
		if(rs>0) {
			isSuccess=true;
		}else {
			isSuccess=false;
		}
		
	}catch(Exception e)
	{
		e.printStackTrace();
	}
	
	return isSuccess;
}
public static boolean empdelete(String id) {
	boolean isTrue=false;
	int ID=Integer.parseInt(id);
	try {
	Connection connection=dbconnect.getConnection();
	PreparedStatement pst=connection.prepareStatement("delete from employee where id=?");
	pst.setInt(1, ID);
	int rs=pst.executeUpdate();
	if(rs>0) {
		isTrue=true;
	}else {
		isTrue=false;
		
	}
	}catch(Exception e) {
		e.printStackTrace();
	}
	return isTrue;
	}
    

}
