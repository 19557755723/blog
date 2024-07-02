package com.example.mapper;

import com.example.domain.User;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserMapper extends BaseMapper<User> {

    List<User> delUser(String uid);
    Integer register(User user);
    User getUserByName(String name);
    User getUserByPassword(String password);
    User login(@Param("uid") String uid,@Param("password") String password);
}




