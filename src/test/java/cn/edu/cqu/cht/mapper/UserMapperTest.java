package cn.edu.cqu.cht.mapper;
/*
 * @author CHT
 * @date 创建时间：2018年5月3日 上午12:47:11
 * @version 1.0
 */

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;

import cn.edu.cqu.cht.model.User;
import junit.framework.TestCase;

public class UserMapperTest extends BaseTest {

	@Test
	public void selectByUserIdTest() {
		SqlSession sqlSession = getSqlSession();
		try {
			User user = sqlSession.selectOne("selectByUserId", 2);
			//System.out.println(user.getPhoneNum());
			TestCase.assertEquals("chttttttt", user.getUserName());
		} finally {
			sqlSession.close();
		}
	}

	@Test
	public void selectAllUserTest() {
		SqlSession session = getSqlSession();
		try {
			List<User> usersList = session.selectList("selectAllUser");
			TestCase.assertTrue(usersList.size() > 0);
		} finally {
			session.close();
		}
	}

}
