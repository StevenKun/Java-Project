package com.likun.usercenter.controller;

import com.likun.usercenter.domain.entity.user.User;
import com.likun.usercenter.service.user.UserService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

@RestController
@RequiredArgsConstructor(onConstructor = @_(@Autowired))
@Slf4j
public class UserController {


    private final UserService userService;
    private final RestTemplate restTemplate;


    @GetMapping("users/{id}")
    public User findById(@PathVariable Integer id){
        log.info("请求了没啊...........1号小布");
        User userFindById = userService.getUserFindById(id);
        return userFindById;
    }
}
