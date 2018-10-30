package cn.edu.cqu.cht.mapper;
/**
 * @author CHT
 * @date 创建时间：2018年5月3日 上午2:33:45
 * @version 1.0
 */

import org.apache.ibatis.annotations.Param;

import cn.edu.cqu.cht.model.PlacePrice;

public interface PlacePriceMapper {

	public PlacePrice selectByProvinceAndCityAndArea(
			@Param("province")String province, 
			@Param("city")String city, 
			@Param("area")String area);

}
