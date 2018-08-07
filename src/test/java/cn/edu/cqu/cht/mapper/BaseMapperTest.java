package cn.edu.cqu.cht.mapper;
/*
 * @author CHT
 * @date 创建时间：2018年4月10日 上午4:02:07
 * @version 1.0
 */

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;

import com.github.pagehelper.PageHelper;
import cn.edu.cqu.cht.function.MD5;
import cn.edu.cqu.cht.model.Base;
import junit.framework.TestCase;

public class BaseMapperTest extends BaseTest {

	//@Test
	public void selectAllTest() {
		SqlSession sqlSession = getSqlSession();
		try {
			List<Base> baseList = sqlSession.selectList("selectAllBase");
			// printBaseList(baseList);
			TestCase.assertTrue(baseList.size() > 0);
		} finally {
			sqlSession.close();
		}
	}

	@Test
	public void selectByAccountTest() {
		SqlSession session=getSqlSession();
		try {
			BaseMapper baseMapper=session.getMapper(BaseMapper.class);
			Base base=baseMapper.selectByAccount("utest");
			TestCase.assertEquals(2, base.getId().intValue());
		} finally {
			session.close();
		}
	}
	
	// @Test
	public void selectByIdTest() {
		SqlSession sqlSession = getSqlSession();
		try {
			Base base = sqlSession.selectOne("selectById", 1);
			// System.out.println(base.getAccount());
			TestCase.assertEquals("root", base.getAccount());
		} finally {
			sqlSession.close();
		}

	}

	// @Test
	public void insert2Test() {
		SqlSession session = getSqlSession();
		try {
			BaseMapper baseMapper = session.getMapper(BaseMapper.class);
			Base base = new Base();
			base.setAccount("sTest");
			base.setPassword(MD5.getInstance().getMD5("1234"));
			int result = baseMapper.insertBase2(base);
			TestCase.assertEquals(1, result);
			TestCase.assertNotNull(base.getId());
		} finally {
			session.commit();
			session.close();
		}
	}

	//@Test
	public void selectToPageTest() {
		SqlSession session = getSqlSession();
		try {
			BaseMapper baseMapper=session.getMapper(BaseMapper.class);
			PageHelper.startPage(2, 5);
			List<Base> bases=baseMapper.selectAllBase();
			for(Base base:bases) {
				System.out.println(base.getAccount());
			}
			TestCase.assertEquals(1, bases.size());
		} finally {
			session.close();
		}
	}
	
	//@Test
	public void updateByAccountTest() {
		SqlSession session=getSqlSession();
		try {
			BaseMapper baseMapper=session.getMapper(BaseMapper.class);
			Base base=baseMapper.selectByAccount("uTest2");
			base.setPassword(MD5.getInstance().getMD5("root"));
			baseMapper.updateByAccount(base);
			//TestCase.assertEquals(expected, actual);
		}finally {
			session.commit();
			session.close();
		}
	}
	// private void printBaseList(List<Base> baseList) {
	// for (Base base : baseList) {
	// System.out.printf("%-4d%4s%4s\n", base.getId(), base.getAccount(),
	// base.getPassword());
	// }
	// }
}
