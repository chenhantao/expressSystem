package cn.edu.cqu.cht.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;

import cn.edu.cqu.cht.mapper.CourierMapper;
import cn.edu.cqu.cht.model.Courier;
import cn.edu.cqu.cht.model.Orderlist;

/*
 * @author CHT
 * @date 创建时间：2018年5月4日 下午2:31:37
 * @version 1.0
 */
@Service
public class CourierServiceImpl implements CourierService {

	@Autowired
	private CourierMapper courierMapper;

	@Override
	public List<Courier> findAllCourier(int offset, int limit) {
		PageHelper.startPage(offset, limit);
		List<Courier> couriers = courierMapper.selectAllCourier();
		return couriers;
	}

	@Override
	public Courier findByCourierId(Integer courierId) {
		return courierMapper.selectByCourierId(courierId);
	}

	@Override
	public List<Courier> findByCourierName(String courierName) {
		return courierMapper.selectByCourierName(courierName);
	}

	@Override
	public boolean addCourier(Courier courier) {
		return courierMapper.insertCourier(courier) == 1;
	}

	@Override
	public boolean updateCourier(Courier courier) {
		return courierMapper.updateByCourierId(courier) == 1;
	}

	@Override
	public boolean deleteCourier(Integer courierId) {
		return courierMapper.deleteByCourierId(courierId) == 1;
	}

	@Override
	public List<Courier> findCouriers(String province, String city, String area) {
		return courierMapper.selectCourier(province, city, area);
	}

	@Override
	public List<Courier> findByStationId(Integer stationId) {
		return courierMapper.selectByStationId(stationId);
	}

	@Override
	public boolean addCourier(Integer courierId, String courierName, String courierPhone, String province, String city,
			String area) {
		Courier courier = new Courier();
		courier.setCourierId(courierId);
		courier.setCourierName(courierName);
		courier.setCourierPhone(courierPhone);
		courier.setProvince(province);
		courier.setCity(city);
		courier.setArea(area);
		courier.setStationId(0);
		return courierMapper.updateByCourierId(courier) == 1;
	}

	@Override
	public List<Orderlist> findMyOrders(Integer courierId) {
		return courierMapper.findMyOrders(courierId);
	}

	@Override
	public List<Orderlist> findOrders(Integer stationId, String stationName) {

		return courierMapper.findOrders(stationId, stationName);
	}

}
