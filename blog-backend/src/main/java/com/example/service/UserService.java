package com.example.service;

import com.example.domain.User;
import com.baomidou.mybatisplus.extension.service.IService;
import com.example.domain.vo.UserVo;


public interface UserService extends IService<User> {

    Object login(UserVo user);

    Object register(User user);


}
