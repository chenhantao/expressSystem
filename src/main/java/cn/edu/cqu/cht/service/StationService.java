package cn.edu.cqu.cht.service;
/**
 * @author CHT
 * @date 创建时间：2018年5月8日 上午3:39:05
 * @version 1.0
 */

import java.util.List;

import cn.edu.cqu.cht.model.Orderlist;
import cn.edu.cqu.cht.model.Station;

public interface StationService {
	List<Station> findAllStations(int offset,int limit);
	List<Station> findAllUnpassStations(int offset,int limit);
	Station findByStationId(Integer stationId);
	
	List<Orderlist> findMyOrders(Integer stationId);
	
	boolean insertStation(Station station);
	
	boolean updateStation(Station station);
	
	boolean deleteByStationId(Integer stationId);

	boolean addStation(Integer stationId,String stationName,String province,String city,String area,String address,String principal,String phone);
	
	boolean passStation(Integer stationId);
}

