package cn.edu.cqu.cht.mapper;
/*
 * @author CHT
 * @date 创建时间：2018年5月4日 上午3:39:25
 * @version 1.0
 */

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;

import cn.edu.cqu.cht.model.Orderlist;
import junit.framework.TestCase;

public class OrderlistMapperTest extends BaseTest {

	@Test
	public void selectAllOrderTest() {
		SqlSession session = getSqlSession();
		try {
			List<Orderlist> ordersLsit = session.selectList("selectAllOrder");
			TestCase.assertTrue(ordersLsit.size() > 0);
		} finally {
			session.close();
		}
	}
	
	//@Test
	public void selectByRecipientPhoneTest() {
		SqlSession session=getSqlSession();
		try {
			OrderlistMapper orderMapper=session.getMapper(OrderlistMapper.class);
			Orderlist orders=orderMapper.selectByOrderId("20180516041224246374");
			TestCase.assertEquals("18034830302", orders.getRecipientPhone());
		}finally {
			session.close();
		}
	}
}
