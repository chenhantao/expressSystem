package cn.edu.cqu.cht.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;

import cn.edu.cqu.cht.mapper.StationMapper;
import cn.edu.cqu.cht.model.Orderlist;
import cn.edu.cqu.cht.model.Station;

/**
 * @author CHT
 * @date 创建时间：2018年5月8日 上午3:39:38
 * @version 1.0
 */
@Service
public class StationServiceImpl implements StationService {

	@Autowired
	private StationMapper stationMapper;

	@Override
	public List<Station> findAllStations(int offset, int limit) {
		PageHelper.startPage(offset, limit);
		return stationMapper.selectAllStation();
	}

	@Override
	public Station findByStationId(Integer stationId) {
		return stationMapper.selectByStationId(stationId);
	}

	@Override
	public boolean insertStation(Station station) {
		return stationMapper.insertStation(station) == 1;
	}

	@Override
	public boolean updateStation(Station station) {
		return stationMapper.updateByStationId(station) == 1;
	}

	@Override
	public boolean deleteByStationId(Integer stationId) {
		return stationMapper.deleteByStationId(stationId) == 1;
	}

	@Override
	public boolean addStation(Integer stationId, String stationName, String province, String city, String area,
			String address, String principal, String phone) {
		Station station = new Station();
		station.setStationId(stationId);
		station.setStationName(stationName);
		station.setProvince(province);
		station.setCity(city);
		station.setArea(area);
		station.setAddress(address);
		station.setPrincipal(principal);
		station.setPhone(phone);
		return stationMapper.updateByStationId(station) == 1;
	}

	@Override
	public List<Orderlist> findMyOrders(Integer stationId) {
		return stationMapper.findMyOrders(stationId);
	}

	@Override
	public List<Station> findAllUnpassStations(int offset, int limit) {
		PageHelper.startPage(offset, limit);
		return stationMapper.selectAllUnpassStation();
	}

	@Override
	public boolean passStation(Integer stationId) {
		return stationMapper.passStation(stationId) == 1;
	}

}
