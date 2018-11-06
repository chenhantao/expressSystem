package cn.edu.cqu.cht.service;
/**
 * @author CHT
 * @date 创建时间：2018年5月4日 下午2:28:58
 * @version 1.0
 */

import java.util.List;

import cn.edu.cqu.cht.model.CourierOrder;

public interface CourierOrderService {
	List<CourierOrder> findCourierOrderByCourierId(Integer courierId, int offset, int limit);
	
	boolean addCourierOrder(CourierOrder courierOrder);
	
	boolean updateCourierOrder(String orderId, Double salary);
	
	boolean delete(Integer courierId, Integer orderId);
	
	int findByOrderIdNums(String orderId);
}
