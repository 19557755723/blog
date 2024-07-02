package com.example.service;

import com.example.domain.Category;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;


public interface CategoryService extends IService<Category> {

    List<Category> getAll();
}
