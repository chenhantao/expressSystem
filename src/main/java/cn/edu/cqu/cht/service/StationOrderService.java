package cn.edu.cqu.cht.service;
/*
 * @author CHT
 * @date 创建时间：2018年5月8日 上午3:40:18
 * @version 1.0
 */

import java.util.List;

import cn.edu.cqu.cht.model.StationOrder;

public interface StationOrderService {
	List<StationOrder> findAllStationOrder(int offset,int limit);
	
	List<StationOrder> findByStationId(Integer stationId,int offset,int limit);
	List<StationOrder> findByOrderId(String orderId,int offset,int limit);
	
	int findAllByOrderNums(String orderId);
	
	StationOrder findTheOne(Integer stationId,String orderId);
	
	boolean insertStationOrder(StationOrder stationOrder);
	
	boolean updateStationOrder(String orderId,Double salary);
	
	boolean	deleteStationOrder(Integer stationId,Integer orderId);
}
