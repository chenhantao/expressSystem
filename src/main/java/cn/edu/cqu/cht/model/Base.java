package cn.edu.cqu.cht.model;
/**
 * @author CHT
 * @date 创建时间：2018年4月10日 上午3:37:43
 * @version 1.0
 */
public class Base {
	
	private Integer id;
	private String account;
	private String password;
	
	
	public Integer getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
}
