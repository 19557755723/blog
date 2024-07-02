package com.example.service;

import com.example.domain.Article;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;


public interface ArticleService extends IService<Article> {

    List<Article> getAll();

    List<Article> getByUid(String id);
}
