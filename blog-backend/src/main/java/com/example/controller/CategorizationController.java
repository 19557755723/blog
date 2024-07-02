package com.example.controller;

import com.example.service.CategoryService;
import com.example.utils.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/cate")
@CrossOrigin
public class CategorizationController {

    @Autowired
    private CategoryService categoryService;

    @GetMapping("/all")
    public Result getAll() {
        return new Result(categoryService.getAll());
    }

}
