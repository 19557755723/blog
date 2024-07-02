package com.example.mapper;

import com.example.domain.Category;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CategoryMapper extends BaseMapper<Category> {

    List<Category> getAll();
}




