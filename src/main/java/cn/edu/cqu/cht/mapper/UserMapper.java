package cn.edu.cqu.cht.mapper;
/**
 * @author CHT
 * @date 创建时间：2018年5月2日 下午3:54:22
 * @version 1.0
 */

import java.util.List;

import cn.edu.cqu.cht.model.User;

public interface UserMapper {
	/**
	 * 通过id查询用户
	 * 
	 * @param userId
	 * @return
	 */
	
	public User selectByUserId(Integer userId);
	public List<User> selectAllUser();
	
	public int insertUser(User user);
	
	public int updateByUserId(User user);
	
	public int deleteByUserId(Integer userId);
}
