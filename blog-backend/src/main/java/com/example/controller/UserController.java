package com.example.controller;


import cn.hutool.core.util.ObjectUtil;
import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.example.domain.User;
import com.example.domain.vo.UserVo;
import com.example.service.UserService;
import com.example.utils.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import static jdk.nashorn.internal.runtime.regexp.joni.Config.log;

@RestController
@RequestMapping("/users")
@CrossOrigin
public class UserController {

    @Autowired
    private UserService userService;

    @PostMapping("/login")
    public Result login(@RequestBody UserVo user) {
        if (user == null || StringUtils.isEmpty(user.getUid()) || StringUtils.isEmpty(user.getPassword())) {
            return new Result(400, "用户名或密码有误！");
        } else {
            return new Result(userService.login(user));
        }
    }

    @PostMapping("/register")
    public Result register(@RequestBody User user) {
        Object register = userService.register(user);
        if (ObjectUtil.isNull(register)) {
            return new Result(400, "用户名已存在！");
        } else {
            return new Result(register);
        }
    }


}
