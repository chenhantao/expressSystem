package cn.edu.cqu.cht.mapper;
/**
 * @author CHT
 * @date 创建时间：2018年5月2日 下午3:54:11
 * @version 1.0
 */

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.edu.cqu.cht.model.Orderlist;

public interface OrderlistMapper {
	
	public List<Orderlist> selectAllOrder();
	public Orderlist selectByOrderId(String orderId);
	public List<Orderlist> selectByRecipientPhone(String recipientPhone);
	public List<Orderlist> selectActiveOrder(
			@Param("province")String province,
			@Param("city")String city,
			@Param("area")String area);
	
	public List<Orderlist> selectByUserId(Integer userId);
	
	public int insertOrder(Orderlist order);
	
	public int updateByOrderId(Orderlist order);
	
	public int deleteByOrderId(Integer orderId);
}
