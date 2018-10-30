package cn.edu.cqu.cht.model;
/**
 * @author CHT
 * @date 创建时间：2018年5月8日 上午3:33:32
 * @version 1.0
 */
public class Station {
	private Integer stationId;
	private String stationName;
	private String province;
	private String city;
	private String area;
	private String address;
	private String principal;
	private String phone;
	private Short stationState;
	public Integer getStationId() {
		return stationId;
	}
	public void setStationId(Integer stationId) {
		this.stationId = stationId;
	}
	public String getStationName() {
		return stationName;
	}
	public void setStationName(String stationName) {
		this.stationName = stationName;
	}
	public String getProvince() {
		return province;
	}
	public void setProvince(String province) {
		this.province = province;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPrincipal() {
		return principal;
	}
	public void setPrincipal(String principal) {
		this.principal = principal;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	public Short getStationState() {
		return stationState;
	}
	public void setStationState(Short stationState) {
		this.stationState = stationState;
	}
}
