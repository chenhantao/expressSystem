package cn.edu.cqu.cht.mapper;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.BeforeClass;

/*
 * @author CHT
 * @date 创建时间：2018年5月4日 上午3:31:15
 * @version 1.0
 */
public class BaseTest {
	private static SqlSessionFactory sqlSessionFactory;
	
	@BeforeClass
	public static void init() {
		try {
			Reader reader=Resources.getResourceAsReader("mybatis-config.xml");
			//Reader reader=Resources.getResourceAsReader("applicationContext.xml");
			sqlSessionFactory=new SqlSessionFactoryBuilder().build(reader);
			reader.close();
		}catch (IOException exception) {
			exception.printStackTrace();
		}
	}
	
	public SqlSession getSqlSession() {
		return sqlSessionFactory.openSession();
	}
}
