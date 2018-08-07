package cn.edu.cqu.cht.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;

import cn.edu.cqu.cht.mapper.UserMapper;
import cn.edu.cqu.cht.model.User;

/*
 * @author CHT
 * @date 创建时间：2018年5月4日 下午2:32:47
 * @version 1.0
 */
@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserMapper userMapper;

	@Override
	public List<User> findAllUsers(int offset, int limit) {
		PageHelper.startPage(offset, limit);
		List<User> users = userMapper.selectAllUser();
		return users;
	}

	@Override
	public User findUserByUserId(Integer userId) {
		return userMapper.selectByUserId(userId);
	}

	@Override
	public boolean addUser(Integer userId,String userName,String userRealName,String phone,String email,String addr) {
		User user=new User();
		user.setUserId(userId);
		user.setUserName(userName);
		user.setUserRealName(userRealName);
		user.setPhoneNum(phone);
		user.setEmail(email);
		user.setAddr1(addr);
		
		return userMapper.updateByUserId(user) == 1;
	}

	@Override
	public boolean updateUser(User user) {
		return userMapper.updateByUserId(user) == 1;
	}

	@Override
	public boolean deleteByUserId(Integer userId) {
		return userMapper.deleteByUserId(userId) == 1;
	}

}
