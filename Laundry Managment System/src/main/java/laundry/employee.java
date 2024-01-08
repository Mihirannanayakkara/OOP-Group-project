package laundry;

public class employee {
	private int id;
	private String fname;
	private String lname;
	private String address;
	private String dob;
	private String phone;
	private String eid;
	public employee(int id, String fname, String lname, String address, String dob, String phone, String eid) {
	
		this.id = id;
		this.fname = fname;
		this.lname = lname;
		this.address = address;
		this.dob = dob;
		this.phone = phone;
		this.eid = eid;
	}
	public int getId() {
		return id;
	}
	public String getFname() {
		return fname;
	}
	public String getLname() {
		return lname;
	}
	public String getAddress() {
		return address;
	}
	public String getDob() {
		return dob;
	}
	public String getPhone() {
		return phone;
	}
	public String getEid() {
		return eid;
	}
	
	
	
}
