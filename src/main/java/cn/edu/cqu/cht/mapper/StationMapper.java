package cn.edu.cqu.cht.mapper;
/*
 * @author CHT
 * @date 创建时间：2018年5月8日 上午3:38:35
 * @version 1.0
 */

import java.util.List;

import cn.edu.cqu.cht.model.Orderlist;
import cn.edu.cqu.cht.model.Station;

public interface StationMapper {
	public Station selectByStationId(Integer stationId);
	public List<Station> selectAllStation();
	List<Station> selectAllUnpassStation();
	
	public int insertStation(Station station);
	
	public int updateByStationId(Station station);
	
	public int deleteByStationId(Integer stationId);
	
	int passStation(Integer stationId);
	
	public List<Orderlist> findMyOrders(Integer stationId);
}
