package com.likun.usercenter.controller;

import com.likun.usercenter.dao.user.UserMapper;
import com.likun.usercenter.domain.entity.user.User;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Date;

@RestController
@RequiredArgsConstructor(onConstructor = @_(@Autowired))
public class TestController {

    private  final  UserMapper userMapper;



    @GetMapping("/test")
    public User testInsert(){
        User user=new User();
        user.setAvatarUrl("xxx");
        user.setBonus(100);
        user.setCreateTime(new Date());
        user.setUpdateTime(new Date());
        this.userMapper.insertSelective(user);
        return user;
    }

    @GetMapping("/q")
    public User query(User user){
        return  user;
    }
}
