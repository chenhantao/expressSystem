package cn.edu.cqu.cht.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;

import cn.edu.cqu.cht.mapper.StationOrderMapper;
import cn.edu.cqu.cht.model.StationOrder;

/*
 * @author CHT
 * @date 创建时间：2018年5月8日 上午3:40:52
 * @version 1.0
 */
@Service
public class StationOrderServiceImpl implements StationOrderService {

	@Autowired
	private StationOrderMapper stationOrderMapper;

	@Override
	public List<StationOrder> findAllStationOrder(int offset, int limit) {
		PageHelper.startPage(offset, limit);
		return stationOrderMapper.selectAllStationOrder();
	}

	@Override
	public List<StationOrder> findByStationId(Integer stationId, int offset, int limit) {
		PageHelper.startPage(offset, limit);
		return stationOrderMapper.selectByStationId(stationId);
	}

	@Override
	public List<StationOrder> findByOrderId(String orderId, int offset, int limit) {
		PageHelper.startPage(offset, limit);
		return stationOrderMapper.selectByOrderId(orderId);
	}

	@Override
	public boolean insertStationOrder(StationOrder stationOrder) {
		return stationOrderMapper.insertStationOrder(stationOrder) == 1;
	}

	@Override
	public boolean updateStationOrder(String orderId, Double salary) {
		List<StationOrder> list = stationOrderMapper.selectByOrderId(orderId);
		return stationOrderMapper.updateByOrderId(orderId, salary) == list.size();
	}

	@Override
	public boolean deleteStationOrder(Integer stationId, Integer orderId) {
		return stationOrderMapper.deleteByStationIdAndOrderId(stationId, orderId) == 1;
	}

	@Override
	public StationOrder findTheOne(Integer stationId, String orderId) {
		return stationOrderMapper.selectByStationIdAndOrderId(stationId, orderId);
	}

	@Override
	public int findAllByOrderNums(String orderId) {
		return stationOrderMapper.selectByOrderId(orderId).size();
	}

}
