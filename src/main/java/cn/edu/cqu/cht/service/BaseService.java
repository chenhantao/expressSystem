package cn.edu.cqu.cht.service;
/**
 * @author CHT
 * @date 创建时间：2018年5月4日 下午2:28:16
 * @version 1.0
 */

import java.util.List;

import cn.edu.cqu.cht.model.Base;
import cn.edu.cqu.cht.model.Kotlin;

public interface BaseService {
	Base findById(Integer id);
	Base findByAccount(String account);
	List<Base> findAllBase(int offset, int limit);
	
	boolean checkLogin(String account, String password, String type);
	
	boolean addNewBase(Base base);
	
	boolean updatePassword(Base base);
	
	boolean deleteById(Integer id);
}
