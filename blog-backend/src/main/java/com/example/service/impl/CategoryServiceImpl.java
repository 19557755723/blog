package com.example.service.impl;

import cn.hutool.core.util.ObjectUtil;
import cn.hutool.json.JSONUtil;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.domain.Category;
import com.example.service.CategoryService;
import com.example.mapper.CategoryMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.concurrent.TimeUnit;


@Service
public class CategoryServiceImpl extends ServiceImpl<CategoryMapper, Category> implements CategoryService {

    @Autowired
    private CategoryMapper categoryMapper;

    @Autowired
    private StringRedisTemplate redisTemplate;

    @Override
    public List<Category> getAll() {
        String cate = redisTemplate.opsForValue().get("cate");
        if (ObjectUtil.isEmpty(cate)) {
            List<Category> selectRes = categoryMapper.getAll();
//            cache
            redisTemplate.opsForValue().set("cate", JSONUtil.toJsonStr(selectRes), 30, TimeUnit.MINUTES);
            return selectRes;
        } else {
            return JSONUtil.toList(cate, Category.class);
        }
    }
}




