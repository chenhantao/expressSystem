package cn.edu.cqu.cht.mapper;
/*
 * @author CHT
 * @date 创建时间：2018年5月2日 下午3:32:40
 * @version 1.0
 */

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.edu.cqu.cht.model.Courier;
import cn.edu.cqu.cht.model.Orderlist;

public interface CourierMapper {
	
	public Courier selectByCourierId(Integer courierId);
	public List<Courier> selectByCourierName(String courierName);
	public List<Courier> selectAllCourier();
	
	public List<Courier> selectCourier(@Param("province")String province,
			@Param("city")String city,@Param("area")String area);
	
	public List<Courier> selectByStationId(Integer stationId);
	
	public int insertCourier(Courier courier);
	public int insertCourier2(Courier courier);
	
	public int updateByCourierId(Courier courier);
	
	public int deleteByCourierId(Integer courierId);
	
	
	List<Orderlist> findMyOrders(Integer courierId);
	
	List<Orderlist> findOrders(@Param("stationId")Integer stationId,@Param("stationName")String currentName);
}
