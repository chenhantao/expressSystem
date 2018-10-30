package cn.edu.cqu.cht.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.edu.cqu.cht.function.CalculatePrice;
import cn.edu.cqu.cht.mapper.PlacePriceMapper;
import cn.edu.cqu.cht.model.Orderlist;
import cn.edu.cqu.cht.model.PlacePrice;

/**
 * @author CHT
 * @date 创建时间：2018年5月4日 下午2:32:16
 * @version 1.0
 */
@Service
public class PlacePriceServiceImpl implements PlacePriceService{
	@Autowired
	private PlacePriceMapper placePriceMapper;

	@Override
	public Double findPlaceToPrice(Orderlist order) {
		PlacePrice one=placePriceMapper.selectByProvinceAndCityAndArea(order.getSenderProvince(), order.getSenderCity(), order.getSenderArea());
		PlacePrice two=placePriceMapper.selectByProvinceAndCityAndArea(order.getRecipientProvince(), order.getRecipientCity(), order.getRecipientArea());
		return CalculatePrice.getInstance().init(order.getWeight(), one.getpLevel(), two.getpLevel(), one.getcLevel(), two.getcLevel(), one.getaLevel(), two.getaLevel());
	}
	
	
}
