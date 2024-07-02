package com.example.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.domain.Article;
import com.example.service.ArticleService;
import com.example.mapper.ArticleMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ArticleServiceImpl extends ServiceImpl<ArticleMapper, Article>
    implements ArticleService {


    @Autowired
    private ArticleMapper articleMapper;


    @Override
    public List<Article> getByUid(String id) {
        return  articleMapper.getByUid(id);
    }
    @Override
    public List<Article> getAll() {
        return  articleMapper.getAll();
    }
}




