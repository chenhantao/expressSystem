package cn.edu.cqu.cht.model;
/*
 * @author CHT
 * @date 创建时间：2018年5月2日 下午3:14:15
 * @version 1.0
 */
public class Orderlist {
	private String orderId;
	private Integer userId;
	
	//寄件人相关信息
	private String senderName;
	private String senderPhone;
	private String senderProvince;
	private String senderCity;
	private String senderArea;
	private String senderAddr;
	
	//收件人相关信息
	private String recipientName;
	private String recipientPhone;
	private String recipientProvince;
	private String recipientCity;
	private String recipientArea;
	private String recipientAddr;
	
	//订单本身的一些属性
	private String kind;
	private Double weight;
	private Double money;
	private String notes;
	
	private String logisticsState;
	private String currentCourier;
	private String currentProvince;
	private String currentCity;
	private String currentArea;
	private String currentStation;
	private String nextProvince;
	private String nextCity;
	private String nextArea;
	
	private Short payState;
	private Short orderState;
	private Short transportState;
	
	private String time;


		
	
	public Double getWeight() {
		return weight;
	}
	public void setWeight(Double weight) {
		this.weight = weight;
	}
	public String getKind() {
		return kind;
	}
	public void setKind(String kind) {
		this.kind = kind;
	}
	public String getNextProvince() {
		return nextProvince;
	}
	public void setNextProvince(String nextProvince) {
		this.nextProvince = nextProvince;
	}
	public String getNextCity() {
		return nextCity;
	}
	public void setNextCity(String nextCity) {
		this.nextCity = nextCity;
	}
	public String getOrderId() {
		return orderId;
	}
	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public String getSenderName() {
		return senderName;
	}
	public void setSenderName(String senderName) {
		this.senderName = senderName;
	}
	public String getSenderAddr() {
		return senderAddr;
	}
	public void setSenderAddr(String senderAddr) {
		this.senderAddr = senderAddr;
	}
	public String getSenderPhone() {
		return senderPhone;
	}
	public void setSenderPhone(String senderPhone) {
		this.senderPhone = senderPhone;
	}
	public String getSenderProvince() {
		return senderProvince;
	}
	public void setSenderProvince(String senderProvince) {
		this.senderProvince = senderProvince;
	}
	public String getSenderCity() {
		return senderCity;
	}
	public void setSenderCity(String senderCity) {
		this.senderCity = senderCity;
	}
	public String getRecipientName() {
		return recipientName;
	}
	public void setRecipientName(String recipientName) {
		this.recipientName = recipientName;
	}
	public String getRecipientAddr() {
		return recipientAddr;
	}
	public void setRecipientAddr(String recipientAddr) {
		this.recipientAddr = recipientAddr;
	}
	public String getRecipientPhone() {
		return recipientPhone;
	}
	public void setRecipientPhone(String recipientPhone) {
		this.recipientPhone = recipientPhone;
	}
	public String getRecipientProvince() {
		return recipientProvince;
	}
	public void setRecipientProvince(String recipientProvince) {
		this.recipientProvince = recipientProvince;
	}
	public String getRecipientCity() {
		return recipientCity;
	}
	public void setRecipientCity(String recipientCity) {
		this.recipientCity = recipientCity;
	}
	public String getNotes() {
		return notes;
	}
	public void setNotes(String notes) {
		this.notes = notes;
	}
	public Short getOrderState() {
		return orderState;
	}
	public void setOrderState(Short orderState) {
		this.orderState = orderState;
	}
	public Short getPayState() {
		return payState;
	}
	public void setPayState(Short payState) {
		this.payState = payState;
	}
	public Double getMoney() {
		return money;
	}
	public void setMoney(Double money) {
		this.money = money;
	}
	public String getLogisticsState() {
		return logisticsState;
	}
	public void setLogisticsState(String logisticsState) {
		this.logisticsState = logisticsState;
	}
	public String getCurrentCourier() {
		return currentCourier;
	}
	public void setCurrentCourier(String currentCourier) {
		this.currentCourier = currentCourier;
	}
	public String getCurrentProvince() {
		return currentProvince;
	}
	public void setCurrentProvince(String currentProvince) {
		this.currentProvince = currentProvince;
	}
	public String getCurrentCity() {
		return currentCity;
	}
	public void setCurrentCity(String currentCity) {
		this.currentCity = currentCity;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getSenderArea() {
		return senderArea;
	}
	public void setSenderArea(String senderArea) {
		this.senderArea = senderArea;
	}
	public String getRecipientArea() {
		return recipientArea;
	}
	public void setRecipientArea(String recipientArea) {
		this.recipientArea = recipientArea;
	}
	public String getCurrentStation() {
		return currentStation;
	}
	public void setCurrentStation(String currentStation) {
		this.currentStation = currentStation;
	}
	public Short getTransportState() {
		return transportState;
	}
	public void setTransportState(Short transportState) {
		this.transportState = transportState;
	}
	public String getCurrentArea() {
		return currentArea;
	}
	public void setCurrentArea(String currentArea) {
		this.currentArea = currentArea;
	}
	public String getNextArea() {
		return nextArea;
	}
	public void setNextArea(String nextArea) {
		this.nextArea = nextArea;
	}
	
	
}
