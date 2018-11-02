package cn.edu.cqu.cht.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.edu.cqu.cht.mapper.KotlinMapper;
import cn.edu.cqu.cht.model.Kotlin;

/**
 * @author chenhantao
 * @since 2018/11/2
 */
@Service
public class KotlinServiceImpl implements KotlinService {
    @Autowired
    KotlinMapper kotlinMapper;

    @Override
    public Kotlin findById(Long id) {
        return kotlinMapper.selectById(id);
    }
}
