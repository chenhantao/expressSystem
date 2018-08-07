package cn.edu.cqu.cht.mapper;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import org.junit.Test;

import cn.edu.cqu.cht.model.Courier;
import junit.framework.TestCase;

/*
 * @author CHT
 * @date 创建时间：2018年5月4日 上午2:44:51
 * @version 1.0
 */
public class CourierMapperTest extends BaseTest {

	@Test
	public void selectAllTest() {
		SqlSession session = getSqlSession();
		try {
			CourierMapper courierMapper = session.getMapper(CourierMapper.class);
			List<Courier> courierList = courierMapper.selectAllCourier();
			TestCase.assertNotNull(courierList);
			TestCase.assertTrue(courierList.size() > 0);
		} finally {
			session.close();
		}
	}

	//@Test
	public void selectByCourierIdTest() {
		SqlSession session = getSqlSession();
		try {
			CourierMapper courierMapper = session.getMapper(CourierMapper.class);
			Courier courier = courierMapper.selectByCourierId(2);
			TestCase.assertNotNull(courier);
			//TestCase.assertEquals("cht", courier.getCourierName());
		} finally {
			session.close();
		}
	}

}
