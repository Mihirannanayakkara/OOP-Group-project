package laundry;

public class order {

    private int orderId;
    private int custId;
    private double weight;
    private String orderDate;
    private String deliveryDate;
    private String name;

    public order() {
    }

    public order(int orderId, int custId, double weight, String orderDate, String deliveryDate,String name) {
        this.orderId = orderId;
        this.custId = custId;
        this.weight = weight;
        this.orderDate = orderDate;
        this.deliveryDate = deliveryDate;
        this.name =name;
    }

    public int getOrderId() {
        return orderId;
    }

    public int getCustId() {
        return custId;
    }

    public double getWeight() {
        return weight;
    }

    public String getOrderDate() {
        return orderDate;
    }

    public String getDeliveryDate() {
        return deliveryDate;
    }
    
    public String getName() {
        return name;
    }

	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}

	public void setCustId(int custId) {
		this.custId = custId;
	}

	public void setWeight(double weight) {
		this.weight = weight;
	}

	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}

	public void setDeliveryDate(String deliveryDate) {
		this.deliveryDate = deliveryDate;
	}

	public void setName(String name) {
		this.name = name;
	}
    
    


}