package cn.edu.cqu.cht.model;
/**
 * @author CHT
 * @date 创建时间：2018年5月2日 上午2:36:39
 * @version 1.0
 */
public class User {
	private Integer userId;
	private String userName;
	private String userRealName;
	private String phoneNum;
	private String email;
	private String picture;
	private String addr1;
	private String addr2;
	private String addr3;
	private String historyAddr;
	
	
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserRealName() {
		return userRealName;
	}
	public void setUserRealName(String userRealName) {
		this.userRealName = userRealName;
	}
	public String getPhoneNum() {
		return phoneNum;
	}
	public void setPhoneNum(String phoneNum) {
		this.phoneNum = phoneNum;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
	public String getAddr1() {
		return addr1;
	}
	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}
	public String getAddr2() {
		return addr2;
	}
	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}
	public String getAddr3() {
		return addr3;
	}
	public void setAddr3(String addr3) {
		this.addr3 = addr3;
	}
	public String getHistoryAddr() {
		return historyAddr;
	}
	public void setHistoryAddr(String historyAddr) {
		this.historyAddr = historyAddr;
	}
	
	
}
