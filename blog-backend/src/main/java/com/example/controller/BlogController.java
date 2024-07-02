package com.example.controller;

import cn.hutool.core.util.ObjectUtil;
import com.example.service.ArticleService;
import com.example.utils.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/blog")
@CrossOrigin
public class BlogController {

    @Autowired
    private ArticleService articleService;

    @GetMapping("/{id}")
    public Result get(@PathVariable  String id) {
        if (ObjectUtil.isNotEmpty(id)) {
            return new Result(articleService.getByUid(id));
        } else {
            return new Result("参数有误");
        }
    }
    @GetMapping("/all")
    public Result getAll() {
        return new Result(articleService.getAll());
    }
}
