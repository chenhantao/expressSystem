package cn.edu.cqu.cht.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;

import cn.edu.cqu.cht.mapper.CourierOrderMapper;
import cn.edu.cqu.cht.model.CourierOrder;

/**
 * @author CHT
 * @date 创建时间：2018年5月4日 下午2:31:10
 * @version 1.0
 */
@Service
public class CourierOrderServiceImpl implements CourierOrderService {

	@Autowired
	private CourierOrderMapper courierOrderMapper;

	@Override
	public List<CourierOrder> findCourierOrderByCourierId(Integer courierId, int offset, int limit) {
		PageHelper.startPage(offset, limit);
		return courierOrderMapper.selectByCourierId(courierId);
	}

	@Override
	public boolean addCourierOrder(CourierOrder courierOrder) {
		return courierOrderMapper.insertCourierOrder(courierOrder) == 1;
	}

	@Override
	public boolean updateCourierOrder(String orderId,Double salary) {
		List<CourierOrder> list=courierOrderMapper.selectByOrderId(orderId);
		return courierOrderMapper.updateByOrderId(orderId,salary) == list.size();
	}

	@Override
	public boolean delete(Integer courierId, Integer orderId) {
		return courierOrderMapper.deleteByCourierIdAndOrderId(courierId, orderId) == 1;
	}

	@Override
	public int findByOrderIdNums(String orderId) {
		return courierOrderMapper.selectByOrderId(orderId).size();
	}

}
