package cn.edu.cqu.cht.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;

import cn.edu.cqu.cht.function.MD5;
import cn.edu.cqu.cht.mapper.BaseMapper;
import cn.edu.cqu.cht.model.Base;
import cn.edu.cqu.cht.model.Kotlin;

/**
 * @author CHT
 * @date 创建时间：2018年5月4日 下午2:30:07
 * @version 1.0
 */
@Service
public class BaseServiceImpl implements BaseService {

	@Autowired
	private BaseMapper baseMapper;

	@Override
	public Base findById(Integer id) {
		return baseMapper.selectById(id);
	}

	@Override
	public Base findByAccount(String account) {
		return baseMapper.selectByAccount(account);
	}

	@Override
	public List<Base> findAllBase(int offset, int limit) {
		PageHelper.startPage(offset, limit);
		return baseMapper.selectAllBase();
	}

	@Override
	public boolean checkLogin(String account, String password, String type) {
		if (account.equals("root")) {
			return baseMapper.selectByAccount(account).getPassword().equals(MD5.getInstance().getMD5(password));
		} else {
			switch (type) {
				case "u":
					account = "u" + account;
					if (baseMapper.selectByAccount(account) == null) {
						return false;
					} else {
						return baseMapper.selectByAccount(account).getPassword().equals(MD5.getInstance().getMD5(password));
					}
				case "c":
					account = "c" + account;
					if (baseMapper.selectByAccount(account) == null) {
						return false;
					} else {
						return baseMapper.selectByAccount(account).getPassword().equals(MD5.getInstance().getMD5(password));
					}
				case "s":
					account = "s" + account;
					if (baseMapper.selectByAccount(account) == null) {
						return false;
					} else {
						return baseMapper.selectByAccount(account).getPassword().equals(MD5.getInstance().getMD5(password));
					}
			}
		}
		return false;
	}

	@Override
	public boolean addNewBase(Base base) {
		return baseMapper.insertBase2(base) == 1;
	}

	@Override
	public boolean updatePassword(Base base) {
		return baseMapper.updateByAccount(base) == 1;
	}

	@Override
	public boolean deleteById(Integer id) {
		return baseMapper.deleteById(id) == 1;
	}
}
