package laundry;

public class payment {
	
	private int paymentid ;
	private int cardnumber ;
	private String cardholdername ;
	private String exdate ;
	private int cvv ;
	private double amount ;
	
	public payment() {
	}
	
	public payment(int paymentid, int cardnumber, String cardholdername, String exdate, int cvv,double amount) {
		this.paymentid = paymentid ;
		this.cardnumber = cardnumber ;
		this.cardholdername = cardholdername ;
		this.exdate = exdate ;
		this.cvv = cvv ;
		this.amount = amount ;
	}

	public int getPaymentid() {
		return paymentid;
	}

	

	public int getCardnumber() {
		return cardnumber;
	}

	public String getCardholdername() {
		return cardholdername;
	}

	public String getExdate() {
		return exdate;
	}

	public void setPaymentid(int paymentid) {
		this.paymentid = paymentid;
	}

	public void setCardnumber(int cardnumber) {
		this.cardnumber = cardnumber;
	}

	public void setCardholdername(String cardholdername) {
		this.cardholdername = cardholdername;
	}

	public void setExdate(String exdate) {
		this.exdate = exdate;
	}

	public void setCvv(int cvv) {
		this.cvv = cvv;
	}

	public void setAmount(double amount) {
		this.amount = amount;
	}

	public int getCvv() {
		return cvv;
	}

	public double getAmount() {
		return amount;
	}

	
	
	
	

}
