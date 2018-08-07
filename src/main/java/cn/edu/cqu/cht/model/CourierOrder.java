package cn.edu.cqu.cht.model;
/*
 * @author CHT
 * @date 创建时间：2018年5月2日 上午2:44:31
 * @version 1.0
 */
public class CourierOrder {
	private Integer courierId;
	private String orderId;
	private Double salary;
	private Short orderState;
	private String time;
	
	
	public Integer getCourierId() {
		return courierId;
	}
	public void setCourierId(Integer courierId) {
		this.courierId = courierId;
	}
	public String getOrderId() {
		return orderId;
	}
	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}
	public Double getSalary() {
		return salary;
	}
	public void setSalary(Double salary) {
		this.salary = salary;
	}
	public Short getOrderState() {
		return orderState;
	}
	public void setOrderState(Short orderState) {
		this.orderState = orderState;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	
	
}
