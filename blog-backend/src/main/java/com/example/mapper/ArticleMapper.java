package com.example.mapper;

import com.example.domain.Article;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ArticleMapper extends BaseMapper<Article> {

    List<Article>  getByUid(String id);
    List<Article> getAll();
    List<Article> delArticle(String title);
}




