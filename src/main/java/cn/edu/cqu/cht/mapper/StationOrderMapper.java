package cn.edu.cqu.cht.mapper;
/**
 * @author CHT
 * @date 创建时间：2018年5月8日 上午3:38:44
 * @version 1.0
 */

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.edu.cqu.cht.model.StationOrder;

public interface StationOrderMapper {

	public List<StationOrder> selectAllStationOrder();

	public List<StationOrder> selectByStationId(Integer stationId);

	public List<StationOrder> selectByOrderId(String orderId);

	public StationOrder selectByStationIdAndOrderId(Integer stationId,String orderId);
	
	public int insertStationOrder(StationOrder stationOrder);

	public int updateByOrderId(@Param("orderId")String orderId,@Param("salary")Double salary);

	public int deleteByStationIdAndOrderId(@Param("stationId") Integer stationId, @Param("orderId") Integer orderId);

}
