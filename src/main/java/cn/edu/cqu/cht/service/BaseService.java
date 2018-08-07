package cn.edu.cqu.cht.service;
/*
 * @author CHT
 * @date 创建时间：2018年5月4日 下午2:28:16
 * @version 1.0
 */

import java.util.List;

import cn.edu.cqu.cht.model.Base;

public interface BaseService {
	public Base findById(Integer id);
	public Base findByAccount(String account);
	public List<Base> findAllBase(int offset,int limit);
	
	public boolean checkLogin(String account,String password,String type);
	
	public boolean addNewBase(Base base);
	
	public boolean updatePassword(Base base);
	
	public boolean deleteById(Integer id);
}
