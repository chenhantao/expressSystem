package cn.edu.cqu.cht.model;
/*
 * @author CHT
 * @date 创建时间：2018年5月8日 上午3:35:34
 * @version 1.0
 */
public class StationOrder {
	private Integer stationId;
	private String orderId;
	private Double salary;
	private Short orderState;
	private String time;
	public Integer getStationId() {
		return stationId;
	}
	public void setStationId(Integer stationId) {
		this.stationId = stationId;
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
