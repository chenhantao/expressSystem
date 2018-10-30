package cn.edu.cqu.cht.service;

import cn.edu.cqu.cht.model.Orderlist;

/**
 * @author CHT
 * @date 创建时间：2018年5月4日 下午2:29:35
 * @version 1.0
 */
public interface PlacePriceService {
	public Double findPlaceToPrice(Orderlist order);
}
