package cn.edu.cqu.cht.mapper;
/**
 * @author CHT
 * @date 创建时间：2018年5月2日 下午3:53:56
 * @version 1.0
 */

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.edu.cqu.cht.model.CourierOrder;

public interface CourierOrderMapper {
	
	public List<CourierOrder> selectAllCourierOrder();
	public List<CourierOrder> selectByCourierId(Integer courierId);
	public List<CourierOrder> selectByOrderId(String orderId);
	
	public int insertCourierOrder(CourierOrder courierOrder);
	
	public int updateByOrderId(@Param("orderId")String orderId,@Param("salary")Double salary);
	
	public int deleteByCourierIdAndOrderId(
			@Param("courierId")Integer courierId,
			@Param("orderId")Integer orderId);
}
