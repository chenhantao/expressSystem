package cn.edu.cqu.cht.mapper;
import java.util.List;

import cn.edu.cqu.cht.model.Base;
/*
 * @author CHT
 * @date 创建时间：2018年4月18日 上午4:31:54
 * @version 1.0
 */
public interface BaseMapper {
	/**
	 * 通过id查询注册用户
	 * 
	 * @param id
	 * @return
	 */
	
	public Base selectById(Integer id);
	public Base selectByAccount(String account);
	public List<Base> selectAllBase();
	

	/**
	 * 单纯的插入
	 * @param base
	 * @return 
	 */
	public int insertBase(Base base);
	
	/**
	 * 返回主键的插入
	 * @param base
	 * @return 
	 */
	public int insertBase2(Base base);
	
	/**
	 * 修改密码用
	 * @param password
	 * @return
	 */
	public int updateByAccount(Base base);
	
	public int deleteById(Integer id);
	
}