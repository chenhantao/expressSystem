package cn.edu.cqu.cht.service;
/**
 * @author CHT
 * @date 创建时间：2018年5月4日 下午2:29:47
 * @version 1.0
 */

import java.util.List;

import cn.edu.cqu.cht.model.User;

public interface UserService {
	List<User> findAllUsers(int offset,int limit);
	User findUserByUserId(Integer userId);
	
	boolean addUser(Integer userId,String userName,String userRealName,String phone,String email,String addr);
	
	boolean updateUser(User user);
	
	boolean deleteByUserId(Integer userId);
}
