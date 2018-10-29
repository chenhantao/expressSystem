package cn.edu.cqu.cht.service;
/**
 * @author CHT
 * @date 创建时间：2018年5月4日 下午2:28:47
 * @version 1.0
 */

import java.util.List;

import cn.edu.cqu.cht.model.Courier;
import cn.edu.cqu.cht.model.Orderlist;

public interface CourierService {
	public List<Courier> findAllCourier(int offset,int limit);
	public Courier findByCourierId(Integer courierId);
	public List<Courier> findByCourierName(String courierName);
	public List<Courier> findCouriers(String province,String city,String area);
	public List<Courier> findByStationId(Integer stationId);
	
	public boolean addCourier(Courier courier);
	
	public boolean updateCourier(Courier courier);
	
	public boolean deleteCourier(Integer courierId);

	boolean addCourier(Integer courierId,String courierName,String courierPhone,String province,String city,String area);
	
	
	List<Orderlist> findMyOrders(Integer courierId);
	List<Orderlist> findOrders(Integer stationId,String stationName);
}
