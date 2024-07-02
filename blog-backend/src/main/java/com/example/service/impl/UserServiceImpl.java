package com.example.service.impl;

import cn.hutool.core.date.DateUtil;
import cn.hutool.core.util.ObjectUtil;
import cn.hutool.core.util.RandomUtil;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.domain.User;
import com.example.domain.vo.UserVo;
import com.example.service.UserService;
import com.example.mapper.UserMapper;
import com.example.utils.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;


@Service
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements UserService {


    @Autowired
    private UserMapper userMapper;

    @Override
    public Object register(User user) {

        User userByName = userMapper.getUserByName(user.getUsername());
        if (ObjectUtil.isNotEmpty(userByName)) {
            return null;
        } else {
            String id = DateUtil.year(new Date()) + RandomUtil.randomNumbers(6);
            user.setUid(id);
            user.setEnrollment(DateUtil.now());
            if (userMapper.register(user) > 0) {
                return id;
            } else {
                return null;
            }
        }
    }
    @Override
    public Object login(UserVo user) {
        User entity = userMapper.login(user.getUid(), user.getPassword());
        if (ObjectUtil.isNotEmpty(entity)) {
            return entity;
        } else {
            return "登录失败 用户名或密码错误";
        }
    }

}




